close all
%It is expected that you have already run a simulink external simulation

time = nelin_system_data.time; %shared time of all simulations

theta = nelin_system_data.signals(1).values;
psi = nelin_system_data.signals(2).values;
thetadot = nelin_system_data.signals(3).values;
psidot = nelin_system_data.signals(4).values;
vystupZV = nelin_system_data.signals(5).values;

plot(time, [theta, thetadot, psi, psidot, vystupZV], 'LineWidth', 2);

legend('úhel natoèení kol','úhlová rychlost kol', 'náklon', 'úhlová rychlost pádu', 'akèní zásah','Location','northeast')
grid on;
xlim([0 16])
xlabel('Èas [s]')
ylabel('Velikost signálu [základní jednotky velièin]')
title({'Odezva nelineárního modelu s regulátorem K_3 na poèáteèní podmínky'})

theta = lin_system_data.signals(1).values;
psi = lin_system_data.signals(2).values;
thetadot = lin_system_data.signals(3).values;
psidot = lin_system_data.signals(4).values;

figure
plot(time, [theta, thetadot, psi, psidot], 'LineWidth', 2);

legend('úhel natoèení kol','úhlová rychlost kol', 'náklon', 'úhlová rychlost pádu','Location','northeast')
grid on;
xlim([0 12])
xlabel('Èas [s]')
ylabel('Velikost signálu [základní jednotky velièin]')
title({'Odezva linearizovaného modelu s regulátorem K_2 na poèáteèní podmínky'})
