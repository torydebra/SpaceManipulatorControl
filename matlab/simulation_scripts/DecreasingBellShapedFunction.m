% A sigmoid function with decreasing behavior
%
% This function is defined as follows
% ymax, if x < xmin
% ymin, if x > xmax
% a smooth behavior inbetween
function y = DecreasingBellShapedFunction(xmin, xmax, ymin, ymax, x)
    if (x <= xmin)
		y = ymax;
    elseif (x >= xmax)
		y = ymin;
    else
		cosarg = (x - xmin) * pi / (xmax - xmin);
		y = (ymax - ymin) * (0.5 * cos(cosarg) + 0.5) + ymin;
    end
end