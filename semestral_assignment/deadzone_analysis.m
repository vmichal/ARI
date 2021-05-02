close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations

theta = squeeze(signal_theta.signals.values);
thetadot = squeeze(signal_thetadot.signals.values);
voltage = squeeze(signal_voltage.signals.values);

hold on;
plot(voltage, [theta, thetadot], 'LineWidth', 2);

legend('�hel nato�en� kol','�hlov� rychlost kol','Location','northwest')
grid on;
xlabel('Nap�t� na motorech [V]')
ylabel('Velikost odezvy [z�kladn� jednotky veli�in]')
title({'Anal�za z�ny necitlivosti motor� p�i z�porn�m nap�t�'})
