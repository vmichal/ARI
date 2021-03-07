
f = 1/(s+1); %zakladni odezva
h = 1 /(s+1)/(0.99*s+1); %dalši pol blizko (pomalý)
g = 1 /(s+1)/(0.1*s+1); %je splnìno pravidlo pìti (pól je dokonce desetkrát dál)

%zdá se, že h má tau=2
guess = 1/(2*s+1);
%step(tf(f), tf(g), tf(h));

%Obì odezvy jsou podobné, ale:
% druhý øád je na zaèátku pomalejší, pak trefé inflexi a vyrazí nahoru jako
% namydlený blesk, zatímco øíd 1 je nejrychlejší na zaèátku a postupnì
% zpomaluje. Relativnì pøesnì se odezvy protínají kolem 65% ustálení (cca po jednom tau), ale dál se liší.
% Øád 2 se ustaluje mnohem rycheji
step(tf(h), tf(guess));