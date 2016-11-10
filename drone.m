N=3
D0=zeros(10,10);
B=zeros(10,10);
D1=ones(N,N);
for i=1:3
    for j=1:3
    D0(i,j)=D1(i,j)
    end
end
D1 
D0
k=1
while k<4
%move right
for j=1:3
    for i=1:3
        B(i,j+1)=D0(i,j);
        
    end
end
    
    mesh(B);
    %axis([0 300 0 300 0 300 ])
    pcolor(B);
    M(k) = getframe;
    k=k+1;
end
%move left
for j=1:3
    for i=1:3
        B(i,j+1)=D0(i,j)
        
    end
end




