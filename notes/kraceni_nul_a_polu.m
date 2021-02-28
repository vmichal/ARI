%Rùzné pøenosy:
g1 = 1/((s+1)*(s+1)); %bez nul
g2 = (s^2+1)/((s+1)*(s+1)); %nula na frekvenci, která je na vstupu
g3 = (s^2+1.1)/((s+1)*(s+1)); %nula tìsnì vedle

omega = 1; %rad/s

%Pro zajímavost: zesílení, fázový posun
[gain1, phase1] = bode(tf(g1), omega); %informaci získám vestavìnou funkcí CST
%nebo ruènì:
g_at_omega = value(g1, omega*1i);
gain2 = abs(g_at_omega);
phase2 = angle(g_at_omega);

%Na vstup posíláme sinus 1rad/s
u = 1/(s^2+1);

y1 = g1 * u; %obraz výstupu
y2 = g2 * u;
y3 = g3 * u;

partial(y1)%rozklad na parciální zlomky, máme výrazy pro 
%   (s+1), (s+1)^2 v pøirozené odezvì, jsou to stabilní módy, takže se po nìjaké dobì ustálí
%   (s+i)(s-i) v nucené odezvì, jsou na mezi stability, nikdy se neustálí
partial(y2)
partial(y3) 

%Pro y2 v odezvì zùstal 10e-16 vliv sinu, ale to je vliv numerických chyb.
%Zároveò nám to pøipomíná, že v realitì se nuly a póly taky nikdy nevykrátí.
%y3 - aèkoli je nula velmi blízko - má podíl sinu 0.05, což je celkem dost.
