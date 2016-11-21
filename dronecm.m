function [xcm ycm] = dronecm(dronepositions,N)
xtotal=0;
ytotal=0;
CMdrones=zeros(1,2);
for i=1:N
xtotal=xtotal+dronepositions(i,1);
ytotal=ytotal+dronepositions(i,2);
end

xcm=ceil(xtotal/N);
ycm=ceil(ytotal/N);

end

