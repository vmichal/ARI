G = 1/s/(s+1); %spojit� soustava v OL p�enosu.
T = 2; %perioda vzorkov�n� 0.5Hz, tak�e Nyquist skon�� na frekvenci 0.25 Hz (0.5 pi = 1.57 rad/s)
method = 'zoh'; %typ vzorkov�n�

K = 1;
L = K*G; %diskr�tn� proporcion�ln� reg

sys = c2d(tf(G), T, method);
zpk(sys);
nyquist(sys) %nyquist je celou dobu pod kritick�m bodem, tak�e N = 0;
% ryze nestabiln� p�ly soustava nem�, tak�e P = 0. Tud� Z = 0 a CL bude stabiln�

CL = L/(1+L);
isstable(CL) %returns true.