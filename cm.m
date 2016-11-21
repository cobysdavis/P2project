function [CM] = cm(intensity,closest,matrixDim,dronenum,N,dronepositions)

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

if sumt==1
    [xcm ycm]=dronecm(dronepositions,N);
else
xcm=(sumx/sumt);
ycm=(sumy/sumt);
end
CM=[ceil(xcm) ceil(ycm)];

end

