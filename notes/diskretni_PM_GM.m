L = 1/s/(s+1)^2; %open loop pøenos
f_s = 5; T = 1/f_s;
method = 'zoh'; %metoda diskretizace

disc = c2d(tf(L), T, method);

nyquist(disc);
[GM_disc, PM_disc] = margin(disc)
[GM_cont, PM_cont, W_cross_gain, W_cross_phase] = margin(tf(L)) %velice podobné výsledky (1.7 vs 2 GM a 17.5° vs 21° PM)

%Vzorkování zanáší posun fáze (viz str 96), jak velkou?
extra_phase = 90/pi * W_cross_phase * T; %3.9°
PM_cont - (PM_disc + extra_phase) %a to je skoro nula, takže lze bezpeènì vypoèíst extra fázi.