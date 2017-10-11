%Segmented InDel decoder
function X=InDel_Seg_Dec(Y,b,a0,a1)
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
    if p+b==length(Y)-1
        S=VT_I(Y(p+1:end),a);
        X((i-1)*b+1:i*b)=S;
        break;
    end
    if VT(Y(p+1:p+b))~=a
        x=Y(p+b-1);
        y=Y(p+b);
        z=Y(p+b+1);
        %Decoding is based on table 3
        if x==y
            if y==z
                S=VT_I(Y(p+1:p+b+1),a);
                p=p+b+1;
            else
                S=VT_D(Y(p+1:p+b-1),a);
                p=p+b-1;
            end
        else
            if y==z
                if Y(p+b-2)==x
                    S=VT_D(Y(p+1:p+b-1),a);
                    p=p+b-1;
                else
                    S=VT_I(Y(p+1:p+b+1),a);
                    p=p+b+1;
                end
            else
                Z=[Y(p+1:p+b-1),z];
                if VT(Z)~=a
                    S=VT_D(Y(p+1:p+b-1),a);
                    p=p+b-1;
                else
                    if z~=Y(p+b+2)
                        S=VT_I(Y(p+1:p+b+1),a);
                        p=p+b+1;
                    elseif z~=Y(p+b+3)
                        S=VT_I(Y(p+1:p+b+1),a);
                        p=p+b+1;
                    else
                        S=VT_D(Y(p+1:p+b-1),a);
                        p=p+b-1;
                    end
                end
            end
        end
        % Following is the case that syndrome does match
    else
        S=Y(p+1:p+b);
        %Based on table 4 we determine first bit of the next segment
        %First if the last bit is 1 (so prefix of next segment is 00111)
        if p+b==length(Y)
            X((i-1)*b+1:i*b)=S;
            p=p+b;
            break;
        end
        if Y(p+b)==1
            if Y(p+b+1)==1
                p=p+b+1;
            else
                if Y(p+b+2)==0
                    if Y(p+b+3)==0
                        p=p+b+1;
                    elseif Y(p+b+1:p+b+5)==[0 0 1 0 1]
                        Z1=[0,0,1,Y(p+b+5:p+2*b+1)];
                        if VT(Z1)==a0
                            p=p+b;
                        else
                            p=p+b+1;
                        end
                    else
                        p=p+b;                     
                    end
                elseif Y(p+b+3:p+b+5)==[0,0,1]
                    p=p+b+1;
                else
                    p=p+b;
                end
            end
            %In the following is the case study similar to table 4 for when last bit of the segment is 0
        else
            if Y(p+b+1)==0
                p=p+b+1;
            elseif Y(p+b+1:p+b+3)==[1,1,1]
                p=p+b+1;
            elseif Y(p+b+1:p+b+3)==[1,0,0]
                p=p+b;
            elseif Y(p+b+1:p+b+5)==[1 0 1 1 1]
                p=p+b;
            elseif Y(p+b+1:p+b+5)==[1 0 1 1 0]
                p=p+b+1;
            elseif Y(p+b+1:p+b+5)==[1 1 0 0 1]
                p=p+b;
            elseif Y(p+b+1:p+b+5)==[1 0 1 0 0]
                p=p+b;
            elseif Y(p+b+1:p+b+5)==[1 1 0 0 0]
                p=p+b;
            elseif Y(p+b+1:p+b+5)==[1 1 0 1 0]
                Z1=[1,1,0,Y(p+b+5:p+2*b+1)];
                if VT(Z1)==a1
                    p=p+b;
                else
                    p=p+b+1;
                end
            end
        end
    end
    X((i-1)*b+1:i*b)=S;
    a=a0;
    if S(b)==0
        a=a1;
    end
end


