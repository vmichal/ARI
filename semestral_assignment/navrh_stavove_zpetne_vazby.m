%Máme systém maticeA, maticeB, chceme pro nìj navrhnout stavovou zpìtnou
%vazbu pro stabilizaci úhlu náklonu \psi.

%zadán je max pøekmit 20% a co nejkratší èas dosažení.

overshoot = 0.08; % pro optimální øízení; pro regulátory K_1,2 je 0.2 
settling_time = 1; %s; pro optimální øízení. Pro K_1,2 je 1.5
damping = -log(overshoot)/sqrt(pi^2 + log(overshoot)^2);
sigma = 4/settling_time;

current_poles = eig(maticeA)
rank(ctrb(maticeA, maticeB)) % vychází 4, systém je plnì øiditelný a lze umístit všechny póly.
omega_damped = sigma/damping * sqrt(1-damping^2);

last_placed_pole = 0; %for independence on theta
%last_placed_pole = -0.5 %for good stability (K_2, K_3)

desired_poles = [-231; last_placed_pole; -sigma + omega_damped * i; -sigma - omega_damped * i]

desired_char_polynomial = lop(poly(desired_poles), length(desired_poles),  's');

stavova_ZV = acker(maticeA, maticeB, desired_poles)

