

for B=1:1
clear all;
addDrone=0;
N=1; %number of drones used
F=2;
burnTime=15; %how long the fire can go for without burning out and decreasing temperature a certain point
time=1;  %Initializing step incrementer
timeSteps=50;   %Number of Steps going to be Simulated
matrixDim=100; %Sets dimensions of square forest matrix
updatedFirePosition = zeros(matrixDim,matrixDim);
timeOnFire = zeros(matrixDim,matrixDim);
intensity = zeros(matrixDim,matrixDim);
fireInitialBounds=4; %determines the bounds at which initial fires can start (becasue we dont want them start on the edges of our region)
fireInitial=zeros(N,2);
[startpos fireposition]=startfires(F,matrixDim,fireInitialBounds);%starts F fires in random locations accross the region
updatedfirePosition=fireposition;
droneRadFactor=matrixDim/10; %factor that matrixDim is divided by in lockedOn, determines drones vewiing radius
droneSumFactor=matrixDim/4; %the minimum sum that a drone has to have in its radius to be considered locked on
minMove=matrixDim/20; %robot must be moving this distance every time step in order to not be considered locked on
percentagemove=0.8; % determines the speed of their movement. The percentage of distacnce they should move from their current position to their desired position)
frequencyVar=7; %how often timestep resets to 0
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
droneVel=zeros(N,2); %initialize the drone velocities


for i=1:N
dronenum(i)=i; %associates each drone with a number/colour
dronepositions(i,:)=startdrones(intensity,matrixDim,dronenum(i),N);%call startdrone function to initialize initial coordinates for all drones
dronematrix(dronepositions(i,1),dronepositions(i,2))=dronenum(i);%sets initia positions onto the position matrix
end

windConditions = [80 pi/2 0.5]; % windSpeed, WindDirection, spreadProb
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

while time<timeSteps  
    for i=1:matrixDim
        for j=1:matrixDim
            if fireposition(i,j)==1 %if main matrix has a one set indices i and j
                a=i;
                b=j;
                timeOnFire(i,j)=timeOnFire(i,j)+1;
                if(timeOnFire(i,j)<burnTime)
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
    
fireposition=updatedFirePosition; %update fire position matrix to be the updated fire position matrix which was appended in the above nested for loop

subplot(2,2,1) %plot the intensity of the fire and save the frame
mesh(intensity);
pcolor(intensity);
xlabel('y');
ylabel('x');
hold off
M(time)=getframe;

oldpositions=dronepositions; %save old positions to be used later for velocity calculation (newpos-oldpos)/time

[dronematrix,dronepositions,closest,CM,sumt,maxIndex]=nextposition(N,intensity,dronepositions,matrixDim,percentagemove,dronenum);
%use the nextposition function above to call a host of other functions
%(cm,direction,movement,movedrone) to give outputs of the updated drone
%positions matrix, the drone positions as coordinates, the matrix
%representing which fire tiles are associated to which drone, the centre of
%intensity of each fire, and the sum of the intensity tiles for each fire
%assocaited to a drone
% 
% sumt
% maxIndex
% [dronepositions(maxIndex,1) dronepositions(maxIndex,2)] 

subplot(2,2,2) %plot the matrix called closest which shows which fires are closest to which drone
mesh(closest);
pcolor(closest);
xlabel('y');
ylabel('x');
hold off
C(time)=getframe;

for r=1:N
locked(r)=isLockedon(intensity,dronepositions(r,:),matrixDim,droneRadFactor,droneSumFactor); %determines if a drone is currently locked on to a fire
end

droneCheckFrequency=mod(time,frequencyVar); %frequency that drone lockedon statuses are evaulated


subplot(2,2,3) %plot the position of each drone and save the frame
mesh(dronematrix);
pcolor(dronematrix);
xlabel('y');
ylabel('x');
hold off
B(time)=getframe;


fireMax=1500; %max value for the intensity before a fire is deemed large enough that the drone covering the fire needs assistance from another drone
if droneCheckFrequency==0
for i=1:N
    if (locked(i)==0 && abs(dronepositions(i,1)-oldpositions(i,1))<minMove && abs(dronepositions(i,2)-oldpositions(i,2))<minMove) || sumt(i)>fireMax %if the drone is caught in between two fires and is not moving (its at the center of intensity of one large fire which is really two, so it wont move), or the fire is too big for one drone 
        addDrone=1; %add a drone
        dronenum(N+1)=N+1; %associates each drone with a number/colour
        dronepositions(N+1,:)=goToLargest(dronepositions,maxIndex);%call startdrone function to initialize initial coordinates for all drones
        dronematrix(dronepositions(N+1,1),dronepositions(N+1,2))=dronenum(N+1);%sets initial positions onto the position matrix along with unique drone identifier number 
    end
end
end

if addDrone==1 %if a drone has just been added,
    N=N+1; %increase the number of drones
    velocity=[velocity;zeros(1,2)]; %append all the below matrices to make room for this new drone on the next iteration
    locked=[locked 0];
    startLocked=[startLocked 0];
end
if droneCheckFrequency==3
    for i=1:N
    initPos(i,:)=dronepositions(i,:);
    end
    initPos
end


if droneCheckFrequency==frequencyVar-1
    for i=1:N
        droneVel(i,:)=(dronepositions(i,:)-initPos(i,:))/frequencyVar-3;
    end
    droneVel
end


addDrone=0; %set the addDrone variable to zero so the computer can know for next time if another drone has to be added
time=time+1; %increase the time 
save B %save the below figures as movie frames, B=intensity,M=closest,C=dronematrix
save M
save C
end

% droneVelCheck=mod(time,velUpdateFrequency) %frequency that drone lockedon statuses are evaulated


% fireVel=firespeed(fireInitial,time,N,CM)

% for i=1:N
%     fireMag(i)=((fireVel(i,1))^2+(fireVel(i,2))^2)^0.5;
% end

percentError=zeros(N,2);
error=abs(fireVel-droneVel)
for i=1:N
percentError(i,:)=abs(error(i,:)/fireVel(i,:));
end
percentError

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
