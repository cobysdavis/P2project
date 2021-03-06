function [CM,sumt] = cm(intensity,closest,matrixDim,dronenum,N,dronepositions)
% Finds the center of mass of a fire based on information collected from
% the nearest drone

sumx=1;
sumy=1;
sumt=1;

% Summing up intensities and locations of fire detected by each drone in
% closest and intensity matrices
for i=1:matrixDim
    for j=1:matrixDim
        if closest(i,j)>0
            if closest(i,j)==dronenum
                sumx=sumx+intensity(i,j)*i;
                sumy=sumy+intensity(i,j)*j;
                sumt=sumt+intensity(i,j);
            end
        end
    end
end

% If there are no values of intensity associated to the drone, it assigns 
% the center of mass to the center of mass of the drones by calling the
% dronecm function
% Otherwise, the center of mass is the location with average density of
% intensity

xcm=(sumx/sumt);
ycm=(sumy/sumt);


CM=[ceil(xcm) ceil(ycm)];

end

