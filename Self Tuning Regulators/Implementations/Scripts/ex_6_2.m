N = length(u); theta = zeros(4,N);
L = 1;
theta(:,1:2) = [0 0; 0 0; 0.01 0.01; 0.2 0.2];
P_1 = [100 0 0 0;0 100 0 0;0 0 1 0;0 0 0 1];

for k=3:N
    %ym obtained from simulink diagram
    phi = [-ym(k-1) -ym(k-2) u(k-1) u(k-2)]';
    K = P_1*phi*inv(L+phi'*P_1*phi);
    P = (eye(4)-K*phi')*P_1/L;
    P_1 = P;
    theta(:,k) = theta(:,(k-1))+K*(ym(k)-phi'*theta(:,(k-1)));
end

z = zeros(size(ym));
for k=3:N
    phi = [-z(k-1) -z(k-2) u(k-1) u(k-2)];
    z(k) = phi*theta(:,end);
end
numd=[0 theta(3,end) theta(4,end)];
dend=[1 theta(1,end) theta(2,end)];

Gd = tf(numd,dend,h);
Gc = d2c(Gd)
y=lsim(Gd,u,0:(N-1));