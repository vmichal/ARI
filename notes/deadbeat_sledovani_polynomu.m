%http://www.polyx.com/_ari/slajdy/Pr-ARI-24-Dt-control.pdf slide 42
syms t;
ztrans(t^2) % (z*(z + 1))/(z - 1)^3
clear t;

h = 0.5; %krok vzorkování
gen_denom = (1-zi)^3;
a = (1-zi)^2; b = h^2/2 * (zi + zi^2);
m = 1;%návrh deadbeatu;
[p, q] = axbyc(a, b, m)
[t, r] = axbyc(gen_denom, b, m)