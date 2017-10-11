%Segmented Insertion encoder
function X=Ins_Seg_Enc(C,k)

[m,b]=size(C);
M=randi(m,1,k);
for i=1:k
    s=C(M(i),:);
    X((i-1)*b+1:i*b)=s;
end