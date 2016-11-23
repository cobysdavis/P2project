function [closer] = compare(i,j,dronepositions,N)
% Determines which drone is closest to a fire centered at position i, j

dist=zeros(N,1);

% Calls finddistance function for each drone and stores in N x 2 Matrix
for k=1:N 
    dist(k)=finddistance(i,j,dronepositions(k,1),dronepositions(k,2));
end

min=dist(1);
mindex=1;

% Determines which drone closest by finding the minimum distance vector
% in  distance Matrix
for k=1:N
    if (dist(k))<min
        min=dist(k);
        mindex=k;
    end
end

% Assigns the output value to the index of the closest drone
closer=mindex;

end


