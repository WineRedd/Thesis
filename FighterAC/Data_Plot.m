%% Data Visualization

% Data Plot
figure(1)
subplot(2,2,1)
plot(T_span,Beta.signals.values*180/pi)
a=xlabel('Time','interpreter','latex');
a.FontSize=10;
a=ylabel('$\beta (deg)$','interpreter','latex');
a.FontSize=12;
a=title('AoS vs Time','interpreter','latex');
a.FontSize=12;
grid on
subplot(2,2,2)
plot(T_span,Phi.signals.values*180/pi)
a=xlabel('Time','interpreter','latex');
a.FontSize=10;
a=ylabel('$\Phi (deg)$','interpreter','latex');
a.FontSize=12;
a=title('Bank Angle vs Time','interpreter','latex');
a.FontSize=12;
grid on
subplot(2,2,3)
plot(T_span,P.signals.values*180/pi)
a=xlabel('Time','interpreter','latex');
a.FontSize=10;
a=ylabel('$p (deg/sec)$','interpreter','latex'); 
a.FontSize=12;
a=title('Roll rate vs Time','interpreter','latex');
a.FontSize=12;
grid on
subplot(2,2,4)
plot(T_span,R.signals.values*180/pi)
a=xlabel('Time','interpreter','latex');
a.FontSize=10;
a=ylabel('$r (deg/sec)$','interpreter','latex');
a.FontSize=12;
a=title('Yaw rate vs Time','interpreter','latex');
a.FontSize=12;
grid on
h=suptitle('Outputs');
h.Interpreter = 'Latex';
set(gcf,'Position',[100 100 600 400])

figure(3)
subplot(1,2,1)
plot(T_span,Ail.signals.values*180/pi)
a=xlabel('Time','interpreter','latex');
a.FontSize=12;
a=ylabel('$\delta_a (deg)$','interpreter','latex');
a.FontSize=12;
a=title('Aileron deflection vs Time','interpreter','latex');
a.FontSize=12;
grid on
subplot(1,2,2)
plot(T_span,Rud.signals.values*180/pi)
a=xlabel('Time','interpreter','latex');
a.FontSize=12;
a=ylabel('$\delta_{r} (deg)$','interpreter','latex');
a.FontSize=12;
a=title('Rudder deflection vs Time','interpreter','latex');
a.FontSize=12;
grid on
h=suptitle('Inputs');
h.Interpreter = 'Latex';
set(gcf,'Position',[100 100 600 400])


% saveas(gcf,['../DATA/Figures/AllDataTraining','Noise =',num2str(Noise_on),'.png']);
% close

% saveas(gcf,['../DATA/Figures/UsedDataTraining','Noise =',num2str(Noise_on),'.png']);
% close