function Jtot_0ee = my_kinematic(r0, wR0, q_joints)

global robot

[RJ,RL,rJ,rL,e,g]=Kinematics(wR0,r0,q_joints,robot);
%Diferential Kinematics
[Bij,Bi0,P0,pm]=DiffKinematics(R0,r0,rL,e,g,robot);
%Velocities
[t0,tm]=Velocities(Bij,Bi0,P0,pm,u0,um,robot);
%Jacobian of the last link (the end effector)
[J0_0ee, Jman_0ee]=Jacob(rL(1:3,end),r0,rL,P0,pm,robot.n_links_joints,robot);

Jtot_0ee = [J0_0ee, Jman_0ee];




end

