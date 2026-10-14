%% ===================== STAGE 4 =====================
%  Normalize IQ Signals
%  ==================================================

X = single(X);

X = X ./ max(abs(X(:)));

fprintf('Data Normalized\n');

disp('Stage 4 complete: Normalization Finished');