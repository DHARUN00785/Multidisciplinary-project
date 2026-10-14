%% ===================== STAGE 4 =====================
%  FFT Spectrum Analysis
%  ====================================================
%  Requires: cleanSignal, interferedSignal, Fs (from Stages 1-3)

NFFT = 1024;
f = (-NFFT/2:NFFT/2-1)*(Fs/NFFT);      % Frequency axis, centered at 0

% ---- FFT of clean signal ----
Y_clean = fftshift(fft(cleanSignal, NFFT));
P_clean = abs(Y_clean).^2 / NFFT;       % Power spectrum

% ---- FFT of interfered signal ----
Y_interf = fftshift(fft(interferedSignal, NFFT));
P_interf = abs(Y_interf).^2 / NFFT;

% ---- Plot spectrum ----
figure;
subplot(2,1,1);
plot(f, 10*log10(P_clean));
xlabel('Frequency (Hz)'); ylabel('Power (dB)');
title('Spectrum: Clean Signal'); grid on;

subplot(2,1,2);
plot(f, 10*log10(P_interf), 'r');
xlabel('Frequency (Hz)'); ylabel('Power (dB)');
title('Spectrum: Signal with Interference'); grid on;

disp('Stage 4 complete: FFT spectrum plots generated.');
