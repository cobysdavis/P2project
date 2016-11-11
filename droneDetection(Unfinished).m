function [ output_args ] = droneDetection( intensity, droneLocation, droneVision )
%Takes in fire intesity area and returns map detected by drone

droneX = droneLocation(1);
droneY = droneLocation(2);

lowerSum = 0;
upperSum = 0;

detectionWidth = -1;

for i = droneX-droneVision : droneX
    detectionWidth = detectionWidth + 2;
    for j= DroneY - (detectionWidth/2) : DroneY + ceil(detectionWidth/2)
        lowerSum = lowerSum + intensity(i,j);
    end
    if detectionWidth = droneVision
        break;
    end
end

detectionWidth = -1;

for i = droneX : droneX + droneVision
    detectionWidth = detectionWidth + 2;
    for j= DroneY - (detectionWidth/2) : DroneY + ceil(detectionWidth/2)
        upperSum = upperSum + intensity(i,j);
    end
    if detectionWidth = droneVision
        break;
    end
end

centerMassX = 


lowerSum = 0;
upperSum = 0;

detectionWidth = -1;

for i = droneY-droneVision : droneY
    detectionWidth = detectionWidth + 2;
    for j= DroneX - (detectionWidth/2) : DroneX + ceil(detectionWidth/2)
        lowerSum = lowerSum + intensity(j,i);
    end
    if detectionWidth = droneVision
        break;
    end
end

detectionWidth = -1;

for i = droneY : droneY + droneVision
    detectionWidth = detectionWidth + 2;
    for j= DroneX - (detectionWidth/2) : DroneX + ceil(detectionWidth/2)
        upperSum = upperSum + intensity(j,i);
    end
    if detectionWidth = droneVision
        break;
    end
end


end

