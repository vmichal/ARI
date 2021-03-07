
f = 1/(s+1); %zakladni odezva
h = 1 /(s+1)/(0.99*s+1); %dal�i pol blizko (pomal�)
g = 1 /(s+1)/(0.1*s+1); %je spln�no pravidlo p�ti (p�l je dokonce desetkr�t d�l)

%zd� se, �e h m� tau=2
guess = 1/(2*s+1);
%step(tf(f), tf(g), tf(h));

%Ob� odezvy jsou podobn�, ale:
% druh� ��d je na za��tku pomalej��, pak tref� inflexi a vyraz� nahoru jako
% namydlen� blesk, zat�mco ��d 1 je nejrychlej�� na za��tku a postupn�
% zpomaluje. Relativn� p�esn� se odezvy prot�naj� kolem 65% ust�len� (cca po jednom tau), ale d�l se li��.
% ��d 2 se ustaluje mnohem rycheji
step(tf(h), tf(guess));