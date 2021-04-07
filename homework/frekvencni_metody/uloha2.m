        my_bode = [13.5 3.9 -41 -49];
        omega = [0.1 0.3 4 10];
        semilogx(omega, my_bode);
        hold on
        my_bode = [13.5 -26.5];
        omega = [0.1 10];
        semilogx(omega, my_bode);
        legend('Zadaná frek. charakteristika', 'Proložení pro zjištìní K_v')
        t = title('Amplitudová frekvenèní charakteristika');
        t.FontSize = 20;
        
        xlabel('\omega [rad/s]');
        ylabel('20 log|H(s)| [dB]');
        set(gca,'FontSize',16)
        grid on;

      