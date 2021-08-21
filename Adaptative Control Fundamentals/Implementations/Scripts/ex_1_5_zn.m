out = sim('Ex_1_5_ziegler_nichols');

figure()
plot(out.ex5_ziegler.time, out.ex5_ziegler.data,'LineWidth',1)
hold on
legend('q = 0.9','q = 1.1','q = 2','q = 0.5','location','southeast')
grid on 
title('System Step Response for Varying Flow Rate - Ziegler Nichols Approach')
ylabel('Output Concentration')
xlabel('Time (s)')