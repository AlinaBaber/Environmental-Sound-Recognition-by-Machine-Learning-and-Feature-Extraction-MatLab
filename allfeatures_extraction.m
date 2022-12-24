function Features= allfeatures_extraction( wav_file )
%----------Spectral Features-------------------%
[test.data,fs]=wavread(wav_file);
ko=0;lo=0;wo=0;mo=0;oo=0;
[v1, v2, v3, v4 ,v5]  = spectralfeaturecomputation(wav_file);
Features=[v1, v2, v3, v4 ,v5] ;
