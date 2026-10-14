%% =====================================================
%  AI-Based Wireless Signal Interference Detection
%  Main Execution File
%  =====================================================

clc;
clear;
close all;

fprintf('\n');
fprintf('=========================================\n');
fprintf(' Wireless Signal Interference Detection\n');
fprintf('=========================================\n');

%% Stage 1 : Load Dataset
run('loading_dataset.m');

%% Stage 2 : Select Dataset Subset
run('subset.m');

%% Stage 3 : Convert Labels
run('convert_labels.m');

%% Stage 4 : Normalize Data
run('normalization.m');

%% Stage 5 : Signal Visualization
run('signalvisual.m');

%% Stage 6 : Train Test Split
run('traintestsplit.m');

%% Stage 7 : CNN Architecture
run('cnnmodel.m');

%% Stage 8 : CNN Training
run('cnntraining.m');

%% Stage 9 : Signal Classification
run('prediction.m');

%% Stage 10 : Interference Alert System
run('alertsystem.m');

%% Stage 11 : Results & Confusion Matrix
run('results.m');

fprintf('\n');
fprintf('=========================================\n');
fprintf(' PROJECT EXECUTION COMPLETED\n');
fprintf('=========================================\n');

fprintf('Final CNN Accuracy : %.2f %%\n', accuracy);