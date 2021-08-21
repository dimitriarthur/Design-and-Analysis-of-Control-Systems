figure()
plot(r1,'LineWidth',1)
hold on
plot(ones(1,N)*0.8467,'--')
plot(s0,'LineWidth',1)
hold on
plot(ones(1,N)*2.6852,'--')
plot(s1,'LineWidth',1)
hold on
plot(ones(1,N)*-1.0321,'--')
plot(t0,'LineWidth',1)
plot(ones(1,N)*1.6531,'--')
grid
hold off

ylabel(['$R(t),S(t),T(t)$'],'Interpreter','Latex'),
xlabel('$t(s)$','Interpreter','Latex');
legend('$\hat r_1(t)$','$R(t)$','$\hat s_0(t)$','$S_0(t)$','$\hat s_1(t)$','$S_1(t)$','Interpreter','Latex',...
        'Location', 'best');
