
s = tf('s');

G = (s-1)/((s+10)*(s-10)*(s+80));

opts = bodeoptions;
opts.Grid = 'on';
bodeplot(G, opts);

%èást dva, reversování zadané transfer function

w1 = 10^-3;
w2 = 10^-1;
w3 = 10^1;
w4 = 10^3;

num  = (1 - s/w2)*(1+ s/w3);
denom = (1+s/w1)* (1+s/w4);

H = -num/denom;

opts = bodeoptions;
opts.Grid = 'on';
figure
bodeplot(H, opts);
