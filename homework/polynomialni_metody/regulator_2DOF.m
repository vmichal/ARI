b = s+2;
a = s * (s-1);
r = 1;


c = (s+2+i) * (s+2-i) * (s+2);

[p,q] = axbyc(a, b, c, 'miny');
[t, r] = axbyc(s^2, b, c, 'miny');

char = a*p+b*q;r

G = coprime(b*r/char)

step(tf(1/s),tf(G/s), 5)

legend('Vstup syst�mu', 'Odezva syst�mu', 'location', 'northwest')
title('Odezva soustavy na rampu');
xlabel('�as [s]');
ylabel('Velikost odezvy');

step(G, 5);

title('Odezva soustavy na jednotkov� skok');
xlabel('�as [s]');
ylabel('Velikost odezvy');
