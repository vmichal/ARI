s = tf('s');
%spojit� transfer function
G = (s-3)/((s+1)*(s+7));
%diskr�tn� p�enos
discrete_bad = c2d(G, 1/5, 'zoh');
discrete_ok = c2d(G, 1/100, 'zoh');

%koeficienty p�enos� p�eps�ny do modelu model_diskretizace.slx, z n�j scope
%data exportov�na k vykreslen�.

% Uk�zka vykreslen� grafu
figure(1); clf;hold on
plot(out.ScopeData.time, out.ScopeData.signals(1).values,'LineWidth', 1.2, "Color", 'g');
plot(out.ScopeData.time, out.ScopeData.signals(2).values,'LineWidth', 1.2, "Color", 'b');
legend('spojit� syst�m','diskretizace','Location',"southeast")
grid on;
xlabel('�as [s]')
ylabel('Velikost odezvy [-]')
title({'�asov� pr�b�h odezvy spojit�ho a vhodn� diskretizovan�ho','syst�mu na pilov� sign�l o frekvenci 1 Hz'})

figure(2); clf;hold on
plot(out.ScopeData.time, out.ScopeData.signals(1).values,'LineWidth', 1.2, "Color", 'g');
plot(out.ScopeData.time, out.ScopeData.signals(3).values,'LineWidth', 1.2, "Color", 'b');
legend('spojit� syst�m','diskretizace','Location',"southeast")
grid on;
xlabel('�as [s]')
ylabel('Velikost odezvy [-]')
title({'�asov� pr�b�h odezvy spojit�ho a nevhodn� diskretizovan�ho','syst�mu na pilov� sign�l o frekvenci 1 Hz'})

figure(3); clf;hold on
plot(out.ScopeData.time, out.ScopeData.signals(1).values,'LineWidth', 1.2, "Color", 'g');
plot(out.ScopeData.time, out.ScopeData.signals(2).values,'LineWidth', 1.2, "Color", 'b');
plot(out.ScopeData.time, out.ScopeData.signals(3).values,'LineWidth', 1.2, "Color", 'r');
legend('spojit� syst�m','diskretizace vhodn�', 'diskretizace nevhodn�','Location',"southwest")
grid on;
xlabel('�as [s]')
ylabel('Velikost odezvy [-]')
title({'�asov� pr�b�h odezvy spojit�ho syst�mu a diskretizac�','na pilov� sign�l o frekvenci 50 Hz'})
