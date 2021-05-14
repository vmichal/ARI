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
ylim([-2 2]);
xlim([0 2]);
xlabel('�as [s]')
ylabel('Velikost sign�lu [z�kladn� jednotky veli�in]')
title({'Odezva neline�rn�ho modelu s kompenzac� p�sma necitlivosti'})