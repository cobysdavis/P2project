function [ sum1, sum2, balance, diff ] = partitionx( intensity, matrixDim )
k=1;
b=[0 0 0];
sum1=11;
sum2=0;
index=matrixDim/2;
while true
sum1=0;
sum2=0;

for i=1:index
    for j=1:matrixDim
        if intensity(i,j)>0
            sum1=sum1+intensity(i,j);
        end
    end
end

 for i=index+1:matrixDim
    for j=1:matrixDim
        if intensity(i,j)>0
            sum2=sum2+intensity(i,j);
        end
    end
 end
 

 
if(sum1>sum2)
    index=index-1
    b(k)=index;
else
    index=index+1
    b(k)=index;
end

if (b(1) == b(3))
    break;   
end    

k=k+1;
k=mod(k,3)+1;
end

diff=abs(sum1-sum2);
balance=index;
return
 
end

