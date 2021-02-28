%R�zn� p�enosy:
g1 = 1/((s+1)*(s+1)); %bez nul
g2 = (s^2+1)/((s+1)*(s+1)); %nula na frekvenci, kter� je na vstupu
g3 = (s^2+1.1)/((s+1)*(s+1)); %nula t�sn� vedle

omega = 1; %rad/s

%Pro zaj�mavost: zes�len�, f�zov� posun
[gain1, phase1] = bode(tf(g1), omega); %informaci z�sk�m vestav�nou funkc� CST
%nebo ru�n�:
g_at_omega = value(g1, omega*1i);
gain2 = abs(g_at_omega);
phase2 = angle(g_at_omega);

%Na vstup pos�l�me sinus 1rad/s
u = 1/(s^2+1);

y1 = g1 * u; %obraz v�stupu
y2 = g2 * u;
y3 = g3 * u;

partial(y1)%rozklad na parci�ln� zlomky, m�me v�razy pro 
%   (s+1), (s+1)^2 v p�irozen� odezv�, jsou to stabiln� m�dy, tak�e se po n�jak� dob� ust�l�
%   (s+i)(s-i) v nucen� odezv�, jsou na mezi stability, nikdy se neust�l�
partial(y2)
partial(y3) 

%Pro y2 v odezv� z�stal 10e-16 vliv sinu, ale to je vliv numerick�ch chyb.
%Z�rove� n�m to p�ipom�n�, �e v realit� se nuly a p�ly taky nikdy nevykr�t�.
%y3 - a�koli je nula velmi bl�zko - m� pod�l sinu 0.05, co� je celkem dost.
