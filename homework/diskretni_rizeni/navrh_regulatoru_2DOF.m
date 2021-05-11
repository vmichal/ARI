close all
Gs = (s+9)/(s^2 + 5*s -6);
h = 0.05;
G = sdf(c2d(tf(Gs), h, 'tustin')) %diskretizovaný model
a = G.den; b = G.num;

step(tf(Gs), tf(G*1.1,h), 5); %porovnání soustav. Zajímá nás jen 5s (rychle to diverguje)
figure
% odezva G je pøenásobena malým èíslem, aby bylo vidìt, že se oba prùbìhy
% pøekrývají.

%Je soustava øiditelná?
assert(rank(ctrb(ss(G))) == deg(G.den)); %ano je, jinak bych nedokázal umístit všechny póly.

%nalezení spojitých pólù splòujících stanovené požadavky an dynamiku:
OS = 30/100;
settling = 5; %procenta ustálení
Ts = 3; %s

%èasové vlastrnosti pøepoètu na frekvenèní
damping = -log(OS) / sqrt(pi^2 + log(OS)^2); %zeta
omega_n = 4/(damping*Ts); %w_n %%-log(0.02 * sqrt(1-damping^2)/damping)
damped_freq = omega_n * sqrt(1-damping^2); %w_d

%z nich polohu dominantních pólù
dominant_poles = [-omega_n*damping + i*damped_freq; -omega_n*damping - i*damped_freq]';

%Protože G je øádu 2 a já potøebuji ryzí regulátor, bude mít CL
%charakteristický polynom tøetího stupnì. Dalším pólem chci vykrátit nulu.
CL_deg = 2 * deg(G.den) - 1;
%Oba póly mají reálnou èást rovnu -0.67. Umístìní dalšího pólu do -9 je v poøádku.

cont_poles = [dominant_poles -9];
assert(length(cont_poles) == CL_deg); %mám správný poèet pólù?
discrete_poles = exp(h * cont_poles) %pøevod spojitých pólù do diskrétního svìta

%Zùstala mi zachována stabilita?
assert(all(abs(discrete_poles) < 1));

%Z polohy koøenù naleznu žádaný charakteristický polynom uzavøené smyèky.
CL_char_poly = lop(poly(discrete_poles), CL_deg, z)

%splnìní dynamických požadavkù
[p, q] = axbyc(a, b, CL_char_poly)


%splnìní sledování ... chci sledovat skok, ten má obraz z/(z-1).
f = z-1;
[t, r] = axbyc(f, b, CL_char_poly)
%hledaný regulátor vykonává funci u(z) = q/p y(z) + r/p y_r(z)

%Ovìøení stabilizace. Musím sestrojit vnìjší popis CL a pak na nìj pustit skok.
CL_discrete = coprime(r*(G/p) / (1 + G/p*q));
%DC_gain = value(CL_discrete, 1)
%r = r/DC_gain; 
%CL_discrete = CL_discrete/DC_gain;

step(tf(CL_discrete, h), tf(0.95), tf(1.05))
