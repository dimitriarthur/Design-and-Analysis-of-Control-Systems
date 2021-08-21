
N = 1000;
onePeriod = [zeros(1,50) ones(1,50)];
u = repmat(onePeriod,[1 N/100]);
rng(1); e = wgn(1,N, 10*log(0.5));
for k=2:N
  y(k) = [-y(k-1) u(k-1)]*[-0.8;0.5] + e(k) - 0.5*e(k-1);
end

theta = zeros(3,length(y));
P_1 = 100*eye(3);
phi = [0 0 0]';

for k=2:N
    % ELS mod - e = y - \varphi^T.\theta
    phi = [-y(k-1) u(k-1) y(k-1)-phi'*theta(:,k-1)]';
    K = P_1*phi*inv(eye(1)+phi'*P_1*phi);
    P = (eye(3)-K*phi')*P_1;
    P_1 = P;
    theta(:,k) = theta(:,(k-1))+K*(y(k)-phi'*theta(:,(k-1)));
end

figure()
plot(theta(1,:),'LineWidth',1,'color','#77AC30')
hold on
plot(1:N,ones(size(theta(1,:)))*-0.8,'--','color','#77AC30')
hold on
plot(theta(2,:),'LineWidth',1, 'color', '#D95319')
hold on
plot(1:N,ones(size(theta(1,:)))*0.5,'--', 'color', '#D95319')
hold on
plot(theta(3,:),'LineWidth',1,'color','#7E2F8E') 	
hold on
plot(1:N,ones(size(theta(1,:)))*-0.5,'--','color','#7E2F8E')
ylim([-1 1])
grid on
legend('$\hat{a}(t)$','','$\hat{b}(t)$','','$\hat{c}(t)$','Interpreter','Latex');