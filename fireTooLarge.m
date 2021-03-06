function [ result ] = fireTooLarge( droneposition, matrixDim,bigRad,bigSum,intensity)
sum=0;
bottom=floor(droneposition(1)+matrixDim/bigRad);
while bottom<2
    bottom=bottom+1;
end
while bottom>matrixDim
    bottom=bottom-1;
end
right=floor(droneposition(2)+matrixDim/bigRad);
while right<1
    right=right+1;
end
while right>matrixDim
    right=right-1;
end
top=floor(droneposition(1)-matrixDim/bigRad);
while top<1
    top=top+1;
end
while top>matrixDim
    top=top-1;
end
left=floor(droneposition(2)-matrixDim/bigRad);
while left<1
    left=left+1;
end
while left>matrixDim
    left=left-1;
end

for i=top:bottom
    for j=left:right
        if intensity(i,j)>0
            sum=sum+intensity(i,j);
        end
    end
end
sum;
if sum>bigSum
    result=1;
else
    result=0;
end


end

