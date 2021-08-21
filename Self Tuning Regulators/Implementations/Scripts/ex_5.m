N = 100;
onePeriod = [ones(1,25) -1*ones(1,25)];
uc = repmat(onePeriod,[1 N/length(onePeriod)]);
ym = zeros(1,N); u = zeros(1,N);

am = [-1.3205;0.4966];
b = [0.1065;0.0902];
a = [-1.6065;0.6065];
beta = (1+am(1)+am(2))/(b(1)+b(2));
bm = beta*b;  
a0 = 0;

r1 = b(2)/b(1) + (b(2)^2-am(1)*b(1)*b(2)+am(2)*b(1)^2)*(-b(2)+a0*b(1))/(b(1)*(b(2)^2-a(1)*b(1)*b(2)+a(2)*b(1)^2)); 
s0 = b(2)*(a0*am(1)-a(2)-am(1)*a(1)+a(1)^2+am(2)-a(1)*a0)/(b(2)^2-a(1)*b(1)*b(2)+a(2)*b(1)^2)+...
     b(1)*(am(1)*a(2)-a(1)*a(2)-a0*am(2)+a0*a(2))/(b(2)^2-a(1)*b(1)*b(2)+a(2)*b(1)^2);
s1 = b(2)*(a(1)*a(2)-am(1)*a(2)+a0*am(2)-a0*a(2))/(b(2)^2-a(1)*b(1)*b(2)+a(2)*b(1)^2)+...
     b(1)*(a(2)*am(2)-a(2)^2-a0*am(2)*a(1)+a0*a(2)*am(1))/(b(2)^2-a(1)*b(1)*b(2)+a(2)*b(1)^2); 
T = beta;

for k=3:N
    ym(k) = [-ym(k-1) -ym(k-2) uc(k-1) uc(k-2)]*[am;bm];
end
for k=2:N
    u(k) = [-ym(k) -ym(k-1) uc(k) -u(k-1)]*[s0;s1;T;r1];
end

subplot(2,1,1)
plot(ym,'LineWidth',1)
hold on 
plot(uc,'LineWidth',1)
hold off

ylabel('$y(t),u_c(t)$','Interpreter','Latex'),
xlabel('$t(s)$','Interpreter','Latex');
grid
legend('$y(t)$','$u_c(t)$','Interpreter','Latex',...
        'Location', "best");

subplot(2,1,2)
stairs(u,'LineWidth',1)
ylabel('$u(t)$','Interpreter','Latex'),
xlabel('$t(s)$','Interpreter','Latex');
grid