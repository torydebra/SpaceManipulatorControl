
function newp = integrate_vehicle(p, v_v, deltat)

wRv = rotation(p(4), p(5), p(6));

% v projected on <w>
w_v = [wRv zeros(3);zeros(3) wRv] * v_v;

% wx wy wz on the body frame transformed to rpy derivatives on inertial
% frame
[rpydot] = pqr2rpy(p(4:6), v_v(4:6));

% create the velocity vector xdot ydot zdot rolldot pitchdot yawdot
w_vrpy = [w_v(1:3); rpydot'];

% integrate
newp = p + w_vrpy*deltat;

end
