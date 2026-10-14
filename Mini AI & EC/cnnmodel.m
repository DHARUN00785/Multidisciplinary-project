%% ===================== STAGE 7 =====================

numClasses = numel(categories(classLabels));

layers = [

imageInputLayer([1024 2 1])

convolution2dLayer([5 2],32,'Padding','same')
batchNormalizationLayer
reluLayer

maxPooling2dLayer([2 1])

convolution2dLayer([3 1],64,'Padding','same')
batchNormalizationLayer
reluLayer

fullyConnectedLayer(128)
reluLayer

dropoutLayer(0.5)

fullyConnectedLayer(numClasses)

softmaxLayer

classificationLayer

];