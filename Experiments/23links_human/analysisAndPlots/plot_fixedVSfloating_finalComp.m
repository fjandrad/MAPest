
% -----------------------------------------------------------------------%
%  VARIABLES ESTIMATION --> ANALYSIS & PLOTS
% -----------------------------------------------------------------------%
close all;

%% WHY THIS ANALYSIS
% If MAP is able to estimate properly those variables that are also
% measured (acc, fext and ddq) --> then we can suppose that the estimation
% of fint, fnet and tau are reasonable, as well.

% Plot folder
bucket.pathToPlots = fullfile('analysisAndPlots/plots');
if ~exist(bucket.pathToPlots)
    mkdir (bucket.pathToPlots)
end
saveON = true;

% normColor_fixed = [0.466666668653488 0.674509823322296 0.18823529779911]; %green
% normColor_floating = [0 0 1]; % blu

colorNormError = [0.87058824300766 0.490196079015732 0];

task01_normData = load(fullfile(bucket.pathToSubject,'Task01/processed/normAnalysis.mat'));
task04_normData = load(fullfile(bucket.pathToSubject,'Task04/processed/normAnalysis.mat'));
task06_normData = load(fullfile(bucket.pathToSubject,'Task06/processed/normAnalysis.mat'));

%% option of normalization
normalizedSignal = false;

if normalizedSignal
    % baseAccLin_floating
    tmp.var = task01_normData.normAnalysis.baseAccLin_floating;
    task01_normData.normAnalysis.baseAccLin_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.baseAccLin_floating;
    task04_normData.normAnalysis.baseAccLin_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.baseAccLin_floating;
    task06_normData.normAnalysis.baseAccLin_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    % baseAccLin_fixed
    tmp.var = task01_normData.normAnalysis.baseAccLin_fixed;
    task01_normData.normAnalysis.baseAccLin_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.baseAccLin_fixed;
    task04_normData.normAnalysis.baseAccLin_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.baseAccLin_fixed;
    task06_normData.normAnalysis.baseAccLin_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    % baseAccAng_floating
    tmp.var = task01_normData.normAnalysis.baseAccAng_floating;
    task01_normData.normAnalysis.baseAccAng_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.baseAccAng_floating;
    task04_normData.normAnalysis.baseAccAng_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.baseAccAng_floating;
    task06_normData.normAnalysis.baseAccAng_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    % baseAccAng_fixed
    tmp.var = task01_normData.normAnalysis.baseAccAng_fixed;
    task01_normData.normAnalysis.baseAccAng_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.baseAccAng_fixed;
    task04_normData.normAnalysis.baseAccAng_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.baseAccAng_fixed;
    task06_normData.normAnalysis.baseAccAng_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    
    % fext_floating
    tmp.var = task01_normData.normAnalysis.fext_floating;
    task01_normData.normAnalysis.fext_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.fext_floating;
    task04_normData.normAnalysis.fext_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.fext_floating;
    task06_normData.normAnalysis.fext_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    % fext_fixed
    tmp.var = task01_normData.normAnalysis.fext_fixed;
    task01_normData.normAnalysis.fext_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.fext_fixed;
    task04_normData.normAnalysis.fext_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.fext_fixed;
    task06_normData.normAnalysis.fext_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    % mext_floating
    tmp.var = task01_normData.normAnalysis.mext_floating;
    task01_normData.normAnalysis.mext_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.mext_floating;
    task04_normData.normAnalysis.mext_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.mext_floating;
    task06_normData.normAnalysis.mext_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    % mext_fixed
    tmp.var = task01_normData.normAnalysis.mext_fixed;
    task01_normData.normAnalysis.mext_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.mext_fixed;
    task04_normData.normAnalysis.mext_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.mext_fixed;
    task06_normData.normAnalysis.mext_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    
    % ddq_floating
    tmp.var = task01_normData.normAnalysis.ddq_floating;
    task01_normData.normAnalysis.ddq_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.ddq_floating;
    task04_normData.normAnalysis.ddq_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.ddq_floating;
    task06_normData.normAnalysis.ddq_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    % ddq_fixed
    tmp.var = task01_normData.normAnalysis.ddq_fixed;
    task01_normData.normAnalysis.ddq_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.ddq_fixed;
    task04_normData.normAnalysis.ddq_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.ddq_fixed;
    task06_normData.normAnalysis.ddq_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    
    % tau_floating
    tmp.var = task01_normData.normAnalysis.tau_floating;
    task01_normData.normAnalysis.tau_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.tau_floating;
    task04_normData.normAnalysis.tau_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.tau_floating;
    task06_normData.normAnalysis.tau_floating = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    % tau_fixed
    tmp.var = task01_normData.normAnalysis.tau_fixed;
    task01_normData.normAnalysis.tau_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task04_normData.normAnalysis.tau_fixed;
    task04_normData.normAnalysis.tau_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
    tmp.var = task06_normData.normAnalysis.tau_fixed;
    task06_normData.normAnalysis.tau_fixed = (tmp.var-min(tmp.var))/(max(tmp.var)-min(tmp.var));
end

%% Legend to be cropped fake plot)
% fig = figure('Name', 'fake_figure','NumberTitle','off');
% axes1 = axes('Parent',fig,'FontSize',16);
% box(axes1,'on');
% hold(axes1,'on');
% AA = 1;
% plot1 = plot(AA,'Color',normColor1,'lineWidth',2);
% plot2 = plot(AA,'Color',normColor2,'lineWidth',2);
% plot3 = plot(AA,'Color',normColor3,'lineWidth',2);
% plot4 = plot(AA,'Color',normColor4,'lineWidth',2);
% plot5 = plot(AA,'Color',normColor5,'lineWidth',2);
% 
% leg = legend([plot1,plot2,plot3,plot4,plot5],...
%     {'$\Sigma_d = 1e^2$','$\Sigma_d = 1e^1$','$\Sigma_d = 1e^0$', ...
%     '$\Sigma_d = 1e^{-1}$','$\Sigma_d = 1e^{-2}$'},'Location','south');
% set(leg,'Interpreter','latex');
% set(leg,'FontSize',24);

% % subplotsqueeze(gcf, 1.2);
% % if saveON
% %     save2pdf(fullfile(bucket.pathToPlots, ('legend')),fig,600);
% % end

%% Plot paper ACC BASE
fig = figure('Name', 'floatVSfixed norm baseACC','NumberTitle','off');
axes1 = axes('Parent',fig,'FontSize',16);
box(axes1,'on');
hold(axes1,'on');
grid on;

% ------------------------- task T1 == taskID1 ----------------------------
% Mean and std
norm_fixedVSfloating.MEANaccLinError_norm_task01 = mean(task01_normData.normAnalysis.baseAccLinDiff);
norm_fixedVSfloating.STDaccLinError_norm_task01 = std(task01_normData.normAnalysis.baseAccLinDiff);

norm_fixedVSfloating.MEANaccAngError_norm_task01 = mean(task01_normData.normAnalysis.baseAccAngDiff);
norm_fixedVSfloating.STDaccAngError_norm_task01  = std(task01_normData.normAnalysis.baseAccAngDiff);

subplot(2,3,1)
% plot1 = plot(task01_normData.normAnalysis.baseAccLin_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task01_normData.normAnalysis.baseAccLin_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task01_normData.normAnalysis.baseAccLinDiff,'Color',colorNormError,'lineWidth',2);
title ('T1','FontSize',15);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$\big|\varepsilon(a_{lin}^g)\big|$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;
% if normalizedSignal
%     ylabel('$|a_{lin}^g|$','HorizontalAlignment','center',...
%         'FontSize',24,'interpreter','latex');
% else
%     ylabel('$|a_{lin}^g|$ [m/$s^2$]','HorizontalAlignment','center',...
%         'FontSize',24,'interpreter','latex');
% end

subplot(2,3,4)
% plot1 = plot(task01_normData.normAnalysis.baseAccAng_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task01_normData.normAnalysis.baseAccAng_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task01_normData.normAnalysis.baseAccAngDiff,'Color',colorNormError,'lineWidth',2);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
ylabel('$\big|\varepsilon(a_{ang}^g)\big|$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
xlabel('samples', 'FontSize',18);
grid on;
% if normalizedSignal
%     ylabel('$|a_{ang}^g|$','HorizontalAlignment','center',...
%         'FontSize',24,'interpreter','latex');
% else
%     ylabel('$|a_{ang}^g|$[rad/$s^2$]','HorizontalAlignment','center',...
%         'FontSize',24,'interpreter','latex');
% end

% % ------------------------- task T2 == taskID4 ----------------------------
% Mean and std
norm_fixedVSfloating.MEANaccLinError_norm_task04 = mean(task04_normData.normAnalysis.baseAccLinDiff);
norm_fixedVSfloating.STDaccLinError_norm_task04 = std(task04_normData.normAnalysis.baseAccLinDiff);

norm_fixedVSfloating.MEANaccAngError_norm_task04 = mean(task04_normData.normAnalysis.baseAccAngDiff);
norm_fixedVSfloating.STDaccAngError_norm_task04  = std(task04_normData.normAnalysis.baseAccAngDiff);

subplot(2,3,2)
% plot1 = plot(task04_normData.normAnalysis.baseAccLin_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task04_normData.normAnalysis.baseAccLin_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task04_normData.normAnalysis.baseAccLinDiff,'Color',colorNormError,'lineWidth',2);
title ('T2','FontSize',15);
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
% ylabel('$\big|\varepsilon(a_{lin}^g)\big|$','HorizontalAlignment','center',...
%     'FontSize',27,'interpreter','latex');

subplot(2,3,5)
% plot1 = plot(task04_normData.normAnalysis.baseAccAng_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task04_normData.normAnalysis.baseAccAng_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task04_normData.normAnalysis.baseAccAngDiff,'Color',colorNormError,'lineWidth',2);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
xlabel('samples', 'FontSize',18);
grid on;

% % ------------------------- task T3 == taskID6 ----------------------------
% Mean and std
norm_fixedVSfloating.MEANaccLinError_norm_task06 = mean(task06_normData.normAnalysis.baseAccLinDiff);
norm_fixedVSfloating.STDaccLinError_norm_task06 = std(task06_normData.normAnalysis.baseAccLinDiff);

norm_fixedVSfloating.MEANaccAngError_norm_task06 = mean(task06_normData.normAnalysis.baseAccAngDiff);
norm_fixedVSfloating.STDaccAngError_norm_task06  = std(task06_normData.normAnalysis.baseAccAngDiff);

subplot(2,3,3)
% plot1 = plot(task06_normData.normAnalysis.baseAccLin_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task06_normData.normAnalysis.baseAccLin_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task06_normData.normAnalysis.baseAccLinDiff,'Color',colorNormError,'lineWidth',2);
title ('T3','FontSize',15);
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

subplot(2,3,6)
% plot1 = plot(task06_normData.normAnalysis.baseAccAng_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task06_normData.normAnalysis.baseAccAng_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task06_normData.normAnalysis.baseAccAngDiff,'Color',colorNormError,'lineWidth',2);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
xlabel('samples', 'FontSize',18);
grid on;

align_Ylabels(gcf)
% resize and save
subplotsqueeze(gcf, 1.12);
tightfig();
% save
if saveON
    save2pdf(fullfile(bucket.pathToPlots,'floatVSfixed_normError_ACC'),fig,600);
end

%% Plot paper 6D FEXT
fig = figure('Name', 'floatVSfixed norm FEXT','NumberTitle','off');
axes1 = axes('Parent',fig,'FontSize',16);
box(axes1,'on');
hold(axes1,'on');
grid on;

% ------------------------- task T1 == taskID1 ----------------------------
% Mean and std
norm_fixedVSfloating.MEANfextError_norm_task01 = mean(task01_normData.normAnalysis.difference_fext3D);
norm_fixedVSfloating.STDfextError_norm_task01 = std(task01_normData.normAnalysis.difference_fext3D);

norm_fixedVSfloating.MEANmextError_norm_task01 = mean(task01_normData.normAnalysis.difference_mext3D);
norm_fixedVSfloating.STDmextError_norm_task01 = std(task01_normData.normAnalysis.difference_mext3D);

subplot(2,3,1)
% plot1 = plot(task01_normData.normAnalysis.fext_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task01_normData.normAnalysis.fext_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task01_normData.normAnalysis.difference_fext3D,'Color',colorNormError,'lineWidth',2);
title ('T1','FontSize',15);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
% set(subplot1,'FontSize',15,'XTickLabel',{'','','',''},'YTick',...
%     [0.0245 0.0255 0.0265],'YTickLabel',{'0.024','0.025','0.026'});
ylabel('$\big|\varepsilon(f^x)\big|$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot(2,3,4)
% plot1 = plot(task01_normData.normAnalysis.mext_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task01_normData.normAnalysis.mext_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task01_normData.normAnalysis.difference_mext3D,'Color',colorNormError,'lineWidth',2);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
% set(subplot2,'FontSize',15,'XTickLabel','','YTick',...
%     [0.0008 0.0009 0.0009]);
ylabel('$\big|\varepsilon(m^x)\big|$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T2 == taskID4 ----------------------------
% Mean and std
norm_fixedVSfloating.MEANfextError_norm_task04 = mean(task04_normData.normAnalysis.difference_fext3D);
norm_fixedVSfloating.STDfextError_norm_task04 = std(task04_normData.normAnalysis.difference_fext3D);

norm_fixedVSfloating.MEANmextError_norm_task04 = mean(task04_normData.normAnalysis.difference_mext3D);
norm_fixedVSfloating.STDmextError_norm_task04 = std(task04_normData.normAnalysis.difference_mext3D);

subplot(2,3,2)
% plot1 = plot(task04_normData.normAnalysis.fext_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task04_normData.normAnalysis.fext_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task04_normData.normAnalysis.difference_fext3D,'Color',colorNormError,'lineWidth',2);
title ('T2','FontSize',15);
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

subplot(2,3,5)
% plot1 = plot(task04_normData.normAnalysis.mext_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task04_normData.normAnalysis.mext_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task04_normData.normAnalysis.difference_mext3D,'Color',colorNormError,'lineWidth',2);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
% ylabel('$\big|\varepsilon(f^x)\big|$','HorizontalAlignment','center',...
%     'FontSize',27,'interpreter','latex');
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T3 == taskID6 ----------------------------
% Mean and std
norm_fixedVSfloating.MEANfextError_norm_task06 = mean(task06_normData.normAnalysis.difference_fext3D);
norm_fixedVSfloating.STDfextError_norm_task06 = std(task06_normData.normAnalysis.difference_fext3D);

norm_fixedVSfloating.MEANmextError_norm_task06 = mean(task06_normData.normAnalysis.difference_mext3D);
norm_fixedVSfloating.STDmextError_norm_task06 = std(task06_normData.normAnalysis.difference_mext3D);

subplot(2,3,3)
% plot1 = plot(task06_normData.normAnalysis.fext_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task06_normData.normAnalysis.fext_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task06_normData.normAnalysis.difference_fext3D,'Color',colorNormError,'lineWidth',2);
title ('T3','FontSize',15);
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


subplot(2,3,6)
% plot1 = plot(task06_normData.normAnalysis.mext_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task06_normData.normAnalysis.mext_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task06_normData.normAnalysis.difference_mext3D,'Color',colorNormError,'lineWidth',2);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
% ylabel('$\big|\varepsilon(f^x)\big|$','HorizontalAlignment','center',...
%     'FontSize',27,'interpreter','latex');
xlabel('samples', 'FontSize',18);
grid on;

% align_Ylabels(gcf)
% resize and save
subplotsqueeze(gcf, 1.12);
tightfig();
% save
if saveON
    save2pdf(fullfile(bucket.pathToPlots,'floatVSfixed_normError_FEXT'),fig,600);
end

%% Plot paper DDS AND TAU
fig = figure('Name', 'floatVSfixed norm DDS AND TAU','NumberTitle','off');
axes1 = axes('Parent',fig,'FontSize',16);
box(axes1,'on');
hold(axes1,'on');
grid on;

% ------------------------- task T1 == taskID1 ----------------------------
% Mean and std
norm_fixedVSfloating.MEANddsError_norm_task01 = mean(task01_normData.normAnalysis.difference_ddq);
norm_fixedVSfloating.STDddsError_norm_task01 = std(task01_normData.normAnalysis.difference_ddq);

norm_fixedVSfloating.MEANtauError_norm_task01 = mean(task01_normData.normAnalysis.difference_tau);
norm_fixedVSfloating.STDtauError_norm_task01 = std(task01_normData.normAnalysis.difference_tau);

subplot(2,3,1)
% plot1 = plot(task01_normData.normAnalysis.ddq_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task01_normData.normAnalysis.ddq_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task01_normData.normAnalysis.difference_ddq,'Color',colorNormError,'lineWidth',2);
title ('T1','FontSize',15);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$\big|\varepsilon(\ddot{s})\big|$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;
% if normalizedSignal
%     ylabel('$|\ddot{s}|$','HorizontalAlignment','center',...
%         'FontSize',24,'interpreter','latex');
% else
%     ylabel('$|\ddot{s}|$ [rad/$s^2$]','HorizontalAlignment','center',...
%         'FontSize',24,'interpreter','latex');
% end

subplot(2,3,4)
% plot1 = plot(task01_normData.normAnalysis.tau_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task01_normData.normAnalysis.tau_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task01_normData.normAnalysis.difference_tau,'Color',colorNormError,'lineWidth',2);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$\big|\varepsilon(\tau)\big|$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T2 == taskID4 ----------------------------
% Mean and std
norm_fixedVSfloating.MEANddsError_norm_task04 = mean(task04_normData.normAnalysis.difference_ddq);
norm_fixedVSfloating.STDddsError_norm_task04 = std(task04_normData.normAnalysis.difference_ddq);

norm_fixedVSfloating.MEANtauError_norm_task04 = mean(task04_normData.normAnalysis.difference_tau);
norm_fixedVSfloating.STDtauError_norm_task04 = std(task04_normData.normAnalysis.difference_tau);

subplot(2,3,2)
% plot1 = plot(task04_normData.normAnalysis.ddq_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task04_normData.normAnalysis.ddq_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task04_normData.normAnalysis.difference_ddq,'Color',colorNormError,'lineWidth',2);
title ('T2','FontSize',15);
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

subplot(2,3,5)
% plot1 = plot(task04_normData.normAnalysis.tau_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task04_normData.normAnalysis.tau_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task04_normData.normAnalysis.difference_tau,'Color',colorNormError,'lineWidth',2);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T3 == taskID6 ----------------------------
% Mean and std
norm_fixedVSfloating.MEANddsError_norm_task06 = mean(task06_normData.normAnalysis.difference_ddq);
norm_fixedVSfloating.STDddsError_norm_task06 = std(task06_normData.normAnalysis.difference_ddq);

norm_fixedVSfloating.MEANtauError_norm_task06 = mean(task06_normData.normAnalysis.difference_tau);
norm_fixedVSfloating.STDtauError_norm_task06 = std(task06_normData.normAnalysis.difference_tau);

subplot(2,3,3)
% plot1 = plot(task06_normData.normAnalysis.ddq_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task06_normData.normAnalysis.ddq_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task06_normData.normAnalysis.difference_ddq,'Color',colorNormError,'lineWidth',2);
title ('T3','FontSize',15);
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

subplot(2,3,6)
% plot1 = plot(task06_normData.normAnalysis.tau_floating,'Color',normColor_floating,'lineWidth',2);
% hold on;
% plot2 = plot(task06_normData.normAnalysis.tau_fixed,'Color',normColor_fixed,'lineWidth',1.5);
plot1 = plot(task06_normData.normAnalysis.difference_tau,'Color',colorNormError,'lineWidth',2);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
xlabel('samples', 'FontSize',18);
grid on;

align_Ylabels(gcf)
% resize and save
subplotsqueeze(gcf, 1.12);
tightfig();
% save
if saveON
    save2pdf(fullfile(bucket.pathToPlots,'floatVSfixed_normError_DDSandTAU'),fig,600);
end

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

%% Plot paper only a lin, dds, tau
% normColor = [0.600000023841858 0.600000023841858 0];
% 
% fig = figure('Name', 'norm difference','NumberTitle','off');
% axes1 = axes('Parent',fig,'FontSize',16);
% box(axes1,'on');
% hold(axes1,'on');
% grid on;
% 
% % ------------------------- task T1 == taskID1 ----------------------------
% subplot(3,3,1)
% plot1 = plot(task01_normData.normAnalysis.baseAccLinDiff,'Color',normColor,'lineWidth',2);
% title ('T1','FontSize',15);
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
% xlim([0 len])
% 
% subplot(3,3,4)
% plot1 = plot(task01_normData.normAnalysis.difference_ddq,'Color',normColor,'lineWidth',2);
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
% subplot(3,3,7)
% plot1 = plot(task01_normData.normAnalysis.difference_tau,'Color',normColor,'lineWidth',2);
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
% % ------------------------- task T2 == taskID4 ----------------------------
% subplot(3,3,2)
% plot1 = plot(task04_normData.normAnalysis.baseAccLinDiff,'Color',normColor,'lineWidth',2);
% title ('T2','FontSize',15);
% ax = gca;
% ax.FontSize = 15;
% NumTicks = 5;
% L = get(gca,'YLim');
% set(gca,'YTick',linspace(L(1),L(2),NumTicks))
% set(gca,'XTickLabel',[])
% ax = gca;
% ax.FontSize = 15;
% grid on;
% axis tight;
% xlim([0 len])
% 
% subplot(3,3,5)
% plot1 = plot(task04_normData.normAnalysis.difference_ddq,'Color',normColor,'lineWidth',2);
% ax = gca;
% ax.FontSize = 15;
% NumTicks = 5;
% L = get(gca,'YLim');
% set(gca,'YTick',linspace(L(1),L(2),NumTicks))
% set(gca,'XTickLabel',[])
% ax = gca;
% ax.FontSize = 15;
% grid on;
% axis tight;
% 
% subplot(3,3,8)
% plot1 = plot(task04_normData.normAnalysis.difference_tau,'Color',normColor,'lineWidth',2);
% xlabel('samples','HorizontalAlignment','center',...
%     'FontSize',16)
% ax = gca;
% ax.FontSize = 15;
% xlabel('samples', 'FontSize',18);
% grid on;
% axis tight;
% 
% % ------------------------- task T3 == taskID6 ----------------------------
% subplot(3,3,3)
% plot1 = plot(task06_normData.normAnalysis.baseAccLinDiff,'Color',normColor,'lineWidth',2);
% title ('T3','FontSize',15);
% ax = gca;
% ax.FontSize = 15;
% NumTicks = 5;
% L = get(gca,'YLim');
% set(gca,'YTick',linspace(L(1),L(2),NumTicks))
% set(gca,'XTickLabel',[])
% ax = gca;
% ax.FontSize = 15;
% grid on;
% axis tight;
% xlim([0 len])
% 
% subplot(3,3,6)
% plot1 = plot(task06_normData.normAnalysis.difference_ddq,'Color',normColor,'lineWidth',2);
% ax = gca;
% ax.FontSize = 15;
% NumTicks = 5;
% L = get(gca,'YLim');
% set(gca,'YTick',linspace(L(1),L(2),NumTicks))
% set(gca,'XTickLabel',[])
% ax = gca;
% ax.FontSize = 15;
% grid on;
% axis tight;
% 
% subplot(3,3,9)
% plot1 = plot(task06_normData.normAnalysis.difference_tau,'Color',normColor,'lineWidth',2);
% xlabel('samples','HorizontalAlignment','center',...
%     'FontSize',16)
% ax = gca;
% ax.FontSize = 15;
% xlabel('samples', 'FontSize',18);
% grid on;
% axis tight;
% 
% % resize and save
% subplotsqueeze(gcf, 1.12);
% tightfig();
% % save
% if saveON
%     save2pdf(fullfile(bucket.pathToPlots,'floatVSfixed_normDifference'),fig,600);
% end