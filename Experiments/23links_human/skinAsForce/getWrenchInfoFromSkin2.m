
% Load required info
%addpath('/media/shared/dev/element_ftSk_Shoes/SkinInsoles/Matlab/');
if ~exist(fullfile(bucket.pathToProcessedData,[shoe,'_skin.mat']), 'file')
    disp(['[Skin FT calculation] No force information exist for skin from ',shoe,' shoe, performing calculation']);
    addpath(genpath(bucket.pathToSkinFunctions));
    %shoe = 'Left';
    wearable_data = false;
    insole_data = false;
    CAPACITANCE_REST_CONDITION=240;
    [fileName, path] = uigetfile('*.log','Select skin capacitance file' );
    fileInsoles=[path,'/',fileName];
    configurationfile; % this should be the associated configuration of the sole used with current status.
    
    % fileInsoles='/media/shared/dev/MAPest/Experiments/23links_human/dataFloatingIWear/S05/task03/data/SkinShoes//data.log';
    [skin_timestamp, skin_capacitances_raw] = load_data(fileInsoles, wearable_data, insole_data, shoe);
    currentPath=pwd;
    % needed only for some datasets need to agree on this
    skin_timestamp=skin_capacitances_raw(:,1);
    skin_capacitances_raw=skin_capacitances_raw(:,2:end);
    % there is a double time stamp for some reason
    % [fileName, path] = uigetfile('*.mat','Select file process_skin_data to get the right path' )
    % fileInsoles=[path,'/',fileName]
    %pathToProcessSkinData='/media/shared/dev/element_ftSk_Shoes/SkinInsoles/Matlab/ProcessData/utils';
    %cd(pathToProcessSkinData);
    cd(bucket.pathToProcessSkinData);
    [taxels_positions, raw_capacitance, raw_temperature] = process_skin_data(skin_capacitances_raw, shoe);
    %     [skin_capacitances_filtered, skin_timestamp] = filter_data(raw_capacitance, skin_timestamp);
    cd(currentPath)
    [coeffFileName, path] = uigetfile('*.mat',['Select ',shoe ,' coefficients file'] );
    skinLeftCoefficientVar=[path,'/',coeffFileName];
    %skinLeftCoefficientVar='skinAsForce/k_insole.mat';
    temporaryStructk=load(skinLeftCoefficientVar);
    fname=fieldnames(temporaryStructk);
%       k=temporaryStructk.k.k_vac_f_tx_ty;
     k=temporaryStructk.(fname{1});
    %%
    %threshold capacitance
    ind = abs(raw_capacitance - CAPACITANCE_REST_CONDITION) < 8;
raw_capacitance(ind) = CAPACITANCE_REST_CONDITION;

    length_coeff_per_taxel = POLYNOMIAL_ORDER + 1 + HISTORY_SAMPLES * HISTORY_POLYNOMIAL_ORDER;
    
    
    Phi_f = zeros(size(raw_capacitance,1), (NUMBER_OF_TAXELS-length(DISCARDED_TAXELS_CAL))*length_coeff_per_taxel);
    Phi_tau_x = zeros(size(raw_capacitance,1), (NUMBER_OF_TAXELS-length(DISCARDED_TAXELS_CAL))*length_coeff_per_taxel);
    Phi_tau_y = zeros(size(raw_capacitance,1), (NUMBER_OF_TAXELS-length(DISCARDED_TAXELS_CAL))*length_coeff_per_taxel);
    
    index = 1;
    for taxel = 1 : NUMBER_OF_TAXELS
        if ismember(taxel,DISCARDED_TAXELS_CAL) == 0
            start_index = (index - 1) * length_coeff_per_taxel + 1;
            end_index = index * length_coeff_per_taxel;
            
            % forces z
            Phi_f(:, start_index:end_index) = regressor(raw_capacitance(:,taxel), POLYNOMIAL_ORDER, HISTORY_SAMPLES, HISTORY_POLYNOMIAL_ORDER);
            
            % torques x
            Phi_tau_x(:, start_index:end_index) = Phi_f(:, start_index:end_index) .* taxels_positions(taxel,2)/1000;
            
            % torques y
            Phi_tau_y(:, start_index:end_index) = - Phi_f(:, start_index:end_index) .* taxels_positions(taxel,1)/1000;
            
            index = index + 1;
        end
    end
    
    
    Phi_Af = Phi_f .* AREA_TAXEL;
    Phi_Atau_x = Phi_tau_x .* AREA_TAXEL;
    Phi_Atau_y = Phi_tau_y .* AREA_TAXEL;
    
    
    %% Estimate fz, taux, tauy, with the optimized coefficients
    presssureSkin= Phi_f * k;
    forceSkin = Phi_Af * k;
    tauxSkin = Phi_Atau_x * k;
    tauySkin = Phi_Atau_y * k;    
    
    %% put in correct format
    skinFT=[zeros(size(forceSkin)),zeros(size(forceSkin)),forceSkin,tauxSkin,tauySkin,zeros(size(forceSkin))];
    skinFT=-skinFT; % to put it in the human frame instead of the sensor frame ( we should handle this better in the future
    save(fullfile(bucket.pathToProcessedData,[shoe,'_skin.mat']),'skinFT');
    save(fullfile(bucket.pathToProcessedData,[shoe,'_skinTime.mat']),'skin_timestamp');
else
    skinFT_struct=  load(fullfile(bucket.pathToProcessedData,[shoe,'_skin.mat']));
    skin_timestamp_struct = load(fullfile(bucket.pathToProcessedData,[shoe,'_skinTime.mat']));
    disp(['[Skin FT calculation] Read file ',shoe,'_skin.mat']);
    skin_timestamp=skin_timestamp_struct.skin_timestamp;
    skinFT=skinFT_struct.skinFT;
end
%%  Synchronize data
referenceTimeStamp=wearData.timestamp;
skinFTData=resampleFt(referenceTimeStamp,skin_timestamp,skinFT);
skinFTData=skinFTData';
disp('[Skin FT calculation] Skin ft data syncrhonized with suit timestamp.');
%% plot
% figure,plot(skin_timestamp-skin_timestamp(1),forceSkin*-1)
% hold on
% plot(referenceTimeStamp-referenceTimeStamp(1),  shoes.Left_HF(3,:))
%
% figure,plot(skin_timestamp,forceSkin*-1)
% hold on
% plot(referenceTimeStamp,  shoes.Left_HF(3,:))