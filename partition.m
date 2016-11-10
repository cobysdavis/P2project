function [ avg1, avg2, balance, diff ] = partition( index, intensity,matrixDim )
avg1=0;
avg2=10;
sum1=0;
sum2=0;
while abs(avg1-avg2)>1
for i=1:index
    for j=1:matrixDim
        if intensity(i,j)>0
            sum1=sum1+intensity(i,j);
        end
    end
end

 for i=index:matrixDim
    for j=1:matrixDim
        if intensity(i,j)>0
            sum2=sum2+intensity(i,j);
        end
    end
end
avg1=sum1/index;
avg2=sum2/index;
sum1=0;
sum2=0;
if(avg1>avg2)
    index=index-1;
else
    index=index+1;
end
end

diff=abs(avg1-avg2);
balance=index;
return
 
end

