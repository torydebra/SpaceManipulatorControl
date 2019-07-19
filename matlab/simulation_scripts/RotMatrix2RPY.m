function [roll, pitch, yaw] = RotMatrix2RPY(R)
temp = zeros(3,1);
if ((abs(R(1,1)) < 0.000000000001) && (abs(R(2,1)) < 0.000000000001)) 
    temp(1,1) = 0;
    temp(2,1) = -pi/2*R(3,1);
    temp(3,1) = atan2(-R(1,2),R(2,2));
else
    temp(1,1) = atan2(R(2,1),R(1,1));

    sr = sin(temp(1,1));
    cr = cos(temp(1,1));

    temp(2,1) = atan2(-R(3,1),(R(1,1)*cr + R(2,1)*sr));
    temp(3,1) = atan2((R(1,3)*sr - R(2,3)*cr),(-R(1,2)*sr + R(2,2)*cr));
end

roll = temp(3,1);
pitch = temp(2,1);
yaw = temp(1,1);

end
