%Segmented Deletion decoder
function X=Del_Seg_Dec(Y,b,a0,a1)
p=0; %The starting point of the next segment
a=a0; % a is the syndrom of the segment
i=0;
X=zeros(1,b);
while p<length(Y)
    %In ith iteration we decode ith segment
    i=i+1;
    %The case that syndrome does not match
    if p+b==length(Y)+1
        S=VT_D(Y(p+1:end),a);
        X((i-1)*b+1:i*b)=S;
        break;
    end
    if VT(Y(p+1:p+b))~=a
        S=VT_D(Y(p+1:p+b-1),a);
        p=p+b-1;
    % Following is the case that syndrome does match
    else
        S=Y(p+1:p+b);
        p=p+b;
    end
    X((i-1)*b+1:i*b)=S;
    a=a0;
    if S(b)==0
        a=a1;
    end
end


