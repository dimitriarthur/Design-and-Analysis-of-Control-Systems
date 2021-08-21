s = tf('s');
Go = 1/(s+1)^3;
H = 0.15*(1+1/s);
pzmap(H*Go/(1+H*Go));
grid on