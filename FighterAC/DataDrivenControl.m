cd('C:\Users\Can\Desktop\Thesis_v4\FighterAC')
clear all, close all, clc
addpath('../utils'); addpath('../SimulationFiles');

%% Execute this file to collect training data for model identification
aero_dat; % on-linear missile model parameters
Sim_IC % Initial conditions for simulation
sim('FighterAC.slx'); % Simulate the model and get the data
Data_Plot; % Data-set visualization
% SampleTimeAnalysis %% Different Sample Time Analysis
Noise= 2; k=1; % 0 for clean, 1 for moderate, 2 for high noise.
Data_gen_noise
Realdata; % Real Parameters
DMD_train_results;

%% MPC
plant= sysmodel_DMDc;
plant.InputName={'Aileron';'Rudder'}
plant.OutputName={'Beta','P','R','Phi'}
mpcobj = mpc(plant,0.1,20,4);
mpcobj.Weights.OutputVariables=[10 1 0 0];
mpcobj.Weights.ManipulatedVariablesRate=[0.05 0.05];
%% MPC Results
% open FighterAC_mpc % Need to open model first
if Noise == 0
display('Clean') 
s1=100;
s2=100;
s3=100;
elseif Noise == 1
s1=52;
s2=40;
s3=50;
elseif Noise == 2
s1=45;
s2=34;
s3=43;
end


sim('FighterAC_mpc')

figure(1245)
subplot(2,1,1)
plot(Beta.time,Beta.signals.values/d2r,'-r','LineWidth',1.5); hold on
plot(Bref.time(25001:end),Bref.signals.values(25001:end)/d2r,'-b','LineWidth',1.5);  hold on
ylim([[min(x(:,1))/d2r+min(x(:,1))/d2r*0.5 max(x(:,1))/d2r+max(x(:,1))/d2r*2]]);grid on
plot([0 T_final/2],[max(x(:,1))/d2r*1.2 max(x(:,1))/d2r*1.2],'--k','linewidth',1.5);
plot([T_final/2 T_final],[max(x(:,1))/d2r*1.2 max(x(:,1))/d2r*1.2],'-ok','linewidth',2)
plot([T_final Beta.time(end)],[max(x(:,1))/d2r*1.2 max(x(:,1))/d2r*1.2],'-xk','linewidth',2)
can2=text(T_final*0.75/4,max(x(:,1))/d2r+max(x(:,1))/d2r,'Training','linewidth',Line_size);
can3=text(T_final*2.5/4,max(x(:,1))/d2r+max(x(:,1))/d2r,'Validation','linewidth',2);
can4=text(T_final*1.1,max(x(:,1))/d2r+max(x(:,1))/d2r,'Control','linewidth',2);
can2.FontSize=12;can3.FontSize=12; can4.FontSize=12;
ylabel('$\beta (deg)$','interpreter','latex')
set(gca,'FontSize',14)
subplot(2,1,2)
plot(P.time,P.signals.values/d2r,'-r','LineWidth',1.5);  hold on
plot(Pref.time(25001:end),Pref.signals.values(25001:end)/d2r,'-b','LineWidth',1.5);  hold on
set(gca,'FontSize',14)
ylabel('p (deg/sec)','interpreter','latex')
legend('True Response','Reference Input','location','southeast'); 
set(gcf,'Position',[0 -100 600 800])
grid on
h=suptitle(['DMDc-MPC Control Results for $\Delta$t=',num2str(dt),'sec']);
h.Interpreter = 'Latex';