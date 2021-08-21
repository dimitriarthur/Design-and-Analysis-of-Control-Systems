y_all = zeros(3,1);
a = [-0.01, 0, 0.01];
kp = 1;
C = pid(kp,0,0);

for i=1:3
   num = [1];
   den = [1 1+a(i) a(i)];
   G = tf(num,den);
   [y,t] = step(G);
   plot(t,y,'LineWidth',1);
   xlim([0 300]);
   ylim([0 400]);
   hold on
end
title('Open Loop Unit Step Response')
xlabel('Time (s)')
ylabel('y')
legend({'a = -0.01','a = 0', 'a = 0.01'},'Location','northeast')
hold off