function [y] = bcmiFilter(X)

%Some filtering below
[b,a] = butter(6,4/128,'high');
F1 = filtfilt(b,a,X);
[b,a] = butter(24,34/128,'low');
F2 = filtfilt(b,a,F1);
wo = 50/128;  
bw = wo/35;
[b,a] = iirnotch(wo,bw);
F3 = filtfilt(b,a,F2);
y = F3;

%Filtering complete