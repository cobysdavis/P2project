function [closest] = findclosest(intensity,matrixDim,drone1,drone2)
closest=zeros(matrixDim,matrixDim);
for i=1:matrixDim
    for j=1:matrixDim
        if intensity(i,j)>0
            closest(i,j)=compare(i,j,drone1(1),drone1(2),drone2(1),drone2(2));
        end
    end
end


end

