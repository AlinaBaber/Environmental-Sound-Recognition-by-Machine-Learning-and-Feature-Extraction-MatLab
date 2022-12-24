function [ ffreq ] = formant( wav_file )
%[x,fs]=readwav(wav_file);
[son,Fs]=readwav(wav_file);
x=son;

 ncoeff=2+Fs/1000; % rule of thumb for formant estimation

a=lpc(son,ncoeff);

[h,f]=freqz(1,a,512,Fs);

% find frequencies by root-solving

r=roots(a);
r=r(imag(r)>0.01);
ffreq=sort(atan2(imag(r),real(r))*Fs/(2*pi));
