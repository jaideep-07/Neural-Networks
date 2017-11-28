clear;
clc;
l=1;
x=[0 0 1 1;0 1 0 1];
y=[0 0 0 1];
b=random('Normal',0,1,1,2);
n=length(x);
m=length(y);
w=random('Normal',0,1,2,2);
v=random('Normal',0,1,1,3);
disp('Random weights are:')
disp(w)
disp('Random bias are:')
disp(b)
alpha=abs(random('Normal',0,1));
flag=0;
while flag==0
W=0;
for j=1:2
    for i=1:2
        W=x(i,l)+w(i,j)+W;
    end
    Zin(j)=b(j)+W;
    if Zin(j)<0
        Z(j)=0;
    else
        Z(j)=1;
    end
end
yin=v(3)+Z(1)*v(1)+Z(2)*v(2);
if yin<0
    Y=0;
else
    Y=1;
end
if Y==y(l)
    disp('Outputs match: Continuing for next inputs');
    l=l+1;
    continue;
else
    Wold=w;
    bold=b;
    for j=1:2
        for i=1:2
            w(i,j)=Wold(i,j)+alpha*(y(l)-Zin(j))*x(i,l);
            b(j)=bold(j)+alpha*(y(l)-Zin(j));
        end
    end
end
disp('End of first iteration')
disp('Weights are:')
disp(w)
disp('Bias are:')
disp(b)
if  Wold ==w
    disp('Weights have converged')
    flag=1;
elseif l>=n
    l=1;
    continue;
else
    l=l+1;
    continue;
end
end