C = pid(1,0,0);
s = tf('s');
T = [0 0.015 0.03];

for i=1:3
  G = 400*(1-T(i)*s)/((s+1)*(s+20)*(1+T(i)*s))
  %bode(G)
  hold on
  %t1 = getPIDLoopResponse(C,G,'closed-loop');
  [mag1,phase1,wout1] = bode(G);
  subplot(2,1,1);
  semilogx(wout1,20*log10(mag1(:)),'LineWidth',1.5);
  ylim([0 30])
  legend('$T=0$','$T=0.015$','$T=0.03$',...
    'Interpreter','latex', 'Location','best'); 
  ylabel("Magnitude")
  title('Open loop step frequency reponse')
  subplot(2,1,2);
  semilogx(wout1,phase1(:),'LineWidth',1.5);
end
