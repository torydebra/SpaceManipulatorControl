function [temp1 , temp2] = CartError(in1, in2)
% computes the Cartesian error between two frames
% e.g. CartError(wTg, wTv) returns the error that makes <v> -> <g> 
% projected on <w>

temp1 = (VersorLemma(in1(1:3,1:3), in2(1:3,1:3)))*(-1);
temp2 = in1(1:3,4)-in2(1:3,4);

end

