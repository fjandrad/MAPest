%% comparison kinDyn and MAPest using projected Dynamics
% we assume we already have MAPest

% Selector matrix (O{nx6},1{n})'
selectorMatrix = [zeros(6,human_kinDynComp.getNrOfDegreesOfFreedom); ...
    eye(human_kinDynComp.getNrOfDegreesOfFreedom)];

% write down contact frames
contactFramesNames= {'LeftFoot','RightFoot'};
%we can use endEffectorFrame in the future
dummy=0;
for blockIdx = 1 : block.nrOfBlocks 
    tic
    disp('-------------------------------------------------------------------');
    disp(strcat('[Start] no force iDynTree ID (via kinDyn) computation for Block ',num2str(blockIdx),'...'));
       % put into twist form the base velocity
    baseVelocity=[baseVel(blockIdx).baseLinVelocity;baseVel(blockIdx).baseAngVelocity];
    
    [tau_iDyn(blockIdx).tau_kinDynAlpha,tau_iDyn(blockIdx).baseWrenchAlpha] = iDynTreeID_kinDyn_floating(human_kinDynComp, ...
        currentBase, ...
        bucket.orientation(blockIdx).baseOrientation, ...
        bucket.basePosition(blockIdx).basePos_wrtG, ...
        baseVelocity, ...
        IDcomparisonParams.baseAcc(blockIdx).baseAcc_wrtG, ...
        synchroKin(blockIdx), ...
        shoes(blockIdx),false); %shoes(blockIdx));
    toc 
    % calculate null space projector
    Nu=calculateNullSpaceProjectorForConstraintJacobians(human_kinDynComp,...
        contactFramesNames,...
        synchroKin(blockIdx),...
        G_T_base(blockIdx),...
        baseVelocity);
    toc
    % project dynamics
    projectedDynamics{blockIdx}=projectDynamics(Nu,selectorMatrix,tau_iDyn(blockIdx).tau_kinDynAlpha,tau_iDyn(blockIdx).baseWrenchAlpha);
    toc
    
    disp(strcat('[End] iDynTree ID (via kinDyn) computation for Block ',num2str(blockIdx)));
end


% comparison of joint torques at the hip
% jointID=31;
blockID=3;
for jointID=31:33
figure, plot(estimatedVariables.tau(blockID).values(jointID,:),'.','MarkerSize',12)
hold on;
plot(tau_iDyn(blockID).tau_kinDyn(jointID,:),'.','MarkerSize',18);
hold on;
plot(projectedDynamics{blockID}(jointID,:),'.','MarkerSize',18); hold on;

% plot(projectedDynamics2{blockID}(jointID,:),'.','MarkerSize',18); hold on;
legend('MAPest','kinDyn','projectedDynamics')
legendmarkeradjust (20)
xlabel('sample')
ylabel('Nm')
title(sprintf('Torque comparison for %s %drd block S%02d task%d',(selectedJoints{jointID}),blockID,subjectID,taskID));
set(gca,'fontsize', 24);


figure,plot(projectedDynamics{blockID}(jointID,:),'.','MarkerSize',18); hold on;
plot(tau_iDyn(blockID).tau_kinDynAlpha(jointID,:),'.','MarkerSize',18); hold on;
plot(tau_iDyn(blockID).tau_kinDyn(jointID,:),'.','MarkerSize',18);
legend('projectedDynamics','alpha','kinDyn')
legendmarkeradjust (20)
xlabel('sample')
ylabel('Nm')
title(sprintf('Torque comparison for %s %drd block S%02d task%d',(selectedJoints{jointID}),blockID,subjectID,taskID));
set(gca,'fontsize', 24);
end


%  diff=tau_iDyn(blockID).tau_kinDyn(:,:)-tau_iDyn(blockID).tau_kinDynAlpha(:,:);
% tocheck=mean(diff')'
% 
% diff2=tau_iDyn(blockID).tau_kinDyn(:,:)-estimatedVariables.tau(blockID).values(:,:);
% tocompare=mean(diff2')'
% 
%  diff3=tau_iDyn(blockID).tau_kinDynAlpha(:,:)-estimatedVariables.tau(blockID).values(:,:);
% tocheck2=mean(diff3')'
