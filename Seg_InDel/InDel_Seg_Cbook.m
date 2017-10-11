%Segmented InDel codebook generator
function [C0,C1]=InDel_Seg_Cbook(b,a0,a1)
b1=b-8;
C0=[];
C1=[];
for i=0:2^b1-1
    Z=de2bi(i,b1);
    X0=[0,0,1,1,1,Z,0,0,0];
    Y0=[0,0,1,1,1,Z,1,1,1];
    X1=[1,1,0,0,0,Z,0,0,0];
    Y1=[1,1,0,0,0,Z,1,1,1];
    if VT(X0)==a0
        C0=[C0;X0];
    end
    if VT(Y0)==a0
        C0=[C0;Y0];
    end
    if VT(X1)==a1
        C1=[C1;X1];
    end
    if VT(Y1)==a1
        C1=[C1;Y1];
    end
end
[m0,~]=size(C0);
[m1,~]=size(C1);
m=min(m0,m1);
C0=C0(1:m,:);
C1=C1(1:m,:);







%Decoding
        
                    
                    
                    
                    
                    