function [ result ] = probCatch(probability)
%Determines whether or not the fire will spread in a particular direction

x = rand;   %Assigns a random number to a dummy variable x

%If provided probability is greater than random number, spread fire
if probability>x
    result=1;
else
    result=0;

end
