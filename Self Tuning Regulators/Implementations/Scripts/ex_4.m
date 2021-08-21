N = 100;
onePeriod = [ones(1,25) -1*ones(1,25)];
uc = repmat(onePeriod,[1 N/length(onePeriod)]);
ym = zeros(1,N); u = zeros(1,N);

%desired 
bm = [0.1761;0];
am = [-1.3205;0.4966];
%real values
b = [0.1065;0.0902];
a = [-1.6065;0.6065];

%diophantine coeficients 
s0 = (am(1)-a(1))/b(1);
s1 = (am(2)-a(2))/b(1);

T = bm(1)/b(1);
R = b(2)/b(1);

%y(t) = -a1y(t-1) -a2y(t-2) + b0u(t-1) + bu1u(t-2)
%y(t) = [-y(t-1) -y(t-2) u(t-1) u(t-2)].[a1 a2 b0 b1]^T
for k=3:N
    ym(k) = [-ym(k-1) -ym(k-2) uc(k-1) uc(k-2)]*[am;bm];
end

for k=2:N
    u(k) = [-ym(k) -ym(k-1) uc(k) -u(k-1)]*[s0;s1;T;R];
end

figure();
subplot(2,1,1)
plot(ym,'LineWidth',1)
hold on 
plot(uc,'LineWidth',1);
hold off
ylabel('$y(t),u_c(t)$','Interpreter','Latex'),
xlabel('$t(s)$','Interpreter','Latex');
grid
legend('$y(t)$','$u_c(t)$','Interpreter','Latex',...
        'Location', "best");
subplot(2,1,2)
hold on
ylabel('$u(t)$','Interpreter','Latex'),
xlabel('$t(s)$','Interpreter','Latex');
stairs(u,'LineWidth',1)
grid
hold off