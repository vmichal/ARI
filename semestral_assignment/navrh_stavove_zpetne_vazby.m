%M�me syst�m maticeA, maticeB, chceme pro n�j navrhnout stavovou zp�tnou
%vazbu pro stabilizaci �hlu n�klonu \psi.

%zad�n je max p�ekmit 20% a co nejkrat�� �as dosa�en�.

overshoot = 0.08; % pro optim�ln� ��zen�; pro regul�tory K_1,2 je 0.2 
settling_time = 1; %s; pro optim�ln� ��zen�. Pro K_1,2 je 1.5
damping = -log(overshoot)/sqrt(pi^2 + log(overshoot)^2);
sigma = 4/settling_time;

current_poles = eig(maticeA)
rank(ctrb(maticeA, maticeB)) % vych�z� 4, syst�m je pln� �iditeln� a lze um�stit v�echny p�ly.
omega_damped = sigma/damping * sqrt(1-damping^2);

last_placed_pole = 0; %for independence on theta
%last_placed_pole = -0.5 %for good stability (K_2, K_3)

desired_poles = [-231; last_placed_pole; -sigma + omega_damped * i; -sigma - omega_damped * i]

desired_char_polynomial = lop(poly(desired_poles), length(desired_poles),  's');

stavova_ZV = acker(maticeA, maticeB, desired_poles)

