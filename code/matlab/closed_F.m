function F = closed_F(ell, x)
    % closed_F(ell, x)
    % ell = orbital number
    % x = independent variable
    % Closed form of F_\ell for 0 \leq \ell \leq 4 given by Eqs. (8) of
    % C. A. Gokani, M. R. Haberman, M. F. Hamilton,
    % "Analytical solutions for acoustic vortex beam radiation from planar and spherically focused circular pistons"
    % JASA Express Lett., 4, 124001 (2024). https://doi.org/10.1121/10.0034739
   
    if ell == 0
        F = x.*besselj(1,x); 
    elseif ell == 1
        F = pi/2.*x.*(StruveH0(x).*besselj(1,x) - StruveH1(x).*besselj(0,x)); 
    elseif ell == 2
        F = (2-2*besselj(0,x) - x.*besselj(1, x)); 
    elseif ell == 3
        F = ((3*pi/2*x.*StruveH0(x) - 8).*besselj(1, x) +...
        (4*x - 3*pi/2*x.*StruveH1(x)).*besselj(0,x));  
    elseif ell == 4
        F = (4 - 8.*besselj(1,x)./(x) - 4*besselj(2,x) - x.*besselj(3,x));  % Example: F_ell is x to the power of 4 when ell = 4
    else
        F = NaN; 
        disp(['You chose a value of \ell that is not an integer between 0 and 4. ' ...
            'Use instead the function sum_F(ell,x,k), where k is the number of terms in the summation.']);
    end
end