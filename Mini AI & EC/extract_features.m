function features = extract_features(sig, Fs)
%EXTRACT_FEATURES Extracts 8 time/frequency-domain features from a signal
%   features = extract_features(sig, Fs)
%   sig : 1xN input signal (real-valued)
%   Fs  : sampling frequency (Hz)
%
%   Returns an 8-element row vector:
%   [MeanPower, PAPR, PeakSpectralPower, SpecMean, SpecStd, ...
%    SpectralEntropy, Kurtosis, CrestFactor]

    N = length(sig);

    % 1. Mean Power (time domain)
    meanPower = mean(sig.^2);

    % 2. Peak-to-Average Power Ratio (PAPR)
    peakPower = max(sig.^2);
    papr = peakPower / meanPower;

    % 3. FFT-based spectral features
    Y = abs(fft(sig, N));
    Y = Y(1:floor(N/2));                % Single-sided spectrum
    Pxx = Y.^2 / N;

    % 4. Peak frequency magnitude (indicates strong interferer)
    peakSpectralPower = max(Pxx);

    % 5. Spectral Mean & Standard Deviation
    specMean = mean(Pxx);
    specStd  = std(Pxx);

    % 6. Spectral Entropy (measures randomness/flatness of spectrum)
    Pxx_norm = Pxx / sum(Pxx);          % Normalize to probability dist.
    Pxx_norm(Pxx_norm == 0) = 1e-12;    % Avoid log(0)
    spectralEntropy = -sum(Pxx_norm .* log2(Pxx_norm));

    % 7. Kurtosis (peakedness - spikes indicate tone interference)
    kurt = kurtosis(sig);

    % 8. Crest Factor
    crestFactor = sqrt(peakPower) / rms(sig);

    % ---- Combine into feature vector ----
    features = [meanPower, papr, peakSpectralPower, specMean, ...
                specStd, spectralEntropy, kurt, crestFactor];
end
