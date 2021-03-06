function [xcm ycm] = goToLargest(dronepositions,N)
% Calculating the center of mass of the drone using the N x 2 Matrix
% of the current positions of each drone 

% xtotal=0;
% ytotal=0;
% CMdrones=zeros(1,2);
% for i=1:N % Summing up the x and y components of drones respectively
%     xtotal=xtotal+dronepositions(i,1);
%     ytotal=ytotal+dronepositions(i,2);
% end
% 
% % Determining the average x and y positions
% xcm=ceil(xtotal/N);
% ycm=ceil(ytotal/N);

random=ceil(randi([1 N],1,1));
xcm=dronepositions(random,1);
ycm=dronepositions(random,2);
end

