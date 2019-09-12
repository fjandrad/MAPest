
% % variables in y simulated from d from floating base
% load(fullfile(bucket.pathToProcessedData,'y_sim.mat'));

len = size(estimation.mu_dgiveny,2);
specific_vector_sigma = zeros(1,len);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------------------------------------------------------------%
%  ACCELERATION
% -----------------------------------------------------------------------%
% PELVIS
% simulated in y vector
plotData.range_accSIM_pelvis = rangeOfSensorMeasurement(berdy, iDynTree.ACCELEROMETER_SENSOR, 'Pelvis_accelerometer');
plotData.acc.simulated.pelvis = y_sim((plotData.range_accSIM_pelvis:plotData.range_accSIM_pelvis+2),:);
% acc.simulated.rightUpperArm_sigma = Sigmay((range_accSIM_rightUpperArm:range_accSIM_rightUpperArm+2),(range_accSIM_rightUpperArm:range_accSIM_rightUpperArm+2));

% acc measured in y vector
plotData.acc.measured.pelvis = data(1).meas;
plotData.acc.measured.pelvis_sigma = data(1).var;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------------------------------------------------------------%
%  EXTERNAL FORCES
% -----------------------------------------------------------------------%
% - other applied (exernal) forces are null
% % -------------
% LEFT FOOT
% simulated in y vector
plotData.range_fextMEAS_leftFoot = rangeOfSensorMeasurement(berdy, iDynTree.NET_EXT_WRENCH_SENSOR, 'LeftFoot');
plotData.fext.simulated.leftFoot = y_sim((plotData.range_fextMEAS_leftFoot:plotData.range_fextMEAS_leftFoot+5),:);
% fext.simulated.leftFoot_sigma = diag(Sigmay((range_fextMEAS_leftFoot:range_fextMEAS_leftFoot+5),(range_fextMEAS_leftFoot:range_fextMEAS_leftFoot+5)));

% fext measured in y vector
plotData.fext.measured.leftFoot = data(95).meas;
plotData.fext.measured.leftFoot_sigma = data(95).var;

% % -------------
% RIGTH FOOT
% simulated in y vector
plotData.range_fextMEAS_rightFoot = rangeOfSensorMeasurement(berdy, iDynTree.NET_EXT_WRENCH_SENSOR, 'RightFoot');
plotData.fext.simulated.rightFoot = y_sim((plotData.range_fextMEAS_rightFoot:plotData.range_fextMEAS_rightFoot+5),:);
% fext.simulated.rightFoot_sigma = diag(Sigmay((range_fextMEAS_rightFoot:range_fextMEAS_rightFoot+5),(range_fextMEAS_rightFoot:range_fextMEAS_rightFoot+5)));

% % fext measured in y vector
plotData.fext.measured.rightFoot = data(106).meas;
plotData.fext.measured.rightFoot_sigma = data(106).var;

%% Save plot data

plotData.estimated_ddq = estimatedVariables.ddq.values;
plotData.measured_ddq = synchroKin.ddq;
save(fullfile(bucket.pathToProcessedData,'plotData_measVSestim.mat'),'plotData');

%% RMSE computation
% RMSE = sqrt(mean(real-estim)^2) --> number value!
% hp: real --> measured variable, estim --> estimated variable

RMSE = struct;
% LIN ACC
% RMSE.accErr_diff  = zeros(3,len);
for i = 1 : 3 
    tmp.vect1 = plotData.acc.measured.pelvis(i,:);
    tmp.vect2 = plotData.acc.simulated.pelvis(i,:);
    RMSE.accErr_pelvis(i) = calc_RMSE(tmp.vect1,tmp.vect2);
    % RMSE.accErr_pelvis(i) = sqrt(mean((plotData.acc.measured.pelvis(i,:) - plotData.acc.simulated.pelvis(i,:)).^2));
end

% FEXT
% RMSE.fextErr_lFoot = zeros(3,1);
% RMSE.fextErr_rFoot = zeros(3,1);
for i = 1 : 3
    tmp.vect1lf = plotData.fext.measured.leftFoot(i,:);
    tmp.vect2lf= plotData.fext.simulated.leftFoot(i,:);
    RMSE.fextErr_lFoot(i) = calc_RMSE(tmp.vect1lf,tmp.vect2lf);
    
    tmp.vect1lf = plotData.fext.measured.leftFoot(i+3,:);
    tmp.vect2lf= plotData.fext.simulated.leftFoot(i+3,:);
    RMSE.mextErr_lFoot(i) = calc_RMSE(tmp.vect1lf,tmp.vect2lf);
    
    tmp.vect1rf = plotData.fext.measured.rightFoot(i,:);
    tmp.vect2rf= plotData.fext.simulated.rightFoot(i,:);
    RMSE.fextErr_rFoot(i) = calc_RMSE(tmp.vect1rf,tmp.vect2rf);
    
    tmp.vect1rf = plotData.fext.measured.rightFoot(i+3,:);
    tmp.vect2rf= plotData.fext.simulated.rightFoot(i+3,:);
    RMSE.mextErr_rFoot(i) = calc_RMSE(tmp.vect1rf,tmp.vect2rf);
end
save(fullfile(bucket.pathToProcessedData,'RMSE_measVSestim.mat'),'RMSE');

%% Maximumn and minimum error
%
% errorRanges = struct;
% LIN ACC
errorRanges.accMAXerr_pelvis  = zeros(3,1);
errorRanges.accMINerr_pelvis  = zeros(3,1);
for i = 1 : 3
    errorRanges.accMAXerr_pelvis(i) = max(abs((plotData.acc.measured.pelvis(i,:) - plotData.acc.simulated.pelvis(i,:))));
    errorRanges.accMINerr_pelvis(i) = min(abs((plotData.acc.measured.pelvis(i,:) - plotData.acc.simulated.pelvis(i,:))));
end
%
% FEXT
% errorRanges.fextfext6DMAXerr_lFoot  = zeros(6,1);
% errorRanges.fextfext6DMAXerr_rFoot  = zeros(6,1);
% 
% errorRanges.fextfext6DMINerr_lFoot  = zeros(6,1);
% errorRanges.fextfext6DMINerr_rFoot  = zeros(6,1);
for i = 1 : 6
    errorRanges.fext6DMAXerr_lFoot(i) = max(abs((plotData.fext.measured.leftFoot(i,:) - plotData.fext.simulated.leftFoot(i,:))));
    errorRanges.fext6DMAXerr_rFoot(i) = max(abs((plotData.fext.measured.rightFoot(i,:) - plotData.fext.simulated.rightFoot(i,:))));

    errorRanges.fext6DMINerr_lFoot(i) = min(abs((plotData.fext.measured.leftFoot(i,:) - plotData.fext.simulated.leftFoot(i,:))));
    errorRanges.fext6DMINerr_rFoot(i) = min(abs((plotData.fext.measured.rightFoot(i,:) - plotData.fext.simulated.rightFoot(i,:))));

end
save(fullfile(bucket.pathToProcessedData,'errorVal_measVSestim.mat'),'errorRanges');


function rmse = calc_RMSE(a,b)
rmse=sqrt(mean((a(:)-b(:)).^2));
end
