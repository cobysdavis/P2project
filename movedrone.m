function [ newposition ] = movedrone( distance,oldposition )
newposition(1)=oldposition(1)+distance(1);
newposition(2)=oldposition(2)+distance(2);
end

