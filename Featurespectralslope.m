% ======================================================================
%> @brief computes the spectral slope from the magnitude spectrum
%> called by ::ComputeFeature
%>
%> @param X: spectrogram (dimension FFTLength X Observations)
%> @param f_s: sample rate of audio data (unused)
%>
%> @retval vsk spectral slope
% ======================================================================
function [vssl] = Featurespectralslope (X,iBlockLength, iHopLength, f_s)
 
    % compute mean
    mu_x    = mean(abs(X), 1);
 
    % compute index vector
    kmu     = [0:size(X,1)-1] - size(X,1)/2;
 
    % compute slope
    X       = X - repmat(mu_x, size(X,1), 1);
    vssl1    = (kmu*X)/(kmu*kmu');
      vrms =  Featuretimerootmeansquare(X, iBlockLength, iHopLength, f_s);
   vssl2=vssl1.*vrms;
   
   vssl=sum(vssl2)./sum(vrms);
%     dlmwrite('spectralslope.txt', vssl, 'delimiter', '\t');
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