function [dronematrix,dronepositions,closest,CM,sumt,maxIndex] = nextposition(N,intensity,dronepositions,matrixDim,percentagemove,dronenum)
% Determines the next position 

closest=findclosest(intensity,matrixDim,dronepositions,N);% assoacitaes each point to the drone closest to it
sumt=zeros(N,1);
CM=zeros(N,2);
directions=zeros(N,2);
distance=zeros(N,2);
dronematrix=zeros(matrixDim,matrixDim);

max=1;
maxIndex=1;
for j=1:N
    [CM(j,:) sumt(j)]=cm(intensity,closest,matrixDim,dronenum(j),N,dronepositions);
    if sumt(j)>max
        max=sumt(j);
        maxIndex=j;
    end
end


for i=1:N
    % Finds centre of mass of firey area associated with drones 1 and 2 
    % repesctively
    if sumt(i)==1
        CM(i,:)=goToLargest(dronepositions,maxIndex);
    end
    
    % Determines which directions the drones must travel to get to the 
    % center of mass of the respective fires
    directions(i,:)=direction(dronepositions(i,:),CM(i,:));

    % Finds the distance they must travel
    distance(i,:)=movement(directions(i,:),percentagemove); 
    
    % Updates drones to new position
    dronepositions(i,:)=movedrone(distance(i,:),dronepositions(i,:));

dronematrix(dronepositions(i,1),dronepositions(i,2))=dronenum(i);
end

end

