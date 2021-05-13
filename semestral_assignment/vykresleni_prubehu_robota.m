close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations

theta = squeeze(signal_theta.signals.values);
thetadot = squeeze(signal_thetadot.signals.values);
voltage = squeeze(signal_voltage.signals.values);
psi = squeeze(signal_psi.signals.values)*20;
psidot = squeeze(signal_psidot.signals.values);

hold on;
stem(time, voltage, 'LineWidth', 2);
plot(time, [theta, thetadot, psi, psidot], 'LineWidth', 2);
xlim([0 12])
legend('ak�n� z�sah','�hel nato�en� kol','�hlov� rychlost kol', 'n�klon', '�hlov� rychlost p�du','Location','northwest')
grid on;
xlabel('�as [s]')
ylabel('Velikost odezvy [z�kladn� jednotky veli�in]')
title({'Pr�b�hy z LEGO robota'})
