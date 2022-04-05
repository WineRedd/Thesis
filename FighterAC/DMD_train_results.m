%% DMDc assuming B = unknown and x may be augmented with time-delayed states
% Identify A, B from xdot = Ax + Bu
ModelName = 'DMDc';
tic
% [sysmodel_DMDc] = DMDc(x',u',dt);
[sysmodel_DMDc] = DelayDMDc_MV(x',u',dt,4,2,4); 

TrainingTime_DMD(k)=toc;
sysmodel_DMDc = d2c(sysmodel_DMDc,'zoh');
a_red=find(abs(sysmodel_DMDc.A)<1e-3);
sysmodel_DMDc.A(a_red)=0;
b_red=find(abs(sysmodel_DMDc.B)<1e-3);
sysmodel_DMDc.B(b_red)=0;

%% Prediction over training phase
[xDMDc,T_DMDC] = lsim(sysmodel_DMDc,u',t,x(1,:)');
pre_MAPE = abs((x(:,1)-xDMDc(:,1))./x(:,1));
MSEtrain(k) = mse(x-xDMDc);
MAEtrain(k) = mae(x-xDMDc);

%% Validation
% Truth
xA      = xv; tA      = tv;
[xB,tB] = lsim(sysmodel_DMDc,uv,tv,xv(1,:));
MSE = mse(xv-xB);
MAE = mae(xv-xB);
% 
% 
% Data Plot
Line_size=1.5;
figure(1245)
subplot(4,1,1)
plot(T_real,x_real(:,1)/d2r,'-r','LineWidth',1.5); hold on
plot(t,xDMDc(:,1)/d2r,'--b','LineWidth',1.5); hold on
plot(tB,xB(:,1)/d2r,'--b','LineWidth',1.5);
ylim([[min(x(:,1))/d2r+min(x(:,1))/d2r*0.5 max(x(:,1))/d2r+max(x(:,1))/d2r*2]]);grid on
plot([0 T_final/2],[max(x(:,1))/d2r*1.2 max(x(:,1))/d2r*1.2],'--k','linewidth',1.5);
plot([T_final/2 T_final],[max(x(:,1))/d2r*1.2 max(x(:,1))/d2r*1.2],'-ok','linewidth',2)
can2=text(T_final*0.75/4,max(x(:,1))/d2r+max(x(:,1))/d2r,'Training','linewidth',Line_size);
can3=text(T_final*2.5/4,max(x(:,1))/d2r+max(x(:,1))/d2r,'Validation','linewidth',2);
can2.FontSize=12;can3.FontSize=12;
ylabel('$\beta (deg)$','interpreter','latex')
set(gca,'FontSize',14)
subplot(4,1,2)
plot(T_real,x_real(:,2)/d2r,'-r','LineWidth',1.5);  hold on
plot(t,xDMDc(:,2)/d2r,'--b','LineWidth',1.5);
plot(tB,xB(:,2)/d2r,'--b','LineWidth',1.5);grid on
set(gca,'FontSize',14)
ylabel('p (deg/sec)','interpreter','latex')
subplot(4,1,3)
plot(T_real,x_real(:,3)/d2r,'-r','LineWidth',1.5);  hold on
plot(t,xDMDc(:,3)/d2r,'--b','LineWidth',1.5);
plot(tB,xB(:,3)/d2r,'--b','LineWidth',1.5);grid on
set(gca,'FontSize',14)
ylabel('r (deg/sec)','interpreter','latex')
subplot(4,1,4)
plot(T_real,x_real(:,4)/d2r,'-r','LineWidth',1.5);  hold on
plot(t,xDMDc(:,4)/d2r,'--b','LineWidth',1.5);
plot(tB,xB(:,4)/d2r,'--b','LineWidth',1.5);grid on
xlabel('Time','interpreter','latex');
ylabel('$\phi (deg)$','interpreter','latex')
set(gca,'FontSize',14)
legend('True','DMD','location','southeast'); 
set(gcf,'Position',[0 -100 600 800])
h=suptitle(['DMDc Training and Validation Results for $\Delta$t=',num2str(dt),'sec']);
h.Interpreter = 'Latex';
% saveas(gcf,['../DATA/Figures/DMDTrain','Noise =',num2str(Noise_on),'.png']); 

%% Eigen Comparison
Eig_real=eig(A_real);
Eig_DMDc=eig(sysmodel_DMDc);
Eig_DMDc2=Eig_DMDc;
% if Noise==2
%     Eig_DMDc(3)=Eig_DMDc2(4);
%     Eig_DMDc(4)=Eig_DMDc2(3);
% end
Abs_diff=abs(Eig_real-Eig_DMDc);
EigDiff_prctg=Abs_diff./abs(Eig_real)*100;

