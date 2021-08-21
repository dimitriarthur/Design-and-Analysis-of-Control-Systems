theta = zeros(4,N);
R = zeros(1,N); s0 = zeros(1,N);
s1 = zeros(1,N); T = zeros(1,N);
lambda = 1;
%initial estimation
theta(:,1:2) = [0 0; 0 0; 0.01 0.01; 0.2 0.2]; %[a1; a2; b1; b2]
%covariance matrix P(1,1)=P(2,2)=100, P(3,3)=P(4,4)=1
P_1 = [100 0 0 0;0 100 0 0;0 0 1 0;0 0 0 1];

%y(t) = -a1y(t-1) -a2y(t-2) + b0u(t-1) + bu1u(t-2)
for k=3:N
    phi = [-ym(k-1) -ym(k-2) u(k-1) u(k-2)]';
    K = P_1*phi*inv(lambda+phi'*P_1*phi);
    P = (eye(4)-K*phi')*P_1/lambda;
    P_1 = P;
    theta(:,k) = theta(:,(k-1))+K*(ym(k)-phi'*theta(:,(k-1)));
    %
    a1 = theta(1,k); a2 = theta(2,k);
    b0 = theta(3,k); b1 = theta(4,k);
    %
    r1(k) = b1/b0; s0(k) = (am(1)-a1)/b0;
    s1(k) = (am(2)-a2)/b0; t0(k) = (bm(1))/b0;
end

subplot(2,1,1)
stairs(theta(1,:),'LineWidth',1)
hold on
plot(ones(1,N)*a(1),'--')
hold on
stairs(theta(2,:),'LineWidth',1)
hold on 
    plot(ones(1,N)*a(2),'--')
hold off
ylabel('$a(t)$','Interpreter','Latex'),
xlabel('$t(s)$','Interpreter','Latex');
grid
legend('$\hat a_1(t)$','$a_1(t)$','$\hat a_2(t)$','$a_2(t)$','Interpreter','Latex',...
        'Location', 'eastoutside');

subplot(2,1,2)
stairs(theta(3,:),'LineWidth',1,'color','#77AC30')
hold on 
plot(ones(1,N)*b(1),'--','color','#77AC30')
hold on
stairs(theta(4,:),'LineWidth',1,'color','#D95319')
hold on
plot(ones(1,N)*b(2),'--','color','#D95319')
hold off
ylabel('$b(t)$','Interpreter','Latex'),
xlabel('$t(s)$','Interpreter','Latex');
grid
legend('$\hat b_1(t)$','$b_1(t)$','$\hat b_2(t)$','$b_2(t)$','Interpreter','Latex',...
        'Location', 'eastoutside');