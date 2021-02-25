
% Ukázka vykreslení grafu
figure(1); clf;hold on
stairs(out.ScopeData.time, out.ScopeData.signals(1).values,'LineWidth', 2, "Color", 'r');
legend('odezva systému','Location',"northeast")
grid on;
xlabel('Èas [s]')
ylabel('Velikost odezvy [-]')
title({'Èasový prùbìh odezvy diskrétního','systému na jednotkový skok'})