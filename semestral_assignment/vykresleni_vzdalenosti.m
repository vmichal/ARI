%close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations
start = time(1); finish = time(length(time));
distance = squeeze(signal_distance.signals.values);
theta_error = squeeze(signal_thetaerror.signals.values);

figure
stem(time, [distance, theta_error], 'LineWidth', 2,'LineStyle','none');
hold on;
plot([0 finish], [d_ref d_ref], 'g--');
plot([0 finish], [255 255], 'r--');
hold off;
legend('mìøená vzdálenost d', 'error term d-d_{ref}', 'reference d_{ref}', 'saturace senzoru', 'location', 'northwest')
grid on;
xlabel('Èas [s]')
ylabel('Vzdálenost [cm]')
%ylim([30 120])
title('Vzdálenost robota od pøekážky pro proporcionální regulátor')
