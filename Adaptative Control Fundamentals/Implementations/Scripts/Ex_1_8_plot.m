out = sim('Ex_1_8');

figure();
plot(out.ex8.time, out.ex8.data)
legend('w = wc = 0.1', 'w = 0.05 and w = 0.1', 'w = wc = 0.05', 'location', 'southeast')
grid on 
title('Controllers Performance for Varying W and Wc')
ylabel('Output Error')
xlabel('Time (s)')