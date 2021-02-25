tiledlayout(1, 2);
        nexttile;
        my_bode = [-78 -78 -58 -76 -116];
        omega = [0.1, 1, 10, 80, 800];
        semilogx(omega, my_bode);
        t = title('Amplitudová frekvenèní charakteristika');
        t.FontSize = 20;
        
        xlabel('\omega [rad/s]');
        ylabel('20 log|H(s)| [dB]');
        set(gca,'FontSize',16)
        grid on;

        nexttile
        my_bode = [0 0  -1.49468 (-pi/2 - 0.23643)  -pi -pi];
        omega = [0.01, 0.1, 8 10 800, 10000];
        semilogx(omega, my_bode);
        t = title('Fázová frekvenèní charakteristika');
        t.FontSize = 20;

        xlabel('\omega [rad/s]');
        ylabel('fáze [rad]');
        set(gca,'FontSize',16)
        grid on;