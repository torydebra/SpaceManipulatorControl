function [ out ] = VersorLemma( R1, R2 )
i1 = R1(:,1);
j1 = R1(:,2);
k1= R1(:,3);

i2 = R2(:,1);
j2 = R2(:,2);
k2 = R2(:,3);

sigma = cross(i1,i2) + cross(j1,j2) + cross(k1,k2);

rosintheta = sigma/2;
sintheta = norm(rosintheta,2);
costheta = ((dot(i1,i2) + dot(j1,j2) + dot(k1,k2))-1)/2;

VERSOR_LEMMA_TH = 0.000001;
        if sintheta > VERSOR_LEMMA_TH
      %0<theta<180
            theta = atan2(sintheta,costheta);
            out = (rosintheta * (theta/sintheta));
        else
            if (costheta>0)
                % theta = 0 degrees
                out = [0 0 0]';
            else
                % theta = 180 degrees
               h = R1 + R2;
                
               temp1 = h(:,1);
               temp2 = h(:,2);
               temp3 = h(:,3);
               
               t1 = norm(temp1,2);
               t2 = norm(temp2,2);
               t3 = norm(temp3,2);
	
                if (t2 > t1)

                    if (t2 > t3)
                        maxnormvector = temp2;
                    else
                        maxnormvector = temp3;
                    end
                else

                    if (t3 > t1)
                        maxnormvector = temp3;
                    else
                        maxnormvector = temp1;

                    end

                end
    
                if  norm(maxnormvector,2) ~= 0
                    out = (maxnormvector * (pi / norm(maxnormvector,2)));
                else
                    out = [0 0 0]';        
                end    
            end
        end
end

