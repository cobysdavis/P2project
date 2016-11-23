function [ newposition ] = movedrone( distance,oldposition )
% Determines new position of drone based on the distance to travel and the
% current position of the drone 

newposition(1)=oldposition(1)+distance(1);
newposition(2)=oldposition(2)+distance(2);
newposition=[newposition(1) newposition(2)];

end

