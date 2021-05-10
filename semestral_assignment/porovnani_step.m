close all
%It is expected that you have already run a simulink external simulation

time = signal_voltage.time; %shared time of all simulations

voltage = squeeze(signal_voltage.signals.values);
battery = squeeze(signal_battery.signals.values) / 1000;
pwm = squeeze(signal_pwm_center.signals.values) .* battery / 100;

theta = squeeze(signal_theta.signals.values);
thetadot = squeeze(signal_thetadot.signals.values);
psi = squeeze(signal_psi.signals.values);
psidot = squeeze(signal_psidot.signals.values);

hold on;
plot(time, voltage, 'LineWidth', 2);
plot(time, pwm, 'LineWidth', 2);
plot(time, theta,'LineWidth', 2);
plot(time, thetadot,'LineWidth', 2);
plot(time, psi,'LineWidth', 2);
plot(time, psidot,'LineWidth', 2);

legend('napìtí', 'pwm', 'theta', 'thetadot', 'psi', 'psidot','Location','northwest')
grid on;
xlabel('Výstup regulátoru [V]')
ylabel('Velikost akèního zásahu [V]')
title({'Saturace akèního zásahu'})
