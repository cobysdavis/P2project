function [xcm,ycm] = startdrones(intensity, matrixDim)
sumx=0;
sumy=0;
sumt=0;
for i=1:matrixDim
    for j=1:matrixDim
        if intensity(i,j)>0
            sumx=sumx+intensity(i,j)*i;
            sumy=sumy+intensity(i,j)*j;
            sumt=sumt+intensity(i,j);
        end
    end
end

xcm=floor(sumx/sumt);
ycm=floor(sumy/sumt);
end

