clc
clear

addpath('./simulation_scripts');


%% read desired pose and velocities
desiredPoseData = csvread('end-effectorPose.csv');
desiredVelocitiesData = csvread('end-effectorVelocities.csv');

timePose = desiredPoseData(:,1);
desiredPose = desiredPoseData(:,2:7);
timeVelocities = desiredVelocitiesData(:,1);
desiredVelocities = desiredVelocitiesData(:,2:7);


%% SPART
run SPART/SPART2path
[robot,robot_keys] = urdf2robot('ChaserRobot.urdf');

%initial conditions
%Base-link position and orientation
R0=eye(3);  %Rotation from base-link with respect to the inertial CCS.
r0=[0;0;0]; 
%Joint displacements
qJoints_init=[0; -0.5236; 0; -1.0472; 0; -1.0472; 0];

%% simulink gains
deltaQdotGainVeh = 1; %only free flying cases
deltaQdotGainArm = 1; % gain for the computed torque for manipulator

eePositionGain = 3;
eeVelocityGain = 1;
vehPositionGain = 1; %only free flying cases
