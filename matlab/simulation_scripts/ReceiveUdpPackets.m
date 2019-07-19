function [uvms] = ReceiveUdpPackets(uvms, uSensor)

condition = true;
while condition
    sensorDistance = uSensor.step();
    if (isempty(sensorDistance) == false)
        if (uvms.sensorDistance < 1 && sensorDistance == 100)
            uvms.sensorDistance = 0;
        else
            uvms.sensorDistance = double(sensorDistance);
        end
    end
    condition = (isempty(sensorDistance) == false);
end
    
end

