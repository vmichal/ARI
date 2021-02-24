%nejdøíve je potøeba pustit simulinkový model nelinearni.slx

% Ukázka vykreslení grafu
figure(1); clf;hold on
plot(out.output.time, out.output.signals(1).values,'LineWidth', 2, "Color", 'g');
plot(out.output.time, out.output.signals(2).values,'LineWidth', 2, "Color",'b');
legend('nelineární systém','linearizovaný model','Location',"northwest")
grid on;
xlabel('Èas [s]')
ylabel('Rychlost [m/s]')
title({'Èasový prùbìh rychlosti nelineárního a','linearizovaného modelu auta pro obdélníkový vstup', 'se støídou 1%, amplitudou 500 Nm a frekvencí 1Hz'})