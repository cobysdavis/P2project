function [ sum1, sum2, balance, diff ] = partitionx( intensity, matrixDim )
k=1;
a=[0 0 0];
sum1=100;
sum2=0;
tolerance=20;
diff=abs(sum1-sum2);
index=matrixDim/2;
while diff>tolerance
sum1=0;
sum2=0;

for i=1:index
    for j=1:matrixDim
        if intensity(i,j)>0
            sum1=sum1+intensity(i,j);
        end
    end
end

 for i=(index+1):matrixDim
    for j=1:matrixDim
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

 k=mod(k,3);
 k=k+1;
 diff=abs(sum1-sum2);
end


balance=index;

 
end

