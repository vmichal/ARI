%nejd��ve je pot�eba pustit simulinkov� model nelinearni.slx

% Uk�zka vykreslen� grafu
figure(1); clf;hold on
plot(out.output.time, out.output.signals(1).values,'LineWidth', 2, "Color", 'g');
plot(out.output.time, out.output.signals(2).values,'LineWidth', 2, "Color",'b');
legend('neline�rn� syst�m','linearizovan� model','Location',"northwest")
grid on;
xlabel('�as [s]')
ylabel('Rychlost [m/s]')
title({'�asov� pr�b�h rychlosti neline�rn�ho a','linearizovan�ho modelu auta pro obd�ln�kov� vstup', 'se st��dou 1%, amplitudou 500 Nm a frekvenc� 1Hz'})