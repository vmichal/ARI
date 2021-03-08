close all;
y = hw_3a_std(18, 2, 00); %Vygenerovan� odezva
figure(3);
plot(0:n-1, y, 'LineWidth',2);
%legend('nefiltrovan� data','Location',"southeast")
xlabel('�as [s]');
ylabel('y [-]');
title('Zm��en� odezva syst�mu p�ed filtrac�');
grid on
n = length(y);
filtered = [y(1); (y(1:n-2) + y(2 : n-1) + y(3:n))/3 ; y(n)];

figure(1);
plot(0:n-1, filtered, 'LineWidth',2);
%legend('filtrovan� odezva','Location',"southeast")
xlabel('�as [s]');
ylabel('y [-]');
title('Odezva syst�mu vyhlazen� klouzav�m pr�m�rem');
grid on
tau = 22;
k = 2;

G = 2/(1+ tau * s);

model = step(G);

figure(2)
plot(0:n-1,filtered,'LineWidth',2);

hold on
plot(0:n-1,model,'LineWidth',2);
legend('re�ln� syst�m','matematick� model','Location',"southeast")
xlabel('�as [s]');
ylabel('y [-]');
title('Srovn�n� odezev na jednotkov� skok');
grid on
