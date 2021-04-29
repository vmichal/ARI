a = s^2 + 3*s + 2;
b = s + 1;
c = s^3 + 4*s^2 + 8*s + 5;

g = gld(a, b);

a = a/g;
b = b/g;

S = sylv([a;b])
C = [5;3;1]
X = transpose(S)\C


[x_min, y_max] = axbyc(a, b, c, 'minx')
[x_max, y_min] = axbyc(a, b, c, 'miny')