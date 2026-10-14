%% ===================== STAGE 9 =====================
%  Signal Classification
%  ==================================================

predLabels = classify(net,XTest);

accuracy = mean(predLabels == YTest) ;

fprintf('CNN Accuracy = %.2f%%\n',accuracy);

disp('Stage 9 complete: Prediction Finished');