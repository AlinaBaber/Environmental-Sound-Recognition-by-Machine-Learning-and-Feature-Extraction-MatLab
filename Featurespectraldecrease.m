% ======================================================================
%> @brief computes the spectral decrease from the magnitude spectrum
%> called by ::ComputeFeature
%>
%> @param X: spectrogram (dimension FFTLength X Observations)
%> @param f_s: sample rate of audio data (unused)
%>
%> @retval vsk spectral decrease
% ======================================================================
function [vsd] = Featurespectraldecrease (X,iBlockLength, iHopLength, f_s)

    % compute index vector
    k       = [0:size(X,1)-1];
    k(1)    = 1;
    kinv    = 1./k;
    
    % compute slope
    vsd1     = (kinv*(X-repmat(X(1,:),size(X,1),1)))./sum(X(2:end,:),1);
      vrms =  Featuretimerootmeansquare(X, iBlockLength, iHopLength, f_s);
   vsd2=vsd1.*vrms;
   
   vsd=sum(vsd2)./sum(vrms);
%         dlmwrite('spectraldecrease.txt', vsd, 'delimiter', '\t');
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