close all
Gs = tf((s+9)/(s^2 + 5*s -6));
h = 0.05;
G = c2d(Gs, h, 'tustin') %diskretizovaný model

step(Gs, G, 3); %porovnání soustav. Zajímá nás jen 5s (rychle diverguje)
legend('spojitá soustava', 'diskrétní model', 'location', 'northwest');
title('Srovnání odezvy spojitého a dikretizovaného systému')


%pidTuner(G);

%nalezený vyladìný regulátor je v promìnné Controller, je to paralelní diskrétní PI
%regulátor s konstantami Kp = 4.8, Ki = 4.83;

OL = Controller * G;
CL = OL/(1+OL);
assert(isstable(CL.den))

step(CL,5);
title('Odezva na skok stabilizovaného diskrétního systému')

