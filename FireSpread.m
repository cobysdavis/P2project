

matrixDim=200; %Sets dimensions of square forest matrix

position = zeros(matrixDim,matrixDim,'uint8');
updatedPosition = zeros(matrixDim,matrixDim,'uint8');
timeonfire = zeros(matrixDim,matrixDim,'uint32');
intensity = zeros(matrixDim,matrixDim,'uint8');

burntime=40;

k = 1;  %Initializing step incrementer

steps = 20;    %Number of Steps going to be Simulated

position(150,50)=1; %starting initial fire


updatedPosition=position;

probN=0.7;
probS=0.0;
probE=0.1;
probW=0.2;
probNW=0.3;
probSW=0.4;
probNE=0.3;
probSE=0.2;

while k<steps  
    for i=1:matrixDim
        for j=1:matrixDim
            if position(i,j)==1 %if main matrix has a one set indices i and j
                a=i;
                b=j;
                timeonfire(i,j)=timeonfire(i,j)+1;
                if(timeonfire(i,j)<burntime)
                intensity(i,j)=intensity(i,j)+1;
                elseif (intensity(i,j)>0)
                intensity(i,j)= intensity(i,j)-1;
                else
                intensity(i,j)=intensity(i,j);
                end
         
                if a==1 && b==1
                    if probCatch(probS)
                        updatedPosition(a+1,b)=1; 
                    end
                    if probCatch(probE)
                        updatedPosition(a,b+1)=1;
                    end
                    if probCatch(probSE)
                        updatedPosition(a+1,b+1)=1;
                    end
                elseif a==1 && b==matrixDim
                    if probCatch(probS)
                        updatedPosition(a+1,b)=1;
                    end
                    if probCatch(probW)
                        updatedPosition(a,b-1)=1;
                    end
                    if probCatch(probSW)
                        updatedPosition(a+1,b-1)=1;
                    end
       
                elseif a==matrixDim && b==1
                    if probCatch(probN)
                        updatedPosition(a-1,b)=1;
                    end
                    if probCatch(probE)
                        updatedPosition(a,b+1)=1;
                    end
                    if probCatch(probNE)
                            updatedPosition(a-1,b+1)=1;
                    end
           
                elseif a==matrixDim && b==matrixDim
                    if probCatch(probN)
                        updatedPosition(a-1,b)=1;
                    end
                    if probCatch(probW)
                        updatedPosition(a,b-1)=1;
                    end
                    if probCatch(probNW)
                        updatedPosition(a-1,b-1)=1;
                    end
       
                elseif a==1 && (b~=matrixDim && b~=1)
                    if probCatch(probS)
                        updatedPosition(a+1,b)=1;
                    end
                    if probCatch(probW)
                        updatedPosition(a,b-1)=1;
                    end
                    if probCatch(probE)
                        updatedPosition(a,b+1)=1;
                    end
                    if probCatch(probSW)
                        updatedPosition(a+1,b-1)=1;
                    end
                    if probCatch(probSE)
                        updatedPosition(a+1,b+1)=1;
                    end

                elseif a==matrixDim && (b~=matrixDim && b~=1)
                    if probCatch(probN)
                        updatedPosition(a-1,b)=1;
                    end      
                    if probCatch(probW)
                        updatedPosition(a,b-1)=1;
                    end
                    if probCatch(probE)
                        updatedPosition(a,b+1)=1;
                    end
                    if probCatch(probNE)
                        updatedPosition(a-1,b+1)=1;
                    end
                    if probCatch(probNW)
                        updatedPosition(a-1,b-1)=1;
                    end
                    
                elseif b==matrixDim && (a~=1 && a~=matrixDim)
                    if probCatch(probN)
                        updatedPosition(a-1,b)=1;
                    end
                    if probCatch(probS)
                        updatedPosition(a+1,b)=1;
                    end
                    if probCatch(probW)
                        updatedPosition(a,b-1)=1;
                    end
                    if probCatch(probNW)
                        updatedPosition(a-1,b-1)=1;
                    end
                    if probCatch(probSW)
                        updatedPosition(a+1,b-1)=1;
                    end
                    
                elseif b==1 && (a~=1 && a~=matrixDim)
                    if probCatch(probN)     
                        updatedPosition(a-1,b)=1;
                    end
                    if probCatch(probS)
                        updatedPosition(a+1,b)=1;
                    end
                    if probCatch(probE)
                        updatedPosition(a,b+1)=1;
                    end
                    if probCatch(probNE)
                        updatedPosition(a-1,b+1)=1;
                    end
                    if probCatch(probSE)
                        updatedPosition(a+1,b+1)=1;
                    end   
           
                elseif a~=1 && a~=matrixDim && b~=1 && b~=matrixDim
                    if probCatch(probN)
                        updatedPosition(a-1,b)=1;
                    end
                    if probCatch(probS)
                        updatedPosition(a+1,b)=1;
                    end
                    if probCatch(probE)
                        updatedPosition(a,b+1)=1; 
                    end
                    if probCatch(probW)
                        updatedPosition(a,b-1)=1; 
                    end
                    if probCatch(probNW)
                        updatedPosition(a-1,b-1)=1;
                    end 
                    if probCatch(probNE)
                        updatedPosition(a-1,b+1)=1;
                    end
                    if probCatch(probSW)
                        updatedPosition(a+1,b-1)=1;
                    end
                    if probCatch(probSE)
                        updatedPosition(a+1,b+1)=1;
                    end 
                end
            end
        end
    end
    
    position=updatedPosition;
    mesh(intensity);
    axis([0 300 0 300 0 300 ])
    pcolor(intensity);
    M(k) = getframe;
    k=k+1;
end
save M



[sum1x,sum2x,balancex,diffx] = partitionx(intensity, matrixDim);
[sum1y,sum2y,balancey,diffy]=partitiony(intensity, matrixDim);

balancex
balancey





