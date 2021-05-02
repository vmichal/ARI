close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations

theta = squeeze(signal_theta.signals.values);
thetadot = squeeze(signal_thetadot.signals.values);
voltage = squeeze(signal_voltage.signals.values);

hold on;
plot(voltage, [theta, thetadot], 'LineWidth', 2);

legend('úhel natoèení kol','úhlová rychlost kol','Location','northwest')
grid on;
xlabel('Napìtí na motorech [V]')
ylabel('Velikost odezvy [základní jednotky velièin]')
title({'Analýza zóny necitlivosti motorù pøi záporném napìtí'})
