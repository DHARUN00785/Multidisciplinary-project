%% ===================== STAGE 5 =====================
%  Signal Visualization
%  ==================================================

sample = squeeze(X(:,:,1));

figure;
plot(sample(:,1));
title('I Component');

figure;
plot(sample(:,2));
title('Q Component');

figure;
scatter(sample(:,1),sample(:,2));
title('Constellation Diagram');

disp('Stage 5 complete: Signal Visualized');