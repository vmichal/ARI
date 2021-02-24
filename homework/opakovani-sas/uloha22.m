syms t
%results of computation
x1 = exp(-3*t) * (2*cos(2*t) - 3*sin(2*t));
x2 = -0.5*exp(-3*t)*sin(2*t);

time = 0 : 0.01 : 2.5;

% Uk�zka vykreslen� grafu
figure(1); clf;hold on
plot(time, subs(x1, t, time),'LineWidth', 2, "Color", 'g');
plot(time, subs(x2, t, time),'LineWidth', 2, "Color",'b');
legend('x1(t)','x2(t)','Location',"northeast")
grid on;
xlabel('�as [s]')
ylabel('Funk�n� hodnota [-]')
title('�asov� pr�b�h �e�en� soustavy ODR')