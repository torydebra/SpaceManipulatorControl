function [R] = rotation(tx, ty, tz)
% rotation matrix Rz*Ry*Rx
% tx angle around x axis (roll)
% ty angle around y axis (pitch)
% tz angle around z axis (yaw)

Rx = [1 0 0; 0 cos(tx) -sin(tx); 0 sin(tx) cos(tx)];
Ry = [cos(ty) 0 sin(ty); 0 1 0; -sin(ty) 0 cos(ty)];
Rz = [cos(tz) -sin(tz) 0; sin(tz) cos(tz) 0; 0 0 1];
R = Rz*Ry*Rx;
end