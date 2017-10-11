%Segmented InDel channel
% X is the codeword, b is segment length
%p_I is the probability of an insertion in a segment
%1-p_I is the probability that segment remains unchanged
function [Y,Edit]=Ins_Seg_Ch(X,b,k,p_I)
Y=[];
Edit=zeros(1,k);
P=rand(1,k);
for i=1:k
    S=X((i-1)*b+1:i*b);
    if P(i)<p_I
        l=randi(b);
        q=rand(1)>0.5;
        S=[X((i-1)*b+1:(i-1)*b+(l-1)),q,X((i-1)*b+l:i*b)];
        Edit(i)=1;
    end
    Y=[Y,S];
end