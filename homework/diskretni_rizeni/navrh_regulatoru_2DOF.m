close all
Gs = (s+9)/(s^2 + 5*s -6);
h = 0.05;
G = sdf(c2d(tf(Gs), h, 'tustin')) %diskretizovan� model
a = G.den; b = G.num;

step(tf(Gs), tf(G*1.1,h), 5); %porovn�n� soustav. Zaj�m� n�s jen 5s (rychle to diverguje)
figure
% odezva G je p�en�sobena mal�m ��slem, aby bylo vid�t, �e se oba pr�b�hy
% p�ekr�vaj�.

%Je soustava �iditeln�?
assert(rank(ctrb(ss(G))) == deg(G.den)); %ano je, jinak bych nedok�zal um�stit v�echny p�ly.

%nalezen� spojit�ch p�l� spl�uj�c�ch stanoven� po�adavky an dynamiku:
OS = 30/100;
settling = 5; %procenta ust�len�
Ts = 3; %s

%�asov� vlastrnosti p�epo�tu na frekven�n�
damping = -log(OS) / sqrt(pi^2 + log(OS)^2); %zeta
omega_n = 4/(damping*Ts); %w_n %%-log(0.02 * sqrt(1-damping^2)/damping)
damped_freq = omega_n * sqrt(1-damping^2); %w_d

%z nich polohu dominantn�ch p�l�
dominant_poles = [-omega_n*damping + i*damped_freq; -omega_n*damping - i*damped_freq]';

%Proto�e G je ��du 2 a j� pot�ebuji ryz� regul�tor, bude m�t CL
%charakteristick� polynom t�et�ho stupn�. Dal��m p�lem chci vykr�tit nulu.
CL_deg = 2 * deg(G.den) - 1;
%Oba p�ly maj� re�lnou ��st rovnu -0.67. Um�st�n� dal��ho p�lu do -9 je v po��dku.

cont_poles = [dominant_poles -9];
assert(length(cont_poles) == CL_deg); %m�m spr�vn� po�et p�l�?
discrete_poles = exp(h * cont_poles) %p�evod spojit�ch p�l� do diskr�tn�ho sv�ta

%Z�stala mi zachov�na stabilita?
assert(all(abs(discrete_poles) < 1));

%Z polohy ko�en� naleznu ��dan� charakteristick� polynom uzav�en� smy�ky.
CL_char_poly = lop(poly(discrete_poles), CL_deg, z)

%spln�n� dynamick�ch po�adavk�
[p, q] = axbyc(a, b, CL_char_poly)


%spln�n� sledov�n� ... chci sledovat skok, ten m� obraz z/(z-1).
f = z-1;
[t, r] = axbyc(f, b, CL_char_poly)
%hledan� regul�tor vykon�v� funci u(z) = q/p y(z) + r/p y_r(z)

%Ov��en� stabilizace. Mus�m sestrojit vn�j�� popis CL a pak na n�j pustit skok.
CL_discrete = coprime(r*(G/p) / (1 + G/p*q));
%DC_gain = value(CL_discrete, 1)
%r = r/DC_gain; 
%CL_discrete = CL_discrete/DC_gain;

step(tf(CL_discrete, h), tf(0.95), tf(1.05))
