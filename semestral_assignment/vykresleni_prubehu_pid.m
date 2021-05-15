%close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations

error = squeeze(signal_thetaerror.signals.values);
P = squeeze(signal_P.signals.values);
I = squeeze(signal_I.signals.values);

figure
plot(time, [error/10 P I], 'LineWidth', 2);
legend('regulaèní odchylka', 'proporcionální složka', 'integraèní složka', 'derivaèní složka', 'location', 'southeast')
grid on;
xlabel('Èas [s]')
ylabel('hodnota složky [-]')
%ylim([-10 10])
title('Prùbìhy složek PId regulátoru')
