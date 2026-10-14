%% ===================== STAGE 8 =====================
% CNN Training
% ==================================================

disp('Before Training')

disp(size(XTrain))
disp(size(YTrain))

options = trainingOptions('adam',...
    'MaxEpochs',5,...
    'MiniBatchSize',64,...
    'Verbose',true,...
    'Plots','training-progress');

disp('XTrain Size:')
disp(size(XTrain))

disp('YTrain Size:')
disp(size(YTrain))

disp('Classes Found:')
disp(categories(YTrain))

net = trainNetwork(XTrain,YTrain,layers,options);

disp('Stage 8 complete: CNN Trained');