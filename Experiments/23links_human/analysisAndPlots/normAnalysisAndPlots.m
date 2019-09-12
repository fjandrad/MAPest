
% Plot folder
bucket.pathToPlots = fullfile('analysisAndPlots/plots');
if ~exist(bucket.pathToPlots)
    mkdir (bucket.pathToPlots)
end
saveON = false;

%% Compare variables from estimation vectors
% Accelerations, external forces and torques have a different order in
% fixed and floating vectors.

% --------------- EXTERNAL FORCE
fext_fixed    = d_fixed_estimatedVar.estimatedVariables.Fext;
fext_floating = d_floating_estimatedVar.estimatedVariables.Fext;

% Remove fixed base from fext_floating label and from values
% for floatLabelIdx = 1 : length(d_floating_estimatedVar.estimatedVariables.Fext.label)
%     if strcmp(d_floating_estimatedVar.estimatedVariables.Fext.label(floatLabelIdx),fixedBase)
%         elementToBeRemovedIdx = floatLabelIdx;
%         tmp.fixedIdx2Plot = elementToBeRemovedIdx;
%         break;
%     end
% end
% fext_floating.label(elementToBeRemovedIdx)  = [];
% fext_floating.values((elementToBeRemovedIdx*6)-5:(elementToBeRemovedIdx*6),:) = [];
% from now on d_floating_fext and d_floating_fixed have the same size!

% Find ranges to match values in different vectors
fext_rangesForDiff = zeros(length(fext_fixed.label),6);
for labelFixedIdx = 1 : length(fext_fixed.label)
    for labelFloatIdx = 1 : length(fext_fixed.label)
        if strcmp(fext_fixed.label(labelFixedIdx),fext_floating.label(labelFloatIdx))
            fext_rangesForDiff(labelFixedIdx,:) = (labelFloatIdx*6)-5:(labelFloatIdx*6);
            break;
        end
    end
end
 
% --------------- TORQUE
tau_fixed    = d_fixed_estimatedVar.estimatedVariables.tau;
tau_floating = d_floating_estimatedVar.estimatedVariables.tau;

% By construction from the previous computations, the order of the torques
% in fixed and floating vectors must be the same!
if all(strcmp(tau_fixed.label, tau_floating.label) == 0)
    error('Error in the computation of fixed/floating estimated variables. Check it!')
end

% --------------- DDQ
ddq_fixed    = d_fixed_estimatedVar.estimatedVariables.ddq;
ddq_floating = d_floating_estimatedVar.estimatedVariables.ddq;

% By construction from the previous computations, the order of the ddq
% in fixed and floating vectors must be the same!
if all(strcmp(ddq_fixed.label, ddq_floating.label) == 0)
    error('Error in the computation of fixed/floating estimated variables. Check it!')
end

% --------------- ACC
% See floating-paper Sensors for definitions.

% Load proper body acceleration from MAP_fixed (Eq. 11).
% In berdy variables --> iDynTree.LINK_BODY_PROPER_ACCELERATION
acc_fixed    = d_fixed_estimatedVar.estimatedVariables.Acc;

% Load proper sensor acceleration from MAP_floating (Eq. 12)
% In berdy variables --> iDynTree.LINK_BODY_PROPER_CLASSICAL_ACCELERATION
acc_floating = d_floating_estimatedVar.estimatedVariables.Acc;

% Note: the relation betweem them is represented in Eq. 13.
% -----
% Find floatingBase 6D acc correspondance between vectors
% Accelerations have a different order in fixed and floating vectors.

floatingBase = currentBase; % e.g., Pelvis for floating_base paper

% Find and floatingBase acc in acc_fixed vect
for fixedLabelIdx = 1 : length(acc_fixed.label)
    if strcmp(acc_fixed.label(fixedLabelIdx),floatingBase)
        tmp.baseIntoFixedAccVect = fixedLabelIdx;
        break;
    end
end
g_a_base_fromFixed = (acc_fixed.values((6*(tmp.baseIntoFixedAccVect-1)+1 : 6*tmp.baseIntoFixedAccVect),:));

% Find floatingBase acc in acc_floating vect
for floatLabelIdx = 1 : length(acc_floating.label)
    if strcmp(acc_floating.label(floatLabelIdx),floatingBase)
        tmp.baseIntoFloatingAccVect = floatLabelIdx;
        break;
    end
end
g_alfa_base_fromFloating = (acc_floating.values((6*(tmp.baseIntoFloatingAccVect-1)+1 : 6*tmp.baseIntoFloatingAccVect),:));
% -----
% Find g_a_base_fromFloating
% To compute g_a_base_fromFloating from Eq. 13:
% g_a_base_fromFloating = g_alfa_base_fromFloating - [(base_R_G*G_dot{o}_base) x
% omega_base; O(3x1)];

lenAccSample = length(g_alfa_base_fromFloating);
% ------ base_R_G computation
base_R_G = cell(lenAccSample,1);
for sampleIdx = 1 : lenAccSample
    tmp.adjoint = G_T_b{sampleIdx}.asAdjointTransformWrench().toMatlab();
    base_R_G{sampleIdx,1} = tmp.adjoint(1:3,1:3);
end
% ------ G_dot{o}_base computation
baseLinVel_wrtG = baseVelocity.linear;
% ------ omega_base computation
baseAngVel_wrtG = baseVelocity.angular;

g_a_base_fromFloating = zeros(size(g_alfa_base_fromFloating));
for sampleIdx = 1 : lenAccSample
    tmp.term_acc_vect = [cross((base_R_G{sampleIdx,1}*baseLinVel_wrtG(:,sampleIdx)), ...
        baseAngVel_wrtG(:,sampleIdx));zeros(3,1)];
    % difference
    g_a_base_fromFloating(:,sampleIdx) = g_alfa_base_fromFloating(:,sampleIdx) - ...
        tmp.term_acc_vect;
end
%% Temporal norm analysis
lenSamples = size(fext_fixed.values,2);

% --------------- EXTERNAL FORCE f^x
fext_diff = zeros(size(fext_fixed.values)); % ordered like the fext_fixed label
lenVar = length(fext_fixed.label);
tmp.fixed_fext_vect    = zeros(size(fext_diff));
tmp.floating_fext_vect = zeros(size(fext_diff));
fext3D_diff = [];
mext3D_diff = [];
for diffIdx = 1 : lenVar
    fext_diff((6*(diffIdx-1)+1 : 6*diffIdx),:) = fext_fixed.values((6*(diffIdx-1)+1 : 6*diffIdx),:) ...
        - fext_floating.values(fext_rangesForDiff(diffIdx,:),:);
    tmp.fixed_fext_vect((6*(diffIdx-1)+1 : 6*diffIdx),:)    = fext_fixed.values((6*(diffIdx-1)+1 : 6*diffIdx),:);
    tmp.floating_fext_vect((6*(diffIdx-1)+1 : 6*diffIdx),:) = fext_floating.values(fext_rangesForDiff(diffIdx,:),:);
    
    tmp.fext6D_diff = fext_diff((6*(diffIdx-1)+1 : 6*diffIdx),:);
    fext3D_diff = [fext3D_diff; tmp.fext6D_diff(1:3,:)];
    mext3D_diff = [mext3D_diff; tmp.fext6D_diff(4:6,:)];
end
% Norm all samples
for samplesIdx = 1 : lenSamples
    normAnalysis.difference_fext(1,samplesIdx)   = norm(fext_diff(:,samplesIdx));
    normAnalysis.difference_fext3D(1,samplesIdx) = norm(fext3D_diff(:,samplesIdx));
    normAnalysis.difference_mext3D(1,samplesIdx) = norm(mext3D_diff(:,samplesIdx));
    normAnalysis.onlyFixed_fext(1,samplesIdx)    = norm(tmp.fixed_fext_vect(:,samplesIdx));
    normAnalysis.onlyFloating_fext(1,samplesIdx) = norm(tmp.floating_fext_vect(:,samplesIdx));
end
% Norm of the fext per each link
normAnalysis.singleLink_fext = zeros(lenVar,lenSamples);
for diffIdx = 1 : lenVar
    tmp.fextDiff_singleLinkNorm = tmp.fixed_fext_vect((6*(diffIdx-1)+1 : 6*diffIdx),:) ...
        - tmp.floating_fext_vect((6*(diffIdx-1)+1 : 6*diffIdx),:);
    for samplesIdx = 1 : lenSamples
        normAnalysis.singleLink_fext(diffIdx,samplesIdx)   = norm(tmp.fextDiff_singleLinkNorm(:,samplesIdx));
    end
end

% --------------- TORQUE
tau_diff = (tau_fixed.values - tau_floating.values);
% Norm all samples
for samplesIdx = 1 : lenSamples
    normAnalysis.difference_tau(1,samplesIdx) = norm(tau_diff(:,samplesIdx));
    normAnalysis.onlyFixed_tau(1,samplesIdx)    = norm(tau_fixed.values(:,samplesIdx));
    normAnalysis.onlyFloating_tau(1,samplesIdx) = norm(tau_floating.values(:,samplesIdx));
end

% --------------- DDQ
ddq_diff = (ddq_fixed.values - ddq_floating.values);
% Norm all samples
for samplesIdx = 1 : lenSamples
    normAnalysis.difference_ddq(1,samplesIdx) = norm(ddq_diff(:,samplesIdx));
    normAnalysis.onlyFixed_ddq(1,samplesIdx)    = norm(ddq_fixed.values(:,samplesIdx));
    normAnalysis.onlyFloating_ddq(1,samplesIdx) = norm(ddq_floating.values(:,samplesIdx));
end

% --------------- ACC
normAnalysis.baseAccLinDiff = zeros(1,lenAccSample);
normAnalysis.baseAccAngDiff = zeros(1,lenAccSample);

tmp.baseAccLinDiff = g_a_base_fromFixed(1:3,:) - g_a_base_fromFloating(1:3,:);
tmp.baseAccAngDiff = g_a_base_fromFixed(4:6,:) - g_a_base_fromFloating(4:6,:);
for normAccIdx = 1 : lenAccSample
    normAnalysis.baseAccLinDiff(1,normAccIdx) = norm(tmp.baseAccLinDiff(:,normAccIdx));
    normAnalysis.baseAccAngDiff(1,normAccIdx) = norm(tmp.baseAccAngDiff(:,normAccIdx));
end

save(fullfile(bucket.pathToProcessedData,'normAnalysis.mat'),'normAnalysis');

%% Norm plots
% Plot norm all samples ---------------------------------------------------
% % fig = figure('Name', 'norm all samples','NumberTitle','off');
% % axes1 = axes('Parent',fig,'FontSize',16);
% % box(axes1,'on');
% % hold(axes1,'on');
% % grid on;
% % 
% % subplot(3,2,1)
% % plot2 = plot(normAnalysis.onlyFixed_ddq,'color', colorFixed,'lineWidth',1.5);
% % hold on
% % plot3 = plot(normAnalysis.onlyFloating_ddq,'b','lineWidth',1.5);
% % title ('Individual norm','FontSize',16);
% % ylabel('ddq [rad/s^2]','HorizontalAlignment','center',...
% %     'FontSize',16);
% % grid on;
% % axis tight;
% % leg = legend([plot2,plot3],{'||fixed||','||floating||'});
% % % set(leg,'Interpreter','latex');
% % set(leg,'FontSize',14);
% % 
% % subplot(3,2,2)
% % plot1 = plot(normAnalysis.difference_ddq,'k','lineWidth',1.5);
% % title ('Difference norm','FontSize',16);
% % grid on;
% % axis tight;
% % leg = legend([plot1],{'||fixed-floating||'},'FontSize',14);
% % set(leg,'FontSize',14);
% % 
% % subplot(3,2,3)
% % plot2 = plot(normAnalysis.onlyFixed_fext,'color', colorFixed,'lineWidth',1.5);
% % hold on
% % plot3 = plot(normAnalysis.onlyFloating_fext,'b','lineWidth',1.5);
% % ylabel('6D f^x','HorizontalAlignment','center',...
% %     'FontSize',16);
% % set(gca,'XTickLabel',[])
% % grid on;
% % axis tight;
% % 
% % subplot(3,2,4)
% % plot1 = plot(normAnalysis.difference_fext,'k','lineWidth',1.5);
% % set(gca,'XTickLabel',[])
% % grid on;
% % axis tight;
% % 
% % subplot(3,2,5)
% % plot2 = plot(normAnalysis.onlyFixed_tau,'color', colorFixed,'lineWidth',1.5);
% % hold on
% % plot3 = plot(normAnalysis.onlyFloating_tau,'b','lineWidth',1.5);
% % ylabel('\tau [Nm]','HorizontalAlignment','center',...
% %     'FontSize',16);
% % xlabel('samples','HorizontalAlignment','center',...
% %     'FontSize',16)
% % grid on;
% % axis tight;
% % 
% % subplot(3,2,6)
% % plot1 = plot(normAnalysis.difference_tau,'k','lineWidth',1.5);
% % xlabel('samples','HorizontalAlignment','center',...
% %     'FontSize',16)
% % grid on;
% % axis tight;

%% Legend to be cropped fake plot)
% fig = figure('Name', 'fake_figure','NumberTitle','off');
% axes1 = axes('Parent',fig,'FontSize',16);
% box(axes1,'on');
% hold(axes1,'on');
% 
% plot1 = plot(normAnalysis.difference_ddq,'Color',normColor,'lineWidth',2);
% 
% leg = legend([plot1],{'norm(fixed-floating)'},'Location','south');
% set(leg,'Interpreter','latex', ...
%        'Orientation','horizontal');
% set(leg,'FontSize',13);
% 
% subplotsqueeze(gcf, 1.2);
% if saveON
%     save2pdf(fullfile(bucket.pathToPlots, ('legend')),fig,600);
% end

%% Plot paper
% normColor = [0.600000023841858 0.600000023841858 0];
% 
% fig = figure('Name', 'norm difference','NumberTitle','off');
% axes1 = axes('Parent',fig,'FontSize',16);
% box(axes1,'on');
% hold(axes1,'on');
% grid on;
% 
% subplot(3,1,1)
% plot1 = plot(normAnalysis.baseAccLinDiff','Color',normColor,'lineWidth',2);
% % title ('Difference norm','FontSize',16);
% ax = gca;
% ax.FontSize = 15;
% NumTicks = 5;
% L = get(gca,'YLim');
% set(gca,'YTick',linspace(L(1),L(2),NumTicks))
% set(gca,'XTickLabel',[])
% ax = gca;
% ax.FontSize = 15;
% ylabel('$a_{lin}^g$ error','HorizontalAlignment','center',...
%     'FontSize',24,'interpreter','latex');
% grid on;
% axis tight;
% 
% subplot(3,1,2)
% plot1 = plot(normAnalysis.difference_ddq,'Color',normColor,'lineWidth',2);
% ax = gca;
% ax.FontSize = 15;
% NumTicks = 5;
% L = get(gca,'YLim');
% set(gca,'YTick',linspace(L(1),L(2),NumTicks))
% set(gca,'XTickLabel',[])
% ax = gca;
% ax.FontSize = 15;
% ylabel('$\ddot{s}$ error','HorizontalAlignment','center',...
%     'FontSize',24,'interpreter','latex');
% grid on;
% axis tight;
% 
% subplot(3,1,3)
% plot1 = plot(normAnalysis.difference_tau,'Color',normColor,'lineWidth',2);
% xlabel('samples','HorizontalAlignment','center',...
%     'FontSize',16)
% ax = gca;
% ax.FontSize = 15;
% ylabel('$\tau$ error','HorizontalAlignment','center',...
%     'FontSize',24,'interpreter','latex');
% xlabel('samples', 'FontSize',18);
% grid on;
% axis tight;
% 
% % resize and save
% % subplotsqueeze(gcf, 1.18);
% tightfig();
% % save
% if saveON
%     save2pdf(fullfile(bucket.pathToPlots, sprintf('floatVSfixed_normDifference-trial%s',num2str(taskID))),fig,600);
% end

%%
% for plotIdx = 1:lenVar
% figure();
% axes1 = axes('Parent',fig,'FontSize',16);
% box(axes1,'on');
% hold(axes1,'on');
% grid on;
% 
% plot1 = plot(normAnalysis.singleLink_fext(plotIdx,:),'lineWidth',1.5);
% title('external force norm');
% leg = legend([plot1],{fext_fixed.label{plotIdx}},'FontSize',14);
% set(leg,'FontSize',14);
% end