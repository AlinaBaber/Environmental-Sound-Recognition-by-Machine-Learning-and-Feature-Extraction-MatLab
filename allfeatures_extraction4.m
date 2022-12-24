function Features= allfeatures_extraction4( wav_file )
%------------------Cepstral Analysis-----------------------------

 %-----(8)---------------MFCCs------------------------------------
 [ MFCCscepDpDD] = melfccformatching( wav_file );
 MFCCscepDpDD=mean(MFCCscepDpDD);
 MFCCs=MFCCscepDpDD([1,1:100]);
 %MFCCs=[min(MFCCscepDpDD),max(MFCCscepDpDD), mean( MFCCscepDpDD),median( MFCCscepDpDD),mode( MFCCscepDpDD),std( MFCCscepDpDD),var( MFCCscepDpDD)];
 %MFCCsMax= max ( MFCCscepDpDD);
 %MFCCsMin= min( MFCCscepDpDD);
 %-------(9)------------RastaPLP----------------------------------------
 [RastaPLPcepDpDD] = rastaplp_matching( wav_file );
 RastaPLP=mean (RastaPLPcepDpDD);
 RastaPLP=RastaPLP([1,1:100]);
 %RastaPLP=[min( RastaPLP),max( RastaPLP), mean( RastaPLP),median( RastaPLP),mode( RastaPLP),std( RastaPLP),var( RastaPLP)];
 %RastaPLPsMax= max (RastaPLPcepDpDD);
 %RastaPLPsMin= min(RastaPLPcepDpDD);
Features=[MFCCs,RastaPLP];