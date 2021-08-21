s = tf('s');
T = [0, 0.015, 0.03];
for i=1:3
  G = 400*(1-T(i)*s)/((s+1)*(s+20)*(1+T(i)*s));
  ylim([0 20]);
  step(G);
  hold on
end

title('Open Loop Unit Step Response')
xlabel('Time (s)')
ylabel('y')
legend({'T = 0','T = 0.015', 'T = 0.03'},'Location','northeast')

hold off