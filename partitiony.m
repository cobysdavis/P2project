function [ sum1, sum2, balance, diff ] = partitiony( intensity, matrixDim )
k=1;
a=[0 0 0];
sum1=11;
sum2=0;
index=matrixDim/2;
while true
sum1=0;
sum2=0;

for j=1:index
    for i=1:matrixDim
        if intensity(i,j)>0
            sum1=sum1+intensity(i,j);
        end
    end
end

 for j=index+1:matrixDim
    for i=1:matrixDim
        if intensity(i,j)>0
            sum2=sum2+intensity(i,j);
        end
    end
 end
 

 
if(sum1>sum2)
    index=index-1;
    a(k)=index;
else
    index=index+1;
    a(k)=index;
end

if (a(1) == a(3))
    break;   
end    

k=k+1;
k=mod(k,3)+1;
end

diff=abs(sum1-sum2);
balance=index;
return
 
end

