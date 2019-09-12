% Plot the estimated joint torques w.r.t. the contact pattern detected
close all;

% Plot folder
bucket.pathToPlots = fullfile(bucket.pathToTask,'plots');
if ~exist(bucket.pathToPlots)
    mkdir (bucket.pathToPlots)
end
saveON = true;

fig = figure('Name', 'Right angles vs. joints w.r.t. pattern detection','NumberTitle','off');
axes1 = axes('Parent',fig,'FontSize',16);
box(axes1,'on');
hold(axes1,'on');
grid on;

% Colors
doubleSupportColor       = [0.87058824300766 0.921568632125854 0.980392158031464];
singleSupportColor_left  = [1 0.800000011920929 0.800000011920929];
singleSupportColor_right = [0.756862759590149 0.866666674613953 0.776470601558685];

%% Extraction of the angles
for jntIdx = 1 : nrDofs
    % ----------------------- Right Ankle rotx ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jRightAnkle_rotx')
        angle_RA_rotx = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_RA_rotx = max(angle_RA_rotx);
        minValAng_RA_rotx = min(angle_RA_rotx);
    end
    %     % ----------------------- Right Ankle roty ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jRightAnkle_roty')
        angle_RA_roty = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_RA_roty = max(angle_RA_roty);
        minValAng_RA_roty = min(angle_RA_roty);
    end
    %     % ----------------------- Right Ankle rotz ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jRightAnkle_rotz')
        angle_RA_rotz = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_RA_rotz = max(angle_RA_rotz);
        minValAng_RA_rotz = min(angle_RA_rotz);
    end
    %     % ----------------------- Right Knee rotx ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jRightKnee_rotx')
        angle_RK_rotx = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_RK_rotx = max(angle_RK_rotx);
        minValAng_RK_rotx = min(angle_RK_rotx);
    end
    % ----------------------- Right Knee roty ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jRightKnee_roty')
        angle_RK_roty = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_RK_roty = max(angle_RK_roty);
        minValAng_RK_roty = min(angle_RK_roty);
    end
    % ----------------------- Right Knee rotz ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jRightKnee_rotz')
        angle_RK_rotz = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_RK_rotz = max(angle_RK_rotz);
        minValAng_RK_rotz = min(angle_RK_rotz);
    end
    % ----------------------- Right Hip rotx ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jRightHip_rotx')
        angle_RH_rotx = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_RH_rotx = max(angle_RH_rotx);
        minValAng_RH_rotx = min(angle_RH_rotx);
    end
    % ----------------------- Right Hip roty ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jRightHip_roty')
        angle_RH_roty = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_RH_roty = max(angle_RH_roty);
        minValAng_RH_roty = min(angle_RH_roty);
    end
    % ----------------------- Right Hip roty ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jRightHip_rotz')
        angle_RH_rotz = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_RH_rotz = max(angle_RH_rotz);
        minValAng_RH_rotz = min(angle_RH_rotz);
    end
end

%% Extraction of the torques
for tauIdx = 1 : nrDofs
    % ----------------------- Right Ankle rotx ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jRightAnkle_rotx')
        torque_RA_rotx = estimatedVariables.tau.values(tauIdx,:);
        maxVal_RA_rotx = max(torque_RA_rotx);
        minVal_RA_rotx = min(torque_RA_rotx);
    end
    % ----------------------- Right Ankle roty ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jRightAnkle_roty')
        torque_RA_roty = estimatedVariables.tau.values(tauIdx,:);
        maxVal_RA_roty = max(torque_RA_roty);
        minVal_RA_roty = min(torque_RA_roty);
    end
    % ----------------------- Right Ankle rotz ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jRightAnkle_rotz')
        torque_RA_rotz = estimatedVariables.tau.values(tauIdx,:);
        maxVal_RA_rotz = max(torque_RA_rotz);
        minVal_RA_rotz = min(torque_RA_rotz);
    end
    % ----------------------- Right Knee rotx ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jRightKnee_rotx')
        torque_RK_rotx = estimatedVariables.tau.values(tauIdx,:);
        maxVal_RK_rotx = max(torque_RK_rotx);
        minVal_RK_rotx = min(torque_RK_rotx);
    end
    % ----------------------- Right Knee roty ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jRightKnee_roty')
        torque_RK_roty = estimatedVariables.tau.values(tauIdx,:);
        maxVal_RK_roty = max(torque_RK_roty);
        minVal_RK_roty = min(torque_RK_roty);
    end
    % ----------------------- Right Knee rotz ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jRightKnee_rotz')
        torque_RK_rotz = estimatedVariables.tau.values(tauIdx,:);
        maxVal_RK_rotz = max(torque_RK_rotz);
        minVal_RK_rotz = min(torque_RK_rotz);
    end
    % ----------------------- Right Hip rotx ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jRightHip_rotx')
        torque_RH_rotx = estimatedVariables.tau.values(tauIdx,:);
        maxVal_RH_rotx = max(torque_RH_rotx);
        minVal_RH_rotx = min(torque_RH_rotx);
    end
    % ----------------------- Right Hip roty ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jRightHip_roty')
        torque_RH_roty = estimatedVariables.tau.values(tauIdx,:);
        maxVal_RH_roty = max(torque_RH_roty);
        minVal_RH_roty = min(torque_RH_roty);
    end
    % ----------------------- Right Hip rotz ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jRightHip_rotz')
        torque_RH_rotz = estimatedVariables.tau.values(tauIdx,:);
        maxVal_RH_rotz = max(torque_RH_rotz);
        minVal_RH_rotz = min(torque_RH_rotz);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANGLES RIGHT rotx (1-2-3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxValAngl_Rx = max([maxValAng_RA_rotx, maxValAng_RK_rotx, maxValAng_RH_rotx]);
minValAng_Rx  = min([minValAng_RA_rotx, minValAng_RK_rotx, minValAng_RH_rotx]);

subplot (6,3,1) % Right Ankle rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Rx;
    y2 = minValAng_Rx;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxValAngl_Rx;
        y2 = minValAng_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxValAngl_Rx;
        y2 = minValAng_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_RA_rotx,'k','lineWidth',1.5);

title('Right ankle');
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$s_x$ [deg]','HorizontalAlignment','center',...
    'FontSize',24,'interpreter','latex');
grid on;

subplot (6,3,2) % Right Knee rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Rx;
    y2 = minValAng_Rx;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxValAngl_Rx;
        y2 = minValAng_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxValAngl_Rx;
        y2 = minValAng_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_RK_rotx,'k','lineWidth',1.5);

title('Right knee');
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;

subplot (6,3,3) % Right Hip rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Rx;
    y2 = minValAng_Rx;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxValAngl_Rx;
        y2 = minValAng_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxValAngl_Rx;
        y2 = minValAng_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_RH_rotx,'k','lineWidth',1.5);

title('Right hip');
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TORQUES RIGHT rotx (4-5-6)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxVal_Rx = max([maxVal_RA_rotx, maxVal_RK_rotx, maxVal_RH_rotx]);
minVal_Rx = min([minVal_RA_rotx, minVal_RK_rotx, minVal_RH_rotx]);

subplot (6,3,4) % Right Ankle rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Rx;
    y2 = minVal_Rx;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxVal_Rx;
        y2 = minVal_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxVal_Rx;
        y2 = minVal_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_RA_rotx,'b','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$\tau_x$ [Nm]','HorizontalAlignment','center',...
    'FontSize',24,'interpreter','latex');
grid on;

subplot (6,3,5) % Right Knee rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Rx;
    y2 = minVal_Rx;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxVal_Rx;
        y2 = minVal_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxVal_Rx;
        y2 = minVal_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_RK_rotx,'b','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;

subplot (6,3,6) % Right Hip rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Rx;
    y2 = minVal_Rx;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxVal_Rx;
        y2 = minVal_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxVal_Rx;
        y2 = minVal_Rx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_RH_rotx,'b','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANGLES RIGHT roty (7-8-9)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxValAngl_Ry = max([maxValAng_RA_roty, maxValAng_RK_roty, maxValAng_RH_roty]);
minValAng_Ry  = min([minValAng_RA_roty, minValAng_RK_roty, minValAng_RH_roty]);

subplot (6,3,7) % Right Ankle roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Ry;
    y2 = minValAng_Ry;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxValAngl_Ry;
        y2 = minValAng_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxValAngl_Ry;
        y2 = minValAng_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_RA_roty,'k','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$s_y$ [deg]','HorizontalAlignment','center',...
    'FontSize',24,'interpreter','latex');
grid on;

subplot (6,3,8) % Right Knee roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Ry;
    y2 = minValAng_Ry;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxValAngl_Ry;
        y2 = minValAng_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxValAngl_Ry;
        y2 = minValAng_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_RK_roty,'k','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;

subplot (6,3,9) % Right Hip roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Ry;
    y2 = minValAng_Ry;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxValAngl_Ry;
        y2 = minValAng_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxValAngl_Ry;
        y2 = minValAng_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_RH_roty,'k','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TORQUES RIGHT roty (10-11-12)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxVal_Ry = max([maxVal_RA_roty, maxVal_RK_roty, maxVal_RH_roty]);
minVal_Ry = min([minVal_RA_roty, minVal_RK_roty, minVal_RH_roty]);

subplot (6,3,10) % Right Ankle roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Ry;
    y2 = minVal_Ry;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxVal_Ry;
        y2 = minVal_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxVal_Ry;
        y2 = minVal_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_RA_roty,'b','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$\tau_y$ [Nm]','HorizontalAlignment','center',...
    'FontSize',24,'interpreter','latex');
grid on;

subplot (6,3,11) % Right Knee roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Ry;
    y2 = minVal_Ry;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxVal_Ry;
        y2 = minVal_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxVal_Ry;
        y2 = minVal_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_RK_roty,'b','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;


subplot (6,3,12) % Right Hip roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Ry;
    y2 = minVal_Ry;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxVal_Ry;
        y2 = minVal_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxVal_Ry;
        y2 = minVal_Ry;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_RH_roty,'b','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANGLES RIGHT rotz (13-14-15)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxValAngl_Rz = max([maxValAng_RA_rotz, maxValAng_RK_rotz, maxValAng_RH_rotz]);
minValAng_Rz  = min([minValAng_RA_rotz, minValAng_RK_rotz, minValAng_RH_rotz]);

subplot (6,3,13) % Right Ankle rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Rz;
    y2 = minValAng_Rz;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxValAngl_Rz;
        y2 = minValAng_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxValAngl_Rz;
        y2 = minValAng_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_RA_rotz,'k','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$s_z$ [deg]','HorizontalAlignment','center',...
    'FontSize',24,'interpreter','latex');
grid on;

subplot (6,3,14) % Right Knee rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Rz;
    y2 = minValAng_Rz;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxValAngl_Rz;
        y2 = minValAng_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxValAngl_Rz;
        y2 = minValAng_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_RK_rotz,'k','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;

subplot (6,3,15) % Right Hip rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Rz;
    y2 = minValAng_Rz;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxValAngl_Rz;
        y2 = minValAng_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxValAngl_Rz;
        y2 = minValAng_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_RH_rotz,'k','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TORQUES RIGHT rotz (16-17-18)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxVal_Rz = max([maxVal_RA_rotz, maxVal_RK_rotz, maxVal_RH_rotz]);
minVal_Rz = min([minVal_RA_rotz, minVal_RK_rotz, minVal_RH_rotz]);

subplot (6,3,16) % Right Ankle rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Rz;
    y2 = minVal_Rz;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxVal_Rz;
        y2 = minVal_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxVal_Rz;
        y2 = minVal_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_RA_rotz,'b','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$\tau_z$ [Nm]','HorizontalAlignment','center',...
    'FontSize',24,'interpreter','latex');
xlabel('samples','FontSize',18);
grid on;

% %legend
% if flag_SSleft % DS + leftSS
%     leg = legend([plot1,shadedPatch1,shadedPatch2], ...
%         {'\tau_{MAP}','doubleSupport','leftSupport'},'Location','northeast','FontSize',18);
% end
% if flag_SSright % DS + rightSS
%     leg = legend([plot1,shadedPatch1,shadedPatch3], ...
%         {'\tau_{MAP}','doubleSupport','rightSupport'},'Location','northeast','FontSize',18);
% end
% if flag_SSleft & flag_SSright % DS + leftSS + rightSS
%     leg = legend([plot1,shadedPatch1,shadedPatch2,shadedPatch3], ...
%         {'\tau_{MAP}','doubleSupport','leftSupport','rightSupport'},'Location','northeast','FontSize',18);
% end

subplot (6,3,17) % Right Knee rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Rz;
    y2 = minVal_Rz;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxVal_Rz;
        y2 = minVal_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxVal_Rz;
        y2 = minVal_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_RK_rotz,'b','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
xlabel('samples','FontSize',18);
grid on;

subplot (6,3,18) % Right Hip rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Rz;
    y2 = minVal_Rz;
    x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
    x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
    shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
    hold on
end

% SS_left
flag_SSleft = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
        flag_SSleft = true;
        y1 = maxVal_Rz;
        y2 = minVal_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
    end
end
hold on

% SS_right
flag_SSright = false; % by default
for shadedIdx = 1 : patternRanges.nrOfDS
    if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
        flag_SSright = true;
        y1 = maxVal_Rz;
        y2 = minVal_Rz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_RH_rotz,'b','lineWidth',1.5);

axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
xlabel('samples','FontSize',18);
grid on;

%% Legend
% % % fig = figure('Name', 'fake plot per legend','NumberTitle','off');
% % % axes1 = axes('Parent',fig,'FontSize',16);
% % % box(axes1,'on');
% % % hold(axes1,'on');
% % % 
% % % % DS
% % % for shadedIdx = 1 : patternRanges.nrOfDS
% % %     y1 = maxVal_Rz;
% % %     y2 = minVal_Rz;
% % %     x1 = patternRanges.DSrange(shadedIdx).rangeMin(1);
% % %     x2 = patternRanges.DSrange(shadedIdx).rangeMax(1);
% % %     shadedPatch1 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],doubleSupportColor);
% % %     hold on
% % % end
% % % 
% % % % SS_left
% % % flag_SSleft = false; % by default
% % % for shadedIdx = 1 : patternRanges.nrOfDS
% % %     if strcmp(patternRanges.SSrange(shadedIdx).contact,'LeftFoot')
% % %         flag_SSleft = true;
% % %         y1 = maxVal_Rz;
% % %         y2 = minVal_Rz;
% % %         x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
% % %         x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
% % %         shadedPatch2 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_left);
% % %     end
% % % end
% % % hold on
% % % 
% % % % SS_right
% % % flag_SSright = false; % by default
% % % for shadedIdx = 1 : patternRanges.nrOfDS
% % %     if strcmp(patternRanges.SSrange(shadedIdx).contact,'RightFoot')
% % %         flag_SSright = true;
% % %         y1 = maxVal_Rz;
% % %         y2 = minVal_Rz;
% % %         x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
% % %         x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
% % %         shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
% % %     end
% % % end
% % % hold on
% % % plot1 = plot(torque_RH_rotz,'b','lineWidth',1.5);
% % % 
% % % 
% % % if flag_SSleft % DS + leftSS
% % %     leg = legend([plot1,plot2,shadedPatch1,shadedPatch2], ...
% % %         {'\tau_{MAP}','angle','doubleSupport','leftSupport'},'Location','northeast','FontSize',18);
% % % end
% % % if flag_SSright % DS + rightSS
% % %     leg = legend([plot1,plot2,shadedPatch1,shadedPatch3], ...
% % %         {'\tau_{MAP}','angle','doubleSupport','rightSupport'},'Location','northeast','FontSize',18);
% % % end
% % % if flag_SSleft & flag_SSright % DS + leftSS + rightSS
% % %     leg = legend([plot1,plot2,shadedPatch1,shadedPatch2,shadedPatch3], ...
% % %         {'\tau_{MAP}','angle','doubleSupport','leftSupport','rightSupport'},'Location','northeast','FontSize',18);
% % % end
% % % set(leg,'Orientation','horizontal');

%% Squeeze figure and save as pdf
align_Ylabels(gcf)

subplotsqueeze(gcf, 1.15);
tightfig();
if saveON
    save2pdf(fullfile(bucket.pathToPlots, sprintf('tauVSangleRight-trial%s',num2str(taskID))),fig,600);
    % % this modality allows to open the figure, to move manually the legend and
    % % then to save as a .pdf
    
    %     set(fig,'PaperSize',[26 13]); %set the paper size to what you want
    %     figureName = sprintf('tauVSangle_rleg_trial%s',num2str(taskID));
    %     print(fig,figureName,'-dpdf') % then print it
end
