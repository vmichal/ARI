%Provede identifikaci motoru robota z odezvy na skok.

%soubor vygenerovan� z LEGO NXT programu. Na motor bylo aplikov�no 60% PWM
fid = fopen('motor_data_identifikace.txt','r');
encoder = sscanf(fgetl(fid),'%f');
time = sscanf(fgetl(fid),'%f');
fclose(fid);

N = length(encoder);
encoder = encoder / 180 * pi; %p�evod stupn� -> radi�ny

velocity = [0; (encoder(2:N)-encoder(1:N-1)) ./ (time(2:N) - time(1:N-1))]; %rad za ms
velocity = velocity * 1000; %p�evod na rad za s
velocity(2:N-1) = (velocity(1:N-2) + velocity(2:N-1) + velocity(3:N))/3;

time = time - time(1); %normalizace �asu (odstran�n� offsetu n�kolik vte�in p�ed za��tkem d�je)

jiz_ustaleno = time > 100;
t_0 = time(jiz_ustaleno); t_0 = t_0(1);
enc_0 = encoder(jiz_ustaleno); enc_0 = enc_0(1);

rychlost = 9.6;
prolozeni = enc_0 + (time-t_0)/1000*rychlost;

plot(time(1:60), [encoder(1:60), prolozeni(1:60)])
legend('�ten� z enkod�ru', 'line�rn� asymptota', 'location' , 'northwest');
title('Odezva motoru na skok nap�t�')
grid on
xlabel('�as [ms]')
ylabel('Nato�en� motoru [rad]');

U_bat = 8; %V
U_in = U_bat * 0.6;

G = 9.6/s/(0.037*s+1)/U_in
