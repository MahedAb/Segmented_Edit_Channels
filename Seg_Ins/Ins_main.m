%%% This script simulates a segemented code with segement length b, and
%%% code parameter a that can be specified by the user. 
%%% The number of simulated segments is k, and each segment undergoes an
%%% insertion with probability p_I. The output is the difference between the
%%% length kb input sequence and the decoded sequence.
b=17;  % Segment length
a=3;  % Syndrome for the codewords
k=1000; % Number of Segments
p_I=0.5;  % Probability of an insertion in a segment
C=Ins_Seg_Cbook(b,a); %This function produce the codebooks
X=Ins_Seg_Enc(C,k);  % X is the codeword (k segments of length b)
[Y,e]=Ins_Seg_Ch(X,b,k,p_I); % Y is the edited version
X1=Ins_Seg_Dec(Y,b,a);  %X1 is the decoded sequence
sum(abs(X-X1))