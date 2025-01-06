function F = sum_F(ell, x, max_k)
    % sum_F(ell, x, max_k)
    % ell = orbital number
    % x = independent variable
    % max_k = maximum number of terms in the sum
    % closed form of F_\ell for 0 < \ell \leq 4 given by Eqs. (8) of
    % C. A. Gokani, M. R. Haberman, M. F. Hamilton,
    % "Analytical solutions for acoustic vortex beam radiation from planar and spherically focused circular pistons"
    % JASA Express Lett., 4, 124001 (2024). https://doi.org/10.1121/10.0034739
    % If \ell = 0, \ell is reset to a small number to avoid NaN output. But
    % in that case, one should use closed_F.
    
    sum_result = 0;
    
    if ell == 0
       ell = ell + 1e-4;
        for k = 0:max_k
            term = (ell+ 2*k+1) * gamma(ell/2+k)/gamma(ell/2+2+k);
            J_term = besselj(ell+2*k+1, x);  
            sum_result = sum_result + term*J_term;
        end
        F = x.*(gamma(ell/2+1)/gamma(ell/2)).*sum_result;
    else %for all other values of \ell \neq 0:

    for k = 0:max_k
        term = (ell+ 2*k+1) * gamma(ell/2+k)/gamma(ell/2+2+k);
        J_term = besselj(ell+2*k+1, x);  
        sum_result = sum_result + term*J_term;
    end
    
    F = x.*(gamma(ell/2+1)/gamma(ell/2)).*sum_result;
    end
end

