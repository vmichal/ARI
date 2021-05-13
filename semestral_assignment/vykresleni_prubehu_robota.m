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
legend('akèní zásah','úhel natoèení kol','úhlová rychlost kol', 'náklon', 'úhlová rychlost pádu','Location','northwest')
grid on;
xlabel('Èas [s]')
ylabel('Velikost odezvy [základní jednotky velièin]')
title({'Prùbìhy z LEGO robota'})
