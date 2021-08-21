y_all = zeros(3,1);
a = [-0.01, 0, 0.01];
kp = 1;
C = pid(kp,0,0);

for i=1:3
  num = [1];
  den = [1 1+a(i) a(i)];
  G = tf(num,den);
  t1 = getPIDLoopResponse(C,G,'closed-loop');
  bode(t1)
  hold on
end
legend('a=-0.01','a=0','a=0.01')
hold off