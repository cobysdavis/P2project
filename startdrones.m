function [dronepos] = startdrones(intensity, matrixDim,dronenum, N)
% sumx=0;
% sumy=0;
% sumt=0;
% for i=1:matrixDim
%     for j=1:matrixDim
%         if intensity(i,j)>0
%             sumx=sumx+intensity(i,j)*i;
%             sumy=sumy+intensity(i,j)*j;
%             sumt=sumt+intensity(i,j);
%         end
%     end
% end

% xcm=floor(sumx/sumt);
% ycm=floor(sumy/sumt);
spacing=floor(matrixDim/(N+1));
dronepos=[(spacing*dronenum) (spacing*dronenum)];
%dronepos=[(xcm+5*dronenum) (ycm+dronenum)];


end

