% Load required info
%addpath('/media/shared/dev/element_ftSk_Shoes/SkinInsoles/Matlab/');
if ~exist(fullfile(bucket.pathToProcessedData,[shoe,'_skin.mat']), 'file')
    disp(['[Skin FT calculation] No force information exist for skin from ',shoe,' shoe, performing calculation']);
    addpath(genpath(bucket.pathToSkinFunctions));
    %shoe = 'Left';
    wearable_data = false;
    insole_data = false;
    [fileName, path] = uigetfile('*.log','Select skin capacitance file' );
    fileInsoles=[path,'/',fileName];
    % fileInsoles='/media/shared/dev/MAPest/Experiments/23links_human/dataFloatingIWear/S05/task03/data/SkinShoes//data.log';
    [skin_timestamp, skin_capacitances_raw] = load_data(fileInsoles, wearable_data, insole_data, shoe);
    currentPath=pwd;
    % [fileName, path] = uigetfile('*.mat','Select file process_skin_data to get the right path' )
    % fileInsoles=[path,'/',fileName]
    %pathToProcessSkinData='/media/shared/dev/element_ftSk_Shoes/SkinInsoles/Matlab/ProcessData/utils';
    %cd(pathToProcessSkinData);
    cd(bucket.pathToProcessSkinData);
    [taxels_positions, raw_capacitance, raw_temperature] = process_skin_data(skin_capacitances_raw, shoe);
    cd(currentPath)
    [coeffFileName, path] = uigetfile('*.mat',['Select ',shoe ,' coefficients file'] );
    skinLeftCoefficientVar=[path,'/',coeffFileName];
    %skinLeftCoefficientVar='skinAsForce/k_left_insole.mat';
    load(skinLeftCoefficientVar);
    num_taxels=280;
    order_pol=3;
    A = (0.024 * 0.027 / 2) / 10;  % Sensor area
    %% prepare raw data
    for taxel = 1 : num_taxels
        start_index = (taxel-1)*(order_pol+1) + 1;
        end_index = (taxel-1)*(order_pol+1) + 4;
        Phi_left(:, start_index:end_index)=stack_n_order(raw_capacitance(:,taxel), order_pol);
        phi_t_x_temp = stack_n_order(raw_capacitance(:,taxel), order_pol);
        Phi_tau_x(:, start_index:end_index) = phi_t_x_temp * taxels_positions(taxel,2);
        
        % torques y
        phi_t_y_temp = stack_n_order(raw_capacitance(:,taxel), order_pol);
        Phi_tau_y(:, start_index:end_index) = - phi_t_y_temp * taxels_positions(taxel,1);
    end
    Phi_left_force=Phi_left.* A;
    Phi_tau_x = Phi_tau_x .* A;
    Phi_tau_y = Phi_tau_y .* A;
    
    %% compute forces pressure and torques
    presssureSkin= Phi_left * k_left;
    
    forceSkin=Phi_left_force* k_left;
    tauxSkin=Phi_tau_x* k_left;
    tauySkin=Phi_tau_y* k_left;
    skinFT=[zeros(size(forceSkin)),zeros(size(forceSkin)),forceSkin,tauxSkin,tauySkin,zeros(size(forceSkin))];
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