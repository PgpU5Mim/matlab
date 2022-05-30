%Copyright (c) 2009, Richard Schreier
%All rights reserved.
%
%Redistribution and use in source and binary forms, with or without
%modification, are permitted provided that the following conditions are
%met:
%
%    * Redistributions of source code must retain the above copyright
%      notice, this list of conditions and the following disclaimer.
%    * Redistributions in binary form must reproduce the above copyright
%      notice, this list of conditions and the following disclaimer in
%      the documentation and/or other materials provided with the distribution
%
%  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
%  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
%  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
%  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
%  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
%  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
%  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
%  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
%  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
%  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%  POSSIBILITY OF SUCH DAMAGE
%

function snr = calculateSNR(hwfft,f,nsig)
% snr = calculateSNR(hwfft,f,nsig=1) Estimate the signal-to-noise ratio, 
% given the in-band bins of a (Hann-windowed) fft and 
% the location of the input signal (f>0).
% For nsig=1, the input tone is contained in hwfft(f:f+2); 
%  this range is appropriate for a Hann-windowed fft.
% Each increment in nsig adds a bin to either side.
% The SNR is expressed in dB.
if nargin<3
    nsig = 1;
end
signalBins = [f-nsig+1:f+nsig+1];
signalBins = signalBins(signalBins>0);
signalBins = signalBins(signalBins<=length(hwfft));
s = norm(hwfft(signalBins));		% *4/(N*sqrt(3)) for true rms value;
noiseBins = 1:length(hwfft);
noiseBins(signalBins) = [];
n = norm(hwfft(noiseBins));
if n==0
    snr = Inf;
else
    snr = dbv(s/n);
end
