
K = 141253;

L = K/s/(s+50)/(s+100)

overshoot = 0.2 %given by the assignment

damping = -log(overshoot)/sqrt(pi^2 + log(overshoot)^2)

phase_margin = atan(2*damping/sqrt(-2*damping^2 + sqrt(1+ 4*damping^4)))

rad2deg(phase_margin)

%bode(L)
T = L/(1+L);
step(T)