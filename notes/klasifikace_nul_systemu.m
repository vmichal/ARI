%Založeno na pøíkladu z pøednášky 3a na slidu 6 prezentace http://www.polyx.com/_ari/slajdy/Pr-ARI-03-Pole-zero-response.pdf
%notes regarding this are pages 11-13

clear s; %make sure s is used from the polynomial toolbox

A = diag([-1 2 3 4]);
B = [1;1;0;0]; C = [1 0 1 0 ]; D = [1];

pformat rootr
nekraceny_prenos = C* (s*eye(4)-A)^-1*B + D
kraceny_prenos = sdf(A, B, C, D) % pøenos systému
pformat nice

%polynomial in the transfer function's denominator (the characteristic polynomial of said system)
a = det(s*eye(4) - A);
poles = roots(a).';

M = [s*eye(4)-A    B; -C D];
b = det(M); %polynomial in the transfer function's numerator
system_zeros = roots(b).'; %alternatively roots(M) finds all roots of said matrix (numbers that produce matrix with lower rank when plugged in).

full_ranks = [rank([s*eye(4)-A, B]),rank([s*eye(4)-A;-C])];
for zero = system_zeros
    %deal udela dovoli priradit hodnoty z vektoru dilci promenne
    comp = num2cell([ rank(vpa([zero*eye(4)-A, B])), rank(vpa([zero*eye(4)-A;-C]))] < full_ranks);
    [vstupni, vystupni] =comp{:};
    vstup = ', vstupní';
    vystup = ', výstupní';
    
    if ~vstupni & ~vystupni
       vstup = '';
       vystup = ', pøenosu';
    else
    
    if ~vstupni
        vstup = '';
    end
    if ~vystupni
        vystup = '';
    end 
    end
    disp([num2str(zero), ' je nula systému', vstup, vystup, '.']);    
end





