function [ result ] = isCovered( CM,matrixDim,dronepositions,factor )
lowerCM=CM(1)+matrixDim/factor;
upperCM=CM(1)-matrixDim/factor;
rightCM=CM(2)+matrixDim/factor;
leftCM=CM(2)-matrixDim/factor;
if dronepositions(1)<=lowerCM && dronepositions(1)>=upperCM && dronepositions(2)<=rightCM && dronepositions(2)>=leftCM
    result=1;
else
    result=0;
end
end

