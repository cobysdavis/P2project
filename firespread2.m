

N=20;
%sets size of forest NxN
C = zeros(N,N);
Z = zeros(N,N);
A=zeros(N,N);
k=1;
steps=80;
C(12,5)=1;


Z=C;
probN=0.9;
probS=0.15;
probE=0.12;
probW=0.19;

while k<steps
    
for i=1:N
    for j=1:N
        if C(i,j)==1
          a=i;
          b=j;
          A(i,j)=A(i,j)+1;
if a==1 && b==1
       if probCatch(probS)
           Z(a+1,b)=1;
           if
            Z(a+2,b)=1;  
       end
       if probCatch(probE)
           Z(a,b+1)=1;
       end
       
elseif a==1 && b==N
       if probCatch(probS)
           Z(a+1,b)=1;
       end
       if probCatch(probW)
           Z(a,b-1)=1;
       end
       
elseif a==N && b==1
       if probCatch(probN)
           Z(a-1,b)=1;
       end
           if probCatch(probE)
               Z(a,b+1)=1;
           end
           
elseif a==N && b==N
       if probCatch(probN)
           Z(a-1,b)=1;
       end
       if probCatch(probW)
           Z(a,b-1)=1;
       end
       
elseif a==1 && (b~=N && b~=1)
       if probCatch(probS)
           Z(a+1,b)=1;
       end
       if probCatch(probW)
           Z(a,b-1)=1;
       end
            Z(a,b+1)=1;
elseif a==N && (b~=N && b~=1)
       if probCatch(probN)
           Z(a-1,b)=1;
       end      
          if probCatch(probW)
           Z(a,b-1)=1;
          end
          if probCatch(probE)
               Z(a,b+1)=1;
           end
elseif b==N && (a~=1 && a~=N)
       if probCatch(probN)
           Z(a-1,b)=1;
       end
       if probCatch(probS)
           Z(a+1,b)=1;
       end
       if probCatch(probW)
           Z(a,b-1)=1;
       end
elseif b==1 && (a~=1 && a~=N)
            Z(a-1,b)=1;
       if probCatch(probS)
           Z(a+1,b)=1;
       end
           if probCatch(probE)
               Z(a,b+1)=1;
           end
elseif a~=1 && a~=N && b~=1 && b~=N
       if probCatch(probN)
           Z(a-1,b)=1;
       end
       if probCatch(probS)
           Z(a+1,b)=1;
       end
           if probCatch(probE)
               Z(a,b+1)=1;
           end
           if probCatch(probW)
           Z(a,b-1)=1;
       end           
end
end 
end
end
  C=Z;
  mesh(A);
  pcolor(A);
  M(k) = getframe;
  k=k+1;
end
save M










