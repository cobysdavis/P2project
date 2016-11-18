function [CM] = cm(intensity,closest,matrixDim,dronenum,N)

sumx=0;
sumy=0;
sumt=0;

for i=1:matrixDim
    for j=1:matrixDim
        if closest(i,j)==dronenum
            sumx=sumx+intensity(i,j)*i;
            sumy=sumy+intensity(i,j)*j;
            sumt=sumt+intensity(i,j);
 
        end
    end
end


xcm=floor(sumx/sumt);
ycm=floor(sumy/sumt);

CM=[xcm ycm];


end

