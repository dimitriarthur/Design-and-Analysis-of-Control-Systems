out = sim('simulink_q8');

figure();
subplot(2,1,1);
plot(out.N.time, out.N.data, 'linewidth', 1)
grid on;
legend({'N = 0.2', 'N=1', 'N=2'},'Location','northeast')
title('Time Step Response for N Varying')
xlabel('Time (s)')
ylabel('y');

subplot(2,1,2);
plot(out.a.time, out.a.data, 'linewidth', 1)
grid on;
legend({'a = 0.5', 'a=1', 'a=4'},'Location','northeast')
title('Time Step Response for a Varying')
xlabel('Time (s)')
ylabel('y');