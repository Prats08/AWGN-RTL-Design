%%a simple example for polyfit to approximate cosine function
%% Kiran Gunnam

clear all
clc
close all

ns=2^7; %%number of segments
nr=2^9; %%number of points in each segment
np=2; %% polynomial order used

for i=1:ns          % For all segments

    %Start and End Points of segment
        xsegment_end   = i/ns;
        xsegment_step  = 1/(ns*nr);
        xsegment_start = (i-1)/ns;
        
    x(i,:)  =  xsegment_start:xsegment_step:xsegment_end;
    y(i,:)  =  log(x(i,:));     %Log values
    p(i,:)  =  polyfit(x(i,:),y(i,:),np);   %polynomial coefficients

    y1(i,:) = polyval(p(i,:),x(i,:));   %polynomial values

    %Log 0 is not defined therefore we need initialized coefficients
    p(1,1) = -21474923943.6744;
    p(1,2) = 524289.593756354;
    p(1,3) = -14.4236942724212;

    Cc2(i,:) = ( -1 * p(i,1));
    Cc0(i,:) = ( -1 * p(i,3));

    %Convert coefficients into fixed point binary values
        C2fi(i,1) = fi(Cc2(i,1), 0, 30, 16);
        C2Binary (i,:) = bin(C2fi(i,1));
    
        C1fi(i,1) = fi(p(i,2), 0, 22, 13);
        C1Binary (i,:) = bin(C1fi(i,1));
    
        C0fi(i,1) = fi(Cc0(i,1), 0, 13, 10);
        C0Binary (i,:) = bin(C0fi(i,1));

    e(i)  = max(abs(y(i,:)- y1(i,:)));  %error
end

figure
plot(reshape(x',1,[]),reshape(y',1,[]),'b')
hold on
plot(reshape(x',1,[]),reshape(y1',1,[]),'r')
title('log');
hold off
figure;

plot(e)
title('error vs segment number');
xlabel('segment number')
ylabel('error');
max_error=max(e)
spec_error=2^-15

if(max_error<=spec_error)
    disp('error specification is satisfied')
else
    disp('error specification is not satisfied')
end