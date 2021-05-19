close all
%It is expected that you have already run a simulink external simulation

time = nelin_system_data.time; %shared time of all simulations

theta = nelin_system_data.signals(1).values;
psi = nelin_system_data.signals(2).values;
thetadot = nelin_system_data.signals(3).values;
psidot = nelin_system_data.signals(4).values;
vystupZV = nelin_system_data.signals(5).values;

plot(time, [theta, thetadot, psi, psidot, vystupZV], 'LineWidth', 2);

legend('�hel nato�en� kol','�hlov� rychlost kol', 'n�klon', '�hlov� rychlost p�du', 'ak�n� z�sah','Location','northeast')
grid on;
xlim([0 16])
xlabel('�as [s]')
ylabel('Velikost sign�lu [z�kladn� jednotky veli�in]')
title({'Odezva neline�rn�ho modelu s regul�torem K_3 na po��te�n� podm�nky'})

theta = lin_system_data.signals(1).values;
psi = lin_system_data.signals(2).values;
thetadot = lin_system_data.signals(3).values;
psidot = lin_system_data.signals(4).values;

figure
plot(time, [theta, thetadot, psi, psidot], 'LineWidth', 2);

legend('�hel nato�en� kol','�hlov� rychlost kol', 'n�klon', '�hlov� rychlost p�du','Location','northeast')
grid on;
xlim([0 12])
xlabel('�as [s]')
ylabel('Velikost sign�lu [z�kladn� jednotky veli�in]')
title({'Odezva linearizovan�ho modelu s regul�torem K_2 na po��te�n� podm�nky'})
