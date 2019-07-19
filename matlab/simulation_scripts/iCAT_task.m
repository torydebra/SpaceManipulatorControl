% A single multidimensional task at a given level
% This function computes the new rho value based on the Jacobian and
% reference value of this task, its activation function and the previous
% value of the projection matrix.
% It returns the new value of rho and the new value of the projection
% matrix
% Paramters:
% - A, the activation matrix, must be a diagonal matrix of values smoothly
% evolving from 0 to 1
% - J, the Jacobian matrix of this task
% - Qold, the projection matrix of the previous priority level
% - rhoold, the previous computed rho
% - xdot, the reference value of this task
% - lambda, threshold, the two parameters used in the singular value
% oriented regularization of A*J*Qold (see
% SingularValueOrientedRegularization.m)
%
% Return values:
% - Q, the new projection matrix
% - rho, the updated rho value
function [Q, rho, W] = iCAT_task(A, J, Qold, rhoold, xdot, lambda, threshold, weight)
   n = size(J, 2);
   
   if (size(A, 2) ~= size(J, 1))
       error('A and J have different size');
   end
   
   JQpinv1 = iCAT_pseudoInverse(J*Qold, A, Qold, lambda, threshold, weight);
   JQpinv2 = iCAT_pseudoInverse(J*Qold, A, eye(n),lambda, threshold, weight);
  
   % compute the new projection matrix
   Q = Qold*(eye(n) - JQpinv2*J*Qold);
  
   % compute W to smooth out the use of Qold in lower priority tasks
   W = J*Qold*JQpinv1;
   T = eye(n) - Qold*JQpinv2*W*J;
   % compute the new rho
   rho = T*rhoold + Qold*JQpinv2*W*xdot;  
end