
%Zadaný stavový model
A = [	-0.04167 0  -0.0058 ;
			0.0217  -0.24  0.0058 ;
			0  100  -2.4
            ];
        
B = [5.2;-5.2;0] ;
C = [0 0 1];

% System transfer function
G = C * inv(s*eye(3) - A) * B;
zeros = roots(G.num); %we will want to cancel these out.

%Požadavky na dynamiku:
OS = 0.1; % max pøekmit 10%
Ts = 100 * 24 *60 * 60; % 100 dní

damping = -log(OS)/sqrt(pi^2 + log(OS)^2)
assert(0<=damping && damping < 1)
nat_freq = - log(0.02 * sqrt(1-damping^2)/damping)/(Ts * damping)

%Real and imaginary component of the dominant pole pair
sigma = damping * nat_freq;
damped_freq = nat_freq * sqrt(1-damping^2);

%Desired characteristic polynomial
c = (s + sigma + i *damped_freq) * (s+sigma - i*damped_freq) * (s- zeros(1));
poles = roots(c)';

%Two different ways of obtaining the regulator elements
K = acker(A, B, poles)
K2 = [0 0 1] * inv(ctrb(A, B)) * mvalue(c, A)



