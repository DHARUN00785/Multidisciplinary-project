%===================== STAGE 1 =====================
%  Load RadioML Dataset
%  ==================================================

clear;
clc;

filename = 'D:\Mini AI & EC\GOLD_XYZ_OSC.0001_1024.hdf5';

numSamples = 10000;

X = h5read(filename,'/X',...
          [1 1 1],...
          [2 1024 numSamples]);

Y = h5read(filename,'/Y',...
          [1 1],...
          [24 numSamples]);

Z = h5read(filename,'/Z',...
          [1 1],...
          [1 numSamples]);

disp(size(X))
disp(size(Y))
disp(size(Z))