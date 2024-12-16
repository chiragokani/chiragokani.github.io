%% Vortex beam radiated by focused Gaussian vortex source
% Magnitude of Eq. (14) of https://doi.org/10.1121/10.0025688

ell = 1; %orbital number
G = 10; %G = ka^2/2d, k = wavenumber, a = source radius, d = focal length
Z = 1/G; %Z = 2z/ka^2, Z*G = z/d; currently set to plot at z = d
R = linspace(0,1); %R = r/a
chi = 1i*R.^2/(2*Z)./(1 + Z*(1i - G)); %auxiliary function
Q = sqrt(2*pi)*Z./R.^2.*abs(chi.^1.5.*exp(-chi).*... 
    (besseli((ell-1)/2,chi) - besseli((ell+1)/2,chi))); %paraxial pressure
figure; plot(R,Q)

%% Vortex beam radiated by unfocused Gaussian vortex source
% set G in \chi to zero
Z = 0.1; %plot at this Rayleigh distance
chi = 1i*R.^2/(2*Z)./(1 + 1i.*Z);
Q = sqrt(2*pi)*Z./R.^2.*abs(chi.^1.5.*exp(-chi).*...
    (besseli((ell-1)/2,chi) - besseli((ell+1)/2,chi)));
figure; plot(R,Q)
