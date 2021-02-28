%% m-file for pendulum settings.
% The simulink model is in pendulum.mdl file.
%
% EITHER
% 1) Run this script/function to adjust the necessary constants, initial
% conditions and constant input (momentum of the actuator).
%
% 2) Go into the simulink model and run the simulation by pressing "run"
% button (a green triangle). In this case:
%           Change set point via 
%           SP = [x1 x2 u] = [phi phi' mc]
%           and initial conditions via 
%           x0 = [x1(0) x2(0)] = [phi(0) phi'(0)]
%           for exmple
%           SP=[0 0 0]; x0=[pi/4 0];    % hanging pendulum / down / lower location
%           SP=[pi 0 0]; x0=[pi-0.01 0];% standing pendulum / up / upper location
%           SP=[pi/2 0 m*g*l]; x0=[pi/2-0.01 0];Mc=m*g*l;% horizontal              
%           
%
% OR
% 1) Uncomment the last sections and run only this script. The variable
% simDuration (r.17) and model (r.70) could be adjusted by yourself.
%

%% duration of simulation
simDuration = 5; % [s] 

%% physical constants

g = 9.81; % [m/s^2] : gravitational acceleration
m = 0.3; % [kg] : mass on the pendulum
l = 0.7; % [m] : length of pendulum

%% input = momentum of the actuator

deltaT = 0.01; % only for time axis of 'momentum' signal
momentum.time = 0:deltaT:simDuration;
momentum.signals.values = zeros(simDuration/deltaT+1,1);
% peak(s) in momentum
%Tpeak = 1.5; % 0 <= Tpeak <= simDuration ... peak time
Tpeak = 0;
momentum.signals.values(Tpeak/deltaT+1) = -30; % peak value

Mc = 0; %  constant momentum in [Nm]

%% initial conditions: x0 = [x1(0) x2(0)] = [phi(0) phi'(0)]
% Set all values due to the angles being in radians.

x0 = [pi/4 0];

%% set point: sp = [x1 x2 u] = [phi phi' mc]
% The same units as in the previous point.

SP = [0 0 0]; % hanging pendulum / down / lower location
% SP = [pi 0 0]; % standing pendulum / up / upper location
% SP = [pi/2 0 m*g*l]; % horizontal

%% run the simulink 1 from this m-file
% Either run the simulink 1 or uncomment this part and run it as well.

%clear outputs

%sim('ARI_pendulum_lin_nonlin.mdl',simDuration);
%signals = outputs.signals.values;
%timeSim = outputs.time;
%dTimeSim = timeSim(2:end)-timeSim(1:end-1);

%figure(1);
%plot(timeSim,signals(:,1),'b','linewidth',1)
%hold on
%plot(timeSim,signals(:,2),'r','linewidth',1)
%grid on
%hold off
%xlabel('time [s]');
%ylabel('angle [deg]');
%title('comparison of real system and its linear approximation.');
%legend('nonlinear model','linearly approximated model')

% % moving real pendulum - SUITABLE ONLY FOR SLOW PROCESSES !!!
% model = 1; % 1 - nonlinear, 2 - linearly approximated
% 
% for i = 1:size(signals,1)
%     figure(1)
%     plot(0,0,'.k','MarkerSize',20)
%     hold on
%     plot([0 l*cos(signals(i,model)*pi/180-pi/2)],[0 l*sin(signals(i,model)*pi/180-pi/2)],'b','LineWidth',2)
%     plot(l*cos(signals(i,model)*pi/180-pi/2),l*sin(signals(i,model)*pi/180-pi/2),'or','MarkerSize',15)
%     plot(l*cos(signals(i,model)*pi/180-pi/2),l*sin(signals(i,model)*pi/180-pi/2),'*r','MarkerSize',15)
%     grid on
%     hold off
%     axis(1.25*[-l l -l l])
%     if dTimeSim>=0.03
%         pause(dTimeSim(i)) 
%     end
% end