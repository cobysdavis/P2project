function [ directionBias ] = windBias( windSpeed, windDirection, spreadProb)
%Wind Bias takes a particular wind speed and direction and 
%create an array affecting the direction the fire progresses

%WindSpeed is a scalar value whilst windDirection is a 2-component vector

%Initializing Output and log base
directionBias = repmat(spreadProb,1,8); % (N,S,W,E,NW,NE,SW,SE)
logBase = 6;

% Determines W and E depending on sign of X-component of WindDirection
if (windDirection(1) < 0)
    directionBias(3) = 1- (spreadProb^(log(windSpeed)/log(logBase)));
    directionBias(4) = spreadProb^(log(windSpeed)/log(logBase));
elseif (windDirection(1) > 0)
    directionBias(3) = spreadProb^(log(windSpeed)/log(logBase));
    directionBias(4) = 1 - (spreadProb^(log(windSpeed)/log(logBase)));
end

% Determines N and S depending on sign of Y-component of WindDirection
if (windDirection(2) < 0)
    directionBias(2) = 1- (spreadProb^(log(windSpeed)/log(logBase)));
    directionBias(1) = spreadProb^(log(windSpeed)/log(logBase));
elseif (windDirection(2) > 0)
    directionBias(2) = spreadProb^(log(windSpeed)/log(logBase));
    directionBias(1) = 1 - (spreadProb^(log(windSpeed)/log(logBase)));
end


directionBias(5) = (directionBias(1) + directionBias(3))/2; %NW
directionBias(6) = (directionBias(1) + directionBias(4))/2; %NE
directionBias(7) = (directionBias(2) + directionBias(3))/2; %SW
directionBias(8) = (directionBias(2) + directionBias(4))/2; %SE

end
