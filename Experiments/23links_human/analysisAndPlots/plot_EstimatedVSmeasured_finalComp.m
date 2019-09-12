
% -----------------------------------------------------------------------%
%  VARIABLES ESTIMATION --> ANALYSIS & PLOTS
% -----------------------------------------------------------------------%
close all;

%% WHY THIS ANALYSIS
% If MAP is able to estimate properly those variables that are also
% measured (acc, fext and ddq) --> then we can suppose that the estimation
% of fint, fnet and tau are reasonable, as well.

task01_data = load(fullfile(bucket.pathToSubject,'Task01/processed/plotData_measVSestim.mat'));
task04_data = load(fullfile(bucket.pathToSubject,'Task04/processed/plotData_measVSestim.mat'));
task06_data = load(fullfile(bucket.pathToSubject,'Task06/processed/plotData_measVSestim.mat'));
task10_data = load(fullfile(bucket.pathToSubject,'Task10/processed/plotData_measVSestim.mat'));

% Plot folder
bucket.pathToPlots = fullfile('analysisAndPlots/plots');
if ~exist(bucket.pathToPlots)
    mkdir (bucket.pathToPlots)
end
saveON = true;

colorNormError = [0.87058824300766 0.490196079015732 0];

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------------------------------------------------------------%
%  NORM all quantities for tuning
% -----------------------------------------------------------------------%
% bucket.pathToNormError = fullfile(bucket.pathToSubject,'error_measVSestim');
% if ~exist(bucket.pathToPlots)
%     mkdir (bucket.pathToNormError)
% end
% 
% norm_MeasVsEstim = struct;
% % ------------------------- task T1 == taskID1 ----------------------------
% len_task01 = length(task01_data.plotData.acc.measured.pelvis);
% 
% tmp.allVar_meas_task01 = [task01_data.plotData.acc.measured.pelvis; ...
%     task01_data.plotData.fext.measured.leftFoot;...
%     task01_data.plotData.fext.measured.rightFoot;
%     task01_data.plotData.measured_ddq];
% tmp.allVar_estim_task01 = [task01_data.plotData.acc.simulated.pelvis; ...
%     task01_data.plotData.fext.simulated.leftFoot;...
%     task01_data.plotData.fext.simulated.rightFoot;
%     task01_data.plotData.estimated_ddq];
% tmp.allVar_norm_task01 = zeros(1,len_task01);
% for len_task01Idx = 1 : len_task01
%     norm_MeasVsEstim.allVar_norm_task01(1,len_task01Idx) = norm(tmp.allVar_meas_task01(:,len_task01Idx) ...
%         - tmp.allVar_estim_task01(:,len_task01Idx));
% end
% 
% % ------------------------- task T2 == taskID4 ----------------------------
% len_task04 = length(task04_data.plotData.acc.measured.pelvis);
% 
% tmp.allVar_meas_task04 = [task04_data.plotData.acc.measured.pelvis; ...
%     task04_data.plotData.fext.measured.leftFoot;...
%     task04_data.plotData.fext.measured.rightFoot;
%     task04_data.plotData.measured_ddq];
% tmp.allVar_estim_task04 = [task04_data.plotData.acc.simulated.pelvis; ...
%     task04_data.plotData.fext.simulated.leftFoot;...
%     task04_data.plotData.fext.simulated.rightFoot;
%     task04_data.plotData.estimated_ddq];
% tmp.allVar_norm_task04 = zeros(1,len_task04);
% for len_task04Idx = 1 : len_task04
%     norm_MeasVsEstim.allVar_norm_task04(1,len_task04Idx) = norm(tmp.allVar_meas_task04(:,len_task04Idx) ...
%         - tmp.allVar_estim_task04(:,len_task04Idx));
% end
% 
% % ------------------------- task T3 == taskID6 ----------------------------
% len_task06 = length(task06_data.plotData.acc.measured.pelvis);
% 
% tmp.allVar_meas_task06 = [task06_data.plotData.acc.measured.pelvis; ...
%     task06_data.plotData.fext.measured.leftFoot;...
%     task06_data.plotData.fext.measured.rightFoot;
%     task06_data.plotData.measured_ddq];
% tmp.allVar_estim_task06 = [task06_data.plotData.acc.simulated.pelvis; ...
%     task06_data.plotData.fext.simulated.leftFoot;...
%     task06_data.plotData.fext.simulated.rightFoot;
%     task06_data.plotData.estimated_ddq];
% tmp.allVar_norm_task06 = zeros(1,len_task06);
% for len_task06Idx = 1 : len_task06
%     norm_MeasVsEstim.allVar_norm_task06(1,len_task06Idx) = norm(tmp.allVar_meas_task06(:,len_task06Idx) ...
%         - tmp.allVar_estim_task06(:,len_task06Idx));
% end
% 
% % ------------------------- task T4 == taskID10 ----------------------------
% len_task10 = length(task10_data.plotData.acc.measured.pelvis);
% 
% tmp.allVar_meas_task10 = [task10_data.plotData.acc.measured.pelvis; ...
%     task10_data.plotData.fext.measured.leftFoot;...
%     task10_data.plotData.fext.measured.rightFoot;
%     task10_data.plotData.measured_ddq];
% tmp.allVar_estim_task10 = [task10_data.plotData.acc.simulated.pelvis; ...
%     task10_data.plotData.fext.simulated.leftFoot;...
%     task10_data.plotData.fext.simulated.rightFoot;
%     task10_data.plotData.estimated_ddq];
% tmp.allVar_norm_task10 = zeros(1,len_task10);
% for len_task10Idx = 1 : len_task10
%     norm_MeasVsEstim.allVar_norm_task10(1,len_task10Idx) = norm(tmp.allVar_meas_task10(:,len_task10Idx) ...
%         - tmp.allVar_estim_task10(:,len_task10Idx));
% end
% 
% save(fullfile(bucket.pathToNormError,'norm_MeasVsEstim.mat'),'norm_MeasVsEstim');
% 
% %% Legend to be cropped fake plot)
% % % fig = figure('Name', 'fake_figure','NumberTitle','off');
% % % axes1 = axes('Parent',fig,'FontSize',16);
% % % box(axes1,'on');
% % % hold(axes1,'on');
% % % 
% % % plot1 = plot(acc.simulated.pelvis(1,:),'b','lineWidth',1.5);
% % % hold on
% % % specific_vector_sigma(1,:) = acc.measured.pelvis_sigma(1);
% % % shad2 = shadedErrorBar([],acc.measured.pelvis(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
% 
% % % leg = legend([plot1,shad2.mainLine,shad2.patch,],{'estim', 'meas','2$\sigma_{estim_{floating}}$'},'Location','south');
% % % set(leg,'Interpreter','latex', ...
% % %        'Orientation','horizontal');
% % % set(leg,'FontSize',13);
% % % 
% % % subplotsqueeze(gcf, 1.2);
% % % if saveON
% % %     save2pdf(fullfile(bucket.pathToPlots, ('legend')),fig,600);
% % % end
% % % 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------------------------------------------------------------%
%  ACCELERATION [m/s^2] COMPARISON
% -----------------------------------------------------------------------%
fig = figure('Name', 'meas vs. estim FLOATING-pelvis acc','NumberTitle','off');
axes1 = axes('Parent',fig,'FontSize',16);
box(axes1,'on');
hold(axes1,'on');
grid on;

% ------------------------- task T1 == taskID1 ----------------------------
len = length(task01_data.plotData.acc.measured.pelvis);
specific_vector_sigma = zeros(1,len);

subplot (3,4,1) %x component
plot1 = plot(task01_data.plotData.acc.simulated.pelvis(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.acc.measured.pelvis_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.acc.measured.pelvis(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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
ylabel('$\alpha_{lin,x}^g$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (3,4,5) %y component
plot1 = plot(task01_data.plotData.acc.simulated.pelvis(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.acc.measured.pelvis_sigma(2);
shad2 = shadedErrorBar([],task01_data.plotData.acc.measured.pelvis(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$\alpha_{lin,y}^g$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (3,4,9) %z component
plot1 = plot(task01_data.plotData.acc.simulated.pelvis(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.acc.measured.pelvis_sigma(3);
shad2 = shadedErrorBar([],task01_data.plotData.acc.measured.pelvis(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
ylabel('$\alpha_{lin,z}^g$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T2 == taskID4 ----------------------------
len = length(task04_data.plotData.acc.measured.pelvis);
specific_vector_sigma = zeros(1,len);

subplot (3,4,2) %x component
plot1 = plot(task04_data.plotData.acc.simulated.pelvis(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.acc.measured.pelvis_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.acc.measured.pelvis(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
title ('T2','FontSize',15);
set(gca,'XTickLabel',[])
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

subplot (3,4,6) %y component
plot1 = plot(task04_data.plotData.acc.simulated.pelvis(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.acc.measured.pelvis_sigma(2);
shad2 = shadedErrorBar([],task04_data.plotData.acc.measured.pelvis(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
set(gca,'XTickLabel',[])
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

subplot (3,4,10) %z component
plot1 = plot(task04_data.plotData.acc.simulated.pelvis(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.acc.measured.pelvis_sigma(3);
shad2 = shadedErrorBar([],task04_data.plotData.acc.measured.pelvis(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

% ------------------------- task T3 == taskID6 ----------------------------
len = length(task06_data.plotData.acc.measured.pelvis);
specific_vector_sigma = zeros(1,len);

subplot (3,4,3) %x component
plot1 = plot(task06_data.plotData.acc.simulated.pelvis(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.acc.measured.pelvis_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.acc.measured.pelvis(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (3,4,7) %y component
plot1 = plot(task06_data.plotData.acc.simulated.pelvis(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.acc.measured.pelvis_sigma(2);
shad2 = shadedErrorBar([],task06_data.plotData.acc.measured.pelvis(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
set(gca,'XTickLabel',[])
grid on;
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
grid on;

subplot (3,4,11) %z component
plot1 = plot(task06_data.plotData.acc.simulated.pelvis(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.acc.measured.pelvis_sigma(3);
shad2 = shadedErrorBar([],task06_data.plotData.acc.measured.pelvis(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

% ------------------------- task T4 == taskID10 ----------------------------
len = length(task10_data.plotData.acc.measured.pelvis);
specific_vector_sigma = zeros(1,len);

subplot (3,4,4) %x component
plot1 = plot(task10_data.plotData.acc.simulated.pelvis(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.acc.measured.pelvis_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.acc.measured.pelvis(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
title ('T4','FontSize',15);
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

subplot (3,4,8) %y component
plot1 = plot(task10_data.plotData.acc.simulated.pelvis(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.acc.measured.pelvis_sigma(2);
shad2 = shadedErrorBar([],task10_data.plotData.acc.measured.pelvis(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (3,4,12) %z component
plot1 = plot(task10_data.plotData.acc.simulated.pelvis(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.acc.measured.pelvis_sigma(3);
shad2 = shadedErrorBar([],task10_data.plotData.acc.measured.pelvis(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

%alifgn subplots y label
align_Ylabels(gcf)

subplotsqueeze(gcf, 1.12);
tightfig();
% save
if saveON
    % plot on \alpha_{lin}^g [m/s^2]
    save2pdf(fullfile(bucket.pathToPlots, 'measVSestim_pelvisAccLin_total'),fig,600);
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------------------------------------------------------------%
%  EXTERNAL CONTACT FORCE LEFT FOOT f^x [N] and moment m^x [Nm] COMPARISON
% -----------------------------------------------------------------------%
% - other applied (exernal) forces are null
fig = figure('Name', 'meas vs. estim FLOATING-leftFoot fext','NumberTitle','off');
axes1 = axes('Parent',fig,'FontSize',16);
box(axes1,'on');
hold(axes1,'on');
grid on;

% ------------------------- task T1 == taskID1 ----------------------------
len = length(task01_data.plotData.fext.measured.leftFoot);
specific_vector_sigma = zeros(1,len);

subplot (6,4,1) %x component
plot1 = plot(task01_data.plotData.fext.simulated.leftFoot(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.leftFoot(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
% title ('Left foot f^x [N]','FontSize',15);
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
ylabel('$f_x^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (6,4,5) %y component
plot1 = plot(task01_data.plotData.fext.simulated.leftFoot(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.leftFoot(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$f_y^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (6,4,9) %z component
plot1 = plot(task01_data.plotData.fext.simulated.leftFoot(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.leftFoot(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$f_z^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (6,4,13) %x component
plot1 = plot(task01_data.plotData.fext.simulated.leftFoot(4,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.leftFoot(4,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$m_x^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
set(gca,'XTickLabel',[])
grid on;

subplot (6,4,17) %y component
plot1 = plot(task01_data.plotData.fext.simulated.leftFoot(5,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.leftFoot(5,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$m_y^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
set(gca,'XTickLabel',[])
grid on;

subplot (6,4,21) %z component
plot1 = plot(task01_data.plotData.fext.simulated.leftFoot(6,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.leftFoot(6,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
ylabel('$m_z^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
% set(gca,'XTickLabel',[])
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T2 == taskID4 ----------------------------
len = length(task04_data.plotData.fext.measured.leftFoot);
specific_vector_sigma = zeros(1,len);

subplot (6,4,2) %x component
plot1 = plot(task04_data.plotData.fext.simulated.leftFoot(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.leftFoot(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,6) %y component
plot1 = plot(task04_data.plotData.fext.simulated.leftFoot(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.leftFoot(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,10) %z component
plot1 = plot(task04_data.plotData.fext.simulated.leftFoot(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.leftFoot(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,14) %x component
plot1 = plot(task04_data.plotData.fext.simulated.leftFoot(4,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.leftFoot(4,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,18) %y component
plot1 = plot(task04_data.plotData.fext.simulated.leftFoot(5,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.leftFoot(5,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,22) %z component
plot1 = plot(task04_data.plotData.fext.simulated.leftFoot(6,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.leftFoot(6,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

% ------------------------- task T3 == taskID6 ----------------------------
len = length(task06_data.plotData.fext.measured.leftFoot);
specific_vector_sigma = zeros(1,len);

subplot (6,4,3) %x component
plot1 = plot(task06_data.plotData.fext.simulated.leftFoot(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.leftFoot(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
title ('T3','FontSize',15);
set(gca,'XTickLabel',[])
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

subplot (6,4,7) %y component
plot1 = plot(task06_data.plotData.fext.simulated.leftFoot(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.leftFoot(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,11) %z component
plot1 = plot(task06_data.plotData.fext.simulated.leftFoot(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.leftFoot(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,15) %x component
plot1 = plot(task06_data.plotData.fext.simulated.leftFoot(4,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.leftFoot(4,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,19) %y component
plot1 = plot(task06_data.plotData.fext.simulated.leftFoot(5,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.leftFoot(5,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,23) %z component
plot1 = plot(task06_data.plotData.fext.simulated.leftFoot(6,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.leftFoot(6,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

% ------------------------- task T4 == taskID10 ----------------------------
len = length(task10_data.plotData.fext.measured.leftFoot);
specific_vector_sigma = zeros(1,len);

subplot (6,4,4) %x component
plot1 = plot(task10_data.plotData.fext.simulated.leftFoot(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.leftFoot(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
% title ('Left foot f^x [N]','FontSize',15);
title ('T4','FontSize',15);
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

subplot (6,4,8) %y component
plot1 = plot(task10_data.plotData.fext.simulated.leftFoot(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.leftFoot(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,12) %z component
plot1 = plot(task10_data.plotData.fext.simulated.leftFoot(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.leftFoot(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,16) %x component
plot1 = plot(task10_data.plotData.fext.simulated.leftFoot(4,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.leftFoot(4,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,20) %y component
plot1 = plot(task10_data.plotData.fext.simulated.leftFoot(5,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.leftFoot(5,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,24) %z component
plot1 = plot(task10_data.plotData.fext.simulated.leftFoot(6,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.leftFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.leftFoot(6,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

%alifgn subplots y label
align_Ylabels(gcf)

subplotsqueeze(gcf, 1.12);
tightfig();
% save
if saveON
    % plot on Left foot 6D fext
    save2pdf(fullfile(bucket.pathToPlots, 'measVSestim_leftFoot6Dfext_total'),fig,600);
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------------------------------------------------------------%
%  EXTERNAL CONTACT FORCE RIGHT FOOT f^x [N] and moment m^x [Nm] COMPARISON
% -----------------------------------------------------------------------%
% - other applied (exernal) forces are null
fig = figure('Name', 'meas vs. estim FLOATING-rightFoot fext','NumberTitle','off');
axes1 = axes('Parent',fig,'FontSize',16);
box(axes1,'on');
hold(axes1,'on');
grid on;

% ------------------------- task T1 == taskID1 ----------------------------
len = length(task01_data.plotData.fext.measured.rightFoot);
specific_vector_sigma = zeros(1,len);

subplot (6,4,1) %x component
plot1 = plot(task01_data.plotData.fext.simulated.rightFoot(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.rightFoot(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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
ylabel('$f_x^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (6,4,5) %y component
plot1 = plot(task01_data.plotData.fext.simulated.rightFoot(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.rightFoot(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$f_y^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (6,4,9) %z component
plot1 = plot(task01_data.plotData.fext.simulated.rightFoot(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.rightFoot(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$f_z^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (6,4,13) %x component
plot1 = plot(task01_data.plotData.fext.simulated.rightFoot(4,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.rightFoot(4,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$m_x^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (6,4,17) %y component
plot1 = plot(task01_data.plotData.fext.simulated.rightFoot(5,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.rightFoot(5,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
set(gca,'XTickLabel',[])
ylabel('$m_y^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
grid on;

subplot (6,4,21) %z component
plot1 = plot(task01_data.plotData.fext.simulated.rightFoot(6,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task01_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task01_data.plotData.fext.measured.rightFoot(6,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
axis tight;
ax = gca;
ax.FontSize = 15;
L = get(gca,'YTick');
NumTicks = 3;
if length(L) >= 3
  set(gca,'YTick',(L(1):(abs(L(end)-L(1))/2):L(end)))
end
ylabel('$m_y^x$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T2 == taskID4 ----------------------------
len = length(task04_data.plotData.fext.measured.rightFoot);
specific_vector_sigma = zeros(1,len);

subplot (6,4,2) %x component
plot1 = plot(task04_data.plotData.fext.simulated.rightFoot(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.rightFoot(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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


subplot (6,4,6) %y component
plot1 = plot(task04_data.plotData.fext.simulated.rightFoot(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.rightFoot(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,10) %z component
plot1 = plot(task04_data.plotData.fext.simulated.rightFoot(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.rightFoot(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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


subplot (6,4,14) %x component
plot1 = plot(task04_data.plotData.fext.simulated.rightFoot(4,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.rightFoot(4,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,18) %y component
plot1 = plot(task04_data.plotData.fext.simulated.rightFoot(5,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.rightFoot(5,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,22) %z component
plot1 = plot(task04_data.plotData.fext.simulated.rightFoot(6,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task04_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task04_data.plotData.fext.measured.rightFoot(6,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
% set(gca,'XTickLabel',[])
ax = gca;
ax.FontSize = 15;
NumTicks = 6;
L = get(gca,'YLim');
set(gca,'YTick',linspace(L(1),L(2),NumTicks))
xlabel('samples', 'FontSize',18);
grid on;
axis tight;
xlim([0 len])

% ------------------------- task T3 == taskID6 ----------------------------
len = length(task06_data.plotData.fext.measured.rightFoot);
specific_vector_sigma = zeros(1,len);

subplot (6,4,3) %x component
plot1 = plot(task06_data.plotData.fext.simulated.rightFoot(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.rightFoot(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,7) %y component
plot1 = plot(task06_data.plotData.fext.simulated.rightFoot(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.rightFoot(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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


subplot (6,4,11) %z component
plot1 = plot(task06_data.plotData.fext.simulated.rightFoot(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.rightFoot(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,15) %x component
plot1 = plot(task06_data.plotData.fext.simulated.rightFoot(4,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.rightFoot(4,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,19) %y component
plot1 = plot(task06_data.plotData.fext.simulated.rightFoot(5,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.rightFoot(5,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,23) %z component
plot1 = plot(task06_data.plotData.fext.simulated.rightFoot(6,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task06_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task06_data.plotData.fext.measured.rightFoot(6,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

% ------------------------- task T4 == taskID10 ----------------------------
len = length(task10_data.plotData.fext.measured.rightFoot);
specific_vector_sigma = zeros(1,len);

subplot (6,4,4) %x component
plot1 = plot(task10_data.plotData.fext.simulated.rightFoot(1,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.rightFoot(1,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
title ('T4','FontSize',15);
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

subplot (6,4,8) %y component
plot1 = plot(task10_data.plotData.fext.simulated.rightFoot(2,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.rightFoot(2,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,12) %z component
plot1 = plot(task10_data.plotData.fext.simulated.rightFoot(3,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.rightFoot(3,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,16) %x component
plot1 = plot(task10_data.plotData.fext.simulated.rightFoot(4,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.rightFoot(4,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,20) %y component
plot1 = plot(task10_data.plotData.fext.simulated.rightFoot(5,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.rightFoot(5,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

subplot (6,4,24) %z component
plot1 = plot(task10_data.plotData.fext.simulated.rightFoot(6,:),'b','lineWidth',1.5);
hold on
specific_vector_sigma(1,:) = task10_data.plotData.fext.measured.rightFoot_sigma(1);
shad2 = shadedErrorBar([],task10_data.plotData.fext.measured.rightFoot(6,:),2.*sqrt(specific_vector_sigma(1,:)),'r',1.5);
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

%alifgn subplots y label
align_Ylabels(gcf)

subplotsqueeze(gcf, 1.12);
tightfig();
% save
if saveON
    % plot on Right foot 6D fext
    save2pdf(fullfile(bucket.pathToPlots, 'measVSestim_rightFoot6Dfext_total'),fig,600);
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------------------------------------------------------------%
%  JOINT ACCELERATION DDS [rad/s^2] NORM of the error
% -----------------------------------------------------------------------%
% Note:
% - no comparison because of 66 dofs
% - comparison of the norms


% Legend to be cropped fake plot)
% fig = figure('Name', 'fake_figure','NumberTitle','off');
% axes1 = axes('Parent',fig,'FontSize',16);
% AA = 1;
% plot1 = plot(AA,'Color',colorNormError,'lineWidth',2);
% 
% leg = legend([plot1],...
%     {'norm(error)'},'Location','south');
% set(leg,'Interpreter','latex');
% set(leg,'FontSize',24);

fig = figure('Name', 'meas vs. estim FLOATING-dds error norm','NumberTitle','off');
axes1 = axes('Parent',fig,'FontSize',16);
box(axes1,'on');
hold(axes1,'on');
grid on;

% ------------------------- task T1 == taskID1 ----------------------------
len_task01 = length(task01_data.plotData.estimated_ddq);
norm_MeasVsEstim.ddsMeas_norm_task01 = zeros(1,len_task01);
norm_MeasVsEstim.ddsEstim_norm_task01 = zeros(1,len_task01);
tmp.ddsError_norm_task01 = task01_data.plotData.measured_ddq - task01_data.plotData.estimated_ddq;
norm_MeasVsEstim.ddsError_norm_task01 = zeros(1,len_task01);
for len_task01Idx = 1 : len_task01
    norm_MeasVsEstim.ddsMeas_norm_task01(1,len_task01Idx) = norm(task01_data.plotData.estimated_ddq(:,len_task01Idx));
    norm_MeasVsEstim.ddsEstim_norm_task01(1,len_task01Idx) = norm(task01_data.plotData.measured_ddq(:,len_task01Idx));
    % error = measured - estimated
    norm_MeasVsEstim.ddsError_norm_task01(1,len_task01Idx) = norm(tmp.ddsError_norm_task01(:,len_task01Idx));
end

% Mean and std
norm_MeasVsEstim.MEANddsError_norm_task01 = mean(norm_MeasVsEstim.ddsError_norm_task01);
norm_MeasVsEstim.STDddsError_norm_task01 = std(norm_MeasVsEstim.ddsError_norm_task01);

subplot (1,4,1)
% plot1 = plot(norm_MeasVsEstim.ddsEstim_norm_task01,'b','lineWidth',2.5);
% hold on
% plot2 = plot(norm_MeasVsEstim.ddsMeas_norm_task01,'r','lineWidth',1.5);
plot1 = plot(norm_MeasVsEstim.ddsError_norm_task01,'Color',colorNormError,'lineWidth',2);
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
ylabel('$\big|\varepsilon(\ddot s)\big|$','HorizontalAlignment','center',...
    'FontSize',27,'interpreter','latex');
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T2 == taskID4 ----------------------------
len_task04 = length(task04_data.plotData.estimated_ddq);
norm_MeasVsEstim.ddsMeas_norm_task04 = zeros(1,len_task04);
norm_MeasVsEstim.ddsEstim_norm_task04 = zeros(1,len_task04);
tmp.ddsError_norm_task04 = task04_data.plotData.measured_ddq - task04_data.plotData.estimated_ddq;
norm_MeasVsEstim.ddsError_norm_task04 = zeros(1,len_task04);
for len_task04Idx = 1 : len_task04
    norm_MeasVsEstim.ddsMeas_norm_task04(1,len_task04Idx) = norm(task04_data.plotData.estimated_ddq(:,len_task04Idx));
    norm_MeasVsEstim.ddsEstim_norm_task04(1,len_task04Idx) = norm(task04_data.plotData.measured_ddq(:,len_task04Idx));
    % error = measured - estimated
    norm_MeasVsEstim.ddsError_norm_task04(1,len_task04Idx) = norm(tmp.ddsError_norm_task04(:,len_task04Idx));
end

% Mean and std
norm_MeasVsEstim.MEANddsError_norm_task04 = mean(norm_MeasVsEstim.ddsError_norm_task04);
norm_MeasVsEstim.STDddsError_norm_task04 = std(norm_MeasVsEstim.ddsError_norm_task04);

subplot (1,4,2)
% plot1 = plot(norm_MeasVsEstim.ddsEstim_norm_task04,'b','lineWidth',2.5);
% hold on
% plot2 = plot(norm_MeasVsEstim.ddsMeas_norm_task04,'r','lineWidth',1.5);
plot1 = plot(norm_MeasVsEstim.ddsError_norm_task04,'Color',colorNormError,'lineWidth',2);
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
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T3 == taskID6 ----------------------------
len_task06 = length(task06_data.plotData.estimated_ddq);
norm_MeasVsEstim.ddsMeas_norm_task06 = zeros(1,len_task06);
norm_MeasVsEstim.ddsEstim_norm_task06 = zeros(1,len_task06);
tmp.ddsError_norm_task06 = task06_data.plotData.measured_ddq - task06_data.plotData.estimated_ddq;
norm_MeasVsEstim.ddsError_norm_task06 = zeros(1,len_task06);
for len_task06Idx = 1 : len_task06
    norm_MeasVsEstim.ddsMeas_norm_task06(1,len_task06Idx) = norm(task06_data.plotData.estimated_ddq(:,len_task06Idx));
    norm_MeasVsEstim.ddsEstim_norm_task06(1,len_task06Idx) = norm(task06_data.plotData.measured_ddq(:,len_task06Idx));
    % error = measured - estimated
    norm_MeasVsEstim.ddsError_norm_task06(1,len_task06Idx) = norm(tmp.ddsError_norm_task06(:,len_task06Idx));
end

% Mean and std
norm_MeasVsEstim.MEANddsError_norm_task06 = mean(norm_MeasVsEstim.ddsError_norm_task06);
norm_MeasVsEstim.STDddsError_norm_task06 = std(norm_MeasVsEstim.ddsError_norm_task06);

subplot (1,4,3)
% plot1 = plot(norm_MeasVsEstim.ddsEstim_norm_task06,'b','lineWidth',2.5);
% hold on
% plot2 = plot(norm_MeasVsEstim.ddsMeas_norm_task06,'r','lineWidth',1.5);
plot1 = plot(norm_MeasVsEstim.ddsError_norm_task06,'Color',colorNormError,'lineWidth',2);
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
xlabel('samples', 'FontSize',18);
grid on;

% ------------------------- task T4 == taskID10 ----------------------------
len_task10 = length(task10_data.plotData.estimated_ddq);
norm_MeasVsEstim.ddsMeas_norm_task10 = zeros(1,len_task10);
norm_MeasVsEstim.ddsEstim_norm_task10 = zeros(1,len_task10);
tmp.ddsError_norm_task10 = task10_data.plotData.measured_ddq - task10_data.plotData.estimated_ddq;
norm_MeasVsEstim.ddsError_norm_task10 = zeros(1,len_task10);
for len_task10Idx = 1 : len_task10
    norm_MeasVsEstim.ddsMeas_norm_task10(1,len_task10Idx) = norm(task10_data.plotData.estimated_ddq(:,len_task10Idx));
    norm_MeasVsEstim.ddsEstim_norm_task10(1,len_task10Idx) = norm(task10_data.plotData.measured_ddq(:,len_task10Idx));
    % error = measured - estimated
    norm_MeasVsEstim.ddsError_norm_task10(1,len_task10Idx) = norm(tmp.ddsError_norm_task10(:,len_task10Idx));
end

% Mean and std
norm_MeasVsEstim.MEANddsError_norm_task10 = mean(norm_MeasVsEstim.ddsError_norm_task10)
norm_MeasVsEstim.STDddsError_norm_task10 = std(norm_MeasVsEstim.ddsError_norm_task10)

subplot (1,4,4)
% plot1 = plot(norm_MeasVsEstim.ddsEstim_norm_task10,'b','lineWidth',2.5);
% hold on
% plot2 = plot(norm_MeasVsEstim.ddsMeas_norm_task10,'r','lineWidth',1.5);
plot1 = plot(norm_MeasVsEstim.ddsError_norm_task10,'Color',colorNormError,'lineWidth',2);
title ('T4','FontSize',15);
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

%alifgn subplots y label
align_Ylabels(gcf)
% 
% subplotsqueeze(gcf, 1.02);
% tightfig();
% % save
% if saveON
%     % plot on dds for all the joints
%     save2pdf(fullfile(bucket.pathToPlots, 'measVSestim_ddsErrorNorm_total'),fig,600);
% end



