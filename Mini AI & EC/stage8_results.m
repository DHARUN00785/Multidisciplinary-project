%% ===================== STAGE 8 =====================
%  Confusion Matrix & Results Display
%  ====================================================
%  Requires: YTest, predTree, predRF, predSVM, accTree, accRF, accSVM
%  (from Stage 7)

% ---- Confusion Matrix for best model (Random Forest) ----
figure;
cm = confusionchart(YTest, predRF);
cm.Title = 'Confusion Matrix - Random Forest';
cm.RowSummary = 'row-normalized';
cm.ColumnSummary = 'column-normalized';

% ---- Bar chart comparing model accuracies ----
figure;
models = categorical({'Decision Tree','Random Forest','SVM'});
models = reordercats(models, {'Decision Tree','Random Forest','SVM'});
accValues = [accTree, accRF, accSVM];
bar(models, accValues);
ylabel('Accuracy (%)');
title('Model Comparison');
ylim([0 100]);
grid on;

% ---- Print classification report ----
fprintf('\n--- Classification Summary (Random Forest) ---\n');
TP = sum(predRF==1 & YTest==1);
TN = sum(predRF==0 & YTest==0);
FP = sum(predRF==1 & YTest==0);
FN = sum(predRF==0 & YTest==1);

precision = TP / (TP+FP);
recall    = TP / (TP+FN);
f1score   = 2*(precision*recall)/(precision+recall);

fprintf('Precision: %.2f\n', precision);
fprintf('Recall: %.2f\n', recall);
fprintf('F1-Score: %.2f\n', f1score);

disp('Stage 8 complete: Confusion matrix and comparison chart generated.');
