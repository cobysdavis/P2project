function [ distance ] = movement(direction,percentage)
distance(1)=ceil(percentage*direction(1));
distance(2)=ceil(percentage*direction(2));
distance=[distance(1) distance(2)];
end

