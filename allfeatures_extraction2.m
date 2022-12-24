function Features= allfeatures_extraction2( wav_file )
%-----------Predictive Analysis------------------%
[ formant_frequencies ] = formant( wav_file );
formant_frequencies= transpose(formant_frequencies(1:8));
Features=[formant_frequencies];