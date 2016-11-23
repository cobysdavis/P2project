function [startpos,firepositions] = startfires(F,matrixDim)
firepositions=zeros(matrixDim,matrixDim);
xpos=zeros(F,1);
ypos=zeros(F,1);
startpos=zeros(F,2);
i=0;
for i=1:F
    xpos(i)=randi([1 matrixDim]);
    ypos(i)=randi([1 matrixDim]);
    startpos(i,:)=[xpos(i) ypos(i)];
    firepositions(xpos(i),ypos(i))=1;
end
end
