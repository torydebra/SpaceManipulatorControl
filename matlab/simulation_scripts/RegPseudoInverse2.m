function [Xinv, p] = RegPseudoInverse2(X, lambda, threshold)
    [U,S,V] = svd(X);
    sizeS = size(S);
    Sinv = zeros(sizeS(2), sizeS(1));
    for i = 1:min(sizeS)
        p(i) = cosRialzatoEnr(S(i,i), lambda, threshold);
        Sinv(i,i) = S(i,i)/(S(i,i)^2 + p(i));
    end
    Xinv = V*Sinv*U';
end

function [reg] = cosRialzatoEnr(sigma, lambda, threshold)
    if (sigma < 0) 
        sigma = -sigma;
    end

    if (0<=sigma && sigma<=threshold)
		tempVal = (sigma/threshold)*pi;
		reg =lambda*(0.5*cos(tempVal) + 0.5);
	else 
		reg = 0.0;
    end
end