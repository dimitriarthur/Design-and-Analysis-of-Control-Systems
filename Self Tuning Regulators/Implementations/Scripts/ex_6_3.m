figure();
plot(0:(N-1),ym,'LineWidth',1.2);hold on
plot(0:(N-1),y,'--'), hold off;
ylabel('$y(t),u_c(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
legend('$y_m(t)$','$y_e(t)$','Interpreter','Latex',...
        'Location', "best"); grid
xlim([0 100]);