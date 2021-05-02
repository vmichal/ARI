syms k1 k2 k3 k4 c1 v alpha beta theta dtheta ddtheta psi dpsi ddpsi

eq1 = k1 * ddtheta + k2 * ddpsi == 2*v*alpha - c1*dtheta + 2*beta*dpsi;
eq2 = k2*ddtheta + k3*ddpsi - k4*psi == -2*v*alpha + 2 * beta * dtheta - 2 * beta * dpsi;

equations = [eq1, eq2];

result = solve(equations, [ddtheta, ddpsi]);

result.ddtheta
result.ddpsi