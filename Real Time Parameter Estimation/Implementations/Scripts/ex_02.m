
t = 0:0.1:10;
u = t;
y = zeros(size(t));
N = length(u);
for k=2:N
  y(k) = -0.6*-y(k-1)+u(k-1)+sin(u(k-1));
end


theta = zeros(3,length(y));
P_1 = eye(3);
for k=2:N
    phi = [-y(k-1) u(k-1) sin(u(k-1))]';
    K = P_1*phi*inv(eye(1)+phi'*P_1*phi);
    P = (eye(3)-K*phi')*P_1;
    P_1 = P;
    theta(:,k) = theta(:,(k-1))+K*(y(k)-phi'*theta(:,(k-1)));
end

z = zeros(size(y));
for k=3:N
    phi = [-z(k-1) u(k-1) sin(u(k-1))];
    z(k) = phi*theta(:,end);
end

figure()
plot(t,y,'color','blue','LineWidth',1)
hold on
plot(t,z,'-.','LineWidth',2,'color','#D95319')
hold off
grid on
ylabel('$y(t), \hat{y}(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
legend('$y(k) = -0.6y(k-1)+u(k-1)+sin(u(k-1))$','Approximate Model','Interpreter','Latex','location','northwest')

immse(y,z)