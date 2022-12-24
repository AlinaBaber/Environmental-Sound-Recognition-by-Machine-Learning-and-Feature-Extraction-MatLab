function [acceleration1,velocity1,t,t1,rate_of_acceleration]= acceleration(wav_file)
[x,fs]=readwav( wav_file);
t=(0:length(x)-1)/fs;

x1=(0.4*t.^4)+(10.8*t.^3)-(64.4*t.^2)-(28.2*t)+4.4;

t=(0:length(x)-1)/fs;
v=diff(x1);
a=gradient(v,0.01);

t1=diff(t);

velocity1=v;

acceleration1=a;  

rate_of_acceleration = mean(acceleration1);
