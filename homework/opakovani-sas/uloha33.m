%nejdøíve je potøeba pustit simulinkový model model33.slx

% Ukázka vykreslení grafu
figure(1); clf;hold on
plot(out.outputs.time, out.outputs.signals(1).values,'LineWidth', 2, "Color", 'g');
plot(out.outputs.time, out.outputs.signals(2).values,'LineWidth', 2, "Color",'b');
legend('nelineární systém','linearizovaný model','Location',"southwest")
grid on;
xlabel('Èas [s]')
ylabel('Velikost odevzy [-]')
title({'Èasový prùbìh odezvy nelineárního a','linearizovaného systému pro vstup u(t) = 1'})