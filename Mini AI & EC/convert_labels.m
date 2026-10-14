%% ===================== STAGE 3 =====================
% Convert Labels
% ==================================================

% RadioML Labels

[~, classLabels] = max(Y,[],1);

classLabels = categorical(classLabels);

disp('Classes Found:')
disp(categories(classLabels))

disp(['Number of Classes = ' ...
      num2str(numel(categories(classLabels)))])

disp('Stage 3 complete: Labels Converted');