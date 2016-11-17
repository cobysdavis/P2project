function [closer] = compare(i,j,drone1x,drone1y,drone2x,drone2y)
dist1=finddistance(i,j,drone1x,drone1y);
dist2=finddistance(i,j,drone2x,drone2y);
if dist1<dist2
    closer=1;
else
    closer=2;
end

end

