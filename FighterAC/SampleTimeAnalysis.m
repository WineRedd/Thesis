%% Training processes
k=1;jk=1;
MAEplot=[]; normA=[]; dt_ind=[];
for Noise=0:1:2;
for Data_reduce=1:4:100
T_span=[0:dt_sim:T_final];
Data_gen_noise  % Preparation of the data for training & validation processes
DMD_train_results;
dt_ind(k)=dt;
normA(k,jk)=mean(EigDiff_prctg);
MAEplot(k,jk)=MAE;
k=k+1;
end
k=1;
jk=jk+1;
end
% figure(122)
% plot(dt_ind,MAEplot,'-r','linewidth',1.5)
% xlabel('Sampling Time $\Delta$t (sec)','interpreter','latex')
% ylabel('Mean Absolute Error (MAE)','Interpreter','Latex')
% title('MAE vs $\Delta$t','Interpreter','Latex')
% grid on

figure
subplot(3,1,1)
semilogy(dt_ind,normA(:,1),'-r','linewidth',1.5)
h=ylabel('Error (%)','Interpreter','Latex');
h.FontSize=15;grid on
a=title('Clean Case','interpreter','latex');
a.FontSize=12;
subplot(3,1,2)
semilogy(dt_ind,normA(:,2),'-r','linewidth',1.5)
h=ylabel('Error (%)','Interpreter','Latex');
h.FontSize=15;grid on
a=title('Medium Noise Case','interpreter','latex');
a.FontSize=12;
subplot(3,1,3)
semilogy(dt_ind,normA(:,3),'-r','linewidth',1.5)
h=ylabel('Error (%)','Interpreter','Latex');
h.FontSize=15;
grid on
h=suptitle(['Model Eigenvalue Error']);
h.Interpreter = 'Latex';
h.FontSize=20;
h=xlabel('Sampling Time $\Delta$t','interpreter','latex');
h.FontSize=15;
a=title('High Noise Case','interpreter','latex');
a.FontSize=12;
ylim([1e2 1e5])
set(gcf,'Position',[0 0 600 800])

% figure(123)
% plot(dt_ind,MSE,'-r','linewidth',1.5)
% xlabel('Sampling Time $\Delta$t','interpreter','latex')
% ylabel('Mean Absolute Error (MAE)','Interpreter','Latex')
% title('MAE vs $\Delta$t','Interpreter','Latex')
% grid on