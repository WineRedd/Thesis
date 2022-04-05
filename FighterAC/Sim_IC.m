dt_sim= 2e-3;
T_final=50;
T_span=[0:dt_sim:T_final];

t = 12.5+dt_sim:dt_sim:25;
y = chirp(t,0.05,12.5-dt_sim,0.5)*0.05;
t = 0:dt_sim:12.5;
y1 = chirp(t,0.05,12.5,0.5)*0.05;


T_span1_ail0=[0:dt_sim:T_final/4];
Ail_input1 = T_span1_ail0*0;
Rud_input1 = y1;

T_span1_ail1=[T_final/4+dt_sim:dt_sim:T_final/2];
Ail_input2=y1(1:end-1);
Rud_input2=0*T_span1_ail1;

T_span1_ail2=[T_final/2+dt_sim:dt_sim:T_final/2+5];
Ail_input3=0*T_span1_ail2;
Rud_input3=0*T_span1_ail2;

T_span1_ail3=[T_final/2+5+dt_sim:dt_sim:T_final];
Ail_input4=0.05*sin(0.4*T_span1_ail3);
Rud_input4=0.05*sin(0.3*T_span1_ail3);

T_span_ail = [T_span1_ail0';T_span1_ail1';T_span1_ail2';T_span1_ail3'];
Ail_input  = [ Ail_input1'; Ail_input2'; Ail_input3';Ail_input4'];
Rud_input  = [ Rud_input1'; Rud_input2'; Rud_input3';Rud_input4'];
Input_ail  = [ T_span_ail Ail_input];
Input_rud  = [ T_span_ail Rud_input];

