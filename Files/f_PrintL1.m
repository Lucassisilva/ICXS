function [handles] = f_PrintL1(Tab,t,handles,GInf)
% PLOTA GRÁFICOS DO LAYOUT 1
% Esta função gera os gráficos do Layout 1.
% Entrada: Tab: informações dos dados; t: informações de layout e aba;
% handles: informações do gui; GInf: informações de padronização do plot.
% Saída: handles: informações do gui.

Xvar = Tab(t(1)).Layout(1).Cont(1);                                         % Neste Layout há apenas 1 variável em X, ela é anotada
Yvar = Tab(t(1)).Layout(1).Cont(2:5);                                       % As variáveis de Y são anotadas
p = length(Tab(t(1)).Var) + 1;                                              % Posição do default no popupmenu
if Xvar == p                                                                % Confere se X é default
    handles.XS1_LimX1.String = 'X1';
    handles.XS1_LimX2.String = 'X2';
    XY = [0 1];
else                                                                        % Caso X não seja default, seus limites são anotados nos editbox...
    handles.XS1_LimX1.String = num2str(Tab(t(1)).Layout(1).Cont(6));
    handles.XS1_LimX2.String = num2str(Tab(t(1)).Layout(1).Cont(7));
    XY = Tab(t(1)).Layout(1).Cont(6:7);                                     % ... e utilizados para plot
end

%% Plot A
if Xvar < p && Yvar(1) < p                                                  % Só será plotado se nem X nem Y forem default
    plot(handles.XS1_1,Tab(t(1)).Data(:,Xvar),Tab(t(1)).Data(:,Yvar(1)),... % Plota os dados definindo estilo da linha, sua grossura e cor
        GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);
    set(handles.XS1_1,'fontsize',GInf.FSize)                                % Seta o tamanho da fonte
    ylabel(handles.XS1_1,Tab(t(1)).Layout(1).ContN(2))                      % Título do eixo Y
    grid(handles.XS1_1,'on')                                                % Grid
    xlim(handles.XS1_1,XY);                                                 % Coloca limites definidos nos editbox
else                                                                        % Caso X ou Y forem default, será plotado algo em branco
    grid(handles.XS1_1,'off')
    plot(handles.XS1_1,XY,XY,'Color',[1 1 1])
    set(handles.XS1_1,'Xtick',[],'Ytick',[]);
    xlim(handles.XS1_1,XY);
end

%% Plot B
if Xvar < p && Yvar(2) < p
    plot(handles.XS1_2,Tab(t(1)).Data(:,Xvar),Tab(t(1)).Data(:,Yvar(2)),...
        GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);
    set(handles.XS1_2,'fontsize',GInf.FSize)
    ylabel(handles.XS1_2,Tab(t(1)).Layout(1).ContN(3))
    grid(handles.XS1_2,'on')
    xlim(handles.XS1_2,XY);
else
    grid(handles.XS1_2,'off')
    plot(handles.XS1_2,XY,XY,'Color',[1 1 1])
    set(handles.XS1_2,'Xtick',[],'Ytick',[]);
    xlim(handles.XS1_2,XY);
end

%% Plot C
if Xvar < p && Yvar(3) < p
    plot(handles.XS1_3,Tab(t(1)).Data(:,Xvar),Tab(t(1)).Data(:,Yvar(3)),...
        GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);
    set(handles.XS1_3,'fontsize',GInf.FSize)
    ylabel(handles.XS1_3,Tab(t(1)).Layout(1).ContN(4))
    grid(handles.XS1_3,'on')
    xlim(handles.XS1_3,XY);
else
    grid(handles.XS1_3,'off')
    plot(handles.XS1_3,XY,XY,'Color',[1 1 1])
    set(handles.XS1_3,'Xtick',[],'Ytick',[]);
    xlim(handles.XS1_3,XY);
end

%% Plot D
if Xvar < p && Yvar(4) < p
    plot(handles.XS1_4,Tab(t(1)).Data(:,Xvar),Tab(t(1)).Data(:,Yvar(4)),...
        GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);
    set(handles.XS1_4,'fontsize',GInf.FSize)
    xlabel(handles.XS1_4,Tab(t(1)).Layout(1).ContN(1))
    ylabel(handles.XS1_4,Tab(t(1)).Layout(1).ContN(5))
    grid(handles.XS1_4,'on')
    xlim(handles.XS1_4,XY);
else
    grid(handles.XS1_4,'off')
    plot(handles.XS1_4,XY,XY,'Color',[1 1 1])
    set(handles.XS1_4,'Xtick',[],'Ytick',[]);
    xlim(handles.XS1_4,XY);
end
if Xvar < p                                                                 % O título do eixo X só é escrito abaixo do último gráfico e isso ocorre caso X não seja default
    xlabel(handles.XS1_4,Tab(t(1)).Layout(1).ContN(1))
    set(handles.XS1_4,'fontsize',GInf.FSize)
end
end

