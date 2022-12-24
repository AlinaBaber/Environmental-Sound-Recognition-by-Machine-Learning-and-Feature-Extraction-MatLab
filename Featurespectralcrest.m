% ======================================================================
%> @brief computes the spectral crest from the magnitude spectrum
%> called by ::ComputeFeature
%>
%> @param X: spectrogram (dimension FFTLength X Observations)
%> @param f_s: sample rate of audio data (unused)
%>
%> @retval vtsc spectral crest factor
% ======================================================================
function [vtsc] = Featurespectralcrest (X, iBlockLength, iHopLength, f_s)
   vtsc1 = max(X,[],1) ./ sum(X,1);
  vrms =  Featuretimerootmeansquare(X, iBlockLength, iHopLength, f_s);
   vtsc2=vtsc1.*vrms;
   
   vtsc=sum(vtsc2)./sum(vrms);
   
%        dlmwrite('spectralcrest.txt', vtsc, 'delimiter', '\t');
end

% ======================================================================
%&gt; @brief computes the RMS of a time domain signal
%&gt; called by ::ComputeFeature
%&gt;
%&gt; @param x: audio signal
%&gt; @param iBlockLength: block length in samples
%&gt; @param iHopLength: hop length in samples
%&gt; @param f_s: sample rate of audio data (unused)
%&gt;
%&gt; @retval vrms root mean square
%&gt; @retval t time stamp
% ======================================================================
function [vrms] = Featuretimerootmeansquare(x, iBlockLength, iHopLength, f_s)
 
      % calculate the rms
        vrms     = sqrt(mean(x.^2));
    end