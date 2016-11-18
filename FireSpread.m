

matrixDim=20; %Sets dimensions of square forest matrix
fireposition = zeros(matrixDim,matrixDim);
updatedfirePosition = zeros(matrixDim,matrixDim);
timeonfire = zeros(matrixDim,matrixDim);
intensity = zeros(matrixDim,matrixDim);
burntime=20;
k=1;  %Initializing step incrementer
steps = 10;    %Number of Steps going to be Simulated

fireposition(5,5)=1; %starting initial fire
fireposition(15,15)=1; %starting initial fire
fireposition(10,10)=1; %starting initial fire

updatedfirePosition=fireposition;

N=3; %number of drones used
dronematrix=zeros(matrixDim,matrixDim);
dronenum=zeros(N,1);
dronepositions=zeros(N,2);

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
    M(k)=getframe;
    k=k+1;

end

for i=1:N
    dronenum(i)=i;
end

for i=1:N
dronepositions(i,:)=startdrones(intensity,matrixDim,dronenum(i),N);%call startdrone function to initialize initial position for both drones
end

percentagemove=1; % determines the speed of their movement
closest=findclosest(intensity,matrixDim,dronepositions,N); % assoacitaes each point to the drone closest to it
mesh(closest);
pcolor(closest);
hold off

for i=1:N
dronematrix(dronepositions(i,1),dronepositions(i,2))=dronenum(i) %sets inital colour to each drone
end


[dronematrix,dronepositions]=nextposition(N,intensity,dronepositions,matrixDim,percentagemove,dronenum)

figure;mesh(dronematrix);
pcolor(dronematrix);
[dronematrix,dronepositions]=nextposition(N,intensity,dronepositions,matrixDim,percentagemove,dronenum)


figure;mesh(dronematrix);
pcolor(dronematrix);
% hold off
% M(l)=getframe;

 
%close all
