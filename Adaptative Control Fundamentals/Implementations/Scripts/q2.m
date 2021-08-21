s = tf('s');
T = [0, 0.015, 0.03];
figure(1)

for i=1:3
  G = 400*(1-T(i)*s)/((s+1)*(s+20)*(1+T(i)*s));
  step(G)
  hold on
end

title('Open Loop Unit Step Response for a = -0.01, 0, 0.01')
xlabel('Time (s)')
ylabel('y')
legend({'T = 0','T = 0.015', 'T = 0.03'},'Location','northeast')

figure(2)

C = pid(kp,0,0);
 
for i=1:3
  G = 400*(1-T(i)*s)/((s+1)*(s+20)*(1+T(i)*s));
  t1 = getPIDLoopResponse(C,G,'closed-loop');
  step(t1);
  xlim([0 1])
  hold on
end
title('Closed Loop Unit Step Response for a = -0.01, 0, 0.01')
xlabel('Time (s)')
ylabel('y')
legend({'T = 0','T = 0.015', 'T = 0.03'},'Location','northeast')
