filename = 'GOLD_XYZ_OSC.0001_1024.hdf5';

samplesPerClass = 500;

X = [];
Y = [];

for c = 0:23

    startIdx = c*106496 + 1;

    Xtemp = h5read(filename,...
        '/X',...
        [1 1 startIdx],...
        [2 1024 samplesPerClass]);

    Ytemp = h5read(filename,...
        '/Y',...
        [1 startIdx],...
        [24 samplesPerClass]);

    X = cat(3,X,Xtemp);
    Y = [Y Ytemp];

end

disp(size(X))
disp(size(Y))