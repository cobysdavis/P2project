function [balance] = partitiony( intensity,minx,miny, maxx,maxy )
k=1;
a=[0 0 0];
sum1=100;
sum2=0;
tolerance=5;
diff=abs(sum1-sum2);
index=maxy/2;
while diff>tolerance
sum1=0;
sum2=0;
N1=index*maxx
for j=miny:index
    for i=minx:maxx
        if intensity(i,j)>0
            sum1=sum1+intensity(i,j);
        end
    end
end
avg1=sum1/N1

N2=(maxy-index)*maxx
 for j=(index+1):maxy
    for i=minx:maxx
        if intensity(i,j)>0
            sum2=sum2+intensity(i,j);
        end
    end
 end
 avg2=sum2/N2

 
if(avg1>avg2)
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
 balance=index;
end

 
end

