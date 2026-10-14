%% ===================== STAGE 11 =====================
%  Results
%  ==================================================

figure;

confusionchart(YTest,predLabels);

title('CNN Confusion Matrix');

disp('Stage 11 complete: Results Generated');