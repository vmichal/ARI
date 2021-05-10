%model dvojitého integrátoru, viz http://www.polyx.com/_ari/slajdy/Pr-ARI-24-Dt-control.pdf str 23

h = 0.1; %krok vzorkování
%diskrétní pøenos dvojtého integrátoru
a_z = (z-1)^2, b_z = h^2/2*(z+1);
a_s = s^2, b_s = 1;
%soustava øádu 2 (ovìøím deg(a))
deg(a_z), deg(a_s)
%pøenos v z^-1 by mìl bý tstejný jako v z, jen se vytknout z^2
a_zi = a_z * z^-deg(a_z), b_zi = b_z * z^-deg(a_z)
%pro kauzální (ryzí) regulátor musí být deg(c) = 2*2-1 a víc. Volíme tøi.
cont_poles = [-1.8 + 1i*0.5, -1.8 - 1i*0.5, -5]; %-5, aby byl dost daleko.
discrete_poles = exp(h*cont_poles)
n = length(discrete_poles)

%mám póly discrete_poles. volání poly(discrete_poles) mi z toho dá
%koeficienty v poøadí [c_3 c_2 c_1 c_0]. Z nich udìlá funkce lop(coef, deg, var) polynom
c_z = lop(poly(discrete_poles), n, z);
c_s = lop(poly(cont_poles), n, s);
c_zi = c_z * z^-n;
c_deadbeat = z^n;

%øešení pro regulátor (diofantické rovnice), pole placement.
[p_z, q_z] = axbyc(a_z, b_z, c_z);
[p_s, q_s] = axbyc(a_s, b_s, c_s);
[p_zi, q_zi] = axbyc(a_zi, b_zi, c_zi);
[p_db, q_db] = axbyc(a_z, b_z, c_deadbeat); %dosáhne ustálení po tøech krocích, jeho akèní zásah je ale dvojnásobný.
[p_db_zi, q_db_zi] = axbyc(a_zi, b_zi, 1);

discrete_reg = sdf(q_z, p_z), discrete_reg_zi = sdf(q_zi, p_zi), cont_reg = sdf(q_s, p_s), deadbeat_reg = sdf(q_db, p_db), deadbeat_reg_zi = sdf(q_db_zi, p_db_zi);
plant_s = sdf(b_s, a_s), plant_z = sdf(b_z, a_z), plant_zi = b_zi/ a_zi

%uzavøení ZV.
OL_s = cont_reg * plant_s, OL_z = discrete_reg * plant_z, OL_zi = discrete_reg_zi * plant_zi, OL_deadbeat = deadbeat_reg * plant_z, OL_deadbeat_zi = deadbeat_reg_zi * plant_zi
CL_s = OL_s/(1+OL_s), CL_z = OL_z/(1+OL_z), CL_zi = OL_zi/(1+OL_zi), CL_deadbeat = OL_deadbeat/(1+OL_deadbeat), CL_deadbeat_zi = OL_deadbeat_zi/(1+OL_deadbeat_zi)

gain_s = value(coprime(CL_s), 0), gain_z = value(coprime(CL_z), 1), gain_deadbeat = value(coprime(CL_deadbeat), 1)

step(tf(CL_s), tf(CL_z, h),  tf(CL_zi*1.01, h), tf(CL_deadbeat, h), tf(CL_deadbeat_zi*1.01, h)); %1.01 just to show the difference...