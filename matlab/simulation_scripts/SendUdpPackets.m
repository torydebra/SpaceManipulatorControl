function [] = SendUdpPackets(uvms,wuRw,vRvu,uArm,uVehicle)
    packetArm = uvms.q;
    fwrite(uArm,packetArm,'float32');

    unity_vehicle = wuRw * uvms.wTv(1:3,1:3) * vRvu;
    [r,p,y] = RotMatrix2RPY(unity_vehicle);

    trasl = [uvms.wTv(1,4),uvms.wTv(2,4),uvms.wTv(3,4)]';
    unity_vehicle_trasl = wuRw * trasl;
            
    packetVehicle = [unity_vehicle_trasl(1,1),-unity_vehicle_trasl(2,1),unity_vehicle_trasl(3,1),-r,p,-y];
    fwrite(uVehicle,packetVehicle,'float32');

end
