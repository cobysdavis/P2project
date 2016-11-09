

matrixDim=300; %Sets dimensions of square forest matrix

position = zeros(matrixDim,matrixDim,'uint8');
updatedPosition = zeros(matrixDim,matrixDim,'uint8');
A = zeros(matrixDim,matrixDim,'uint8');
timeonfire = zeros(matrixDim,matrixDim,'uint8');
intensity = zeros(matrixDim,matrixDim,'uint8');

k = 1;  %Initializing step incrementer

steps = 100;    %Number of Steps going to be Simulated

%Setting Initial Fire Locations
position(100,100)=1;
position(150,200)=1;
position(250,50)=1;

updatedPosition=position; %Initializing Updated Position Matrix

probN=0.2;
probS=0.9;
probE=0.3;
probW=0.9;
probNW=0.5;
probSW=0.5;
probNE=0.1;
probSE=0.86;

while k<steps  
    for i=1:matrixDim
        for j=1:matrixDim
            if position(i,j)==1 %if main matrix has a one set indices i and j
                a=i;
                b=j;
                timeonfire(i,j)=timeonfire(i,j)+1;
                if(timeonfire(i,j)<50)
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
                        updatedPosition(a-1,b-1)=1;
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
    M(k) = getframe;
    k=k+1;
end

save M









