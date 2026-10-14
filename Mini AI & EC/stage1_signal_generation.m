%% ===================== STAGE 1 =====================
%  Generate a Simulated Wireless (BPSK) Signal
%  ====================================================

% ---- Parameters ----
Fs = 10e3;              % Sampling frequency (Hz) - how fast we sample
N  = 1024;              % Number of samples per signal frame
Fc = 1e3;               % Carrier frequency (Hz)
t  = (0:N-1)/Fs;        % Time vector: 0 to (N-1)/Fs seconds

% ---- Generate random bits for BPSK ----
numBits = 64;
bits = randi([0 1], 1, numBits);       % Random binary data (0/1)

% ---- BPSK Modulation: 0 -> -1, 1 -> +1 ----
bpskSymbols = 2*bits - 1;              % Maps 0->-1, 1->+1

% ---- Upsample symbols to match N samples (simulate pulse shaping) ----
samplesPerSymbol = N / numBits;
txSymbols = repelem(bpskSymbols, samplesPerSymbol);

% ---- Modulate onto carrier ----
carrier = cos(2*pi*Fc*t);
txSignal = txSymbols .* carrier;       % Final RF baseband signal

% ---- Plot the clean signal ----
figure;
subplot(2,1,1);
plot(t, txSignal);
xlabel('Time (s)'); ylabel('Amplitude');
title('Clean Transmitted BPSK Signal (Time Domain)');
grid on;

disp('Stage 1 complete: Clean BPSK signal generated (txSignal).');
