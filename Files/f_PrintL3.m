function f_PrintL3(Tab,t,handles,GInf)
% PLOTA GRÁFICOS DO LAYOUT 3
% Esta função gera os gráficos do Layout 3.
% Entrada: Tab: informações dos dados; t: informações de layout e aba;
% handles: informações do gui; GInf: informações de padronização do plot.
% Saída: -

Xvar = Tab(t(1)).Layout(3).Cont(3);                                         % Neste Layout há apenas 1 variável em X, ela é anotada
Yvar = min(Tab(t(1)).Layout(3).Cont(4:end));                                % As diversas variáveis de Y são anotadas
p = length(Tab(t(1)).Var) + 1;                                              % Posição do default no popupmenu
if Xvar == p                                                                % Confere se X é default
    handles.XS3_LimX1.String = 'X1';
    handles.XS3_LimX2.String = 'X2';
    XY = [0 1];
else                                                                        % Caso X não seja default, seus limites são anotados nos editbox...
    handles.XS3_LimX1.String = num2str(Tab(t(1)).Layout(3).Cont(1));
    handles.XS3_LimX2.String = num2str(Tab(t(1)).Layout(3).Cont(2));
    XY = Tab(t(1)).Layout(3).Cont(1:2);                                     % ... e utilizados para plot
end

hold(handles.XS3_1,'off')                                                   % Para que seja apagado o gráfico anterior
if Xvar < p && Yvar < p                                                     % Só será plotado se nem X nem Y forem default
    X = Tab(t(1)).Data(:,Xvar);                                             % Dados de X
    imax = length(Tab(t(1)).Layout(3).Cont(Tab(t(1)).Layout(3).Cont(3:end)<p)); % Número total de variáveis a serem plotadas
    for i = 2:imax                                                          % Plot de cada variável
        Y = Tab(t(1)).Data(:,Tab(t(1)).Layout(3).Cont(i+2));                % Dados do Y do loop
        if handles.XS3_Perc.Value                                           % Caso os dados estejam sendo plotados de forma adimensional
            d = (max(abs(Y)))/100;
            Y = Y/d;                                                        % Novo Y adimensional
        end
        plot(handles.XS3_1,X,Y,GInf.Style,'LineWidth', 1.2);                % Plot com definição do estilo da linha e sua espessura
        hold(handles.XS3_1,'on')                                            % Segura o gráfico para que outras variáveis seram plotadas
    end
    xlabel(handles.XS3_1,Tab(t(1)).Layout(3).ContN(1))                      % Título do eixo X
    set(handles.XS3_1,'fontsize',GInf.FSize)                                % Seta o tamanho da fonte
    legend(handles.XS3_1,Tab(t(1)).Layout(3).ContN{2:imax})                 % Legenda que diz o nome de cada variável plotada em Y
    xlim(handles.XS3_1,XY);                                                 % Seta os limites de X
    grid(handles.XS3_1,'on')                                                % Grid
    
else                                                                        % Caso X ou Y forem default, será plotado algo em branco
    grid(handles.XS3_1,'off')
    plot(handles.XS3_1,XY,XY,'Color',[1 1 1])
    set(handles.XS3_1,'Xtick',[],'Ytick',[]);
end
end