h1 = [tf(1),tf(1),tf(1)];
h2 = h1;
i = 1;
for k_2 = [-1 -0.5 -2]
    s = tf('s');
    h1(i) = (k_2 + 4*s - k_2*s + s^2 + 3)/((s + 1)*(s + 3)*(k_2 + s + 1));
    h2(i) =  1/(k_2 + s + 1);
    i = i+1;
end

figure();
subplot(1,3,1)
step(h1(1))
hold on
step(h2(1))
grid
hold off
legend('y1','y2','location','southeast')

subplot(1,3,2)
step(h1(2))
hold on
step(h2(2))
grid
hold off
legend('y1','y2','location','southeast')

subplot(1,3,3)
step(h1(3))
hold on
step(h2(3))
grid
hold off
legend('y1','y2','location','southeast')