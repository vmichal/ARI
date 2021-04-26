a = s^2 + 3*s + 2;
b = s + 1;
c = s^3 + 4*s^2 + 8*s + 5;

g = gld(a, b);

sylv([a;b]);


[x_min, y_max] = axbyc(a, b, c, 'minx')
[x_max, y_min] = axbyc(a, b, c, 'miny')