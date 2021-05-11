close all
Gs = tf((s+9)/(s^2 + 5*s -6));
h = 0.05;
G = c2d(Gs, h, 'tustin') %diskretizovan� model

step(Gs, G, 3); %porovn�n� soustav. Zaj�m� n�s jen 5s (rychle diverguje)
legend('spojit� soustava', 'diskr�tn� model', 'location', 'northwest');
title('Srovn�n� odezvy spojit�ho a dikretizovan�ho syst�mu')


%pidTuner(G);

%nalezen� vylad�n� regul�tor je v prom�nn� Controller, je to paraleln� diskr�tn� PI
%regul�tor s konstantami Kp = 4.8, Ki = 4.83;

OL = Controller * G;
CL = OL/(1+OL);
assert(isstable(CL.den))

step(CL,5);
title('Odezva na skok stabilizovan�ho diskr�tn�ho syst�mu')

