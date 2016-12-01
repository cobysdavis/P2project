function [closest] = findclosest(intensity,matrixDim,dronepositions,N)
% Function that

closest=zeros(matrixDim,matrixDim);
for i=1:matrixDim
    for j=1:matrixDim
        if intensity(i,j)>0
            closest(i,j)=compare(i,j,dronepositions,N);
        end
    end
end


end

