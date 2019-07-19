function rpydot = pqr2rpy(rpy, pqr)
% rpy the roll, pitch, yaw angles
% pqr the three angular velocities (on the body frame!)
% rpydot the derivatives of the roll, pitch, yaw angles
rpydot = zeros(1,3);

	p = pqr(1);
	q = pqr(2);
	r = pqr(3);
    
	tany = tan(rpy(2));
	sx = sin(rpy(1));
	cx = cos(rpy(1));
	cy = cos(rpy(2));

	rpydot(1) = p + tany*sx*q + tany*cx*r;
	rpydot(2) = cx*q - sx*r;
	rpydot(3) = sx/cy*q + cx/cy*r;

end