function [ distance ] = movement(direction,percentage)
% Determines the distance the drone will move based on a predetermined
% direction vector and the percentage of movement to be made in the given
% direction

distance(1)=ceil(percentage*direction(1));
distance(2)=ceil(percentage*direction(2));
distance=[distance(1) distance(2)];

end

