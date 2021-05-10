%this script assumes that you have run the simulink model "nelinearni_system"
% with ramp input
close all
lin = lin_system_data.signals;
nelin = nelin_system_data.signals;
time = lin_system_data.time;

hold on
plot(time, nelin(2).values, 'r')
%plot(time, nelin(3).values, 'b')
%plot(time, nelin(4).values, 'g')


plot(time, lin(2).values, 'r--')
%plot(time, lin(3).values, 'b--')
%plot(time, lin(4).values, 'g--')

xlabel('�as [s]');
ylabel('�hel n�klonu \psi [rad]')
title({'Porovn�n� odezev na rampu vstupn�ho nap�t� u(t) = t'});
% pro skok xlim([0.8 1.8]), ylim([-20 5])
legend('neline�rn� syst�m', 'line�rn� model', 'location', 'SouthWest')
xlim([0 0.8]);
ylim([-2 0.1]); 
