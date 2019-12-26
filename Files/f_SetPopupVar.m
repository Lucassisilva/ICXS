function [handles] = f_SetPopupVar(var,Tab,t,handles)
% DEFINE A VARI�VEL EM CADA POPUPMENU
% Esta fun��o define a posi��o de cada popupmenu. Essa posi��o pode ser
% diferente da default caso var~=0 ou caso a vari�vel antiga exista nas
% novas.
% Entrada: var: nome dos dados que se deseja encontrar no banco de dados a 
% ser carregado referentes a cada popupmenu; Tab: informa��es dos dados;
% t: informa��es de layout e aba; handles: informa��es do gui.
% Sa�da: handles: informa��es do gui.

p = length(Tab(t(1)).Var)+1;                                                % Quantidade de elementos nos popupmenus
if iscell(var) == 0                                                         % Caso var n�o seja uma c�lula com nomes (var==0), deve-se mudar seu conte�do
    var = [Tab(t(1)).Layout(1).ContN, Tab(t(1)).Layout(2).ContN,...         % Assim, var se torna simplesmente o conjunto de vari�ves do banco de dados...
        Tab(t(1)).Layout(3).ContN];                                         % carregado correspondente a cada popupmenu ou listbox do programa
end
%% Layout 1
if find(contains(Tab(t(1)).Var,var{1}))                                     % Confere se dentre os dados carregados h� algum igual ao var de popupmenu correspondente
    handles.XS1_X.Value = find(contains(Tab(t(1)).Var,var{1}));             % Caso exista, a posi��o do popupmenu passa a ser dessa vari�vel
else
    handles.XS1_X.Value = p;                                                % Caso n�o exista, a posi��o do popmenu � a default
end

if find(contains(Tab(t(1)).Var,var{2}))
    handles.XS1_Y1.Value = find(contains(Tab(t(1)).Var,var{2}));
else
    handles.XS1_Y1.Value = p;
end

if find(contains(Tab(t(1)).Var,var{3}))
    handles.XS1_Y2.Value = find(contains(Tab(t(1)).Var,var{3}));
else
    handles.XS1_Y2.Value = p;
end

if find(contains(Tab(t(1)).Var,var{4}))
    handles.XS1_Y3.Value = find(contains(Tab(t(1)).Var,var{4}));
else
    handles.XS1_Y3.Value = p;
end

if find(contains(Tab(t(1)).Var,var{5}))
    handles.XS1_Y4.Value = find(contains(Tab(t(1)).Var,var{5}));
else
    handles.XS1_Y4.Value = p;
end

%% Layout 2
if find(contains(Tab(t(1)).Var,var{6}))
    handles.XS2_X1.Value = find(contains(Tab(t(1)).Var,var{6}));
else
    handles.XS2_X1.Value = p;
end

if find(contains(Tab(t(1)).Var,var{7}))
    handles.XS2_X2.Value = find(contains(Tab(t(1)).Var,var{7}));
else
    handles.XS2_X2.Value = p;
end

if find(contains(Tab(t(1)).Var,var{8}))
    handles.XS2_X3.Value = find(contains(Tab(t(1)).Var,var{8}));
else
    handles.XS2_X3.Value = p;
end

if find(contains(Tab(t(1)).Var,var{9}))
    handles.XS2_X4.Value = find(contains(Tab(t(1)).Var,var{9}));
else
    handles.XS2_X4.Value = p;
end

if find(contains(Tab(t(1)).Var,var{10}))
    handles.XS2_Y1.Value = find(contains(Tab(t(1)).Var,var{10}));
else
    handles.XS2_Y1.Value = p;
end

if find(contains(Tab(t(1)).Var,var{11}))
    handles.XS2_Y2.Value = find(contains(Tab(t(1)).Var,var{11}));
else
    handles.XS2_Y2.Value = p;
end

if find(contains(Tab(t(1)).Var,var{12}))
    handles.XS2_Y3.Value = find(contains(Tab(t(1)).Var,var{12}));
else
    handles.XS2_Y3.Value = p;
end

if find(contains(Tab(t(1)).Var,var{13}))
    handles.XS2_Y4.Value = find(contains(Tab(t(1)).Var,var{13}));
else
    handles.XS2_Y4.Value = p;
end

if find(contains(Tab(t(1)).Var,var{14}))                                    % Este var14 corresponde ao box para redu��o de dados do Layout 2
    handles.XS2_LimVar.Value = find(contains(Tab(t(1)).Var,var{14}));       % Caso exista igual, o CB ser� ativado e seus boxes ficar�o vis�veis
    handles.XS2_LimCB.Value = 1;
    handles.XS2_LimVar.Visible = 'on';
    handles.XS2_LimX1.Visible = 'on';
    handles.XS2_LimX2.Visible = 'on';
else
    handles.XS2_LimVar.Value = p;                                           % Caso contr�rio, tudo ser� setado como default
    handles.XS2_LimCB.Value = 0;
    handles.XS2_LimVar.Visible = 'off';
    handles.XS2_LimX1.Visible = 'off';
    handles.XS2_LimX2.Visible = 'off';
end
%% Layout 3
if find(contains(Tab(t(1)).Var,var{15}))
    handles.XS3_X.Value = find(contains(Tab(t(1)).Var,var{15}));
else
    handles.XS3_X.Value = p;
end
VarList = var(16:end);                                                      % No Layout 3, v�rios elementos podem ser selecionados no list box
if find(contains(Tab(t(1)).Var,VarList))                                    % Todos com mesmo nome ser�o selecionados
    handles.XS3_Y.Value = find(contains(Tab(t(1)).Var,VarList));
else
    handles.XS3_Y.Value = p;
end
end