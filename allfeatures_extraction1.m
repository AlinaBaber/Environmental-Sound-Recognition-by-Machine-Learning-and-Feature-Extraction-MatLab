function Features= allfeatures_extraction1( wav_file )
%--(1)----Frequency------------------------------
[Frequency,t,x,f,magnitude,q,amplitude] = frequency( wav_file );
%---(2)----------pitch contour-------------------------
%[ Pitch_Contour_min, Pitch_Contour_max,Pitch_Contour_mean,pitch_con] = pitch_contour( wav_file );
%pitch_con= [min(pitch_con),max(pitch_con),mean(pitch_con),median(pitch_con),mode(pitch_con),std(pitch_con),var(pitch_con)];
%pitch_con = pitch_con([1,1:100]);
%---(3)----------- pitch autocorrelation---------------
%[ pitch_freq_auto] = pitch_autocor (wav_file);
%---(4)-----------acceleration----------------
[acceleration1,velocity1,~,t1,rate_of_acceleration]= acceleration(wav_file);
%Acceleration=acceleration1(1,1:19500);
Acceleration=rate_of_acceleration;
% Acceleration=[min(acceleration1),max(acceleration1),mean(acceleration1),median(acceleration1),mode(acceleration1),std(acceleration1),var(acceleration1)];
%-----(5)-------------Intensity------------
[Intensity_of_Sound,f]= intensity_extraction(wav_file);
%Intensity_of_Sound=Intensity_of_Sound(1,1:19500);
Intensity_of_Sound=mean(Intensity_of_Sound);
%Intensity_of_Sound=[min(Intensity_of_Sound),max(Intensity_of_Sound),mean(Intensity_of_Sound),median(Intensity_of_Sound),mode(Intensity_of_Sound),std(Intensity_of_Sound),var(Intensity_of_Sound)];
Features=[Frequency,rate_of_acceleration,Intensity_of_Sound];