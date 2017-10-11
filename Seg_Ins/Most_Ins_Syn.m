%syn is the most frequent symdrome 
%S1 is a vector where element i shows the numeber of sequenses with
%syndrome i
%Num is maximum of S1
function [syn,S1,Num]=Most_Ins_Syn(b)
x=zeros(1,b);
S1=zeros(1,b+1);
for i=0:2^b-1
    y=VT(x);
    if x(1)==0 && x(2)==1  
        ind=y+(y==0)*(b+1);
        S1(ind)=S1(ind)+1;
        if x(3)==0 && x(4)==1
            S1(ind)=S1(ind)-1;
        end
    end
    ss=1;
    if x(1)==0
        x(ss)=1;
    else
        while x(ss)==1  && i<2^b-1
            ss=ss+1;
            %x
        end
        x(ss)=1;
        x(1:ss-1)=zeros(1,ss-1);
    end
end
[Num,syn]=max(S1);