%% ===================== STAGE 6 =====================
%  Automatic Dataset Generation
%  ====================================================
%  Requires: Fs, N, Fc, t, numBits, samplesPerSymbol, Fi, SNR_dB
%  (from Stages 1-3). Uses extract_features.m

numSamples = 500;              % Total dataset size (250 clean + 250 interfered)
featureMatrix = [];
labels = [];

for i = 1:numSamples
    % ---- Regenerate random bits/signal each iteration ----
    bits = randi([0 1], 1, numBits);
    bpskSymbols = 2*bits - 1;
    txSymbols = repelem(bpskSymbols, samplesPerSymbol);
    txSignal_i = txSymbols .* cos(2*pi*Fc*t);

    if mod(i,2) == 0
        % ---- Even index: Clean signal (Label 0) ----
        sig = awgn(txSignal_i, SNR_dB, 'measured');
        label = 0;
    else
        % ---- Odd index: Interference present (Label 1) ----
        interfType = randi(3);         % Randomly select interference type
        switch interfType
            case 1
                interf = 0.8*cos(2*pi*Fi*t);
            case 2
                interf = 0.5*randn(1, N);
            case 3
                interf = 0.6*chirp(t, 500, t(end), 3000);
        end
        sig = awgn(txSignal_i + interf, SNR_dB, 'measured');
        label = 1;
    end

    % ---- Extract features & store ----
    feat = extract_features(sig, Fs);
    featureMatrix = [featureMatrix; feat]; %#ok<AGROW>
    labels = [labels; label];              %#ok<AGROW>
end

% ---- Convert to table and save as CSV ----
featureNames = {'MeanPower','PAPR','PeakSpectralPower','SpecMean', ...
                 'SpecStd','SpectralEntropy','Kurtosis','CrestFactor'};
dataTable = array2table(featureMatrix, 'VariableNames', featureNames);
dataTable.Label = labels;

if ~exist('dataset', 'dir')
    mkdir('dataset');
end
writetable(dataTable, fullfile('dataset','interference_dataset.csv'));
disp('Stage 6 complete: Dataset created and saved to dataset/interference_dataset.csv');
disp(head(dataTable));
