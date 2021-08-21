out = sim('q_1_10');

figure();
plot(out.q10.time, out.q10.data(:,1), 'linewidth', 1.5)
hold on
plot(out.q10.time, out.q10.data(:,2),'--', 'linewidth', 1)
hold on
plot(out.q10.time, out.q10.data(:,3), 'linewidth', 1)

title("Response to d(t) and Measurement Error W/ Integral Controller")
legend('y','error', 'd(t)','location', 'northeast')
xlabel('Time(s)')
ylabel('y')
grid