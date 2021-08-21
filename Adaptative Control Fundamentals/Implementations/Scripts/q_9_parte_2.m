figure()

t = 0:0.01:20;
d1 = -1*(t>0);
d2 = 3*(t>=6);
d3 = -1*(t>=15);
d = d1+d2+d3;

s = tf('s');
D0 = 1/(1+1/(s+1)); 

subplot(2,1,1)
r1 = lsim(D0,d,t);
plot(t,r1)
hold on 
plot(t,d)
title("Response to d(t) W/ Proportional Controller")
legend('y','Disturbance r(t)', 'location', 'northeast')
xlabel('Time(s)')
ylabel('y')
grid
hold off

subplot(2,1,2)
D0 = 1/(1+1/(s*(s+1))); 
r2 = lsim(D0,d,t);
plot(t,r2);
hold on
plot(t,d)
title("Response to d(t) W/ Integral Controller")
legend('y','Disturbance r(t)', 'location', 'northeast')
xlabel('Time(s)')
ylabel('y')
grid
hold off