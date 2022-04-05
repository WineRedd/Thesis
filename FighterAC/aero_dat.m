S_ref = 72; %Reference Area [m^2]
b     = 12; %Reference length
Izz   = 450000; % Inertia
Ixx   = 50000;
g     = 9.81;
mass  = 30000;
d2r   = pi/180;
beta  = (-10:1:10)'*d2r;
V_ini = 150; %m/s

% Yawing Moment Coefficient
an      = -3.386;    %[rad^-3]
bn      = -0.00875; %[rad^-2]
cn      =  0.1116;   %[rad^-1]
Cn_beta = an*beta.^3 + bn*beta.^2 + cn*beta;
Cn_p    = -0.035;
Cn_r    = -0.3;
Cn_da   = -0.0063;
Cn_dr   = -0.0893;

% Rolling Moment Coefficient
al      = -1.904;    %[rad^-3]
bl      = -0.00243;   %[rad^-2]
cl      = -0.04633;   %[rad^-1]
Cl_beta = al*beta.^3 + bl*beta.^2 + cl*beta;
Cl_p    = -0.25;
Cl_r    = 0.065;
Cl_da   = -0.0732;
Cl_dr   = 0.0197;

% Side Force Coefficient
ay      = 5.083;    %[rad^-3]
by      = 0.009127;   %[rad^-2]
cy      = -0.3148;   %[rad^-1]
Cy_beta = ay*beta.^3 + by*beta.^2 + cy*beta;
Cy_p    = 0.1;
Cy_r    = 0.4;
Cy_da   = 0.0213;
Cy_dr   = 0.2539;


%% Aerodata visualization
figure(1)
subplot(1,3,3)
plot(beta/d2r,Cn_beta,'-r','linewidth',2)
a=xlabel('$\beta (deg)$','interpreter','latex');
a.FontSize=15;
a=ylabel('Cn','interpreter','latex');
a.FontSize=15;
a=title('Cn vs $\beta$','interpreter','latex');
a.FontSize=15;
xlim([-10 10])
grid on
subplot(1,3,2)
plot(beta/d2r,Cl_beta,'-r','linewidth',2)
a=xlabel('$\beta (deg)$','interpreter','latex');
a.FontSize=15;
a=ylabel('Cl','interpreter','latex');
a.FontSize=15;
a=title('Cl vs $\beta$','interpreter','latex');
a.FontSize=15;
xlim([-10 10])
grid on
subplot(1,3,1)
plot(beta/d2r,Cy_beta,'-r','linewidth',2)
a=xlabel('$\beta (deg)$','interpreter','latex');
a.FontSize=15;
a=ylabel('Cy','interpreter','latex');
a.FontSize=15;
a=title('Cy vs $\beta$','interpreter','latex');
a.FontSize=15;
xlim([-10 10])
grid on
set(gcf,'Position',[100 100 1000 500])
h=suptitle('Lateral-Directional Aerodynamic Coefficients');
h.Interpreter = 'Latex';



