out = sim('q_1_6_zn');

figure()
plot(out.q6_ziegler.time, out.q6_ziegler.data,'LineWidth',1)
hold on
legend('q = 0.5','q = 1','q = 2','location','southeast')
grid on 
title('System Step Response for Varying Flow Rate - Ziegler Nichols Approach')
ylabel('Output Concentration')
xlabel('Time (s)')