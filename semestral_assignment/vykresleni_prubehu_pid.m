%close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations

error = squeeze(signal_thetaerror.signals.values);
P = squeeze(signal_P.signals.values);
I = squeeze(signal_I.signals.values);
D = squeeze(signal_D.signals.values);

figure
plot(time, [error/25 P I D], 'LineWidth', 2);
legend('regulaèní odchylka', 'proporcionální složka', 'integraèní složka', 'derivaèní složka', 'location', 'southeast')
grid on;
xlabel('Èas [s]')
ylabel('Vzdálenost od pøekážky [cm]')
ylim([-10 10])
title('Vzdálenost robota od pøekážky pro proporcionální regulátor')
