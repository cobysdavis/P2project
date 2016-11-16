function [ dronenum ] = compare(i,j,drone1x,drone1y,drone2x,drone2y)

dist1=((i-drone1x)^2+(j-drone1y)^2)^0.5;

dist2=((i-drone2x)^2+(j-drone2y)^2)^0.5;

if dist1<dist2
    dronenum=1;
else
    dronenum=2;
end

end

