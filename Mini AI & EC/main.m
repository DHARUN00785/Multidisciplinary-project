%% ================= MAIN SCRIPT =================
%  AI-Powered Wireless Signal Interference Detection System
%  Phase 1 (30%) - Pure MATLAB Simulation, No Hardware
%
%  Run this single script to execute all stages in order.
%  Make sure all stage*.m files and extract_features.m are in the
%  same folder (or on the MATLAB path) as this script.
%  =================================================
clc; clear; close all;

run('stage1_signal_generation.m');
run('stage2_interference_generation.m');
run('stage3_combine_signals.m');
run('stage4_fft_analysis.m');
run('stage6_dataset_creation.m');   % Uses extract_features.m internally
run('stage7_train_model.m');
run('stage8_results.m');

disp('=== Project Execution Completed Successfully ===');
