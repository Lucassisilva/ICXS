function f_PrintL2(Tab,t,handles,GInf)
% PLOTA GRÁFICOS DO LAYOUT 2
% Esta função gera os gráficos do Layout 2.
% Entrada: Tab: informações dos dados; t: informações de layout e aba;
% handles: informações do gui; GInf: informações de padronização do plot.
% Saída: -

Xvar = Tab(t(1)).Layout(2).Cont(1:4);                                       % As variáveis de X são anotadas
Yvar = Tab(t(1)).Layout(2).Cont(5:8);                                       % As variáveis de Y são anotadas
LimVar = Tab(t(1)).Layout(2).Cont(9);                                       % A variável que selecionará os limites é anotada
p = length(Tab(t(1)).Var) + 1;                                              % Posição do default no popupmenu
XY = Tab(t(1)).Layout(2).Cont(10:11);                                       % Os limites do checkbox são anotados
if LimVar == p                                                              % Caso não exista uma variável limitadora dos dados
    handles.XS2_LimX1.String = 'Lim 1';
    handles.XS2_LimX2.String = 'Lim 2';
    Pos = 1:length(Tab(t(1)).Data);                                         % Todos dados serão plotados
else                                                                        % Caso exista uma variável limitadora dos dados,...
    handles.XS2_LimX1.String = num2str(XY(1));                              %... deve-se selecionar a posição dos dados que estão dentro dos limites
    handles.XS2_LimX2.String = num2str(XY(2));
    Pos = find(Tab(t(1)).Data(:,LimVar) >= XY(1) & Tab(t(1)).Data(:,LimVar) <= XY(2));
end

%% Plot A
if Xvar(1) < p && Yvar(1) < p                                               % Só será plotado se nem X nem Y forem default
    plot(handles.XS2_1,Tab(t(1)).Data(Pos,Xvar(1)),Tab(t(1)).Data(Pos,Yvar(1)),... % Plota os dados definindo estilo da linha, sua grossura e cor
        GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);
    set(handles.XS2_1,'fontsize',GInf.FSize)                                % Seta o tamanho da fonte
    xlabel(handles.XS2_1,Tab(t(1)).Layout(2).ContN(1))                      % Título do eixo X
    ylabel(handles.XS2_1,Tab(t(1)).Layout(2).ContN(5))                      % Título do eixo Y
    grid(handles.XS2_1,'on')                                                % Grid
else                                                                        % Caso X ou Y forem default, será plotado algo em branco
    grid(handles.XS2_1,'off')
    plot(handles.XS2_1,XY,XY,'Color',[1 1 1])
    set(handles.XS2_1,'Xtick',[],'Ytick',[]);
end

%% Plot B
if Xvar(2) < p && Yvar(2) < p
    plot(handles.XS2_2,Tab(t(1)).Data(Pos,Xvar(2)),Tab(t(1)).Data(Pos,Yvar(2)),...
        GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);
    set(handles.XS2_2,'fontsize',GInf.FSize)
    xlabel(handles.XS2_2,Tab(t(1)).Layout(2).ContN(2))
    ylabel(handles.XS2_2,Tab(t(1)).Layout(2).ContN(6))
    grid(handles.XS2_2,'on')
else
    grid(handles.XS2_2,'off')
    plot(handles.XS2_2,XY,XY,'Color',[1 1 1])
    set(handles.XS2_2,'Xtick',[],'Ytick',[]);
end

%% Plot C
if Xvar(3) < p && Yvar(3) < p
    plot(handles.XS2_3,Tab(t(1)).Data(Pos,Xvar(3)),Tab(t(1)).Data(Pos,Yvar(3)),...
        GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);
    set(handles.XS2_3,'fontsize',GInf.FSize)
    xlabel(handles.XS2_3,Tab(t(1)).Layout(2).ContN(3))
    ylabel(handles.XS2_3,Tab(t(1)).Layout(2).ContN(7))
    grid(handles.XS2_3,'on')
else
    grid(handles.XS2_3,'off')
    plot(handles.XS2_3,XY,XY,'Color',[1 1 1])
    set(handles.XS2_3,'Xtick',[],'Ytick',[]);
end

%% Plot D
if Xvar(4) < p && Yvar(4) < p
    plot(handles.XS2_4,Tab(t(1)).Data(Pos,Xvar(4)),Tab(t(1)).Data(Pos,Yvar(4)),...
        GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);
    set(handles.XS2_4,'fontsize',GInf.FSize)
    xlabel(handles.XS2_4,Tab(t(1)).Layout(2).ContN(4))
    ylabel(handles.XS2_4,Tab(t(1)).Layout(2).ContN(8))
    grid(handles.XS2_4,'on')
else
    grid(handles.XS2_4,'off')
    plot(handles.XS2_4,XY,XY,'Color',[1 1 1])
    set(handles.XS2_4,'Xtick',[],'Ytick',[]);
end
end