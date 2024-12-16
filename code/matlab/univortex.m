%% Unfocused vortex beam radiated by circular piston
% Equation (6) of gokani2024analytical [replace with https://doi.org/??]

ell = 5; %for ell = 0 use Q0 or set ell to a very small number
R = linspace(0,30); %R = r/a
Z = 4; %plot at this Rayleigh distance
Q = abs(1/2*Z./R.^2.*closed_F(ell,2*R/Z));

figure; plot(R,Q);
xline(1/2*(1.2288*ell+1.4903)*Z); %ring radius

%% Focused vortex beam radiated by circular piston 
% analytical only in focal plane z = d, ZG = 1
% replace Z above with 1/G

R = linspace(0,1);
G = 10; %G = ka^2/2d, k = wavenumber, a = source radius, d = focal length
Q = abs(1./(2*G*R.^2).*closed_F(ell, 2*G*R));
figure; plot(R,Q); 
xline(1/(2*G)*(1.2288*ell+1.4903)); %ring radius

