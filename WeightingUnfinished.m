function [ centerOfMass ] = WeightingUnfinished( matrix, weightingRange, index )
%Function created to facilitate weigting of values in a matrix given 
% a particular weighting range

lowerSum = 0;
upperSum = 0;

for i = index - weightingRange : index
    for j= 1 : 2*weightingRange
        lowerSum = lowerSum + matrix(i,j);
    end
end

for i = index : index + weightingRange + 1
    for j = 1 : 2*weightingRange
        upperSum = upperSum + matrix(i,j);
    end
end

if upperSum > lowerSum
    centerOfMass = index + (upperSum/lowerSum)*weightingRange; %Line needs fine-tuning
else
    centerOfMass = index - (lowerSum/upperSum)*weightingRange; %Line needs fine-tuning
end

end

