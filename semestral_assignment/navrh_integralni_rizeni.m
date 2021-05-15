%Máme systém maticeA, maticeB, chceme pro nìj navrhnout stavovou zpìtnou
%vazbu pro stabilizaci úhlu náklonu \psi.
maticeC = [1 0 0 0]; %potøebuji na výstupu mít úhel theta, protože ten budu regulovat na nulu.

%zadán je max pøekmit 20% a co nejkratší èas dosažení.

%Tohe øízení aktuálnì nefunguje. Není schopné dosáhnout nulové regulaèní
%odchylky.

overshoot = 0.2;
settling_time = 1.5; %s
damping = -log(overshoot)/sqrt(pi^2 + log(overshoot)^2);
sigma = 4/settling_time;

Abig = [maticeA zeros(size(maticeA, 1), 1); -maticeC 0]; Bbig = [maticeB; 0];
current_poles = eig(Abig)
assert(size(Abig, 1) == rank(ctrb(Abig, Bbig))) % vychází 5, systém je plnì øiditelný a lze umístit všechny póly.
omega_damped = sigma/damping * sqrt(1-damping^2);

desired_poles = [-231; -0.5; -0.5; -sigma + omega_damped * i; -sigma - omega_damped * i]

desired_char_polynomial = lop(poly(desired_poles), length(desired_poles),  's');

integralni_ZV = acker(Abig, Bbig, desired_poles)

