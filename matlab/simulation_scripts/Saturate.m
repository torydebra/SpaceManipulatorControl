function out = Saturate(x, xmax)
    n = size(x, 1);
    max = 0;
    for i=1:n
        if (abs(x(i)) > max)
            max = abs(x(i));
        end
    end
    
    if (max > xmax)
        out = x/max*xmax;
    else
        out = x;
    end
end