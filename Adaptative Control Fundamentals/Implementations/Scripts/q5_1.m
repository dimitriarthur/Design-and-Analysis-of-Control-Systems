out = sim('Ex_1_5_replication');

plot(out.tout, out.simout.Data(:,1),out.tout,out.simout.Data(:,2),out.tout,out.simout.Data(:,3),out.tout,out.simout.Data(:,4), out.tout, ones(1,57));
title('Output Concentration and Concentration Reference')
xlabel('Time (s)')
ylabel('Output c')
legend({'q = 0.5','q = 0.9', 'q = 1.1','q = 2','Cref'},'Location','northeast')

