

matrixDim=50; %Sets dimensions of square forest matrix

position = zeros(matrixDim,matrixDim);
updatedPosition = zeros(matrixDim,matrixDim);
timeonfire = zeros(matrixDim,matrixDim);
intensity = zeros(matrixDim,matrixDim);




burntime=20;

k = 1;  %Initializing step incrementer

steps = 50;    %Number of Steps going to be Simulated

position(5,5)=1; %starting initial fire
position(35,35)=1; %starting initial fire

%

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
windDirection=3*pi/2.5;
spreadProb = 0.05;
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
    figure1=mesh(intensity);
    pcolor(intensity);
    xlabel('y');
    ylabel('x');
    hold off
    M(k) = getframe;
    k=k+1;

end
save M
intensity;


[dronepos1,dronepos2]=startdrones(intensity,matrixDim)

closest=findclosest(intensity,matrixDim,dronepos1(1),dronepos1(2),dronepos2(1),dronepos2(2));
figure;mesh(closest);
pcolor(closest);
hold on

[CMfire1,CMfire2]=cm(intensity,closest,matrixDim);

[direction1] = direction(dronepos1,CMfire1);
[direction2] = direction(dronepos2,CMfire2);

percentagemove=0.25;

[distance1]=movement(direction1,percentagemove);
[distance2]=movement(direction2,percentagemove);

closest(dronepos1(1),dronepos1(2))=4;
closest(dronepos2(1),dronepos2(2))=6;
figure;mesh(closest);
pcolor(closest);
hold on

dronepos1(1)=dronepos1(1)+distance1(1);
dronepos1(2)=dronepos1(1)+distance1(2);

dronepos2(1)=dronepos2(1)+distance2(1);
dronepos2(2)=dronepos2(1)+distance2(2);

closest(dronepos1(1),dronepos1(2))=4;
closest(dronepos2(1),dronepos2(2))=6;
figure;mesh(closest);
pcolor(closest);
hold on