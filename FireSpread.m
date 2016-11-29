

for B=1:1
clear all;
q=0;
N=1; %number of drones used
F=2;
burntime=15; %how long the fire can go for without burning out and decreasing temperature a certain point
time=1;  %Initializing step incrementer
steps =20;   %Number of Steps going to be Simulated
matrixDim=100; %Sets dimensions of square forest matrix
fireposition = zeros(matrixDim,matrixDim);
updatedFirePosition = zeros(matrixDim,matrixDim);
timeOnFire = zeros(matrixDim,matrixDim);
intensity = zeros(matrixDim,matrixDim);
positionratio=4;
[startpos fireposition]=startfires(F,matrixDim,positionratio);%starts F fires in random locations accross the region
fireinitial=startpos;
droneRad=matrixDim/4; %factor that matrixDim is divided by in lockedOn, determines drones vewiing radius
droneSum=matrixDim/2; %the minimum sum that a drone has to have in its radius to be considered locked on
minMove=matrixDim/20; %robot must be moving this distance every time step in order to not be considered locked on
percentagemove=0.8; % determines the speed of their movement. The percentage of distacnce they should move from their current position to their desired position)
timestepvar=matrixDim/20; %how often timestep resets to 0
updatedFirePosition=fireposition; %initialize the first updated fire position matrix to be the old one
startLocked=zeros(N,1); %tells code if drone has already locked on to it's target fire
fireStatus=zeros(N,1); %stores whether or not a drone is in close proximity to a certain fire
fireRadiusFactor=100; %determines how far away a drone can be from a CM of a fire in order to be considered "covering it"
velocity=zeros(N,2); %%initialzies drone velocity
movementTotal=zeros(N,2); %finds the overall movement of the drone throughout the fire expansion
initialt=zeros(N,1); %the time at which the drone has locked onto its target
dronematrix=zeros(matrixDim,matrixDim); %matrix which stores the position values for all the drones
dronenum=zeros(N,1); % associates a unique number to each drone
dronepositions=zeros(N,2);%stores the coordinates of each drone
locked=zeros(N,1); %stores the status of each drone if it is locked onto a fire or not
startDrones=zeros(N,2);%the intial positions of each drone
for i=1:N
dronenum(i)=i; %associates each drone with a number/colour
dronepositions(i,:)=startdrones(intensity,matrixDim,dronenum(i),N);%call startdrone function to initialize initial coordinates for all drones
dronematrix(dronepositions(i,1),dronepositions(i,2))=dronenum(i);%sets initia positions onto the position matrix
end


% windSpeed, WindDirection, spreadProb
windConditions = [80 pi 0.1];
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


while time<steps  
    for i=1:matrixDim
        for j=1:matrixDim
            if fireposition(i,j)==1 %if main matrix has a one set indices i and j
                a=i;
                b=j;
                timeOnFire(i,j)=timeOnFire(i,j)+1;
                if(timeOnFire(i,j)<burntime)
                intensity(i,j)=intensity(i,j)+1;
                elseif (intensity(i,j)>0)
                intensity(i,j)= intensity(i,j)-1;
                else
                intensity(i,j)=intensity(i,j);
                end
         
                if a==1 && b==1
                    if probCatch(probS)
                        updatedFirePosition(a+1,b)=1; 
                    end
                    if probCatch(probE)
                        updatedFirePosition(a,b+1)=1;
                    end
                    if probCatch(probSE)
                        updatedFirePosition(a+1,b+1)=1;
                    end
                elseif a==1 && b==matrixDim
                    if probCatch(probS)
                        updatedFirePosition(a+1,b)=1;
                    end
                    if probCatch(probW)
                        updatedFirePosition(a,b-1)=1;
                    end
                    if probCatch(probSW)
                        updatedFirePosition(a+1,b-1)=1;
                    end
       
                elseif a==matrixDim && b==1
                    if probCatch(probN)
                        updatedFirePosition(a-1,b)=1;
                    end
                    if probCatch(probE)
                        updatedFirePosition(a,b+1)=1;
                    end
                    if probCatch(probNE)
                            updatedFirePosition(a-1,b+1)=1;
                    end
           
                elseif a==matrixDim && b==matrixDim
                    if probCatch(probN)
                        updatedFirePosition(a-1,b)=1;
                    end
                    if probCatch(probW)
                        updatedFirePosition(a,b-1)=1;
                    end
                    if probCatch(probNW)
                        updatedFirePosition(a-1,b-1)=1;
                    end
       
                elseif a==1 && (b~=matrixDim && b~=1)
                    if probCatch(probS)
                        updatedFirePosition(a+1,b)=1;
                    end
                    if probCatch(probW)
                        updatedFirePosition(a,b-1)=1;
                    end
                    if probCatch(probE)
                        updatedFirePosition(a,b+1)=1;
                    end
                    if probCatch(probSW)
                        updatedFirePosition(a+1,b-1)=1;
                    end
                    if probCatch(probSE)
                        updatedFirePosition(a+1,b+1)=1;
                    end

                elseif a==matrixDim && (b~=matrixDim && b~=1)
                    if probCatch(probN)
                        updatedFirePosition(a-1,b)=1;
                    end      
                    if probCatch(probW)
                        updatedFirePosition(a,b-1)=1;
                    end
                    if probCatch(probE)
                        updatedFirePosition(a,b+1)=1;
                    end
                    if probCatch(probNE)
                        updatedFirePosition(a-1,b+1)=1;
                    end
                    if probCatch(probNW)
                        updatedFirePosition(a-1,b-1)=1;
                    end
                    
                elseif b==matrixDim && (a~=1 && a~=matrixDim)
                    if probCatch(probN)
                        updatedFirePosition(a-1,b)=1;
                    end
                    if probCatch(probS)
                        updatedFirePosition(a+1,b)=1;
                    end
                    if probCatch(probW)
                        updatedFirePosition(a,b-1)=1;
                    end
                    if probCatch(probNW)
                        updatedFirePosition(a-1,b-1)=1;
                    end
                    if probCatch(probSW)
                        updatedFirePosition(a+1,b-1)=1;
                    end
                    
                elseif b==1 && (a~=1 && a~=matrixDim)
                    if probCatch(probN)     
                        updatedFirePosition(a-1,b)=1;
                    end
                    if probCatch(probS)
                        updatedFirePosition(a+1,b)=1;
                    end
                    if probCatch(probE)
                        updatedFirePosition(a,b+1)=1;
                    end
                    if probCatch(probNE)
                        updatedFirePosition(a-1,b+1)=1;
                    end
                    if probCatch(probSE)
                        updatedFirePosition(a+1,b+1)=1;
                    end   
           
                elseif a~=1 && a~=matrixDim && b~=1 && b~=matrixDim
                    if probCatch(probN)
                        updatedFirePosition(a-1,b)=1;
                    end
                    if probCatch(probS)
                        updatedFirePosition(a+1,b)=1;
                    end
                    if probCatch(probE)
                        updatedFirePosition(a,b+1)=1; 
                    end
                    if probCatch(probW)
                        updatedFirePosition(a,b-1)=1; 
                    end
                    if probCatch(probNW)
                        updatedFirePosition(a-1,b-1)=1;
                    end 
                    if probCatch(probNE)
                        updatedFirePosition(a-1,b+1)=1;
                    end
                    if probCatch(probSW)
                        updatedFirePosition(a+1,b-1)=1;
                    end
                    if probCatch(probSE)
                        updatedFirePosition(a+1,b+1)=1;
                    end 
                end
            end
        end
    end
    
fireposition=updatedFirePosition;
subplot(2,2,1)
mesh(intensity);
pcolor(intensity);
xlabel('y');
ylabel('x');
hold off
M(time)=getframe;

oldpositions=dronepositions;

[dronematrix,dronepositions,closest,CM]=nextposition(N,intensity,dronepositions,matrixDim,percentagemove,dronenum);

subplot(2,2,2)
mesh(closest);
pcolor(closest);
xlabel('y');
ylabel('x');
hold off
C(time)=getframe;

for j=1:N
locked(j)=isLockedon(intensity,dronepositions(j,:),matrixDim,droneRad,droneSum);
if locked(j)==1 && startLocked(j)==0
    startLocked(j)=1;
    initialt(j)=time;
    startDrones(j,:)=dronepositions(j,:);
end
end

subplot(2,2,3)
mesh(dronematrix);
pcolor(dronematrix);
xlabel('y');
ylabel('x');
hold off
B(time)=getframe;

timestep=mod(time,timestepvar);

if timestep==1
for i=1:N
    if locked(i)==0 && abs(dronepositions(i,1)-oldpositions(i,1))<minMove && abs(dronepositions(i,2)-oldpositions(i,2))<minMove
        q=1;
        dronenum(N+1)=N+1; %associates each drone with a number/colour
        dronepositions(N+1,:)=[matrixDim/2 matrixDim/2];%call startdrone function to initialize initial coordinates for all drones
        dronematrix(dronepositions(N+1,1),dronepositions(N+1,2))=dronenum(N+1);%sets initia positions onto the position matrix
    end
end
end
if q==1
    N=N+1;
    velocity=[velocity;zeros(1,2)];
    locked=[locked 0];
    startLocked=[startLocked 0];
    initialt=[initialt 0];
    startDrones=[startDrones;zeros(1,2)];
end
q=0;
time=time+1;
save B
save M
save C
end

droneVel=zeros(N,2);

for l=1:N
    droneVel(l,:)=(dronepositions(l,:)-startDrones(l,:))/(time-1-initialt(l));
end
droneVel
fireVel=firespeed(fireinitial,time,N,CM)

% for i=1:N
%     fireMag(i)=((fireVel(i,1))^2+(fireVel(i,2))^2)^0.5;
% end
error=(fireVel-droneVel);
% for i=1:N
% magError(i)=((error(i,1))^2+(error(i,2))^2)^0.5;
% percentError(i)=magError(i)/fireMag(i);
% end
% percentError

for i=1:N
    fireStatus(i)=isCovered(CM(i,:),matrixDim,dronepositions(i,:),fireRadiusFactor);
end

successT=0;

for i=1:N
successT=successT+fireStatus(i);
end

successPercent=successT/N
end

% firestatus
% droneVel
% close all
% subplot(2,2,1)
% movie(M,2)
% subplot(2,2,2)
% movie(C,2)
% subplot(2,2,3)
% movie(B,2)
