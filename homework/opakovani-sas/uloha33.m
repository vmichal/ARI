%nejd��ve je pot�eba pustit simulinkov� model model33.slx

% Uk�zka vykreslen� grafu
figure(1); clf;hold on
plot(out.outputs.time, out.outputs.signals(1).values,'LineWidth', 2, "Color", 'g');
plot(out.outputs.time, out.outputs.signals(2).values,'LineWidth', 2, "Color",'b');
legend('neline�rn� syst�m','linearizovan� model','Location',"southwest")
grid on;
xlabel('�as [s]')
ylabel('Velikost odevzy [-]')
title({'�asov� pr�b�h odezvy neline�rn�ho a','linearizovan�ho syst�mu pro vstup u(t) = 1'})