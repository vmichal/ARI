%close all
%It is expected that you have already run a simulink external simulation

time = signal_theta.time; %shared time of all simulations

error = squeeze(signal_thetaerror.signals.values);
P = squeeze(signal_P.signals.values);
I = squeeze(signal_I.signals.values);
D = squeeze(signal_D.signals.values);

figure
plot(time, [error/25 P I D], 'LineWidth', 2);
legend('regula�n� odchylka', 'proporcion�ln� slo�ka', 'integra�n� slo�ka', 'deriva�n� slo�ka', 'location', 'southeast')
grid on;
xlabel('�as [s]')
ylabel('Vzd�lenost od p�ek�ky [cm]')
ylim([-10 10])
title('Vzd�lenost robota od p�ek�ky pro proporcion�ln� regul�tor')
