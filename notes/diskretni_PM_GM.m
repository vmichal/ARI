L = 1/s/(s+1)^2; %open loop p�enos
f_s = 5; T = 1/f_s;
method = 'zoh'; %metoda diskretizace

disc = c2d(tf(L), T, method);

nyquist(disc);
[GM_disc, PM_disc] = margin(disc)
[GM_cont, PM_cont, W_cross_gain, W_cross_phase] = margin(tf(L)) %velice podobn� v�sledky (1.7 vs 2 GM a 17.5� vs 21� PM)

%Vzorkov�n� zan�� posun f�ze (viz str 96), jak velkou?
extra_phase = 90/pi * W_cross_phase * T; %3.9�
PM_cont - (PM_disc + extra_phase) %a to je skoro nula, tak�e lze bezpe�n� vypo��st extra f�zi.