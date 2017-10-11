%Segmented Deletion encoder
function X=Del_Seg_Enc(C0,C1,k)

[m,b]=size(C0);
M=randi(m,1,k);
s=ones(1,b);
for i=1:k
    if s(b)==0
        s=C1(M(i),:);
    else
        s=C0(M(i),:);
    end
    X((i-1)*b+1:i*b)=s;
end