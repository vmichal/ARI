%Parametry segwaye po mojí (VoMi) upravì
%% Parameters and State-Space Matrix Calculation

% Copyright 2011 The MathWorks, Inc.

%parametry PID regulátoru 
KP = 2/200;
KI = 4/200;
KD = 0;


d_ref = 40; %cm
K_3 = [-0.2243  -17.1901   -1.0080   -2.4071]
K_2 = [-0.1883  -12.4845   -0.9211   -2.1853]
K_1 = [      0  -11.1715   -0.8910   -2.1115]

%Poèáteèní podmínky pro simulaci:
initial_theta = 0; initial_psi = pi/12; initial_thetadot = 0; initial_psidot = pi/10;
simulation_initial_conditions = [initial_theta; initial_psi; initial_thetadot; initial_psidot]

%moje konstanty
U_max = 8.3;
I_max = 0.3;
R_in = 0.65;
U_dropoff = R_in * I_max;

% Physical Constant
g = 9.81;						% gravity acceleration [m/sec^2]

% NXTway-GS Parameters
m = 0.03;						% wheel weight [kg]
R = 0.04;						% wheel radius [m]
Jw = m * R^2 / 2;				% wheel inertia moment [kgm^2]
M = 0.58;						% body weight [kg]
W = 0.17;						% body width [m]
D = 0.055;						% body depth [m]
H = 0.16;						% body height [m]
L = H / 2;						% distance of the center of mass from the wheel axle [m]
Jpsi = M * L^2 / 3;				% body pitch inertia moment [kgm^2]
Jphi = M * (W^2 + D^2) / 12;	% body yaw inertia moment [kgm^2]
fm = 0.0022;					% friction coefficient between body & DC motor
fw = 0;							% friction coefficient between wheel & floor

% DC Motor Parameters			
Jm = 1e-5;						% DC motor inertia moment [kgm^2]
Rm = 6.69;						% DC motor resistance [?¶]
Kb = 0.468;						% DC motor back EMF constant [Vsec/rad]
Kt = 0.317;						% DC motor torque constant [Nm/A]
n = 1;							% gear ratio

% NXTway-GS State-Space Matrix Calculation
alpha = n * Kt / Rm;
beta = n * Kt * Kb / Rm + fm;
tmp = beta + fw;

E_11 = (2 * m + M) * R^2 + 2 * Jw + 2 * n^2 * Jm;
E_12 = M * L * R - 2 * n^2 * Jm;
E_22 = M * L^2 + Jpsi + 2 * n^2 * Jm;

%Moje parametry pro linearizaci
k_1 = E_11;
k_2 = E_12;
k_3 = E_22;
k_4 = M * g * L;
c_1 = 2 * (beta + fw);

k = [k_1 k_2 k_3 k_4 c_1];

a = [
    2 * beta * (k_2 + k_3);
    -(2*beta*k_2 + c_1 * k_3);
    -k_2*k_4;
    2 * alpha * (k_2 + k_3);
    -2 * beta * (k_1 + k_2);
    2*beta*k_1 + c_1 *k_2;
    k_1 * k_4;
    -2 * alpha * (k_1 + k_2)    
] / (k_1 * k_3 - k_2 ^2);

maticeA = [0 0 1 0; 0 0 0 1; 0 a(3) a(2) a(1); 0 a(7) a(6) a(5)];
maticeB = [0; 0; a(4); a(8)];




detE = E_11 * E_22 - E_12^2;

A1_32 = -g * M * L * E_12 / detE;
A1_42 = g * M * L * E_11 / detE;
A1_33 = -2 * (tmp * E_22 + beta * E_12) / detE;
A1_43 = 2 * (tmp * E_12 + beta * E_11) / detE;
A1_34 = 2 * beta * (E_22 + E_12) / detE;
A1_44 = -2 * beta * (E_11 + E_12) / detE;
B1_3 = alpha * (E_22 + E_12) / detE;
B1_4 = -alpha * (E_11 + E_12) / detE;
A1 = [
	0 0 1 0
	0 0 0 1
	0 A1_32 A1_33 A1_34
	0 A1_42 A1_43 A1_44
	];
B1 = [
	0 0
	0 0
	B1_3 B1_3
	B1_4 B1_4
	];
C1 = eye(4);
D1 = zeros(4, 2);

I = m * W^2 / 2 + Jphi + (Jw + n^2 * Jm) * W^2 / (2 * R^2);
J = tmp * W^2 / (2 * R^2);
K = alpha * W / (2 * R);
A2 = [
	0 1
	0 -J / I
	];
B2 = [
	0      0
	-K / I K / I
	];
C2 = eye(2);
D2 = zeros(2);

%% Simulation and Virtual Reality Parameters

% Initial Values
PSI0 = 5 * pi / 180;				% initial value of body angle
X1IV = [							% x1 initial value
	0
	PSI0
	0
	0
	];
X2IV = [							% x2 initial value
	0
	0
	];

% Sample Rates
TS = 0.001;							% base sample rate [sec]

% Environments
GYRO0 = 600;						% initial value of gyro sensor
BATTERY = 8000;						% initial value of battery [mV]

% MAP
START_POS = [100, 100];				% initial position ([z, x]) [cm]

%% Controller Parameters 

% Task Sample Rates
ts1 = 0.004;						% ts1 sample time [sec]

% Start Time of balancing and autonomous drive
time_start = 4000;                  % start time of balancing [msec] (= gyro calibration time)

% Parameters of Coulombic & Viscous Friction
pwm_gain = 1;						% pwm gain
pwm_offset = 0;						% pwm offset 

% Low Path Filter Coefficients
a_b = 0.8;							% average battery value
a_d = 0.8;							% suppress velocity noise
a_r = 0.996;						% smooth reference signal
a_gc = 0.8;							% calibrate gyro offset
a_gd = 0.999;						% compensate gyro drift

k_sync = 0.35;						% wheel synchronization gain


