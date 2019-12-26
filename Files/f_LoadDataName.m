function [handles] = f_LoadDataName(Tab,t,handles)
% CARREGA NOME DOS DADOS
% Esta função modifica no programa o nome da janela, da aba e os nomes
% contidos em cada "botão".
% Entrada: Tab: informações dos dados; t: informações de layout e aba;
% handles: informações do gui.
% Saída: handles: informações do gui.

%% Modifica o nome da janela e das abas
set(gcf,'name',strcat('ICXS-',Tab(t(1)).Name{2}));                          % Muda nome da janela do ICxs
switch t(1)
    case 1
        handles.Tab1.TooltipString = Tab(t(1)).Name{2};                     % Muda nome da aba
    case 2
        handles.Tab2.TooltipString = Tab(t(1)).Name{2};                     % Muda nome da aba
    case 3
        handles.Tab3.TooltipString = Tab(t(1)).Name{2};                     % Muda nome da aba
    case 4
        handles.Tab4.TooltipString = Tab(t(1)).Name{2};                     % Muda nome da aba
    case 5
        handles.Tab5.TooltipString = Tab(t(1)).Name{2};                     % Muda nome da aba
    case 6
        handles.Tab6.TooltipString = Tab(t(1)).Name{2};                     % Muda nome da aba
    case 7
        handles.Tab7.TooltipString = Tab(t(1)).Name{2};                     % Muda nome da aba
    case 8
        handles.Tab8.TooltipString = Tab(t(1)).Name{2};                     % Muda nome da aba
    case 9
        handles.Tab9.TooltipString = Tab(t(1)).Name{2};                     % Muda nome da aba
    case 10
        handles.Tab10.TooltipString = Tab(t(1)).Name{2};                    % Muda nome da aba
end

%% Fornece o nome das variáveis aos "botões"
% Layout 1
handles.XS1_X.String = [Tab(t(1)).Var;'Plot X'];
handles.XS1_LimX1.String = 'X1';
handles.XS1_LimX2.String = 'X2';
handles.XS1_Y1.String = [Tab(t(1)).Var;'Plot AY'];
handles.XS1_Y2.String = [Tab(t(1)).Var;'Plot BY'];
handles.XS1_Y3.String = [Tab(t(1)).Var;'Plot CY'];
handles.XS1_Y4.String = [Tab(t(1)).Var;'Plot DY'];

% Layout 2
handles.XS2_X1.String = [Tab(t(1)).Var;'Plot AX'];
handles.XS2_X2.String = [Tab(t(1)).Var;'Plot BX'];
handles.XS2_X3.String = [Tab(t(1)).Var;'Plot CX'];
handles.XS2_X4.String = [Tab(t(1)).Var;'Plot DX'];
handles.XS2_Y1.String = [Tab(t(1)).Var;'Plot AY'];
handles.XS2_Y2.String = [Tab(t(1)).Var;'Plot BY'];
handles.XS2_Y3.String = [Tab(t(1)).Var;'Plot CY'];
handles.XS2_Y4.String = [Tab(t(1)).Var;'Plot DY'];
handles.XS2_LimVar.String = [Tab(t(1)).Var;'Lim Var'];
handles.XS2_LimX1.String = 'Lim 1';
handles.XS2_LimX2.String = 'Lim 2';

% Layout 3
handles.XS3_X.String = [Tab(t(1)).Var;'Plot X'];
handles.XS3_LimX1.String = 'X1';
handles.XS3_LimX2.String = 'X2';
handles.XS3_Y.String = [Tab(t(1)).Var;'Plot Y'];
end