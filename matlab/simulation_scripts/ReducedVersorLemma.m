function c = ReducedVersorLemma( a,  b)

vsinth = cross(a,b);
costh = dot(a,b);

sinth = norm(vsinth,2);

if  (sinth > 0.00000000001)
    theta = atan2(sinth,costh);
    c = (vsinth * (theta/sinth));
else
    if (costh>0)
        c = 0;
    else 
        c = 0;
    end
    
end

end

