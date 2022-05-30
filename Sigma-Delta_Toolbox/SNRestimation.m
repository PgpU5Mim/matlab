% simout is the modulator output to test, f is the input frequency used for
% the test
function snr= SNRestimation(simout, f)

fs = 48e3;
testsig = simout(30:fs);

N = length(testsig);
spec=fft(testsig.*ds_hann(N)')/(N/4);
snr = calculateSNR(spec(1:fs/2),f);