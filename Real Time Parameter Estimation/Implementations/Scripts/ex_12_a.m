
N = 1000;
u = zeros(1,N);
u(50) = 1;
y = zeros(1,N);
rng(1); e = wgn(1,N, 10*log(0.5));
for k=2:N
  y(k) = [-y(k-1) u(k-1)]*[-0.8;0.5] + e(k);
end


theta = zeros(2,length(y));
P_1 = 100*eye(2);

for k=2:N
    phi = [-y(k-1) u(k-1)]';
    K = P_1*phi*inv(eye(1)+phi'*P_1*phi);
    P = (eye(2)-K*phi')*P_1;
    P_1 = P;
    theta(:,k) = theta(:,(k-1))+K*(y(k)-phi'*theta(:,(k-1)));
end

figure()
plot(theta(1,:),'LineWidth',1, 'color','#D95319')
hold on
plot(1:N,ones(size(theta(1,:)))*-0.8,'--','color','#D95319')
hold on
plot(theta(2,:),'LineWidth',1,'color','#77AC30')
hold on
plot(1:N,ones(size(theta(1,:)))*0.5,'--','color','#77AC30')
ylim([-1 1])
grid on
legend('$\hat{a}(t)$','','$\hat{b}(t)$','','Interpreter','Latex');