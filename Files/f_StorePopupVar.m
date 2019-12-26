function [Tab] = f_StorePopupVar(Tab,t,handles)
% GRAVA O NOME E A POSIÇÃO DOS POPUPMENUS
% Esta função salva em Tab o nome e posição das variáveis posicionadas nos
% popupmenus, isto é, ela grava quais dados estão sendo plotados.
% Entrada: Tab: informações dos dados; t: informações de layout e aba;
% handles: informações do gui.
% Saída: Tab: informações dos dados.

var = {'Plot X','Plot AY','Plot BY','Plot CY','Plot DY','Plot AX',...           % Nome default dos popupmenus
    'Plot BX','Plot CX','Plot DX','Plot AY','Plot BY','Plot CY',...
    'Plot DY','LimVar','Plot X','Plot Y'};

%% Layout 1
Tab(t(1)).Layout(1).Cont(1) = handles.XS1_X.Value;
Tab(t(1)).Layout(1).Cont(2) = handles.XS1_Y1.Value;
Tab(t(1)).Layout(1).Cont(3) = handles.XS1_Y2.Value;
Tab(t(1)).Layout(1).Cont(4) = handles.XS1_Y3.Value;
Tab(t(1)).Layout(1).Cont(5) = handles.XS1_Y4.Value;
Tab(t(1)).Layout(1).Cont(6) = str2double(handles.XS1_LimX1.String);
Tab(t(1)).Layout(1).Cont(7) = str2double(handles.XS1_LimX2.String);

for i = 1:5                                                                 % Confere se cada nome nos popupmenus é diferente do default
    if length(Tab(t(1)).Var)>=Tab(t(1)).Layout(1).Cont(i)
        var(i) = Tab(t(1)).Var(Tab(t(1)).Layout(1).Cont(i));                % Salva em var o nome do popupmenu caso diferente do default
    end
end

%% Layout 2
Tab(t(1)).Layout(2).Cont(1) = handles.XS2_X1.Value;
Tab(t(1)).Layout(2).Cont(2) = handles.XS2_X2.Value;
Tab(t(1)).Layout(2).Cont(3) = handles.XS2_X3.Value;
Tab(t(1)).Layout(2).Cont(4) = handles.XS2_X4.Value;
Tab(t(1)).Layout(2).Cont(5) = handles.XS2_Y1.Value;
Tab(t(1)).Layout(2).Cont(6) = handles.XS2_Y2.Value;
Tab(t(1)).Layout(2).Cont(7) = handles.XS2_Y3.Value;
Tab(t(1)).Layout(2).Cont(8) = handles.XS2_Y4.Value;
Tab(t(1)).Layout(2).Cont(9) = handles.XS2_LimVar.Value;
Tab(t(1)).Layout(2).Cont(10) = str2double(handles.XS2_LimX1.String);
Tab(t(1)).Layout(2).Cont(11) = str2double(handles.XS2_LimX2.String);

for i = 1:9
    if length(Tab(t(1)).Var)>=Tab(t(1)).Layout(2).Cont(i)
        var(i+5) = Tab(t(1)).Var(Tab(t(1)).Layout(2).Cont(i));
    end
end

%% Layout 3
j = length(handles.XS3_Y.Value);                                            % Número de elementos selecionados no listbox para plot
Tab(t(1)).Layout(3).Cont = zeros(1,j+3);
Tab(t(1)).Layout(3).Cont(3) = handles.XS3_X.Value;
Tab(t(1)).Layout(3).Cont(4:j+3) = handles.XS3_Y.Value;
Tab(t(1)).Layout(3).Cont(1) = str2double(handles.XS3_LimX1.String);
Tab(t(1)).Layout(3).Cont(2) = str2double(handles.XS3_LimX2.String);

for i = 1:j+1                                                               % O valor máximo de i não é fixo pois depende da quantidade de elementos plotados
    if length(Tab(t(1)).Var)>=Tab(t(1)).Layout(3).Cont(i+2)
        var(i+14) = Tab(t(1)).Var(Tab(t(1)).Layout(3).Cont(i+2));
    end
end

%% Salva em tab o nome de todos os popupmenus
Tab(t(1)).Layout(1).ContN = var(1:5);
Tab(t(1)).Layout(2).ContN = var(6:14);
Tab(t(1)).Layout(3).ContN = var(15:end);
end