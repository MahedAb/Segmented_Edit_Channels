% VT decoder from a single insertion
% x is the input sequence and X is the decoded sequence
% a is syndrome of X
function X=VT_I(x,a)
n=length(x)-1;
y=0;
w=sum(x);
for i=1:n+1
    y=y+i*x(i);
end

y=mod(y,n+1);
D=mod(y-a,n+1);

if D>w
    R=D-w;
    i=1;
    y=mod(x+1,2);
    while sum(y(1:i))<R
        i=i+1;
    end
    X=[x(1:i),x(i+2:end)];
elseif D==w
    X=x(2:end);
else
    D0=D;
    i=n+2;
    while sum(x(i:n+1))<D0
        i=i-1;
    end
    X=[x(1:i-2),x(i:end)];
end