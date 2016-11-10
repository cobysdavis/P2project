

matrixDim=100; %Sets dimensions of square forest matrix

position = zeros(matrixDim,matrixDim,'uint8');
updatedPosition = zeros(matrixDim,matrixDim,'uint8');
timeonfire = zeros(matrixDim,matrixDim,'uint32');
intensity = zeros(matrixDim,matrixDim,'uint8');

burntime=20;

k = 1;  %Initializing step incrementer

steps = 10;    %Number of Steps going to be Simulated

position(5,5)=1; %starting initial fire
position(95,95)=1; %starting initial fire


updatedPosition=position;

% probN=0.85;
% probS=0.05;
% probE=0.34;
% probW=0.23;
% probNW=0.22;
% probSW=0.09;
% probNE=0.34;
% probSE=0.9;
windSpeed=50;
windDirection=pi/4;
spreadProb = 0.5;
wind= windBias(windSpeed, windDirection, spreadProb) ;
probN = wind(1);
probS = wind(2);
probW = wind(3);
probE = wind(4);
probNW = wind(5);
probNE= wind(6);
probSW = wind(7);
probSE = wind(8);


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
    pcolor(intensity);
    xlabel('y');
    ylabel('x');
    M(k) = getframe;
    k=k+1;
end
save M



[sum1x,sum2x,balancex,diffx] = partitionx(intensity, matrixDim);
[sum1y,sum2y,balancey,diffy]=partitiony(intensity, matrixDim);


centreofMass=[balancex,balancey]





