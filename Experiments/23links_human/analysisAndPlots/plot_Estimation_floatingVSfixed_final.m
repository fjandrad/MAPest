
% -----------------------------------------------------------------------%
%  VARIABLES ESTIMATION --> ANALYSIS & PLOTS
% -----------------------------------------------------------------------%
close all;

%% Load variables from fixed/floating computation

% Load variables
d_fixed_estimatedVar    = load(fullfile(bucket.pathToTask,'processed_ft/estimatedVariables.mat'));
d_floating_estimatedVar = load(fullfile(bucket.pathToTask,'processed/estimatedVariables.mat'));
colorFixed = [0.466666668653488 0.674509823322296 0.18823529779911];

% Note that for the fixed-base processing:
% T1 --> LeftFoot base
% T2 --> RightFoot base
% T3 --> LeftFoot base

% Plot folder
bucket.pathToPlots = fullfile('analysisAndPlots/plots');
if ~exist(bucket.pathToPlots)
    mkdir (bucket.pathToPlots)
end
saveON = false;

%% Norm analysis
normAnalysisAndPlots;

%% Plot like in the version1 of the comparison

% % Legend to be cropped fake plot)
% % fig = figure('Name', 'fake_figure','NumberTitle','off');
% % axes1 = axes('Parent',fig,'FontSize',16);
% % box(axes1,'on');
% % hold(axes1,'on');
% % 
% % plot1 = plot(acc.simulated.pelvis(1,:),'b','lineWidth',1.5);
% % hold on
% % plot3 = plot(acc.simulated_fixed.pelvis(1,:),'color', colorFixed,'lineWidth',1.5);
% % 
% % leg = legend([plot1,plot3],{'floating','fixed'},'Location','south');
% % set(leg,'Interpreter','latex', ...
% %        'Orientation','horizontal');
% % set(leg,'FontSize',14);
% % 
% % subplotsqueeze(gcf, 1.2);
% % if saveON
% %     save2pdf(fullfile(bucket.pathToPlots, ('legend_comparisonFixedVSfloat')),fig,600);
% % end
% % 
% 
% fig = figure('Name', 'floating Vs. fixed comparison','NumberTitle','off');
% axes1 = axes('Parent',fig,'FontSize',16);
% box(axes1,'on');
% hold(axes1,'on');
% grid on;
% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % -----------------------------------------------------------------------%
% %  EXTERNAL CONTACT FORCE LEFT FOOT f^x [N] and moment m^x [Nm]
% % -----------------------------------------------------------------------%
% % - other applied (exernal) forces are null
% % -------------
% % LEFT FOOT
% if taskID == 1 || taskID == 6
%     tmp.idxTrickFixedBase_lf = 6*(tmp.fixedIdx2Plot-1)+1;
% end
% if taskID == 4
%     for labelIdx = 1 : 66
%         if strcmp(fext_fixed.label{labelIdx, 1}, 'LeftFoot')
%             tmp.lfInFixedIdx = labelIdx;
%             break;
%         end
%     end
%     for labelIdx = 1 : 66
%         if strcmp(fext_floating.label{labelIdx, 1}, 'LeftFoot')
%             tmp.lfInFloatIdx = labelIdx;
%             break;
%         end
%     end
%     tmp.idxTrickFloat = 6*(tmp.lfInFloatIdx-1)+1;
%     tmp.idxTrickFixed = 6*(tmp.lfInFixedIdx-1)+1;
% end
% 
% subplot (2,6,1) % f^x_x
% if taskID == 1  || taskID == 6
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_lf,:),'b','lineWidth',1.5);
% end
% if taskID == 4
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed,:),'color', colorFixed,'lineWidth',1.5);
% end
% title ('f_x^x [N]','FontSize',15);
% ylabel('Left foot','FontSize',20);
% set(gca,'XTickLabel',[])
% grid on;
% axis tight;
% 
% subplot (2,6,2) %  f^y_x
% if taskID == 1  || taskID == 6
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_lf+1,:),'b','lineWidth',1.5);
% end
% if taskID == 4
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+1,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+1,:),'color', colorFixed,'lineWidth',1.5);
% end
% title ('f_y^x [N]','FontSize',15);
% set(gca,'XTickLabel',[])
% grid on;
% axis tight;
% 
% subplot (2,6,3) % f^z_x
% if taskID == 1  || taskID == 6
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_lf+2,:),'b','lineWidth',1.5);
% end
% if taskID == 4
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+2,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+2,:),'color', colorFixed,'lineWidth',1.5);
% end
% title ('f_z^x [N]','FontSize',15);
% set(gca,'XTickLabel',[])
% grid on;
% axis tight;
% 
% subplot (2,6,4) %m^x_x
% if taskID == 1  || taskID == 6
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_lf+3,:),'b','lineWidth',1.5);
% end
% if taskID == 4
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+3,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+3,:),'color', colorFixed,'lineWidth',1.5);
% end
% title ('m_x^x [Nm]','FontSize',15);
% set(gca,'XTickLabel',[])
% grid on;
% axis tight;
% 
% subplot (2,6,5)  %m^x_y
% if taskID == 1  || taskID == 6
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_lf+4,:),'b','lineWidth',1.5);
% end
% if taskID == 4
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+4,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+4,:),'color', colorFixed,'lineWidth',1.5);
% end
% title ('m_y^x [Nm]','FontSize',15);
% set(gca,'XTickLabel',[])
% grid on;
% axis tight;
% 
% subplot (2,6,6)  %m^x_z
% if taskID == 1  || taskID == 6
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_lf+5,:),'b','lineWidth',1.5);
% end
% if taskID == 4
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+5,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+5,:),'color', colorFixed,'lineWidth',1.5);
% end
% title ('m_z^x [Nm]','FontSize',15);
% set(gca,'XTickLabel',[])
% grid on;
% axis tight;
% 
% % -------------
% % RIGTH FOOT
% if taskID == 4
%     tmp.idxTrickFixedBase_rf = 6*(tmp.fixedIdx2Plot-1)+1;
% end
% if taskID == 1 || taskID == 6
%     for labelIdx = 1 : 66
%         if strcmp(fext_fixed.label{labelIdx, 1}, 'RightFoot')
%             tmp.rfInFixedIdx = labelIdx;
%             break;
%         end
%     end
%     for labelIdx = 1 : 66
%         if strcmp(fext_floating.label{labelIdx, 1}, 'RightFoot')
%             tmp.rfInFloatIdx = labelIdx;
%             break;
%         end
%     end
%     tmp.idxTrickFloat = 6*(tmp.rfInFloatIdx-1)+1;
%     tmp.idxTrickFixed = 6*(tmp.rfInFixedIdx-1)+1;
% end
%  
% subplot (2,6,7) % f^x_x component
% if taskID == 4
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_rf,:),'b','lineWidth',1.5);
% end
% if taskID == 1 || taskID == 6
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed,:),'color', colorFixed,'lineWidth',1.5);
% end
% hold on
% ylabel('Right foot','FontSize',20);
% xlabel('samples','FontSize',18);
% grid on;
% axis tight;
%  
% subplot (2,6,8) % f^x_y component
% if taskID == 4
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_rf+1,:),'b','lineWidth',1.5);
% end
% if taskID == 1 || taskID == 6
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+1,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+1,:),'color', colorFixed,'lineWidth',1.5);
% end
% xlabel('samples','FontSize',18);
% grid on;
% axis tight;
% 
% subplot (2,6,9) % f^x_z component
% if taskID == 4
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_rf+2,:),'b','lineWidth',1.5);
% end
% if taskID == 1 || taskID == 6
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+2,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+2,:),'color', colorFixed,'lineWidth',1.5);
% end
% xlabel('samples','FontSize',18);
% grid on;
% axis tight;
% 
% subplot (2,6,10)  %m^x_y
% if taskID == 4
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_rf+3,:),'b','lineWidth',1.5);
% end
% if taskID == 1 || taskID == 6
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+3,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+3,:),'color', colorFixed,'lineWidth',1.5);
% end
% hold on
% xlabel('samples','FontSize',18);
% grid on;
% axis tight;
% 
% subplot (2,6,11)  %m^x_y
% if taskID == 4
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_rf+4,:),'b','lineWidth',1.5);
% end
% if taskID == 1 || taskID == 6
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+4,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+4,:),'color', colorFixed,'lineWidth',1.5);
% end
% hold on
% xlabel('samples','FontSize',18);
% grid on;
% axis tight;
% 
% subplot (2,6,12)  %m^x_z
% if taskID == 4
%     plot1 = plot(d_floating_estimatedVar.estimatedVariables.Fext.values(tmp.idxTrickFixedBase_rf+5,:),'b','lineWidth',1.5);
% end
% if taskID == 1 || taskID == 6
%     plot1 = plot(fext_floating.values(tmp.idxTrickFloat+5,:),'b','lineWidth',1.5);
%     hold on
%     plot3 = plot(fext_fixed.values(tmp.idxTrickFixed+5,:),'color', colorFixed,'lineWidth',1.5);
% end
% hold on
% xlabel('samples','FontSize',18);
% grid on;
% axis tight;
% 
% % resize and save
% subplotsqueeze(gcf, 1.20);
% tightfig();
% % save
% if saveON
%     save2pdf(fullfile(bucket.pathToPlots, sprintf('floatVSfixed_6Dfext_comparison-trial%s',num2str(taskID))),fig,600);
% end
