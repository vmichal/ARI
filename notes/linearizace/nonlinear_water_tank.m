%% Simulink linearization
clear all;
close all;
% Author: Jan Hauser
% Differential equation of Nonlinear Water Tank:
% 
% dh   hmax^2*(kmu*mu-kv*sqrt(h))
% -- = --------------------------
% dt         pi*rmax^2*h^2)

hmax = 5;               % ... height [m]
rmax = 2;               % ... maximal radius [m]
kv = 0.2;               % ... valve coefficient [m2.5/s]
kmu = 0.8;              % ... valve flow coefficient [m3/s]

% Steady state: 
% 
% dh
% -- = 0
% dt 
% 
%       kv*sqrt(hp)
% mup = -----------
%          kmu

hp = 0.2;               % ... initial height [m], try to change in interval (0-5>
mup = kv*sqrt(hp)/kmu;  % ... control valve opening coefficient [~]; steady state => equilibrium
% mup = 0.4;              % ... control valve opening coefficient [~]; custom operation point

disp(['Operation point [hp; mup]= [',num2str(hp),'; ',num2str(mup),']'])
disp('Trajectory [htilde; htildedot]= [1-exp(-t),;exp(-t)]')

%% Linearization

syms f(h,mu)
f(h,mu) = hmax^2*(kmu*mu-kv*sqrt(h))/(pi*rmax^2*h^2);

% Derivation according to x and u:
dh = diff(f,h);
dmu = diff(f,mu);

% Define linearized system in operation point:
A = double(dh(hp,mup));
B = double(dmu(hp,mup));
C = 1;
D = 0;
sys = ss(A,B,C,D);
figure(1);
step(sys);

%% Show region of validity 
mugrid = max(0.1, mup-0.1):0.01:min(1,mup+0.1);
hgrid = max(0.1, hp-0.1):0.01:min(5,hp+0.1);
[mu, h] = meshgrid(mugrid,hgrid);

ii = size(mugrid,2);
jj = size(hgrid,2);
hdotnl = double(f(h,mu));
hdotl = A*(h-hp)+B*(mu-mup);
op = double(f(hp, mup));

figure(2);
mesh(h,mu,hdotnl,'edgecolor','b');
hold on;
mesh(h,mu,hdotl,'edgecolor','r');
scatter3(hp,mup,op,'g');
xlabel('h');
ylabel('mu');
zlabel('dh/dt');
legend('Nonlinear Water Tank', 'Linearized Water Tank', 'Operation Point');
