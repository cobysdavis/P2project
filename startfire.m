function [ C ] = startfire( N,x,y )
C = zeros(N,N);
C(x,y)=1;
end

