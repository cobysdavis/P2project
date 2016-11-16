function [xcm,ycm] = cm3(intensity,minx,miny,maxx,maxy)
sumx=0;
sumy=0;
sumt=0;
for i=minx:maxx
    for j=miny:maxy
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

