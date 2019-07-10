% Load required info
% addpath('/media/shared/dev/element_ftSk_Shoes/SkinInsoles/Matlab/');
shoe = 'Left';
wearable_data = false;
insole_data = false;
% [fileName, path] = uigetfile('*.mat','Select file' )
% fileInsoles=[path,'/',fileName]
fileInsoles='/media/shared/dev/MAPest/Experiments/23links_human/dataFloatingIWear/S05/task03/data/SkinShoes//data.log';
[skin_timestamp, skin_capacitances_raw] = load_data(fileInsoles, wearable_data, insole_data, shoe);
currentPath=pwd;
cd '/media/shared/dev/element_ftSk_Shoes/SkinInsoles/Matlab/ProcessData/ftskshoes'
[taxels_positions, raw_capacitance, raw_temperature] = process_skin_data(skin_capacitances_raw, shoe);
cd(currentPath)
load("skinAsForce/k_left_insole.mat");
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

%% plot
figure,plot(skin_timestamp-skin_timestamp(1),forceSkin*-1)
hold on
plot(timestamp1-timestamp1(1),  shoes.Left_HF(3,:))

 figure,plot(skin_timestamp,forceSkin*-1)
hold on
plot(timestamp1,  shoes.Left_HF(3,:))