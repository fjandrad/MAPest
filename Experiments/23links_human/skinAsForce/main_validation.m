[file,path] = uigetfile('../../../../..');
load([path file]);

save(['info_calibration'], 'k', 'POLYNOMIAL_ORDER', 'HISTORY_SAMPLES', 'HISTORY_POLYNOMIAL_ORDER', 'DISCARDED_TAXELS_CAL');

clear all;
close all;
% clc;

addpath('DatasetsValidation');
addpath('Utils');
addpath('Results');

[file,path] = uigetfile('DatasetsValidation/FTSKShoes');
dataset_validation = [path, file];
disp(file);

[strap,tf] = listdlg('ListString',{'true','false'});


clearvars -except dataset_validation strap ii;

configurationfile;

% Load models
load('info_calibration.mat');

ftskshoes_exp = load_dataset_validation(dataset_validation);

% Subtract offset if the experiments are with the straps closed

%   if strap{ii} == true
if strap == 1
  [file,path] = uigetfile({'*.mat'}, 'Select offset insole:');
  offset_insole_file = [path, file];
  offset_ftskshoes = load(offset_insole_file);
  offset = CAPACITANCE_REST_CONDITION - mean(offset_ftskshoes.offset_C,1);
  ftskshoes_exp.C = ftskshoes_exp.C + offset;
end

lim = 2500;
ftskshoes_exp.C = ftskshoes_exp.C(1:lim,:);
ftskshoes_exp.fz = ftskshoes_exp.fz(1:lim,:);
ftskshoes_exp.tx = ftskshoes_exp.tx(1:lim,:);
ftskshoes_exp.ty = ftskshoes_exp.ty(1:lim,:);


% Definitions
name_fields = fieldnames(k);


% ------------- Compute regressors ----------
% Phi_f = AREA_TAXEL * P(C)
% Phi_tau_x = AREA_TAXEL * P(C) * pos_y
% Phi_tau_y = - AREA_TAXEL * P(C) * pos_X
% -------------------------------------------

length_coeff_per_taxel = POLYNOMIAL_ORDER + 1 + HISTORY_SAMPLES * HISTORY_POLYNOMIAL_ORDER;

% Phi_f = zeros(size(ftskshoes_exp.C,1), NUMBER_OF_TAXELS*length_coeff_per_taxel);
% Phi_tau_x = zeros(size(ftskshoes_exp.C,1), NUMBER_OF_TAXELS*length_coeff_per_taxel);
% Phi_tau_y = zeros(size(ftskshoes_exp.C,1), NUMBER_OF_TAXELS*length_coeff_per_taxel);
% 
% for taxel = 1 : NUMBER_OF_TAXELS
%   start_index = (taxel - 1) * length_coeff_per_taxel + 1;
%   end_index = taxel * length_coeff_per_taxel;
%   
%   Phi_f(:, start_index:end_index) = regressor(ftskshoes_exp.C(:,taxel), POLYNOMIAL_ORDER, HISTORY_SAMPLES, HISTORY_POLYNOMIAL_ORDER);
%   Phi_tau_x(:, start_index:end_index) = Phi_f(:, start_index:end_index) .* ftskshoes_exp.taxel_pos_m(taxel,2);
%   Phi_tau_y(:, start_index:end_index) = - Phi_f(:, start_index:end_index) .* ftskshoes_exp.taxel_pos_m(taxel,1);
% end
% 
% if ~isempty(DISCARDED_TAXELS_CAL)
%   for ii = 1 : length(DISCARDED_TAXELS_CAL)
%     Phi_f(:,(DISCARDED_TAXELS_CAL(ii) - 1) * length_coeff_per_taxel + 1:DISCARDED_TAXELS_CAL(ii) * length_coeff_per_taxel) = [];
%     Phi_tau_x(:,(DISCARDED_TAXELS_CAL(ii) - 1) * length_coeff_per_taxel + 1:DISCARDED_TAXELS_CAL(ii) * length_coeff_per_taxel) = [];
%     Phi_tau_y(:,(DISCARDED_TAXELS_CAL(ii) - 1) * length_coeff_per_taxel + 1:DISCARDED_TAXELS_CAL(ii) * length_coeff_per_taxel) = [];
%   end
% end


Phi_f = zeros(size(ftskshoes_exp.C,1), (NUMBER_OF_TAXELS-length(DISCARDED_TAXELS_CAL))*length_coeff_per_taxel);
Phi_tau_x = zeros(size(ftskshoes_exp.C,1), (NUMBER_OF_TAXELS-length(DISCARDED_TAXELS_CAL))*length_coeff_per_taxel);
Phi_tau_y = zeros(size(ftskshoes_exp.C,1), (NUMBER_OF_TAXELS-length(DISCARDED_TAXELS_CAL))*length_coeff_per_taxel);

index = 1;
for taxel = 1 : NUMBER_OF_TAXELS
  if ismember(taxel,DISCARDED_TAXELS_CAL) == 0
    start_index = (index - 1) * length_coeff_per_taxel + 1;
    end_index = index * length_coeff_per_taxel;
    
    % forces z
    Phi_f(:, start_index:end_index) = regressor(ftskshoes_exp.C(:,taxel), POLYNOMIAL_ORDER, HISTORY_SAMPLES, HISTORY_POLYNOMIAL_ORDER);

    % torques x
    Phi_tau_x(:, start_index:end_index) = Phi_f(:, start_index:end_index) .* ftskshoes_exp.taxel_pos_m(taxel,2);

    % torques y
    Phi_tau_y(:, start_index:end_index) = - Phi_f(:, start_index:end_index) .* ftskshoes_exp.taxel_pos_m(taxel,1);
  
    index = index + 1;
  end
end


Phi_Af = Phi_f .* AREA_TAXEL;
Phi_Atau_x = Phi_tau_x .* AREA_TAXEL;
Phi_Atau_y = Phi_tau_y .* AREA_TAXEL;


%% Estimate fz, taux, tauy, with the optimized coefficients
f_estim = cell(numel(name_fields),1);
tx_estim = cell(numel(name_fields),1);
ty_estim = cell(numel(name_fields),1);
P_estim_dataset_f = cell(numel(name_fields),1);
P_estim_dataset_tx = cell(numel(name_fields),1);
P_estim_dataset_ty = cell(numel(name_fields),1);
for index = 1 : numel(name_fields)
  f_estim{index} = Phi_Af * k.(name_fields{index});
  tx_estim{index} = Phi_Atau_x * k.(name_fields{index});
  ty_estim{index} = Phi_Atau_y * k.(name_fields{index});
  
%   for elem = 1 : length_coeff_per_taxel : size(Phi_f, 2)
%     taxel = floor((elem-1) / length_coeff_per_taxel) + 1;
%     P_estim_dataset_f{index}(:,taxel) = (Phi_f(:, elem:elem+(length_coeff_per_taxel-1))) * k.(name_fields{index})(elem:elem+(length_coeff_per_taxel-1));
%     P_estim_dataset_tx{index}(:,taxel) = (Phi_tau_x(:, elem:elem+(length_coeff_per_taxel-1))) * k.(name_fields{index})(elem:elem+(length_coeff_per_taxel-1));
%     P_estim_dataset_ty{index}(:,taxel) = (Phi_tau_y(:, elem:elem+(length_coeff_per_taxel-1))) * k.(name_fields{index})(elem:elem+(length_coeff_per_taxel-1));
%   end
end


%% Compute and plot results
f_err = cell(numel(name_fields));
tx_err = cell(numel(name_fields));
ty_err = cell(numel(name_fields));
for index = 1 : numel(name_fields)
  f_err{index} = ftskshoes_exp.fz - f_estim{index};
  tx_err{index} = ftskshoes_exp.tx - tx_estim{index};
  ty_err{index} = ftskshoes_exp.ty - ty_estim{index};
end

plot_results_ftskshoes(ftskshoes_exp.fz, ftskshoes_exp.tx, ftskshoes_exp.ty, f_estim, tx_estim, ...
  ty_estim, f_err, tx_err, ty_err, name_fields);


for index = 1 : numel(name_fields)
  v1 = gfit(ftskshoes_exp.fz, f_estim{index}, '3');
  disp(['RMSE validation dataset forces - vacuum = ', num2str(v1)]);
  v3 = gfit(ftskshoes_exp.tx, tx_estim{index}, '3');
  disp(['RMSE validation dataset torques x - vacuum = ', num2str(v3)]);
  v5 = gfit(ftskshoes_exp.ty, ty_estim{index}, '3');
  disp(['RMSE validation dataset torques y - vacuum = ', num2str(v5)]);
end

