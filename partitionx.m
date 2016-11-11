function [ sum1, sum2, balance, diff ] = partitionx( intensity, matrixDim )
k=1;
b=[0 0 0];
sum1=100;
sum2=0;
tolerance=5;
diff=abs(sum1-sum2);
index=matrixDim/2;
while diff>tolerance
sum1=0;
sum2=0;

for j=1:matrixDim
    for i=1:index
        if intensity(i,j)>0
            sum1=sum1+intensity(i,j);
        end
    end
end

for j=1:matrixDim
    for i=(index+1):matrixDim

        if intensity(i,j)>0
            sum2=sum2+intensity(i,j);
        end
    end
 end
 

 
if(sum1>sum2)
    index=index-1;
    b(k)=index;
else
    index=index+1;
    b(k)=index;
end

 if (b(1) == b(3))
     break;   
 end    

 k=mod(k,3);
 k=k+1
 diff=abs(sum1-sum2);
 balance=index;
end




return
 
end

