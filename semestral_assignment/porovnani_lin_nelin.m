%this script assumes that you have run the simulink model "nelinearni_system"
close all
lin = lin_system_data.signals;
nelin = nelin_system_data.signals;
time = lin_system_data.time;

hold on
plot(time, nelin(2).values, 'r')
%plot(time, nelin(3).values, 'b')
%plot(time, nelin(4).values, 'g')


plot(time, lin(2).values, 'r--')
%plot(time, lin(3).values, 'b--')
%plot(time, lin(4).values, 'g--')

xlabel('Èas [s]');
ylabel('Hodnota signálu [základní jednotky dané velièiny]')
title({'Porovnání odezev na skok napìtí u', 'Nelineární systém silnou èarou, lineární model èárkovanì'});
% pro skok xlim([0.8 1.8]), ylim([-20 5])
 xlim([0 0.8]);
legend('\psi', 'derivace \theta', 'derivace \psi', 'location', 'SouthWest')
