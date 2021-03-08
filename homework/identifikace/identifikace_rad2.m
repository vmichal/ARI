close all;
y = hw_3b_std(18, 2, 00); %Vygenerovaná odezva

k = 1;
zeta = 0.071;
omega_n = 0.313;

G = k * omega_n^2/(s^2+ 2*zeta*omega_n* s + omega_n^2);

model = step(G, length(y));


plot(0:249,y(1:250),'LineWidth',2);

hold on
plot(0:length(model)-1,model,'LineWidth',2);
legend('reálný systém','matematický model','Location',"southeast")
xlabel('èas [s]');
ylabel('y [-]');
title('Zmìøená odezva systému druhého øádu');
grid on
