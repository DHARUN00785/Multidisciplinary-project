%% ===================== STAGE 3 =====================
%  Combine Signal with Interference / Keep Clean
%  ====================================================
%  Requires: txSignal, toneInterference, t (from Stages 1-2)

SNR_dB = 15;   % Desired Signal-to-Noise Ratio

% Case A: Clean signal + light AWGN channel noise (label = 0, No Interference)
cleanSignal = awgn(txSignal, SNR_dB, 'measured');

% Case B: Signal + Interference (label = 1, Interference Present)
interferedSignal = awgn(txSignal + toneInterference, SNR_dB, 'measured');

% ---- Plot comparison ----
subplot(2,1,2);
plot(t, interferedSignal, 'r');
xlabel('Time (s)'); ylabel('Amplitude');
title('Signal with Interference (Time Domain)');
grid on;

disp('Stage 3 complete: cleanSignal and interferedSignal created.');
