
% Uk�zka vykreslen� grafu
figure(1); clf;hold on
stairs(out.ScopeData.time, out.ScopeData.signals(1).values,'LineWidth', 2, "Color", 'r');
legend('odezva syst�mu','Location',"northeast")
grid on;
xlabel('�as [s]')
ylabel('Velikost odezvy [-]')
title({'�asov� pr�b�h odezvy diskr�tn�ho','syst�mu na jednotkov� skok'})