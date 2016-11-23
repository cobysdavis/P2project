function [ locked ] = isLockedon( intensity,droneposition,matrixDim)
bottom=floor(droneposition(1)+matrixDim/5);
while bottom<2
    bottom=bottom+1;
end
while bottom>matrixDim
    bottom=bottom-1;
end
right=floor(droneposition(2)+matrixDim/5);
while right<1
    right=right+1;
end
while right>matrixDim
    right=right-1;
end
top=floor(droneposition(1)-matrixDim/5);
while top<1
    top=top+1;
end
while top>matrixDim
    top=top-1;
end
left=floor(droneposition(2)-matrixDim/5);
while left<1
    left=left+1;
end
while left>matrixDim
    left=left-1;
end
sum=0;
for i=top:bottom
    for j=left:right
        if intensity(i,j)>0
            sum=sum+intensity(i,j);
        end
    end
end

if sum>50
    locked=1;
else
    locked=0;
end


end

