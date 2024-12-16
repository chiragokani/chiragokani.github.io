%% Exact solution of Helmholtz equation for diffraction from circular pistons
% Numerical evaluation of Eq. (21) of manuscript "piston.pdf"

ell = 1;
K = 40; %K = ka
Z = 3; %Z = z/z_R (z_R = Rayleigh distance)
R = linspace(0,25); %R = r/a, code takes ~10-20 seconds to run at this resolution

% integral solution, x is the integration variable (\zeta in letter)
sol = zeros(1,length(R)); warning('off','all'); %initialize solution and turn off warnings
for ind = 1:length(R)
integrand = @(x) closed_F(ell,x)...  
    ./x.*besselj(ell,x*R(ind)).*...
    exp(1i*K^2*Z/2*sqrt(1-(x/K).^2))./sqrt(1-(x/K).^2);
sol(ind) = integral(integrand,0,Inf);
end 
plot(R,abs(sol))

%compare to the paraxial far field expression given by Eq. (6) of JASA Express Lett.
%%{
hold on; 
Q = abs(1/2*Z./R.^2.*closed_F(ell, 2*R/Z)); %accurate for Z > ~4
plot(R,Q,'LineStyle','--')
%}
