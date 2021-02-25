s = tf('s');
%spojitý transfer function
G = (s-3)/((s+1)*(s+7));
%diskrétní pøenos
discrete_bad = c2d(G, 1/5, 'zoh');
discrete_ok = c2d(G, 1/100, 'zoh');

%koeficienty pøenosù pøepsány do modelu model_diskretizace.slx, z nìj scope
%data exportována k vykreslení.

% Ukázka vykreslení grafu
figure(1); clf;hold on
plot(out.ScopeData.time, out.ScopeData.signals(1).values,'LineWidth', 1.2, "Color", 'g');
plot(out.ScopeData.time, out.ScopeData.signals(2).values,'LineWidth', 1.2, "Color", 'b');
legend('spojitý systém','diskretizace','Location',"southeast")
grid on;
xlabel('Èas [s]')
ylabel('Velikost odezvy [-]')
title({'Èasový prùbìh odezvy spojitého a vhodnì diskretizovaného','systému na pilový signál o frekvenci 1 Hz'})

figure(2); clf;hold on
plot(out.ScopeData.time, out.ScopeData.signals(1).values,'LineWidth', 1.2, "Color", 'g');
plot(out.ScopeData.time, out.ScopeData.signals(3).values,'LineWidth', 1.2, "Color", 'b');
legend('spojitý systém','diskretizace','Location',"southeast")
grid on;
xlabel('Èas [s]')
ylabel('Velikost odezvy [-]')
title({'Èasový prùbìh odezvy spojitého a nevhodnì diskretizovaného','systému na pilový signál o frekvenci 1 Hz'})

figure(3); clf;hold on
plot(out.ScopeData.time, out.ScopeData.signals(1).values,'LineWidth', 1.2, "Color", 'g');
plot(out.ScopeData.time, out.ScopeData.signals(2).values,'LineWidth', 1.2, "Color", 'b');
plot(out.ScopeData.time, out.ScopeData.signals(3).values,'LineWidth', 1.2, "Color", 'r');
legend('spojitý systém','diskretizace vhodná', 'diskretizace nevhodná','Location',"southwest")
grid on;
xlabel('Èas [s]')
ylabel('Velikost odezvy [-]')
title({'Èasový prùbìh odezvy spojitého systému a diskretizací','na pilový signál o frekvenci 50 Hz'})
