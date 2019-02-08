function contactJacobian= getFloatingContactJacobian(kinDynComputation,contactFrames)
% Author: Francisco Andrade
% Get and stack the jacobians for all contact forces
% This method assumes the state has been already updated.
% inputs:
%  kinDynComputation: structure that contains the model and performs the
%  actual calculation of the jacobian for the desired frame
% contactFrames: frames in which the contact is happening

if iscellstr(contactFrames)
    names=true;
else
    names=false;
end
idyn_Jacobian=  iDynTree.FrameFreeFloatingJacobian(kinDynComputation.model);
idyn_Jacobian.zero();
contactJacobian=[];
for frame=1:length(contactFrames)
    if names
        kinDynComputation.getFrameFreeFloatingJacobian (contactFrames{frame}, idyn_Jacobian)
    else
        kinDynComputation.getFrameFreeFloatingJacobian (contactFrames(frame), idyn_Jacobian)
    end
    contactJacobian=[contactJacobian;idyn_Jacobian.toMatlab];
end