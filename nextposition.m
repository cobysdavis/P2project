function [dronematrix,dronepositions] = nextposition(N,intensity,dronepositions,matrixDim,percentagemove,dronenum)

closest=findclosest(intensity,matrixDim,dronepositions,N);% assoacitaes each point to the drone closest to it
CM=zeros(N,2);
directions=zeros(N,2);
distance=zeros(N,2);
dronematrix=zeros(matrixDim,matrixDim);

for i=1:N
CM(i,:)=cm(intensity,closest,matrixDim,dronenum(i),N); % finds centre of mass of firey area associated with drones 1 and 2 repesctively

directions(i,:)=direction(dronepositions(i,:),CM(i,:));%determines which directions the drones must travel to get to the cms of the fires

distance(i,:)=movement(directions(i,:),percentagemove); %finds the distance they must travel

dronepositions(i,:)=movedrone(distance(i,:),dronepositions(i,:));%updates drones to new position

dronematrix(dronepositions(i,1),dronepositions(i,2))=dronenum(i);
end

end

