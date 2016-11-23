function [ directions ] = direction(dronepos,cmfire)
% Calculating the direction that the drone will approach the fire
% Takes inputs dronepos vector and cmfire vector

directionx=cmfire(1)-dronepos(1); % x-component
directiony=cmfire(2)-dronepos(2); % y-component 

directions=[directionx directiony]; % Output vector

end

