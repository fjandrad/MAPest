% Plot the estimated joint torques w.r.t. the contact pattern detected
close all;

% Plot folder
bucket.pathToPlots = fullfile(bucket.pathToTask,'plots');
if ~exist(bucket.pathToPlots)
    mkdir (bucket.pathToPlots)
end
saveON = true;

fig = figure('Name', 'Left angles vs. joints w.r.t. pattern detection','NumberTitle','off');
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
    % ----------------------- Left Ankle rotx ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jLeftAnkle_rotx')
        angle_LA_rotx = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_LA_rotx = max(angle_LA_rotx);
        minValAng_LA_rotx = min(angle_LA_rotx);
    end
    %     % ----------------------- Left Ankle roty ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jLeftAnkle_roty')
        angle_LA_roty = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_LA_roty = max(angle_LA_roty);
        minValAng_LA_roty = min(angle_LA_roty);
    end
    %     % ----------------------- Left Ankle rotz ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jLeftAnkle_rotz')
        angle_LA_rotz = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_LA_rotz = max(angle_LA_rotz);
        minValAng_LA_rotz = min(angle_LA_rotz);
    end
    %     % ----------------------- Left Knee rotx ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jLeftKnee_rotx')
        angle_LK_rotx = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_LK_rotx = max(angle_LK_rotx);
        minValAng_LK_rotx = min(angle_LK_rotx);
    end
    % ----------------------- Left Knee roty ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jLeftKnee_roty')
        angle_LK_roty = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_LK_roty = max(angle_LK_roty);
        minValAng_LK_roty = min(angle_LK_roty);
    end
    % ----------------------- Left Knee rotz ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jLeftKnee_rotz')
        angle_LK_rotz = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_LK_rotz = max(angle_LK_rotz);
        minValAng_LK_rotz = min(angle_LK_rotz);
    end
    % ----------------------- Left Hip rotx ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jLeftHip_rotx')
        angle_LH_rotx = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_LH_rotx = max(angle_LH_rotx);
        minValAng_LH_rotx = min(angle_LH_rotx);
    end
    % ----------------------- Left Hip roty ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jLeftHip_roty')
        angle_LH_roty = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_LH_roty = max(angle_LH_roty);
        minValAng_LH_roty = min(angle_LH_roty);
    end
    % ----------------------- Left Hip roty ----------------------------
    if strcmp(synchroKin.label{jntIdx,1},'jLeftHip_rotz')
        angle_LH_rotz = synchroKin.state.q(jntIdx,:) * 180/pi; %in deg
        maxValAng_LH_rotz = max(angle_LH_rotz);
        minValAng_LH_rotz = min(angle_LH_rotz);
    end
end

%% Extraction of the torques
for tauIdx = 1 : nrDofs
    % ----------------------- Left Ankle rotx ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jLeftAnkle_rotx')
        torque_LA_rotx = estimatedVariables.tau.values(tauIdx,:);
        maxVal_LA_rotx = max(torque_LA_rotx);
        minVal_LA_rotx = min(torque_LA_rotx);
    end
    % ----------------------- Left Ankle roty ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jLeftAnkle_roty')
        torque_LA_roty = estimatedVariables.tau.values(tauIdx,:);
        maxVal_LA_roty = max(torque_LA_roty);
        minVal_LA_roty = min(torque_LA_roty);
    end
    % ----------------------- Left Ankle rotz ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jLeftAnkle_rotz')
        torque_LA_rotz = estimatedVariables.tau.values(tauIdx,:);
        maxVal_LA_rotz = max(torque_LA_rotz);
        minVal_LA_rotz = min(torque_LA_rotz);
    end
    % ----------------------- Left Knee rotx ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jLeftKnee_rotx')
        torque_LK_rotx = estimatedVariables.tau.values(tauIdx,:);
        maxVal_LK_rotx = max(torque_LK_rotx);
        minVal_LK_rotx = min(torque_LK_rotx);
    end
    % ----------------------- Left Knee roty ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jLeftKnee_roty')
        torque_LK_roty = estimatedVariables.tau.values(tauIdx,:);
        maxVal_LK_roty = max(torque_LK_roty);
        minVal_LK_roty = min(torque_LK_roty);
    end
    % ----------------------- Left Knee rotz ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jLeftKnee_rotz')
        torque_LK_rotz = estimatedVariables.tau.values(tauIdx,:);
        maxVal_LK_rotz = max(torque_LK_rotz);
        minVal_LK_rotz = min(torque_LK_rotz);
    end
    % ----------------------- Left Hip rotx ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jLeftHip_rotx')
        torque_LH_rotx = estimatedVariables.tau.values(tauIdx,:);
        maxVal_LH_rotx = max(torque_LH_rotx);
        minVal_LH_rotx = min(torque_LH_rotx);
    end
    % ----------------------- Left Hip roty ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jLeftHip_roty')
        torque_LH_roty = estimatedVariables.tau.values(tauIdx,:);
        maxVal_LH_roty = max(torque_LH_roty);
        minVal_LH_roty = min(torque_LH_roty);
    end
    % ----------------------- Left Hip rotz ----------------------------
    if strcmp(estimatedVariables.tau.label{tauIdx},'jLeftHip_rotz')
        torque_LH_rotz = estimatedVariables.tau.values(tauIdx,:);
        maxVal_LH_rotz = max(torque_LH_rotz);
        minVal_LH_rotz = min(torque_LH_rotz);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANGLES LEFT rotx (1-2-3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxValAngl_Lx = max([maxValAng_LA_rotx, maxValAng_LK_rotx, maxValAng_LH_rotx]);
minValAng_Lx  = min([minValAng_LA_rotx, minValAng_LK_rotx, minValAng_LH_rotx]);

subplot (6,3,1) % Left Ankle rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Lx;
    y2 = minValAng_Lx;
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
        y1 = maxValAngl_Lx;
        y2 = minValAng_Lx;
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
        y1 = maxValAngl_Lx;
        y2 = minValAng_Lx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_LA_rotx,'k','lineWidth',1.5);

title('Left ankle');
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


subplot (6,3,2) % Left Knee rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Lx;
    y2 = minValAng_Lx;
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
        y1 = maxValAngl_Lx;
        y2 = minValAng_Lx;
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
        y1 = maxValAngl_Lx;
        y2 = minValAng_Lx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_LK_rotx,'k','lineWidth',1.5);

title('Left knee');
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

subplot (6,3,3) % Left Hip rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAngl_Lx;
    y2 = minValAng_Lx;
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
        y1 = maxValAngl_Lx;
        y2 = minValAng_Lx;
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
        y1 = maxValAngl_Lx;
        y2 = minValAng_Lx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_LH_rotx,'k','lineWidth',1.5);

title('Left hip');
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
%% TORQUES LEFT rotx (4-5-6)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxVal_Lx = max([maxVal_LA_rotx, maxVal_LK_rotx, maxVal_LH_rotx]);
minVal_Lx = min([minVal_LA_rotx, minVal_LK_rotx, minVal_LH_rotx]);

subplot (6,3,4) % Left Ankle rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Lx;
    y2 = minVal_Lx;
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
        y1 = maxVal_Lx;
        y2 = minVal_Lx;
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
        y1 = maxVal_Lx;
        y2 = minVal_Lx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_LA_rotx,'b','lineWidth',1.5);

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


subplot (6,3,5) % Left Knee rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Lx;
    y2 = minVal_Lx;
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
        y1 = maxVal_Lx;
        y2 = minVal_Lx;
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
        y1 = maxVal_Lx;
        y2 = minVal_Lx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_LK_rotx,'b','lineWidth',1.5);

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

subplot (6,3,6) % Left Hip rotx ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Lx;
    y2 = minVal_Lx;
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
        y1 = maxVal_Lx;
        y2 = minVal_Lx;
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
        y1 = maxVal_Lx;
        y2 = minVal_Lx;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_LH_rotx,'b','lineWidth',1.5);

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
%% ANGLES LEFT roty (7-8-9)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxValAng_Ly = max([maxValAng_LA_roty, maxValAng_LK_roty, maxValAng_LH_roty]);
minValAng_Ly  = min([minValAng_LA_roty, minValAng_LK_roty, minValAng_LH_roty]);

subplot (6,3,7) % Left Ankle roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAng_Ly;
    y2 = minValAng_Ly;
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
        y1 = maxValAng_Ly;
        y2 = minValAng_Ly;
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
        y1 = maxValAng_Ly;
        y2 = minValAng_Ly;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_LA_roty,'k','lineWidth',1.5);

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

subplot (6,3,8) % Left Knee roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAng_Ly;
    y2 = minValAng_Ly;
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
        y1 = maxValAng_Ly;
        y2 = minValAng_Ly;
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
        y1 = maxValAng_Ly;
        y2 = minValAng_Ly;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_LK_roty,'k','lineWidth',1.5);

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

subplot (6,3,9) % Left Hip roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAng_Ly;
    y2 = minValAng_Ly;
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
        y1 = maxValAng_Ly;
        y2 = minValAng_Ly;
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
        y1 = maxValAng_Ly;
        y2 = minValAng_Ly;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_LH_roty,'k','lineWidth',1.5);

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
%% TORQUES LEFT roty (10-11-12)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxVal_Ly = max([maxVal_LA_roty, maxVal_LK_roty, maxVal_LH_roty]);
minVal_Ly = min([minVal_LA_roty, minVal_LK_roty, minVal_LH_roty]);

subplot (6,3,10) % Left Ankle roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Ly;
    y2 = minVal_Ly;
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
        y1 = maxVal_Ly;
        y2 = minVal_Ly;
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
        y1 = maxVal_Ly;
        y2 = minVal_Ly;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_LA_roty,'b','lineWidth',1.5);

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


subplot (6,3,11) % Left Knee roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Ly;
    y2 = minVal_Ly;
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
        y1 = maxVal_Ly;
        y2 = minVal_Ly;
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
        y1 = maxVal_Ly;
        y2 = minVal_Ly;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_LK_roty,'b','lineWidth',1.5);

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

subplot (6,3,12) % Left Hip roty ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Ly;
    y2 = minVal_Ly;
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
        y1 = maxVal_Ly;
        y2 = minVal_Ly;
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
        y1 = maxVal_Ly;
        y2 = minVal_Ly;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_LH_roty,'b','lineWidth',1.5);

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
%% ANGLES LEFT rotz (13-14-15)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxValAng_Lz = max([maxValAng_LA_rotz, maxValAng_LK_rotz, maxValAng_LH_rotz]);
minValAng_Lz  = min([minValAng_LA_rotz, minValAng_LK_rotz, minValAng_LH_rotz]);

subplot (6,3,13) % Left Ankle rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAng_Lz;
    y2 = minValAng_Lz;
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
        y1 = maxValAng_Lz;
        y2 = minValAng_Lz;
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
        y1 = maxValAng_Lz;
        y2 = minValAng_Lz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_LA_rotz,'k','lineWidth',1.5);

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

subplot (6,3,14) % Left Knee rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAng_Lz;
    y2 = minValAng_Lz;
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
        y1 = maxValAng_Lz;
        y2 = minValAng_Lz;
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
        y1 = maxValAng_Lz;
        y2 = minValAng_Lz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_LK_rotz,'k','lineWidth',1.5);

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

subplot (6,3,15) % Left Hip rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxValAng_Lz;
    y2 = minValAng_Lz;
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
        y1 = maxValAng_Lz;
        y2 = minValAng_Lz;
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
        y1 = maxValAng_Lz;
        y2 = minValAng_Lz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot2 = plot(angle_LH_rotz,'k','lineWidth',1.5);

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
%% TORQUES LEFT rotz (16-17-18)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxVal_Lz = max([maxVal_LA_rotz, maxVal_LK_rotz, maxVal_LH_rotz]);
minVal_Lz = min([minVal_LA_rotz, minVal_LK_rotz, minVal_LH_rotz]);

subplot (6,3,16) % Left Ankle rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Lz;
    y2 = minVal_Lz;
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
        y1 = maxVal_Lz;
        y2 = minVal_Lz;
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
        y1 = maxVal_Lz;
        y2 = minVal_Lz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_LA_rotz,'b','lineWidth',1.5);

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
% if flag_SSleft % DS + leftSS
%     leg = legend([plot1,shadedPatch1,shadedPatch3], ...
%         {'\tau_{MAP}','doubleSupport','leftSupport'},'Location','northeast','FontSize',18);
% end
% if flag_SSleft & flag_SSleft % DS + leftSS + leftSS
%     leg = legend([plot1,shadedPatch1,shadedPatch2,shadedPatch3], ...
%         {'\tau_{MAP}','doubleSupport','leftSupport','leftSupport'},'Location','northeast','FontSize',18);
% end

subplot (6,3,17) % Left Knee rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Lz;
    y2 = minVal_Lz;
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
        y1 = maxVal_Lz;
        y2 = minVal_Lz;
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
        y1 = maxVal_Lz;
        y2 = minVal_Lz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_LK_rotz,'b','lineWidth',1.5);

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

subplot (6,3,18) % Left Hip rotz ----------------------------
% DS
for shadedIdx = 1 : patternRanges.nrOfDS
    y1 = maxVal_Lz;
    y2 = minVal_Lz;
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
        y1 = maxVal_Lz;
        y2 = minVal_Lz;
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
        y1 = maxVal_Lz;
        y2 = minVal_Lz;
        x1 = patternRanges.SSrange(shadedIdx).rangeMin(1);
        x2 = patternRanges.SSrange(shadedIdx).rangeMax(1);
        shadedPatch3 = fill([x1 x1 x2 x2],[y1 y2 y2 y1],singleSupportColor_right);
    end
end
hold on
plot1 = plot(torque_LH_rotz,'b','lineWidth',1.5);

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
    save2pdf(fullfile(bucket.pathToPlots, sprintf('tauVSangleLeft-trial%s',num2str(taskID))),fig,600);
    % % this modality allows to open the figure, to move manually the legend and
    % % then to save as a .pdf
    
    %     set(fig,'PaperSize',[26 13]); %set the paper size to what you want
    %     figureName = sprintf('tauVSangle_rleg_trial%s',num2str(taskID));
    %     print(fig,figureName,'-dpdf') % then print it
end
