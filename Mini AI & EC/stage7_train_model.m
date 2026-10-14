%% ===================== STAGE 7 =====================
%  Train Machine Learning Model
%  ====================================================

% ---- Load dataset ----
data = readtable(fullfile('dataset','interference_dataset.csv'));
X = table2array(data(:, 1:end-1));     % Features
Y = data.Label;                        % Labels (0/1)

% ---- Split into training (70%) and testing (30%) ----
rng(1);                                 % Fixed seed for reproducibility
cv = cvpartition(Y, 'HoldOut', 0.3);
XTrain = X(training(cv), :);
YTrain = Y(training(cv), :);
XTest  = X(test(cv), :);
YTest  = Y(test(cv), :);

% ---- Train Decision Tree Classifier ----
treeModel = fitctree(XTrain, YTrain);

% ---- Train Random Forest (Bagged Trees) ----
rfModel = fitcensemble(XTrain, YTrain, 'Method', 'Bag');

% ---- Train SVM Classifier ----
svmModel = fitcsvm(XTrain, YTrain, 'KernelFunction', 'rbf', 'Standardize', true);

% ---- Predictions ----
predTree = predict(treeModel, XTest);
predRF   = predict(rfModel, XTest);
predSVM  = predict(svmModel, XTest);

% ---- Accuracy Calculation ----
accTree = sum(predTree == YTest) / length(YTest) * 100;
accRF   = sum(predRF   == YTest) / length(YTest) * 100;
accSVM  = sum(predSVM  == YTest) / length(YTest) * 100;

fprintf('Decision Tree Accuracy: %.2f%%\n', accTree);
fprintf('Random Forest Accuracy: %.2f%%\n', accRF);
fprintf('SVM Accuracy: %.2f%%\n', accSVM);

disp('Stage 7 complete: Models trained (treeModel, rfModel, svmModel).');
