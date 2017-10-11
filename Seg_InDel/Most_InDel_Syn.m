%This function computes the syndrome that gives the largest codebook for
%a segemented indel channel with segment length b.
%syn1 is the most frequent symdrome among codewords starting with 0 (a0 in
%the paper)
%syn2 is the most frequent symdrome among codewords starting with 1 (a1 in
%the paper)
%Num is the number of codewords in the smaller of the two codes with
%syndromes syn1 and syn2 (Ms in the paper)
function [syn1,syn2,Num]=Most_InDel_Syn(b)
x=zeros(1,b);
S1=zeros(1,b+1);
S2=zeros(1,b+1);
for i=0:2^b-1
    y=VT(x);
    if x(1)==1 && x(2)==1 && x(3)==0 && x(4)==0 && x(5)==0
        if x(b)==x(b-1)  && x(b-1)==x(b-2)
            ind=y+(y==0)*(b+1);
            S1(ind)=S1(ind)+1;
        end
    elseif x(1)==0 && x(2)==0 && x(3)==1 && x(4)==1 && x(5)==1
        if x(b)==x(b-1)  && x(b-1)==x(b-2)
            ind=y+(y==0)*(b+1);
            S2(ind)=S2(ind)+1;
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
[Num1,syn1]=max(S1);
[Num2,syn2]=max(S2);
Num=min(Num1,Num2);
syn1=mod(syn1,b+1);
syn2=mod(syn2,b+1);
