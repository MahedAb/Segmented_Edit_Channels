%Segmented InDel channel
% X is the codeword, b is segment length
%P_D is the probability of deletion in a segment
%1-p_D is the probability that segment remains unchanged
function [Y,Edit]=Del_Seg_Ch(X,b,k,p_D)
Y=[];
Edit=zeros(1,k);
P=rand(1,k);
for i=1:k
    S=X((i-1)*b+1:i*b);
    if P(i)<p_D
        Edit(i)=-1;
        l=randi(b);
        S=[X((i-1)*b+1:(i-1)*b+(l-1)),X((i-1)*b+l+1:i*b)];
    end
    Y=[Y,S];
end