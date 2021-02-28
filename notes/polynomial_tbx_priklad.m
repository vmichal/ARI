
g = (1-s+s^2)./(1+s)^4; %pøenos systému

[A, B, C, D] = abcd(g); %udìláme si stavovou realizaci

%Jak zpìt na pøenos?
g_same1 = sdf(A, B, C, D); %Rovnou konstruktor Scalar Denominator Fraction

%Ruènì, pro zajímavost si ovìøíme nìjaké základy
char_poly = det(s*eye(length(A)) - A); %sedí se jmenovatelem pøenosu g
% koøeny charakteristického polynomu jsou vlastní èísla A a to jsou póly systému
vl_cisla = roots(char_poly); 
vl_cisla2 = eig(A); %TODO vychází trošku odlišnì, Šebek neví, proè

%inverze polynomiální matice je racionální matice.
inverze = inv(s*eye(length(A)) - A);
inverze2 = mdf(inv(s*eye(length(A)) - A)); %Matrix Denominator Fraction, pøímý konstruktor racionální funkce pro matice

prenos = C * inverze * B + D; % a vyšel úplnì stejný pøenos, z jakého jsme vyšli.
