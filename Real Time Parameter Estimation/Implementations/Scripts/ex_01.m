figure()
t = 0:0.1:6;
u = t/2;
y = 1.171 + 0.3466*u + 0.1259*u.^2 + 0.01*randn(size(t));
N = length(u);

%first model 
R = 0;
F = 0;
for i=1:N
    phi = 1; 
    psi = phi*y(i);
    R = R + phi*phi';
    F = F + psi;
end

theta = inv(R)*F;
z = zeros(size(y));

for k=3:N
    phi = [1];
    z(k) = phi*theta;
end
plot(t,y,'^','color','blue','LineWidth',0.5)
hold on
plot(t,z,'LineWidth',1.2)
hold on

%second model
R = 0;
F = 0;
for k=1:N
    phi = [1 u(k)]';
    psi = phi*y(k);
    R = R + phi*phi';
    F = F + psi;
end
theta = inv(R)*F;
z = zeros(size(y));
for k=3:N
    phi = [1 u(k)];
    z(k) = phi*theta;
end
plot(t,z,'--','LineWidth',1.5);
hold on
% third model
R = 0;
F = 0;
for k=1:N
    phi = [1 u(k) u(k)^2]';
    psi = phi*y(k);
    R = R + phi*phi';
    F = F + psi;
end
theta = inv(R)*F;
z = zeros(size(y));
for k=3:N
    phi = [1 u(k) u(k)^2];
    z(k) = phi*theta;
end

plot(t,z,'-','LineWidth',2)
hold on

% fourth model
R = 0;
F = 0;
for k=1:N
    phi = [1 u(k) u(k)^2 u(k)^3]';
    psi = phi*y(k);
    R = R + phi*phi';
    F = F + psi;
end

theta = inv(R)*F;
z = zeros(size(y));
for k=3:N
    phi = [1 u(k) u(k)^2 u(k)^3];
    z(k) = phi*theta;
end



plot(t,z,'LineWidth',1);
grid on;
ylabel('$y(t), \hat{y}(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
legend('Original Y','First Model','Second Model','Third Model','Fourth Model','location','northwest')
hold off;