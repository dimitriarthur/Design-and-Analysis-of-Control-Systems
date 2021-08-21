out = sim('Ex_1_4_nl');
ref1 = ones(1,length(out.simout.data(:,1)))*0.3;
figure()
subplot(3,1,1);

plot(out.simout.time, out.simout.data(:,1),'LineWidth',1);
hold on
plot(out.simout.time, ref1,'LineWidth',1);
title('Closed Loop Step Response')
xlabel('Time (s)')
ylabel('y')
legend({'y', 'yref'},'Location','northeast')
hold off

subplot(3,1,2);
ref1 = ones(1,length(out.simout.data(:,1)))*1.1;
plot(out.simout.time, out.simout.data(:,2),'LineWidth',1);
hold on
plot(out.simout.time, ref1,'LineWidth',1);
xlabel('Time (s)')
ylabel('y')
legend({'y', 'yref'},'Location','northeast')
hold off

subplot(3,1,3);
ref1 = ones(1,length(out.simout.data(:,1)))*5.1;
plot(out.simout.time, out.simout.data(:,3),'LineWidth',1);
hold on
plot(out.simout.time, ref1,'LineWidth',1);
xlabel('Time (s)')
ylabel('y')
legend({'y', 'yref'},'Location','northeast')
hold off

