

K_p_lim = -5:0.01:5;
K_i_lim = -5:0.01:5;
[K_p, K_i] = meshgrid(K_p_lim, K_i_lim);  % Get 2-D mesh for x and y based on r
condition1 = K_i > 0;
condition2 = K_p > K_i/3 - 2;
output = ones(length(K_p_lim), length(K_i_lim)); % Initialize to 1
output(~(condition1 & condition2)) = 0; % Zero out coordinates not meeting conditions.
imshow(output, 'XData', K_p_lim, 'YData', K_i_lim); % Display
axis on;

xlabel('K_p [-]');
ylabel('K_I [-]');
title('Pøípustné hodnoty koeficientù K_p, K_I regulátoru');
