%Segmented Insertion codebook generator
function [C]=Ins_Seg_Cbook(b,a)
b1=b-2;
C=[];
for i=0:2^b1-1
    Z=de2bi(i,b1);
    X=[0,1,Z];
    if Z(1)==1
        if VT(X)==a
            C=[C;X];
        end        
    elseif Z(2)==0
        if VT(X)==a
            C=[C;X];
        end
    end
end
