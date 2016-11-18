function [CM] = cm(intensity,closest,matrixDim,dronenum,N)

sumx=1;
sumy=1;
sumt=1;

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

xcm=(sumx/sumt);
ycm=(sumy/sumt);

CM=[ceil(xcm) ceil(ycm)];


end

