

clear all;
q=0;
N=1; %number of drones used
F=5;
burntime=15; %how long the fire can go for without burning out
k=1;  %Initializing step incrementer
steps =20;   %Number of Steps going to be Simulated
matrixDim=100; %Sets dimensions of square forest matrix
fireposition = zeros(matrixDim,matrixDim);
updatedfirePosition = zeros(matrixDim,matrixDim);
timeonfire = zeros(matrixDim,matrixDim);
intensity = zeros(matrixDim,matrixDim);
[startpos fireposition]=startfires(F,matrixDim);
fireinitial=startpos;
droneRad=20; %factor that matrixDim is divided by in lockedOn, determines drones vewiing radius
droneSum=100; %the minimum sum that a drone has to have in its radius to be considered locked on
minMove=3; %robot must be moving this distance every time step in order to not be considered locked on
updatedfirePosition=fireposition;
m=zeros(N,1); %when to start coutning velocity
velocity=zeros(N,2);
movementTotal=zeros(N,2);
initialt=zeros(N,1);
dronematrix=zeros(matrixDim,matrixDim);
dronenum=zeros(N,1);
dronepositions=zeros(N,2);
locked=zeros(N,1);
startDrones=zeros(N,2);
for i=1:N
dronenum(i)=i; %associates each drone with a number/colour
dronepositions(i,:)=startdrones(intensity,matrixDim,dronenum(i),N);%call startdrone function to initialize initial coordinates for all drones
dronematrix(dronepositions(i,1),dronepositions(i,2))=dronenum(i);%sets initia positions onto the position matrix
end

percentagemove=0.7; % determines the speed of their movement

% windSpeed, WindDirection, spreadProb
windConditions = [80 pi 0.4];
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

for j=1:N
locked(j)=isLockedon(intensity,dronepositions(j,:),matrixDim,droneRad,droneSum);
if locked(j)==1 && m(j)~=0
    m(j)=1;
    initialt(j)=k;
    startDrones(j,:)=dronepositions(j,:);
end
locked
startDrones
end

subplot(2,2,3)
mesh(dronematrix);
pcolor(dronematrix);
xlabel('y');
ylabel('x');
hold off
B(k)=getframe;

timestep=mod(k,3);

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
    m=[m 0];
    initialt=[initialt 0];
    startDrones=[startDrones;zeros(1,2)];
end
q=0;
k=k+1
save B
save M
save C
end

droneVel=zeros(N,2);

for l=1:N
    droneVel(l,:)=(dronepositions(l,:)-startDrones(l,:))/(k-1-initialt(l));
end

droneVel
% fireVel=firespeed(fireinitial,k,N,CM);
% 
% for i=1:N
%     fireMag(i)=((fireVel(i,1))^2+(fireVel(i,2))^2)^0.5;
% end
% 
% diff=(fireVel-droneVel);
% sumError=0;
% 
% for i=1:N
% magError(i)=((diff(i,1))^2+(diff(i,2))^2)^0.5;
% percentError(i)=(magError(i)/fireMag(i))*100;
% % sumError=(percentError(i))+sumError;
% end
% totalError=sumError;
% close all
subplot(2,2,1)
movie(M,2)
subplot(2,2,2)
movie(C,2)
subplot(2,2,3)
movie(B,2)
