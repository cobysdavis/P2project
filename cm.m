function [CM1,CM2] = cm(intensity,closest,matrixDim)

sumx1=0;
sumy1=0;
sumx2=0;
sumy2=0;
sumt1=0;
sumt2=0;
for i=1:matrixDim
    for j=1:matrixDim
        if closest(i,j)==1
            sumx1=sumx1+intensity(i,j)*i;
            sumy1=sumy1+intensity(i,j)*j;
            sumt1=sumt1+intensity(i,j);
        elseif closest(i,j)==2
            sumx2=sumx2+intensity(i,j)*i;
            sumy2=sumy2+intensity(i,j)*j;
            sumt2=sumt2+intensity(i,j);
        end
    end
end

xcm1=floor(sumx1/sumt1);
ycm1=floor(sumy1/sumt1);

xcm2=floor(sumx2/sumt2);
ycm2=floor(sumy2/sumt2);

CM1=[xcm1 ycm1];
CM2=[xcm2 ycm2];
end

