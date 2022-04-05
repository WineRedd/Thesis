[T, a, ~, rho] = atmosisa(10000);

Y_beta=0.5*rho*V_ini^2*(-0.312)*S_ref/(mass*V_ini);
Y_r      = 0.5*rho*V_ini^2*(Cy_r)*S_ref*b/(2*mass*V_ini^2);
Y_p      = 0.5*rho*V_ini^2*(Cy_p)*S_ref*b/(2*mass*V_ini^2);
Y_delta_a= 0.5*rho*V_ini^2*(Cy_da)*S_ref/(mass*V_ini);
Y_delta_r= 0.5*rho*V_ini^2*(Cy_dr)*S_ref/(mass*V_ini);

N_beta=0.5*rho*V_ini^2*(0.11)*S_ref*b/(Izz);
N_p=0.5*rho*V_ini^2*(Cn_p)*S_ref*b*b/(Izz*2*V_ini);
N_r=0.5*rho*V_ini^2*(Cn_r)*S_ref*b*b/(Izz*2*V_ini);
N_delta_a=0.5*rho*V_ini^2*(Cn_da)*S_ref*b/(Izz);
N_delta_r=0.5*rho*V_ini^2*(Cn_dr)*S_ref*b/(Izz);

L_beta=0.5*rho*V_ini^2*(-0.047)*S_ref*b/(Ixx);
L_p=0.5*rho*V_ini^2*(Cl_p)*S_ref*b*b/(Ixx*2*V_ini);
L_r=0.5*rho*V_ini^2*(Cl_r)*S_ref*b*b/(Ixx*2*V_ini);
L_delta_a=0.5*rho*V_ini^2*(Cl_da)*S_ref*b/(Ixx);
L_delta_r=0.5*rho*V_ini^2*(Cl_dr)*S_ref*b/(Ixx);

A_real=[Y_beta Y_p+sind(20) -cosd(20)+Y_r g/V_ini; 
        L_beta L_p  L_r   0      ;
        N_beta N_p  N_r   0      ;
        0      1    tand(20)     0       ];

B_real=[ Y_delta_a Y_delta_r;
         L_delta_a L_delta_r;
         N_delta_a N_delta_r;
         0         0       ];
     

% 100*((sysmodel_DMDc.B-B_real)./sysmodel_DMDc.B) 

% 100*((sysmodel_DMDc.A-A_real)./sysmodel_DMDc.A) 