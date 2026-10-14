%% ===================== STAGE 10 =====================
% Interference Alert System
% ==================================================

disp('Checking Interference...')

threshold = 0.60;

maxProb = max(scores,[],2);

alerts = maxProb < threshold;

numAlerts = sum(alerts);

fprintf('Total Interference Alerts = %d\n',numAlerts);

if numAlerts > 0
    disp('WARNING: Possible Signal Interference Detected');
else
    disp('No Significant Interference Detected');
end

disp('Stage 10 complete: Alert System Finished');