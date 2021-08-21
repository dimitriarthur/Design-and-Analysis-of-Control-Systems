figure()

K0 = 1;
A0_1 = 1.4;
A0_2 = 1;

dK = [-0.5 0 0.5 1 1.5 2]; 
dA_1 = [-2 0 2];
dA_2 = [-3 -1.5 0 1.5 3];

K = K0 + dK;
A1 = A0_1 + dA1;
A2 = A0_2 + dA2;

s = tf('s');
G0 = K0/(s^2+A0_1*s+A0_2);
D0 = 1/(1+G0); 
t = 0:0.01:60;

d1 = -1*(t>0);
d2 = 3*(t>=6);
d3 = -1*(t>=15);
d = d1+d2+d3;

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
D0 = 1/(1+G0/s); 
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