x=[Beta.signals.values P.signals.values R.signals.values Phi.signals.values  ];
u=[Ail.signals.values Rud.signals.values];
x_real=x;
T_real=T_span;
% xn(:,1) = awgn(x(:,1),55);
% xnh(:,1) = awgn(x(:,1),45);
% 
% x_nm(:,1) = awgn(x(:,1),52);
% x_nm(:,2) = awgn(x(:,2),40);
% x_nm(:,3) = awgn(x(:,3),50);
% Noise1=x_nm(:,1)-x(:,1);
% Noise2=x_nm(:,2)-x(:,2);
% Noise3=x_nm(:,3)-x(:,3);
% 1/(rms(x(:,1))/rms(Noise1))*100
% 1/(rms(x(:,2))/rms(Noise2))*100
% 1/(rms(x(:,3))/rms(Noise3))*100
% 
% x_nh(:,1) = awgn(x(:,1),45.5);
% x_nh(:,2) = awgn(x(:,2),34);
% x_nh(:,3) = awgn(x(:,3),43.5);
% Noise1=x_nh(:,1)-x(:,1);
% Noise2=x_nh(:,2)-x(:,2);
% Noise3=x_nh(:,3)-x(:,3);
% 1/(rms(x(:,1))/rms(Noise1))*100
% 1/(rms(x(:,2))/rms(Noise2))*100
% 1/(rms(x(:,3))/rms(Noise3))*100
% % 
% figure(1245)
% subplot(3,1,1)
% plot(T_span,x_nh(:,1)/d2r,'-b','LineWidth',1.5); hold on
% plot(T_span,x_nm(:,1)/d2r,'-g','LineWidth',1.5); hold on
% plot(T_span,x(:,1)/d2r,'-r','LineWidth',1.5); grid on
% ylabel('$\beta (deg)$','interpreter','latex')
% set(gca,'FontSize',14)
% subplot(3,1,2)
% plot(T_span,x_nh(:,2)/d2r,'-b','LineWidth',1.5); hold on
% plot(T_span,x_nm(:,2)/d2r,'-g','LineWidth',1.5); hold on
% plot(T_span,x(:,2)/d2r,'-r','LineWidth',1.5); grid on
% set(gca,'FontSize',14)
% ylabel('p (deg/sec)','interpreter','latex')
% subplot(3,1,3)
% plot(T_span,x_nh(:,3)/d2r,'-b','LineWidth',1.5); hold on
% plot(T_span,x_nm(:,3)/d2r,'-g','LineWidth',1.5); hold on
% plot(T_span,x(:,3)/d2r,'-r','LineWidth',1.5); grid on
% set(gca,'FontSize',14)
% ylabel('r (deg/sec)','interpreter','latex')
% legend('High Noise level','Medium Noise Level','Clean Data','location','southeast'); 
% set(gcf,'Position',[100 100 600 750])
% xlabel('Time','interpreter','latex');
% h=suptitle('Noise Levels');
% h.Interpreter = 'Latex';
S = RandStream('mt19937ar','Seed',5489);

if Noise == 0
display('Clean') 
Data_reduce=50;
elseif Noise == 1
x(:,1) = awgn(x(:,1),52,0,S);
x(:,2) = awgn(x(:,2),40,0,S);
x(:,3) = awgn(x(:,3),50,0,S);
Data_reduce=50;
elseif Noise == 2
x(:,1) = awgn(x(:,1),45.5,0,S);
x(:,2) = awgn(x(:,2),34,0,S);
x(:,3) = awgn(x(:,3),43.5,0,S);
Data_reduce=50;
end

x=x(1:Data_reduce:end,:);
T_span=T_span(1:Data_reduce:end);
u=u(1:Data_reduce:end,:);
dt=dt_sim*Data_reduce;

%% Split into training and validation data set
Ntrain = ceil(length(T_span)/2);
xv = x(Ntrain+1:end,:);
x = x(1:Ntrain,:);

uv = u(Ntrain+1:end,:);
u = u(1:Ntrain,:);

tv = T_span(Ntrain+1:end);
t = T_span(1:Ntrain);

T = length(T_span);
N = length(T_span);
