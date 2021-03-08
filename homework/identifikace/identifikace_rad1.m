close all;
y = hw_3a_std(18, 2, 00); %Vygenerovaná odezva
figure(3);
plot(0:n-1, y, 'LineWidth',2);
%legend('nefiltrovaná data','Location',"southeast")
xlabel('èas [s]');
ylabel('y [-]');
title('Zmìøená odezva systému pøed filtrací');
grid on
n = length(y);
filtered = [y(1); (y(1:n-2) + y(2 : n-1) + y(3:n))/3 ; y(n)];

figure(1);
plot(0:n-1, filtered, 'LineWidth',2);
%legend('filtrovaná odezva','Location',"southeast")
xlabel('èas [s]');
ylabel('y [-]');
title('Odezva systému vyhlazená klouzavým prùmìrem');
grid on
tau = 22;
k = 2;

G = 2/(1+ tau * s);

model = step(G);

figure(2)
plot(0:n-1,filtered,'LineWidth',2);

hold on
plot(0:n-1,model,'LineWidth',2);
legend('reálný systém','matematický model','Location',"southeast")
xlabel('èas [s]');
ylabel('y [-]');
title('Srovnání odezev na jednotkový skok');
grid on
