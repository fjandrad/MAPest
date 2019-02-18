function[Nu]=calculateNullSpaceProjectorForConstraintJacobians(kinDynComputation,contactFramesNames,state,G_T_base,baseVelocity)
% Author: Francisco Andrade
%% Function Description
%Output:
% Nu is the weighted null space projector of the contact force jacobians. It is weighted using the mass matrix to be dynamically consistent.
%Input:
%  kinDynComputation: structure that contains the model and performs the
%  kinematic and dynamic computations
% contactFramesNames: names of the frames in which the contact is happening
% state: joints positions and velocities for each sample.
% (maybe accelerations as well)
% basePosition: position of the base in the world frame
% baseOrientation: orientation of the base in the world frame
% baseVelocity: velocity of the base expressed in the base frame

Nu=[];
% state variables 
q  = iDynTree.JointPosDoubleArray(kinDynComputation.model);
dq = iDynTree.JointDOFsDoubleArray(kinDynComputation.model);
baseVel_iDynTree = iDynTree.Twist();
% Assuming gravity with respect to the inertial frame can be expressed as:
gravity = iDynTree.Vector3();
gravity.fromMatlab([0; 0; -9.81]);
% Get Mass matrix
massMatrix_idyntree=iDynTree.MatrixDynSize();
for sample=1:length(state.q)
    % convert state from matlab
    q.fromMatlab(state.q(:,sample));
    dq.fromMatlab(state.dq(:,sample));    
    % convert base velocity in base frame to idyntree
    baseVel_iDynTree.fromMatlab(baseVelocity(:,sample));
    % update robot state
    kinDynComputation.setRobotState(G_T_base.G_T_b{sample,1},q,baseVel_iDynTree,dq,gravity);
    % Get contact jacobian
    contactJacobian=getFloatingContactJacobian(kinDynComputation,contactFramesNames);
    %update mass matrix
    kinDynComputation.getFreeFloatingMassMatrix ( massMatrix_idyntree);
    massMatrix=massMatrix_idyntree.toMatlab;
    invMassMatrix=inv(massMatrix);
    % Null space projector
    partialNu=contactJacobian'*inv(contactJacobian*invMassMatrix*contactJacobian')*contactJacobian*invMassMatrix;
    Nu(sample,:,:)=eye(size(partialNu))-partialNu;
end