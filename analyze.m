% positive results with  - SENSORS ON TOP
% ts = 20 samples per second

% HPF for gyro - 1st order IIR
% stopband = 0.1 Hz , 0.08 Hz
% passband = 0.11 Hz, 0.09 Hz
% gyro gain = 0.05

% LPF for acc - 1st order IIR
% stopband = 1 Hz , 1.4 Hz
% passband = 1.01 Hz , 1.41 Hz

% positive results with  - SENSORS ON BOTTOM
% ts = 20 samples per second

% HPF for gyro - 1st order IIR
% stopband = 0.1 Hz , 0.08 Hz
% passband = 0.11 Hz, 0.09 Hz
% gyro gain = 0.05

% LPF for acc - 1st order IIR
% stopband = 1 Hz , 1.4 Hz
% passband = 1.01 Hz , 1.41 Hz

% Even better results...... 
% Acc LPF Passband = 0.02
% Gyro HPF Passband = 0.98
% Gyro Scale = -0.051
% ts = 0.05


ts = 0.05
from = 2;
to = 9;
close all
%plot gyro
figure(1)
hold on
plot(gyro)
plot(gyro_filtered)
 xlim([from to]);
title('Gyro')
legend('Gyro-Raw', 'Gyro-HPF');

%plot accelereometer
figure(2)
hold on
plot(acc)
plot(acc_filtered)
 xlim([from to]);
 ylim([100 250]);
title('Accelerometer')
legend('ACC-Raw', 'ACC-LPF');

%plot result
figure(3)
hold on
plot(acc_filtered)
plot(sum)
% plot(reference)
 xlim([from to]);
 ylim([100 250]);
title('Sum vs Filtered Accelerometer')
legend('ACC-LPF','ACC-LPF + GYRO-HPF, Ref');