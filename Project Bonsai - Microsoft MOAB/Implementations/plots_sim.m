
tx = out.simout.Data(:,1,:); tx = tx(:,:);
ty = out.simout.Data(:,2,:); ty = ty(:,:);
x2 = out.simout.Data(:,3,:); x2 = x2(:,:);
x1 = out.simout.Data(:,4,:); x1 = x1(:,:);
y2 = out.simout.Data(:,5,:); y2 = y2(:,:);
y1 = out.simout.Data(:,6,:); y1 = y1(:,:);
t = out.simout.time;

figure()
plot(t,tx,'s','color','#A2142F','LineWidth',1), hold on;
plot(t,ty,'-','color','#77AC30','LineWidth',1), hold off;
ylabel('$\theta_x,\theta_y\; (rad)$','Interpreter','Latex');
xlabel('$t\;(s)$','Interpreter','Latex');
legend('$\theta_x$','$\theta_y$','Interpreter','Latex',...
        'Location', "northwest"); grid;