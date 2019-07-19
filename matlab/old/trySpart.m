%URDF filename
filename='ChaserRobot.urdf';

%Create robot model
[robot,robot_keys] = urdf2robot(filename);

%% Kinematics
%Base-link position and orientation
R0=eye(3);  %Rotation from base-link with respect to the inertial CCS.
r0=[0;0;0]; 
%Joint displacements
qm=[0, -0.5236, 0, -1.0472, 0, -1.0472, 0];
[RJ,RL,rJ,rL,e,g]=Kinematics(R0,r0,qm,robot);

%Differential kinematics
[Bij,Bi0,P0,pm]=DiffKinematics(R0,r0,rL,e,g,robot);

%Generalized velocities (joint-space velocities)
u0=ones(6,1); %Base-link angular (projected in the base-link body-fixed CCS) and linear velocities.
um=[4;-1;5;0;0;0;0]; %Joint velocities

%Twist (operational-space velocities)
[t0,tL]=Velocities(Bij,Bi0,P0,pm,u0,um,robot);

%Jacobian of a point p in the 8 link
%rp is the position of the point p, projected in the inertial CCS -- as a [3x1] matrix.
rp = rL(1:3, 8);
[J_0ee, J_mee]=Jacob(r0,r0,rL,P0,pm,0,robot);
%Jacobain time derivative
%rp is the position of the point p, projected in the inertial CCS -- as a [3x1] matrix.
%tp is the twist of the point p -- as a [6x1] matrix.
[J0pdot, Jmpdot]=Jacobdot(r0,t0,r0,t0,rL,tL,P0,pm,0,robot);

%% Dynamics
%Inertias projected in the inertial frame
[I0,Im]=I_I(R0,RL,robot);
%Mass Composite Body matrix
[M0_tilde,Mm_tilde]=MCB(I0,Im,Bij,Bi0,robot);
%Generalized Inertia Matrix
[H0, H0m, Hm] = GIM(M0_tilde,Mm_tilde,Bij,Bi0,P0,pm,robot);
%Generalized Convective Inertia Matrix
[C0, C0m, Cm0, Cm] = CIM(t0,tL,I0,Im,M0_tilde,Mm_tilde,Bij,Bi0,P0,pm,robot);

%Wrenches
wF0=zeros(6,1);
wFm=zeros(6,robot.n_links_joints);

%Generalized forces
tau0=zeros(6,1);
taum=1 * ones(robot.n_q,1);

[u0dot_FD,umdot_FD] = FD(tau0,taum,wF0,wFm,t0,tL,P0,pm,I0,Im,Bij,Bi0,u0,um,robot);





%% other tori
rotmL = RL(:,:,end)
eulL = rotm2eul(rotmL, 'XYZ')
%degL = rad2deg(eulL)

wanted = eul2rotm([-1.2662,-1.5708,1.2662], 'ZYX')
eulasd = rotm2eul(wanted, 'ZYX')
wantasd = eul2rotm(eulasd, 'ZYX')

% rotmJ = RJ(:,:,end)
% eulJ = rotm2eul(rotmJ, 'XYZ')
% degJ = rad2deg(eulJ)

