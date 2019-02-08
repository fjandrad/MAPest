function[Nu]=calculateNullSpaceProjectorForConstraintJacobians(kinDynComputation,contactFramesNames,jointTrajectories,basePosition,baseOrientation,baseVelocity)
% Author: Francisco Andrade
%% Function Description
%Output:
% Nu is the weighted null space projector of the contact force jacobians. It is weighted using the mass matrix to be dynamically consistent.
%Input:
%  kinDynComputation: structure that contains the model and performs the
%  kinematic and dynamic computations
% contactFramesNames: names of the frames in which the contact is happening
% jointTrajectories: trajectories of the joints positions and velocities.
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
kinDynComputation.getFreeFloatingMassMatrix ( massMatrix_idyntree);
massMatrix=massMatrix_idyntree.toMatlab;
invMassMatrix=inv(massMatrix);
for state=1:length(jointTrajectories.q)
    % convert state from matlab
    q.fromMatlab(jointTrajectories.q(:,state));
    dq.fromMatlab(jointTrajectories.dq(:,state));
    % base to world rotation
    G_R_base = quat2Mat(baseOrientation(:,state));
    G_T_baseRot.fromMatlab(G_R_base);
    % base to world position
    G_T_basePos.fromMatlab(basePosition(:,state));
    % base to world transform
    G_T_base = iDynTree.Transform(G_T_baseRot,G_T_basePos);
    % convert base velocity in base frame to idyntree
    baseVel_iDynTree.fromMatlab(baseVelocity(:,state));
    % update robot state
    kinDynComputation.setRobotState(G_T_base,q,baseVel_iDynTree,dq,gravity);
    % Get contact jacobian
    contactJacobian=getFloatingContactJacobian(kinDynComputation,contactFramesNames);    
    % Null space projector
    partialNu=contactJacobian'*inv(contactJacobian*invMassMatrix*contactJacobian')*contactJacobian*invMassMatrix;
    Nu(state,:,:)=eye(size(partialNu))-partialNu;
    % expected size to be (state, number of joints +6, number of joints +6)
end