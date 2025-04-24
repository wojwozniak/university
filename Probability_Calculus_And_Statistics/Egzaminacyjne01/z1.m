% Wojciech Woźniak, 339644
function z1(x, k)
    % z1 - funkcja obliczająca wartość dystrybuanty rozkładu chi-kwadrat
    % w punkcie x z k stopniami swobody
    %
    % Parametry:
    % x - punkt, w którym obliczana jest wartość dystrybuanty
    % k - liczba stopni swobody
        
        if nargin < 2
            error('Funkcja wymaga dwóch argumentów: z1(x, k)');
        end

        % Rozmiar macierzy Romberga - można tu zmienić
        n = 10;
        
        % Obliczenie wartości dystrybuanty moją implementacją
        pdf_k = @(t) pdf(t, k);
        result = romberg(pdf_k, 0, x, n);
        fprintf('Wynik zwrócony przez moją implementację: %.10f\n', result);
        
        % Porównanie z wbudowaną funkcją
        p = chi2cdf(x, k);
        fprintf('Wynik z wbudowanej funkcji chi2cdf do porównania: %.10f\n', p);
    end
    
    function R = romberg(f, a, b, n)
    % ROMBERG - implementacja metody Romberga do całkowania numerycznego
    % Parametry:
    % f - funkcja całkowana
    % a - dolna granica
    % b - górna granica
    % n - rozmiar macierzy
    %
    % Zwraca:
    % R - przybliżenie całki - element (n,n) macierzy

        R_matrix = zeros(n, n);
        h = b - a;
        R_matrix(1, 1) = h * (feval(f, a) + feval(f, b)) / 2;
        
        for i = 2:n
            h = h/2;
            points = 2^(i-2);
            sum = 0;
            for k = 1:points
                x = a + (2*k-1) * h;
                sum = sum + feval(f, x);
            end
            R_matrix(i, 1) = R_matrix(i-1, 1)/2 + h*sum;
        end
        
        for j = 2:n
            for i = j:n
                left = (4^(j-1)*R_matrix(i, j-1));
                right = R_matrix(i-1, j-1);
                R_matrix(i, j) = (left - right)/(4^(j-1) - 1);
            end
        end
        
        R = R_matrix(n, n);
    end
    
    
    function R = pdf(x, k)
        % PDF - Funkcja gęstości prawdopodobieństwa rozkładu chi-kwadrat
        % Oblicza wartość funkcji gęstości prawdopodobieństwa rozkładu chi-kwadrat
        % w punkcie x z k stopniami swobody
        %
        % Parametry:
        %   x - punkt, w którym obliczana jest wartość funkcji
        %   k - liczba stopni swobody
        %
        % Zwraca:
        %   R - wartość funkcji gęstości prawdopodobieństwa w punkcie x
        
        ev = exp(-x / 2);
        xv = x^((k / 2) - 1);
        twov = 2^(k / 2);
        gv = gamma_k_2(k);
        product = twov * gv;
        frac = 1 / product;
        R = frac * ev * xv;
    end
    
    function R = fac(n)
        % FAC - Funkcja obliczająca silnię liczby n
        %
        % Parametry:
        %   n - liczba, dla której obliczana jest silnia
        %
        % Zwraca:
        %   R - wartość n!
        
        if n == 1 || n == 0
            R = 1;
        else
            R = n * fac(n - 1);
        end
    end
    
    function R = gamma_k_2(k)
        % GAMMA_K_2 - Funkcja obliczająca wartość funkcji Gamma Eulera dla k/2
        %
        % Parametry:
        %   k - liczba całkowita (stopnie swobody)
        %
        % Zwraca:
        %   R - wartość funkcji Gamma(k/2)
        
        k = int32(k);
        n = idivide(k, 2);
        
        if mod(k, 2) == 0
            R = fac(n - 1);
        else
            gam_n = fac(n - 1);
            gam_2n = fac(2 * n - 1);
            po = 2^(1 - 2 * double(n));
            fraction = double(gam_2n) / double(gam_n);
            R = sqrt(pi) * po * fraction;
        end
    end