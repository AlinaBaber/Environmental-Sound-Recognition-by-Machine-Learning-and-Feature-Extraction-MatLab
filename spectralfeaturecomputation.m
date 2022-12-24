function [v1, v2, v3, v4 ,v5] = spectralfeaturecomputation (wav_file)
 
        % set default parameters if necessary
 %%   if (nargin < 6)
        iHopLength      = 2048;
 
        iBlockLength    = 4096;

 
        % compute feature

  [Frequency,t,x,f,magnitude,q,amplitude,fs] = frequency( wav_file );       
        
% fprintf('The spectral slope Value of Input is ')
v1           = Featurespectralslope(magnitude,iBlockLength, iHopLength, fs);
% dlmwrite('slope.dat', v1, 'delimiter', '\t');dlmwrite('slope.txt', v1, 'delimiter', '\t');
% fprintf('The spectral skewness Value of Input is ')
v2           = Featurespectralskewness(magnitude, iBlockLength, iHopLength,fs);
% dlmwrite('skewness.dat', v2, 'delimiter', '\t');dlmwrite('skewness.txt', v2, 'delimiter', '\t');
% fprintf('The spectral rolloff Value of Input is ')
v3           = Featurespectralflatness(magnitude, iBlockLength, iHopLength,fs);
% dlmwrite('rolloff.dat', v3, 'delimiter', '\t');dlmwrite('rolloff.txt', v3, 'delimiter', '\t');
% fprintf('The spectral decrease Value of Input is ')
v4           = Featurespectraldecrease(magnitude,iBlockLength, iHopLength, fs);
% dlmwrite('decrease.dat', v4, 'delimiter', '\t');dlmwrite('decrease.txt', v4, 'delimiter', '\t');
% fprintf('The spectral crest Value of Input is ')
v5           = Featurespectralcrest(magnitude,iBlockLength, iHopLength, fs);
% dlmwrite('crest.dat', v5, 'delimiter', '\t');dlmwrite('crest.txt', v5, 'delimiter', '\t');
end