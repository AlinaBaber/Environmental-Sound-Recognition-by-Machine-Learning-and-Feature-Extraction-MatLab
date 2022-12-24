%function [Frequency,t,x,f,magnitude,q,amplitude,fs] = frequency( wav_file )
wav_file =path
[x,fs]=readwav( wav_file);
ms1=fs/1000; %Maximum speech Fx at 1000Hz.
ms20=fs/50;  %Minimum speech Fx at 50Hz.
%-------Plot waveform---------
t=(0:length(x)-1)/fs; %times of instants.
%-------- do fourier transform of windowed signal
Y=fft(x.*hamming(length(x)));
%------- Plot spectrum of bottom 5000Hz
hz5000=5000*length(Y)/fs;
f=(0:hz5000)*fs/length(Y);
%FFT spectrum
magnitude=20*log10(abs(Y(1:length(f)))+eps);

%-------- ceptrum is DFT of log spectrum
C= fft (log(abs(Y)+eps));
%-----Plot between 1ms(-1000Hz) and 20ms (50Hz)
q=(ms1:ms20)/fs;
amplitude=abs(C(ms1:ms20));
[c,fx]=max(abs(C(ms1:ms20)));
Frequency =fs/(ms1+fx-1);
