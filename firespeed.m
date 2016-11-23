function [velocity] = firespeed(fireinitial,k,N,CM)
% Calculates the speed at which the fire spreads based on initial location
% and the final CM of each fire over k steps

for i=1:N
    velocity(i,:)=((CM(i,:)-fireinitial(i,:))/k);
end

end

