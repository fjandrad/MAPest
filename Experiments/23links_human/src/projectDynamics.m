function [projectedDynamics]=projectDynamics(Nu,selectorMatrix,tau_alpha,baseWrench_alpha)
% Author: Francisco Andrade
% this function applies the null space projector to the no external force torques to obtain torques respecting the constraints
% it uses fromula 13 found in https://github.com/dic-iit/component_andy/issues/200#event-2116246140
% inputs:
%  Nu: null space projector to the constraints
%  selector Matrix: matrix that selects only the joints and puts 0 the
%  floating base related quantities
%  tau_alpha: torques estimated neglecting the value of the external forces at contacts 
% output:
%  projectedDynamics: the torques acting on the joints such that the
%  constraints are respected.
projectedDynamics=-9999*ones(size(tau_alpha));
for sample=1:length(tau_alpha)
    sNU=squeeze(Nu(sample,:,:));
    %       projectedDynamics(:,sample) = pinv(sNU * selectorMatrix, 1e-4) * sNU*tau_alpha(:,sample);
    %temporary fix until math is revised
    augmentedAlpha=[baseWrench_alpha(:,sample);tau_alpha(:,sample)];
    
    projectedDynamics(:,sample) = pinvDamped(sNU * selectorMatrix, 1e-6) * sNU*augmentedAlpha;
    % end of temporary code
end