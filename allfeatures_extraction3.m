function Features= allfeatures_extraction3( wav_file )
%------------------Short Term Analysis------------------------------
%--------(10)-------Average Power--------------------------------------------
[Power]= logpower(wav_file);
Average_Power=Power([1,1:100]);
%Average_Power=[min(Power),max(Power), mean(Power),median(Power),mode(Power),std(Power),var(Power)];
%Average_Power_Max= max(Average_Power); 
%Average_Power_Min= min(Average_Power);
%--------(11)------- Average Energy--------------------------------------------
[Energy]= logenergy(wav_file);
Average_Energy=Energy([1,1:100]);
%Average_Energy=[min(Energy),max(Energy), mean(Energy),median(Energy),mode(Energy),std(Energy),var(Energy)];
%-------(12)----Zero Passage Rate----------
[Rate_Zero_Passages] = rate_zero_passages(wav_file);
Rate_Zero_Passages= Rate_Zero_Passages([1,1:100]);
%Rate_Zero_Passages=[min(Rate_Zero_Passages),max(Rate_Zero_Passages), mean(Rate_Zero_Passages),median(Rate_Zero_Passages),mode(Rate_Zero_Passages),std(Rate_Zero_Passages),var(Rate_Zero_Passages)];
Features=[mean(Average_Power),mean(Average_Energy),mean(Rate_Zero_Passages)];