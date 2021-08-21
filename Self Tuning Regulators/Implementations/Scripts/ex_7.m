
N = 100;
onePeriod = [ones(1,25) -1*ones(1,25)];

uc = repmat(onePeriod,[1 N/length(onePeriod)]);
ym = zeros(1,N); u = zeros(1,N); 
uf = zeros(1,N); yf = zeros(1,N);

am = [-1.3205;0.4966]; bm = [0.1761;0];
a = [-1.6065;0.6065]; b = [0.1065;0.0902];

R1 = b(2)/b(1); S0 = (am(1)-a(1))/b(1); 
S1 = (am(2)-a(2))/b(1);  T0 = (bm(1))/b(1); 

%y(t) = -am1*y(t-1) - am2*t(t-2) + b(1)uc(t-1) + b(2)uc(t-2)
%resposta desejada
for k=3:N
    ym(k) = [-ym(k-1) -ym(k-2) uc(k-1) uc(k-2)]*[am;bm];
end
%u(t) = -ym(t)*s0 - ym(t-1)*s1 + uc(t)*t0 - u(t-1)*r1
for k=2:N
    u(k) = [-ym(k) -ym(k-1) uc(k) -u(k-1)]*[S0;S1;T0;R1];
end

%uf(t) = -am1*uf(t-1) -am2*uf(t-2) + u(t)
%uf(t) = -am1*yf(t-1) -am2*uf(t-2) + u(t)
for k=3:N
  uf(k) = -am(1)*uf(k-1)-am(2)*uf(k-2)+u(k);
  yf(k) = -am(1)*yf(k-1)-am(2)*yf(k-2)+ym(k);
end

theta = zeros(4,N);
t0 = 1+am(1)+am(2);

L = 1;
theta(:,1:2) = 0.1*ones(4,2);
P_1 = 0.5*eye(4);
 
% theta = [s0; s1; t0; r1];

for k=3:N
    phi = [yf(k-1) yf(k-2) uf(k-1) uf(k-2)]';
    K = P_1*phi*inv(L+phi'*P_1*phi);
    P = (eye(4)-K*phi')*P_1/L;
    P_1 = P;
    theta(:,k) = theta(:,(k-1))+K*(ym(k)-phi'*theta(:,(k-1)));
end


figure()
plot(theta(1,:)./theta(3,:),'LineWidth',1.2,'color','#77AC30'), hold on;
plot(ones(size(theta(1,:)))*S0,':','LineWidth',1.2,'color','#77AC30')
plot(theta(2,:)./theta(3,:),'LineWidth',1.2,'color','#D95319'),
plot(ones(size(theta(1,:)))*S1,':','LineWidth',1.2,'color','#D95319')
plot(t0./theta(3,:),'LineWidth',1.2,'color','#EDB120')
plot(ones(size(theta(1,:)))*T0,':','LineWidth',1.2,'color','#EDB120')
plot(theta(4,:)./theta(3,:),'LineWidth',1.2,'color','#0072BD'),
plot(ones(size(theta(1,:)))*R1,':','LineWidth',1.2,'color','#0072BD'), 
hold off; grid;
ylabel('$\hat{b}(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
legend('$\hat{s}_0/\hat{r}_0$','','$\hat{s}_1/\hat{r}_0$','',...
       '$\hat{t}_0/\hat{r}_0$','','$\hat{r}_1/\hat{r}_0$','',...
       'Interpreter','Latex','Location', "southwest");