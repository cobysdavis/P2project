function [velocity] = firespeed(fireinitial,k,N,CM)

for i=1:N
velocity(i,:)=((CM(i,:)-fireinitial(i,:))/k);
end

end

