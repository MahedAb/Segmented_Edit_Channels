%%% This script simulates a segemented deletion code with segement length b, and
%%% code parameters a0, a1 that can be specified by the user. 
%%% The number of simulated segments is k, and each segment undergoes a
%%% deletion with probability p_D. The output is the difference between the
%%% length kb input sequence and the decoded sequence. 
b=17;  % Segment length
a0=3;  % Syndrome for codewords starting with 0
a1=7;  % Syndrome for codewords starting with 1
k=1000; % Number of Segments
p_D=0.1;  % Probability of a deletion in a segment
[C0,C1]=Del_Seg_Cbook(b,a0,a1); %This function produce the codebooks
X=Del_Seg_Enc(C0,C1,k);  % X is the codeword (k segments of length b)
[Y,e]=Del_Seg_Ch(X,b,k,p_D); % Y is the edited version
X1=Del_Seg_Dec(Y,b,a0,a1);  %X1 is the decoded sequence
sum(abs(X-X1))