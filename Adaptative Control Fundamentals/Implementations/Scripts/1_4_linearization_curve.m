

a = linspace(0,2,100);
f_u = a.^4;
plot(a,f_u)
hold on
plot([0 1.3], [0 3], '--')
hold on
plot([1.3 2], [3 16], '--')
title('Valve Response and Liner Approximations')
xlabel('u')
legend('u^4','f(u) = 2.31u', 'f(u) = -2.57u + 21.14','location','northwest')
hold off
