out = sim('Ex_1_5_replication');

figure()
plot(out.ex5.time, out.ex5.data,'LineWidth',1)
hold on
legend('q = 0.9','q = 1.1','q = 2','q = 0.5')
grid on 
title('System Step Response for Varying Flow Rate')
ylabel('Output Concentration')
xlabel('Time (s)')