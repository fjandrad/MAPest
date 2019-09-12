
%% Manual contact pattern detection (all tasks)
% contactPatternDetection_manualPlot;

%% Comparison estimation/measured variables (all tasks)
% plot_paperVariableComparison;
% if opts.fixedVSfloat
%     plot_EstimatedVSmeasured_fixed;
%     plot_EstimatedVSmeasured_floating;
% else
%     plot_EstimatedVSmeasured_floating
% end
extractionDataForPlots_floating;

%% Comparison estimation floating vs. fixed (tasks T1,T2,T3)
if opts.fixedVSfloat
%     plot_Estimation_floatingVSfixed_v1;
    plot_Estimation_floatingVSfixed_final;
end

%% Angles vs Torque (only task T4)
% plot_tauVSangles_RIGHT;
% plot_tauVSangles_LEFT;

%% Angles vs Torque (only task T4)
% -only torque and angle y
% plot_tauVSangles_RIGHT_reducedY;
% plot_tauVSangles_LEFT_reducedY;

%% Error analysis (all tasks)
% plot_RMSEandRangeValues.m; % RMSE + max and min error
% plot_RMSEandStd.m;         % RMSE + std

%% Analysis to be launched after ALL-task analysis
% 
% plot_EstimatedVSmeasured_finalComp;
