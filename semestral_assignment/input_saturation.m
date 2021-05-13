close all
%It is expected that you have already run a simulink external simulation

time = signal_voltage.time; %shared time of all simulations

voltage = squeeze(signal_voltage.signals.values);
battery = squeeze(signal_battery.signals.values) / 1000;
pwm = squeeze(signal_pwm_center.signals.values) .* battery / 100;

hold on;
plot(voltage, voltage, 'LineWidth', 2);
plot(voltage, pwm, 'LineWidth', 2);
plot(voltage, [battery, -battery], '--g', 'LineWidth', 0.5);

legend('Ide�ln� ak�n� z�sah','Re�ln� pr�b�h (saturovan�)','Nap�t� baterie (8 V)','Location','northwest')
grid on;
xlabel('V�stup regul�toru [V]')
ylabel('Velikost ak�n�ho z�sahu [V]')
title({'Saturace ak�n�ho z�sahu'})
