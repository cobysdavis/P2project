function [ directions ] = direction(dronepos,cmfire)
directionx=cmfire(1)-dronepos(1);
directiony=cmfire(2)-dronepos(2);
directions=[directionx directiony];
end

