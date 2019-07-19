% Performs the general pseudo inverse minimizing
% min ||A(x-Jq)||^2 + ||Jq||^2_A(I-A) + ||(I-Q)q||^2
%
function [Jpinv, p] = iCAT_pseudoInverse(J, A, Q, lambda, threshold, weight)
   m = size(J, 1);
   n = size(J, 2);

   % task oriented regularization 
   Rtor = J'*(eye(m)-A)*A*J;
   
   % control directions regularization
   Rctrl = weight*(eye(n)-Q)'*(eye(n)-Q);
   
   % compute the pseudo inverse with the unifying formula
   [JJpinv, p] = RegPseudoInverse(J'*A'*A*J + Rtor + Rctrl, lambda, threshold);
   Jpinv = JJpinv*J'*A'*A;  
   
   
end