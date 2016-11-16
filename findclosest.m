function [closest] = findclosest(intensity,matrixDim,drone1x,drone1y,drone2x,drone2y)
closest=zeros(matrixDim,matrixDim);
for i=1:matrixDim
    for j=1:matrixDim
        if intensity(i,j)>0
            closest(i,j)=compare(i,j,drone1x,drone1y,drone2x,drone2y);
        end
    end
end


end

