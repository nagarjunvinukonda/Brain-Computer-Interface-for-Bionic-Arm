%% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

% resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

disp('Now receiving data...');
% [vec,ks] = inlet.pull_sample();
while true
 tic; 
 data3 = zeros(2048,6);
 syms i;
 i = 0;
% data3 = zeros(10000,8);
 while (true) && (i<2048)
    % get data from the inlet
   [k,ts] = inlet.pull_sample();
   %disp(ts);
    % and display it
   
   k(:,7)=[];       %delete unnecessary column
   i=i+1;
   data3(i,:) = k;  %display data in data3 matrix
   %data3 = data3';
   %data3 = bcmiFilter(data3);
   %disp(data3)
   %disp(size(data3));
   
%     fileID = fopen('ee.txt','w');
%     fprintf(fileID,'%f\n',data3);
%     fclose(fileID);

%     sz=size(data3);

%     fprintf('%.2f\t',data3);
%     fprintf('%.5f\n',ts);

%     var u;
%     u = ts-ks;
%     matplotlib(vec,u);

 end
 
% disp("===================================================")
% disp(data3)

data3 = bcmiFilter(data3); 

targetFreq = [8.0 9.0 10.0 11.0 12.0 13.0];

referenceSignals = zeros(6, 2048 , 4);
    
Fs = 256;
T = 1/Fs;
L = 2048;
t = (0:L-1);
    %=======Calculation of reference signals (harmonics)========
for i = 1:6
   for j= 1:2
        referenceSignals(i,:,2*j-1) = sin(2*pi*targetFreq(i)*j*t/ Fs)';
        referenceSignals(i,:,2*j) = cos(2*pi*targetFreq(i)*j*t/ Fs)';
   end
end

dataLength = 2048;

    %======================================


    %================Calculation of correlation values=======
    
data4 = data3(1:dataLength,:); %The matrix of data recorded from the headset... Each column is for one electrode. 

ccaValues = zeros(1,6);
  for data3 = 1:6
     tempReferenceSignals=squeeze(referenceSignals(data3,1:dataLength,:));
     [A,B,r] = canoncorr(data4, tempReferenceSignals);
     ccaValues(data3) = r(1);
  end
[val,ind] = max(ccaValues);

% disp(ccaValues);
fprintf('%f\n',ind);

%==============Serial Communication========================%

if ~isempty(instrfind)
      fclose(instrfind);
      delete(instrfind);
end

  if ind==1
      a = serial('COM8','BaudRate',115200,'TimeOut',5,'Terminator', 'CR');  
      fopen(a);
      sendData=1;
      fprintf(a,'%i',sendData);
      fclose(a);
  elseif ind==2
      a = serial('COM8','BaudRate',115200,'TimeOut',5,'Terminator', 'CR');  
      fopen(a);
      sendData=2;
      fprintf(a,'%i',sendData);
      fclose(a);
  elseif ind==3
      a = serial('COM8','BaudRate',115200,'TimeOut',5,'Terminator', 'CR');  
      fopen(a);
      sendData=3;
      fprintf(a,'%i',sendData);
      fclose(a);
  elseif ind==4
      a = serial('COM8','BaudRate',115200,'TimeOut',5,'Terminator', 'CR');  
      fopen(a);
      sendData=4;
      fprintf(a,'%i',sendData);
      fclose(a);
  elseif ind==5
      a = serial('COM8','BaudRate',115200,'TimeOut',5,'Terminator', 'CR');  
      fopen(a);
      sendData=5;
      fprintf(a,'%i',sendData);
      fclose(a);
  elseif ind==6
      a = serial('COM8','BaudRate',115200,'TimeOut',5,'Terminator', 'CR');  
      fopen(a);
      sendData=6;
      fprintf(a,'%i',sendData);
      fclose(a);
  
  end

end


% disp(size(data3));



