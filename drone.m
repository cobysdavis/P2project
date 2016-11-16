droneX = 5;
droneY = 5;
droneSpeedX = 2;
droneSpeedY = 1;
k = 1;
steps = 200;
y = 1;

movementMatrix = zeros(100, 100);

while k<steps
    
    movementMatrix(droneX,droneY) = 0;
    droneX = droneX + droneSpeedX;
    droneY = droneY + droneSpeedY;
    movementMatrix(droneX,droneY) = 100;
    
    if ((droneX > 100) || (droneX<1))
        droneSpeedX = -droneSpeedX;
    end
    if (droneY > 100 || droneY < 2)
        droneSpeedY = -droneSpeedY;
    end
    
    mesh(movementMatrix);
    pcolor(movementMatrix);
    M(k) = getframe;
    k=k+1;
end
%move left
save M




