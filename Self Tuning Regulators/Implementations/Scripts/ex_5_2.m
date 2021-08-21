
R1 = b(2)/b(1); S0 = (am(1)-a(1))/b(1); 
S1 = (am(2)-a(2))/b(1);  T0 = (bm(1))/b(1); 

figure()
plot(r1,'LineWidth',1)
hold on
plot(ones(1,N)*R1,'--')
plot(s0,'LineWidth',1)
hold on
plot(ones(1,N)*S0,'--')
plot(s1,'LineWidth',1)
hold on
plot(ones(1,N)*S1,'--')
plot(t0,'LineWidth',1)
plot(ones(1,N)*T0,'--')
grid
hold off

ylabel(['$R(t),S(t),T(t)$'],'Interpreter','Latex'),
xlabel('$t(s)$','Interpreter','Latex');
legend('$\hat r_1(t)$','$R(t)$','$\hat s_0(t)$','$S_0(t)$','$\hat s_1(t)$','$S_1(t)$','Interpreter','Latex',...
        'Location', 'best');
