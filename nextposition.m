function [dronematrix,dronepos1,dronepos2] = nextposition(intensity,dronepos1,dronepos2,matrixDim,percentagemove,dronenum1,dronenum2)

closest=findclosest(intensity,matrixDim,dronepos1,dronepos2); % assoacitaes each point to the drone closest to it

CMfire1=cm(intensity,closest,matrixDim,dronenum1); % finds centre of mass of firey area associated with drones 1 and 2 repesctively
CMfire2=cm(intensity,closest,matrixDim,dronenum2);

direction1 = direction(dronepos1,CMfire1);%determines which directions the drones must travel to get to the cms of the fires
direction2 = direction(dronepos2,CMfire2);

distance1=movement(direction1,percentagemove); %finds the distance they must travel
distance2=movement(direction2,percentagemove);

dronematrix=zeros(matrixDim,matrixDim); %resets drone matrix

dronepos1=movedrone(distance1,dronepos1)%updates drones to new position
dronepos2=movedrone(distance2,dronepos2)

dronematrix(dronepos1(1),dronepos1(2))=dronenum1;
dronematrix(dronepos2(1),dronepos2(2))=dronenum2;
end

