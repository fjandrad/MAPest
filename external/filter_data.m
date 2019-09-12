function [filtered_data1, filtered_timestamp1] = filter_data(data1, timestamp1)

addpath('../utils');

polynomOrder = 5; % 10
frameLen = 41; % 11
derivOrder = 2; % 4

% deltaT logged pressured
dT1 = timestamp1(2) - timestamp1(1);

% Filter pressure
for col=1:size(data1,2)
  filtered1(:,col) = sgolayFilterAndDerivate(polynomOrder, frameLen, derivOrder, data1(:,col), dT1);
end

% Mask
mask1 = false(length(filtered1),1);
mask1((frameLen+1)/2 : length(filtered1) - (frameLen+1)/2) = 1;
filtered_data1 = applyMask(filtered1, mask1);
filtered_timestamp1 = applyMask(timestamp1, mask1);
end