y_all = zeros(3,1);
a = [-0.01, 0, 0.01];
kp = 1;
C = pid(kp,0,0);

for i=1:3
   num = [1];
   den = [1 1+a(i) a(i)];
   G = tf(num,den);
   t1 = getPIDLoopResponse(C,G,'closed-loop');
   [y_cl, t_cl] = step(t1);
   plot(t_cl, y_cl,'LineWidth',1);
   hold on
   step(t1)
end
legend({'a = -0.01','a = 0', 'a = 0.01'},'Location','southeast')
title('Closed Loop Unit Step Response')
xlabel('Time (s)')
ylabel('y')
hold off