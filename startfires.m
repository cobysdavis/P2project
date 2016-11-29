function [startpos,firepositions] = startfires(F,matrixDim,positionratio)
firepositions=zeros(matrixDim,matrixDim);
xpos=zeros(F,1);
ypos=zeros(F,1);
startpos=zeros(F,2);
i=0;
for i=1:F
    xpos(i)=randi([floor(matrixDim/positionratio) floor(matrixDim*4/positionratio)]);
    ypos(i)=randi([floor(matrixDim/positionratio) floor(matrixDim*4/positionratio)]);
    startpos(i,:)=[xpos(i) ypos(i)];
    firepositions(xpos(i),ypos(i))=1;
end
end

