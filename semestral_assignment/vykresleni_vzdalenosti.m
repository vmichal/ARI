close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations
start = time(1); finish = time(length(time));
distance = squeeze(signal_distance.signals.values);
theta_error = squeeze(signal_thetaerror.signals.values);

stem(time, [distance, theta_error], 'LineWidth', 2,'LineStyle','none');
hold on;
plot([0 finish], [50 50], 'g--');
legend('mìøená vzdálenost d', 'chyba theta', 'reference d_{ref}', 'location', 'southwest')
grid on;
xlabel('Èas [s]')
ylabel('Vzdálenost od pøekážky [cm]')
%ylim([30 120])
title('Vzdálenost robota od pøekážky pro proporcionální regulátor')
