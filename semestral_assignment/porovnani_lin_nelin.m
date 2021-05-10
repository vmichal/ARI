%this script assumes that you have run the simulink model "nelinearni_system"
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
ylabel('Hodnota sign�lu [z�kladn� jednotky dan� veli�iny]')
title({'Porovn�n� odezev na skok nap�t� u', 'Neline�rn� syst�m silnou �arou, line�rn� model ��rkovan�'});
% pro skok xlim([0.8 1.8]), ylim([-20 5])
 xlim([0 0.8]);
legend('\psi', 'derivace \theta', 'derivace \psi', 'location', 'SouthWest')
