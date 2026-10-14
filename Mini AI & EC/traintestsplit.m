%% ===================== STAGE 6 =====================
% Train Test Split
% ==================================================

rng(1);

cv = cvpartition(classLabels,'HoldOut',0.3);

XTrain = X(:,:,training(cv));
YTrain = classLabels(training(cv));

XTest = X(:,:,test(cv));
YTest = classLabels(test(cv));

% Convert data to CNN format
% Original: 2 x 1024 x N
% Required: 1024 x 2 x 1 x N

XTrain = permute(XTrain,[2 1 4 3]);
XTest = permute(XTest,[2 1 4 3]);

disp('XTrain Size:')
disp(size(XTrain))

disp('YTrain Size:')
disp(size(YTrain))

disp('XTest Size:')
disp(size(XTest))

disp('YTest Size:')
disp(size(YTest))

disp('Stage 6 complete: Data Split');