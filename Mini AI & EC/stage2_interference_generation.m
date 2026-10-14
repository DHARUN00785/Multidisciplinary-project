%% ===================== STAGE 2 =====================
%  Generate Interference Signals
%  ====================================================
%  Requires: t, N (from Stage 1)

% ---- Type 1: Tone (Narrowband) Interference ----
Fi = 2.5e3;                                % Interferer frequency
toneInterference = 0.8*cos(2*pi*Fi*t);     % A strong sinusoidal jammer

% ---- Type 2: Wideband Noise Interference (AWGN burst) ----
noiseInterference = 0.5*randn(1, N);       % Gaussian noise burst

% ---- Type 3: Chirp (Swept Frequency) Interference ----
chirpInterference = 0.6*chirp(t, 500, t(end), 3000);

% ---- Collect interference types for later random selection ----
interferenceTypes = {toneInterference, noiseInterference, chirpInterference};

disp('Stage 2 complete: Tone, Noise, and Chirp interference generated.');
