N=matrixDim;
sum1=0;
sum2=0;
for i=1:N/2
    for j=1:N
        if intensity(i,j)>0
            sum1=sum1+intensity(i,j);
        end
    end
end

for i=(N/2):N
    for j=1:N
        if intensity(i,j)>0
            sum2=sum2+intensity(i,j);
        end
    end
end

if avg1>avg2
    
avg1=sum1/N
avg2=sum2/N