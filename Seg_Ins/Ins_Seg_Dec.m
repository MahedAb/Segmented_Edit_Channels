%Segmented Insertion decoder
function X=Ins_Seg_Dec(Y,b,a)
p=0; %The starting point of the next segment
i=0;
X=zeros(1,b);
while p<length(Y)
    %In ith iteration we decode ith segment
    i=i+1;
    %If it is the last segment with insertion no need for checking VT syndrome
    if p+b==length(Y)-1
        S=VT_I(Y(p+1:end),a);
        X((i-1)*b+1:i*b)=S;
        break;
    end
    %The case that syndrome does not match
    if VT(Y(p+1:p+b))~=a
        S=VT_I(Y(p+1:p+b+1),a);
        p=p+b+1;
        % Following is the case that syndrome does match
    else
        S=Y(p+1:p+b);
        %Based on table 2 we determine first bit of the next segment
        if p+b==length(Y)
            X((i-1)*b+1:i*b)=S;
            break;
        end
        if Y(p+b+1)~=0 || Y(p+b+2)~=1
            p=p+b+1;
        else
            if Y(p+b+3)~=0 || Y(p+b+4)~=1
                p=p+b;
            else
                Z=[0,1,1,Y(p+b+5:p+2*b+1)];
                if VT(Z)==a
                    p=p+b;
                else
                    Z=[0,1,0,Y(p+b+5:p+2*b+1)];
                    if VT(Z)==a
                        p=p+b;
                    else
                        p=p+b+1;
                    end
                end
            end
        end       
    end
    X((i-1)*b+1:i*b)=S;
end


