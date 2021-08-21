function freke_model1(ws,w0,A0,q,r) 

    lineStyles = linspecer(3);
    close all
    
    %Frequência de amostragem e frequência do processo
    
    hs=2*pi/ws;
    na=128;
    wa=na*ws;
    ha=2*pi/wa;
    
    %Matrizes para o filtro de Kalman
    F=[1,ha,0;0,1,0;0,0,1];
    G=[0;1;1];
    
    % Sinal verdadeiro
    xv=[0;ws;1];
    yv=xv(3,1)*sin(xv(1,1));
    yr=yv; xr=xv;
    
    % Estimativas iniciais
    xe=[0;w0;A0];
    ye=0;
    p=[0 0 0
        0 (ws-w0)^2 0 
        0 0 (1-A0)^2];
    I=eye(size(p));
    
    % Covariância do processo (R) e covariância da medição (R)
    R=r^2;
    Q=q^2;
    
    % Parâmetros referentes à iteração
    n=1;
    nc=8;
    nfinal = nc*hs/ha;
    
    % Kalman iteration
    while (n < nfinal),
        %Armazena valores reais, ruidosos e estimados para a saida
        T(n,1) = (n-1);
        Y(n,1) = yv;
        Y(n,2) = yr;
        Y(n,3) = ye;
        Y(n,4) = xv(2);
        Y(n,5) = xr(2);
        Y(n,6) = xe(2);
        Y(n,7) = xv(3);
        Y(n,8) = xr(3);
        Y(n,9) = xe(3);
        
        %Gerando os sinais verdadeiro e ruidoso
        xv=F*xv; %estado verdadeiro
        w=[0 q*randn(1,2)]'; %ruido do processo
        xr=F*xr+w; %estado contaminado com ruido
        v=r*randn(); %ruido da medição
        yv=xv(3,1)*sin(xv(1,1)); %processo verdadeiro
        yr=xr(3,1)*sin(xr(1,1))+v; %medicao contaminada
        
        
        ye=xe(3,1)*sin(xe(1,1));%estima-se a saida
        H=[xe(3,1)*cos(xe(1,1)), 0, sin(xe(1,1))]; % G do slide
        k=p*H'*inv(H*p*H'+R); %correção do ganho de kalman na amostra atual
        xe=xe+k*(yr-ye);%corrige a estimação em n a partir de n-1
        p=(I-k*H)*p; %corrige a matriz de corrrelação em n
        %p=(I-k*H)*p*(I-k*H)'+k*R*k';
        xe=F*xe; %previsao do estado para a proxima iteracao (n+1 que se torna n)
        p=F*p*F'+G'*Q*G; %previsao da matriz de correlacao para a proxima amostra
        %
        n = n+1;
    end
    
    % plot
    figure("position",[10 10 500 400])
    interval = 10;
    subplot(3,1,1),
    plot(T(1:interval:end),Y(1:interval:end,1),'o','LineWidth',1.2,...
        "Color",'#A2142F'), hold on, 
    plot(T(:),Y(:,2),':','LineWidth',1.2,"Color",'#EDB120',...
        'MarkerSize',4,'MarkerFaceColor',lineStyles(3,:)),   
    plot(T,Y(:,3),'LineWidth',1.2,"Color",'#0072BD'),hold off,
    ylabel('$y(t)$','Interpreter','Latex');
    xlabel('$t\;(s)$','Interpreter','Latex');
    legend('$y(t)$','$y_r(t)$','$y_e(t)$','Interpreter','Latex',...
            'Location', "northeast",'FontSize',9,'Orientation','horizontal'); grid;
    title ("$A_0 = "+num2str(A0)+...
        ",\;\omega_0 = "+num2str(w0)+...
        ",\; q = "+num2str(q)+...
        ",\; \sigma = "+num2str(r)+"$",'Interpreter','Latex','FontSize', 10)
     xlim([0 600])
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset; 
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3);
    ax_height = outerpos(4) - ti(2) - ti(4);
    ax.Position = [left bottom ax_width ax_height];
    subplot(3,1,2),
    plot(T(1:interval:end),Y(1:interval:end,4),'o','LineWidth',1.2,...
    "Color",'#A2142F'), hold on, 
    plot(T(:),Y(:,5),'-.','LineWidth',1.2,"Color",'#EDB120',...
        'MarkerSize',4,'MarkerFaceColor',lineStyles(3,:)),   
    plot(T,Y(:,6),'LineWidth',1.2,"Color",'#0072BD'),hold off,
    ylabel('$\omega(t)$','Interpreter','Latex');
    xlabel('$t\;(s)$','Interpreter','Latex');
    legend('$\omega(t)$','$\omega_r(t)$','$\omega_e(t)$','Interpreter','Latex',...
            'Location', "northeast",'FontSize',9,'Orientation','horizontal'); grid;
     xlim([0 600])
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset; 
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3);
    ax_height = outerpos(4) - ti(2) - ti(4);
    ax.Position = [left bottom ax_width ax_height];
    subplot(3,1,3),
    plot(T(1:interval:end),Y(1:interval:end,7),'o','LineWidth',1.2,...
    "Color",'#A2142F'), hold on, 
    plot(T(:),Y(:,8),'-.','LineWidth',1.2,"Color",'#EDB120',...
        'MarkerSize',4,'MarkerFaceColor','#EDB120'),   
    plot(T,Y(:,9),'LineWidth',1.2,"Color",'#0072BD'),hold off,
    ylabel('$A(t)$','Interpreter','Latex');
    xlabel('$t\;(s)$','Interpreter','Latex');
    legend('$A(t)$','$A_r(t)$','$A_e(t)$','Interpreter','Latex',...
            'Location', "northeast",'FontSize',9,'Orientation','horizontal'); grid;
     xlim([0 600])
    ax = gca;
    outerpos = ax.OuterPosition;
    ti = ax.TightInset; 
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3);
    ax_height = outerpos(4) - ti(2) - ti(4);
    ax.Position = [left bottom ax_width ax_height];
end