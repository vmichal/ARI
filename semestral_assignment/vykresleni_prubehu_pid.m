%close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations

error = squeeze(signal_thetaerror.signals.values);
P = squeeze(signal_P.signals.values);
I = squeeze(signal_I.signals.values);

figure
plot(time, [error/10 P I], 'LineWidth', 2);
legend('regula�n� odchylka', 'proporcion�ln� slo�ka', 'integra�n� slo�ka', 'deriva�n� slo�ka', 'location', 'southeast')
grid on;
xlabel('�as [s]')
ylabel('hodnota slo�ky [-]')
%ylim([-10 10])
title('Pr�b�hy slo�ek PId regul�toru')
