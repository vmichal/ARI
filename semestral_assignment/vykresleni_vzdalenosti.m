close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations
start = time(1); finish = time(length(time));
distance = squeeze(signal_distance.signals.values);
theta_error = squeeze(signal_thetaerror.signals.values);

stem(time, [distance, theta_error], 'LineWidth', 2,'LineStyle','none');
hold on;
plot([0 finish], [50 50], 'g--');
legend('m��en� vzd�lenost d', 'chyba theta', 'reference d_{ref}', 'location', 'southwest')
grid on;
xlabel('�as [s]')
ylabel('Vzd�lenost od p�ek�ky [cm]')
%ylim([30 120])
title('Vzd�lenost robota od p�ek�ky pro proporcion�ln� regul�tor')
