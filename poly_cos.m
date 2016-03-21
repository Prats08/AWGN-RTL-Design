%%a simple example for polyfit to approximate cosine function
%% Kiran Gunnam
clear all
clc
close all

ns=128; %%number of segments
nr=128; %%number of points in each segment
np=1 %% polynomial order used
arg_max=pi/2;

for i=1:ns
    
    xsegment_start = (i-1)/ns*arg_max;
    xsegment_end   = i/ns*arg_max;
    xsegment_step  = 1/(ns*nr)*arg_max;

    x(i,:)  =  xsegment_start:xsegment_step:xsegment_end;
    y(i,:)  =  cos(x(i,:));
    p(i,:)  =  polyfit(x(i,:),y(i,:),np);


    y1(i,:) = polyval(p(i,:),x(i,:));
    %%y1(i,:) = x(i,:).*p(i,1)+p(i,2); %same as above for order 1
    %%polynomial
    e(i)  = max(abs(y(i,:)-y1(i,:)));
end
figure
plot(reshape(x',1,[]),reshape(y',1,[]),'b')
hold on
plot(reshape(x',1,[]),reshape(y1',1,[]),'r')
title('cos');
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