%M�me syst�m maticeA, maticeB, chceme pro n�j navrhnout stavovou zp�tnou
%vazbu pro stabilizaci �hlu n�klonu \psi.
maticeC = [1 0 0 0]; %pot�ebuji na v�stupu m�t �hel theta, proto�e ten budu regulovat na nulu.

%zad�n je max p�ekmit 20% a co nejkrat�� �as dosa�en�.

%Tohe ��zen� aktu�ln� nefunguje. Nen� schopn� dos�hnout nulov� regula�n�
%odchylky.

overshoot = 0.2;
settling_time = 1.5; %s
damping = -log(overshoot)/sqrt(pi^2 + log(overshoot)^2);
sigma = 4/settling_time;

Abig = [maticeA zeros(size(maticeA, 1), 1); -maticeC 0]; Bbig = [maticeB; 0];
current_poles = eig(Abig)
assert(size(Abig, 1) == rank(ctrb(Abig, Bbig))) % vych�z� 5, syst�m je pln� �iditeln� a lze um�stit v�echny p�ly.
omega_damped = sigma/damping * sqrt(1-damping^2);

desired_poles = [-231; -0.5; -0.5; -sigma + omega_damped * i; -sigma - omega_damped * i]

desired_char_polynomial = lop(poly(desired_poles), length(desired_poles),  's');

integralni_ZV = acker(Abig, Bbig, desired_poles)

