function out = SaturateActuator(x, xmax)
    n = size(x, 1);
    for i=1:n
        if (abs(x(i)) > xmax)
           out = xmax;
        else
            out = x;
        end
    end  
end