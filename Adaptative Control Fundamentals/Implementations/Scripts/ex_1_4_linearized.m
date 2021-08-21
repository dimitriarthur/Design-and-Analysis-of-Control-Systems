simout = sim('example_1_4_linearized');


subplot(3,1,1);
plot(simout1.time, simout1.data(:,1),'LineWidth',1)
title('Step Response with PI Control - Linear Compensation');
ylabel('y');
ylim([0 0.4])
hold on
plot(simout1.time, ones(1,length(simout1.time))*0.3);
legend('y','y_r','location','southeast');
grid on
hold off

subplot(3,1,2);

plot(simout1.time, simout1.data(:,2),'LineWidth',1)
ylabel('y');
ylim([0 1.2])
hold on
plot(simout1.time, ones(1,length(simout1.time))*1.1);
legend('y','y_r','location','southeast');
grid on
hold off

subplot(3,1,3);

plot(simout1.time, simout1.data(:,3),'LineWidth',1)
ylabel('y');
ylim([0 5.5])
hold on
plot(simout1.time, ones(1,length(simout1.time))*5.1);
legend('y','y_r','location','southeast');
grid on
hold off