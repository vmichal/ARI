close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations

theta = squeeze(signal_theta.signals.values);
thetadot = squeeze(signal_thetadot.signals.values);
voltage = squeeze(signal_voltage.signals.values);

hold on;
stem(time, voltage, 'LineWidth', 2);
plot(time, [theta, thetadot], 'LineWidth', 2);

legend('nap�t�','�hel nato�en� kol','�hlov� rychlost kol','Location','northwest')
grid on;
xlabel('�as [s]')
ylabel('Velikost odezvy [z�kladn� jednotky veli�in]')
title({'Anal�za z�ny necitlivosti motor� p�i z�porn�m nap�t�'})
