% ======================================================================
%> @brief computes the spectral flatness from the magnitude spectrum
%> called by ::ComputeFeature
%>
%> @param X: spectrogram (dimension FFTLength X Observations)
%> @param f_s: sample rate of audio data (unused)
%>
%> @retval vtf spectral flatness
% ======================================================================
function [vtf] = Featurespectralflatness (X,iBlockLength, iHopLength,f_s)
 
    XLog    = log(X+1e-20);
    vtf1     = exp(mean(XLog,1)) ./ mean(X,1);
    
      vrms =  Featuretimerootmeansquare(X, iBlockLength, iHopLength, f_s);
   vtf2=vtf1.*vrms;
   
   vtf=sum(vtf2)./sum(vrms);
%         dlmwrite('spectralflatness.txt', vtf, 'delimiter', '\t');
end

function [vrms] = Featuretimerootmeansquare(x, iBlockLength, iHopLength, f_s)
  
        % calculate the rms
        vrms     = sqrt(mean(x.^2));
    
end