K0 = 1;
A0 = 1;
dK = [-0.5 0 0.5 1 1.5 2]; 
dA = [0 1 2];

K = K0 + dK;
A = A0 + dA;

s = tf('s');

figure()
hold on;
for numerator = 1:length(dK)
    for denon = 1:length(dA)
        G0 = K(numerator)/(s+A(denon));
        step(G0)
    end
end
grid;
hold off