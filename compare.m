function [closer] = compare(i,j,dronepositions,N)
dist=zeros(N,1);
for k=1:N
dist(k)=finddistance(i,j,dronepositions(k,1),dronepositions(k,2));
end

min=dist(1);
mindex=1;
for k=1:N
    if (dist(k))<min
        min=dist(k);
        mindex=k;
    end
end

closer=mindex;
end


