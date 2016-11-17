

matrixDim=10; %Sets dimensions of square forest matrix
fireposition = zeros(matrixDim,matrixDim);
updatedfirePosition = zeros(matrixDim,matrixDim);
timeonfire = zeros(matrixDim,matrixDim);
intensity = zeros(matrixDim,matrixDim);
burntime=20;
k=1;  %Initializing step incrementer
steps = 15;    %Number of Steps going to be Simulated
fireposition(2,2)=1; %starting initial fire
fireposition(8,8)=1; %starting initial fire
updatedfirePosition=fireposition;

dronematrix=zeros(matrixDim,matrixDim);
dronenum1=1;  %drone 1 is associated with #1
dronenum2=2;  %drone 2 is associated with #2


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
            if fireposition(i,j)==1 %if main matrix has a one set indices i and j
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
                        updatedfirePosition(a+1,b)=1; 
                    end
                    if probCatch(probE)
                        updatedfirePosition(a,b+1)=1;
                    end
                    if probCatch(probSE)
                        updatedfirePosition(a+1,b+1)=1;
                    end
                elseif a==1 && b==matrixDim
                    if probCatch(probS)
                        updatedfirePosition(a+1,b)=1;
                    end
                    if probCatch(probW)
                        updatedfirePosition(a,b-1)=1;
                    end
                    if probCatch(probSW)
                        updatedfirePosition(a+1,b-1)=1;
                    end
       
                elseif a==matrixDim && b==1
                    if probCatch(probN)
                        updatedfirePosition(a-1,b)=1;
                    end
                    if probCatch(probE)
                        updatedfirePosition(a,b+1)=1;
                    end
                    if probCatch(probNE)
                            updatedfirePosition(a-1,b+1)=1;
                    end
           
                elseif a==matrixDim && b==matrixDim
                    if probCatch(probN)
                        updatedfirePosition(a-1,b)=1;
                    end
                    if probCatch(probW)
                        updatedfirePosition(a,b-1)=1;
                    end
                    if probCatch(probNW)
                        updatedfirePosition(a-1,b-1)=1;
                    end
       
                elseif a==1 && (b~=matrixDim && b~=1)
                    if probCatch(probS)
                        updatedfirePosition(a+1,b)=1;
                    end
                    if probCatch(probW)
                        updatedfirePosition(a,b-1)=1;
                    end
                    if probCatch(probE)
                        updatedfirePosition(a,b+1)=1;
                    end
                    if probCatch(probSW)
                        updatedfirePosition(a+1,b-1)=1;
                    end
                    if probCatch(probSE)
                        updatedfirePosition(a+1,b+1)=1;
                    end

                elseif a==matrixDim && (b~=matrixDim && b~=1)
                    if probCatch(probN)
                        updatedfirePosition(a-1,b)=1;
                    end      
                    if probCatch(probW)
                        updatedfirePosition(a,b-1)=1;
                    end
                    if probCatch(probE)
                        updatedfirePosition(a,b+1)=1;
                    end
                    if probCatch(probNE)
                        updatedfirePosition(a-1,b+1)=1;
                    end
                    if probCatch(probNW)
                        updatedfirePosition(a-1,b-1)=1;
                    end
                    
                elseif b==matrixDim && (a~=1 && a~=matrixDim)
                    if probCatch(probN)
                        updatedfirePosition(a-1,b)=1;
                    end
                    if probCatch(probS)
                        updatedfirePosition(a+1,b)=1;
                    end
                    if probCatch(probW)
                        updatedfirePosition(a,b-1)=1;
                    end
                    if probCatch(probNW)
                        updatedfirePosition(a-1,b-1)=1;
                    end
                    if probCatch(probSW)
                        updatedfirePosition(a+1,b-1)=1;
                    end
                    
                elseif b==1 && (a~=1 && a~=matrixDim)
                    if probCatch(probN)     
                        updatedfirePosition(a-1,b)=1;
                    end
                    if probCatch(probS)
                        updatedfirePosition(a+1,b)=1;
                    end
                    if probCatch(probE)
                        updatedfirePosition(a,b+1)=1;
                    end
                    if probCatch(probNE)
                        updatedfirePosition(a-1,b+1)=1;
                    end
                    if probCatch(probSE)
                        updatedfirePosition(a+1,b+1)=1;
                    end   
           
                elseif a~=1 && a~=matrixDim && b~=1 && b~=matrixDim
                    if probCatch(probN)
                        updatedfirePosition(a-1,b)=1;
                    end
                    if probCatch(probS)
                        updatedfirePosition(a+1,b)=1;
                    end
                    if probCatch(probE)
                        updatedfirePosition(a,b+1)=1; 
                    end
                    if probCatch(probW)
                        updatedfirePosition(a,b-1)=1; 
                    end
                    if probCatch(probNW)
                        updatedfirePosition(a-1,b-1)=1;
                    end 
                    if probCatch(probNE)
                        updatedfirePosition(a-1,b+1)=1;
                    end
                    if probCatch(probSW)
                        updatedfirePosition(a+1,b-1)=1;
                    end
                    if probCatch(probSE)
                        updatedfirePosition(a+1,b+1)=1;
                    end 
                end
            end
        end
    end
    
    fireposition=updatedfirePosition;
    mesh(intensity);
    pcolor(intensity);
    xlabel('y');
    ylabel('x');
    hold off
    M(k) = getframe;
    k=k+1;

end

dronepos1=startdrones(intensity,matrixDim,dronenum1); %call startdrone function to initialize initial position for both drones
dronepos2=startdrones(intensity,matrixDim,dronenum2);

for i=1:3
closest=findclosest(intensity,matrixDim,dronepos1,dronepos2); % assoacitaes each point to the drone closest to it

CMfire1=cm(intensity,closest,matrixDim,dronenum1); % finds centre of mass of firey area associated with drones 1 and 2 repesctively
CMfire2=cm(intensity,closest,matrixDim,dronenum2);

direction1 = direction(dronepos1,CMfire1);%determines which directions the drones must travel to get to the cms of the fires
direction2 = direction(dronepos2,CMfire2);

percentagemove=0.25; % determines the speed of their movement

distance1=movement(direction1,percentagemove); %finds the distance they must travel
distance2=movement(direction2,percentagemove);

dronematrix(dronepos1(1),dronepos1(2))=dronenum1; %sets inital colour to each drone
dronematrix(dronepos2(1),dronepos2(2))=dronenum2;

figure;mesh(dronematrix);
pcolor(dronematrix);
hold off
L(i)=getframe;

dronematrix=zeros(matrixDim,matrixDim); %resets drone matrix

dronepos1=movedrone(distance1,dronepos1);%updates drones to new position
dronepos2=movedrone(distance2,dronepos2);

dronematrix(dronepos1(1),dronepos1(2))=dronenum1;
dronematrix(dronepos2(1),dronepos2(2))=dronenum2;
end
