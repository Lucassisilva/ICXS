function f_PrintL3(Tab,t,handles,GInf)
% PLOTA GR�FICOS DO LAYOUT 3
% Esta fun��o gera os gr�ficos do Layout 3.
% Entrada: Tab: informa��es dos dados; t: informa��es de layout e aba;
% handles: informa��es do gui; GInf: informa��es de padroniza��o do plot.
% Sa�da: -

Xvar = Tab(t(1)).Layout(3).Cont(3);                                         % Neste Layout h� apenas 1 vari�vel em X, ela � anotada
Yvar = min(Tab(t(1)).Layout(3).Cont(4:end));                                % As diversas vari�veis de Y s�o anotadas
p = length(Tab(t(1)).Var) + 1;                                              % Posi��o do default no popupmenu
if Xvar == p                                                                % Confere se X � default
    handles.XS3_LimX1.String = 'X1';
    handles.XS3_LimX2.String = 'X2';
    XY = [0 1];
else                                                                        % Caso X n�o seja default, seus limites s�o anotados nos editbox...
    handles.XS3_LimX1.String = num2str(Tab(t(1)).Layout(3).Cont(1));
    handles.XS3_LimX2.String = num2str(Tab(t(1)).Layout(3).Cont(2));
    XY = Tab(t(1)).Layout(3).Cont(1:2);                                     % ... e utilizados para plot
end

hold(handles.XS3_1,'off')                                                   % Para que seja apagado o gr�fico anterior
if Xvar < p && Yvar < p                                                     % S� ser� plotado se nem X nem Y forem default
    X = Tab(t(1)).Data(:,Xvar);                                             % Dados de X
    imax = length(Tab(t(1)).Layout(3).Cont(Tab(t(1)).Layout(3).Cont(3:end)<p)); % N�mero total de vari�veis a serem plotadas
    for i = 2:imax                                                          % Plot de cada vari�vel
        Y = Tab(t(1)).Data(:,Tab(t(1)).Layout(3).Cont(i+2));                % Dados do Y do loop
        if handles.XS3_Perc.Value                                           % Caso os dados estejam sendo plotados de forma adimensional
            d = (max(abs(Y)))/100;
            Y = Y/d;                                                        % Novo Y adimensional
        end
        plot(handles.XS3_1,X,Y,GInf.Style,'LineWidth', 1.2);                % Plot com defini��o do estilo da linha e sua espessura
        hold(handles.XS3_1,'on')                                            % Segura o gr�fico para que outras vari�veis seram plotadas
    end
    xlabel(handles.XS3_1,Tab(t(1)).Layout(3).ContN(1))                      % T�tulo do eixo X
    set(handles.XS3_1,'fontsize',GInf.FSize)                                % Seta o tamanho da fonte
    legend(handles.XS3_1,Tab(t(1)).Layout(3).ContN{2:imax})                 % Legenda que diz o nome de cada vari�vel plotada em Y
    xlim(handles.XS3_1,XY);                                                 % Seta os limites de X
    grid(handles.XS3_1,'on')                                                % Grid
    
else                                                                        % Caso X ou Y forem default, ser� plotado algo em branco
    grid(handles.XS3_1,'off')
    plot(handles.XS3_1,XY,XY,'Color',[1 1 1])
    set(handles.XS3_1,'Xtick',[],'Ytick',[]);
end
end