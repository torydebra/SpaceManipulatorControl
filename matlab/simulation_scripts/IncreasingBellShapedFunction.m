% A sigmoid function with increasing behavior
%
% This function is defined as follows
% ymin, if x < xmin
% ymax, if x > xmax
% a smooth behavior inbetween
function y = IncreasingBellShapedFunction(xmin, xmax, ymin, ymax, x)
    if (x <= xmin)
		y = ymin;
    elseif (x >= xmax)
		y = ymax;
    else
    	cosarg = (x - xmin) * pi / (xmax - xmin) + pi;
        y = (ymax - ymin) * (0.5 * cos(cosarg) + 0.5) + ymin;
    end
end