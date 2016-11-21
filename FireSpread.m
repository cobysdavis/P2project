
clear all;
N=3; %number of drones used
F=5;
burntime=20; %how long the fire can go for without burning out
k=1;  %Initializing step incrementer
steps = 20;    %Number of Steps going to be Simulated
matrixDim=60; %Sets dimensions of square forest matrix
fireposition = zeros(matrixDim,matrixDim);
updatedfirePosition = zeros(matrixDim,matrixDim);
timeonfire = zeros(matrixDim,matrixDim);
intensity = zeros(matrixDim,matrixDim);
[startpos fireposition]=startfires(F,matrixDim);
fireinitial=startpos;
% fireposition(45,85)=1;
% fireposition(40,20)=1;
% fireposition(35,90)=1;
updatedfirePosition=fireposition;
m=zeros(N,1);
velocity=zeros(N,2);
movementTotal=zeros(N,2);
initialt=zeros(N,1);
dronematrix=zeros(matrixDim,matrixDim);
dronenum=zeros(N,1);
dronepositions=zeros(N,2);
for i=1:N
dronenum(i)=i; %associates each drone with a number/colour
dronepositions(i,:)=startdrones(intensity,matrixDim,dronenum(i),N);%call startdrone function to initialize initial coordinates for all drones
dronematrix(dronepositions(i,1),dronepositions(i,2))=dronenum(i);%sets initia positions onto the position matrix
end
percentagemove=0.3; % determines the speed of their movement

% windSpeed, WindDirection, spreadProb
windConditions = [50 pi 0.1];
windSpeed=50;
windDirection=pi;
spreadProb = 0.1;
wind= windBias(windSpeed,windDirection,spreadProb) ;%returns a vector that is the wind magnitudes in all directions
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
subplot(2,2,1)
mesh(intensity);
pcolor(intensity);
xlabel('y');
ylabel('x');
hold off
M(k)=getframe;

oldpositions=dronepositions;
[dronematrix,dronepositions,closest,CM]=nextposition(N,intensity,dronepositions,matrixDim,percentagemove,dronenum);
subplot(2,2,2)
mesh(closest);
pcolor(closest);
xlabel('y');
ylabel('x');
hold off
C(k)=getframe;
CM;


for j=1:N
if (abs(dronepositions(j,:)-oldpositions(j,:)))<3 %threshhold needs experienting
    if m(j)==0
        initialt(j)=k;
        m(j)=1;
    end
    velocity(j,:)=velocity(j,:)+(dronepositions(j,:)-oldpositions(j,:));
end
subplot(2,2,3)
mesh(dronematrix);
pcolor(dronematrix);
xlabel('y');
ylabel('x');
hold off
B(k)=getframe;
end
velocity;
k=k+1;
end
for l=1:N
    velocityavg(l,:)=velocity(l,:)/(k-1-initialt(l));
end
fireVel=firespeed(fireinitial,k,N,CM);
for i=1:N
    fireMag(i)=((fireVel(i,1))^2+(fireVel(i,2))^2)^0.5;
end
droneVel=velocityavg;
error=(fireVel-droneVel);
for i=1:N
magError(i)=((error(i,1))^2+(error(i,2))^2)^0.5;
percentError(i)=magError(i)/fireMag(i);
end
percentError

% close all
 

