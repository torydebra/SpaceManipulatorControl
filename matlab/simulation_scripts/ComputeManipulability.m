function [Jmu, mu] = ComputeManipulability(J, djdq)
% this function computes the manipulability Jacobian Jmu of the
% manipulability measure mu of a matrix J (given djdq)
    k = 0;
    Jpinv = RegPseudoInverse2(J, 0.0001, 0.0001);
    mu = sqrt(det(J*J'));
    numberOfJoints = size(J,2);
    while k < numberOfJoints
        Jmu(k+1) = 0;
        djdqJpinv = djdq(:,:,k+1) * Jpinv;
        i = 1;
        while i <= 6
            Jmu(k+1) = Jmu(k+1) + djdqJpinv(i,i);
            i = i + 1;
        end
        
        Jmu(k+1) = Jmu(k+1)*mu;
        
        k = k+1;
    end
end    
