function f_TabState(Ton,handles)
% MODIFICA O ESTADO DAS ABAS
% Esta função modifica o estado das abas. Ela ativa uma nova aba
% selecionada e desativa as outras.
% Entrada: Ton: tabela ativada; handles: informações do gui.
% Saída: -

t = getappdata(handles.ICxs_Defaut,'T');
t(1) = Ton;                                                                 % Define nova aba ativada
setappdata(handles.ICxs_Defaut,'T',t);

switch Ton                                                                  % Confere o número da aba ativada para torná-la visível e com estado ativado. Assim desativa as outras.
    case 1
        handles.Tab1.Visible = 'on';
        handles.Tab1.State = 'on';
        handles.Tab2.State = 'off';
        handles.Tab3.State = 'off';
        handles.Tab4.State = 'off';
        handles.Tab5.State = 'off';
        handles.Tab6.State = 'off';
        handles.Tab7.State = 'off';
        handles.Tab8.State = 'off';
        handles.Tab9.State = 'off';
        handles.Tab10.State = 'off';
    case 2
        handles.Tab2.Visible = 'on';
        handles.Tab2.State = 'on';
        handles.Tab1.State = 'off';
        handles.Tab3.State = 'off';
        handles.Tab4.State = 'off';
        handles.Tab5.State = 'off';
        handles.Tab6.State = 'off';
        handles.Tab7.State = 'off';
        handles.Tab8.State = 'off';
        handles.Tab9.State = 'off';
        handles.Tab10.State = 'off';
    case 3
        handles.Tab3.Visible = 'on';
        handles.Tab3.State = 'on';
        handles.Tab2.State = 'off';
        handles.Tab1.State = 'off';
        handles.Tab4.State = 'off';
        handles.Tab5.State = 'off';
        handles.Tab6.State = 'off';
        handles.Tab7.State = 'off';
        handles.Tab8.State = 'off';
        handles.Tab9.State = 'off';
        handles.Tab10.State = 'off';
    case 4
        handles.Tab4.Visible = 'on';
        handles.Tab4.State = 'on';
        handles.Tab2.State = 'off';
        handles.Tab3.State = 'off';
        handles.Tab1.State = 'off';
        handles.Tab5.State = 'off';
        handles.Tab6.State = 'off';
        handles.Tab7.State = 'off';
        handles.Tab8.State = 'off';
        handles.Tab9.State = 'off';
        handles.Tab10.State = 'off';
    case 5
        handles.Tab5.Visible = 'on';
        handles.Tab5.State = 'on';
        handles.Tab2.State = 'off';
        handles.Tab3.State = 'off';
        handles.Tab4.State = 'off';
        handles.Tab1.State = 'off';
        handles.Tab6.State = 'off';
        handles.Tab7.State = 'off';
        handles.Tab8.State = 'off';
        handles.Tab9.State = 'off';
        handles.Tab10.State = 'off';
    case 6
        handles.Tab6.Visible = 'on';
        handles.Tab6.State = 'on';
        handles.Tab2.State = 'off';
        handles.Tab3.State = 'off';
        handles.Tab4.State = 'off';
        handles.Tab5.State = 'off';
        handles.Tab1.State = 'off';
        handles.Tab7.State = 'off';
        handles.Tab8.State = 'off';
        handles.Tab9.State = 'off';
        handles.Tab10.State = 'off';
    case 7
        handles.Tab7.Visible = 'on';
        handles.Tab7.State = 'on';
        handles.Tab2.State = 'off';
        handles.Tab3.State = 'off';
        handles.Tab4.State = 'off';
        handles.Tab5.State = 'off';
        handles.Tab6.State = 'off';
        handles.Tab1.State = 'off';
        handles.Tab8.State = 'off';
        handles.Tab9.State = 'off';
        handles.Tab10.State = 'off';
    case 8
        handles.Tab8.Visible = 'on';
        handles.Tab8.State = 'on';
        handles.Tab2.State = 'off';
        handles.Tab3.State = 'off';
        handles.Tab4.State = 'off';
        handles.Tab5.State = 'off';
        handles.Tab6.State = 'off';
        handles.Tab7.State = 'off';
        handles.Tab1.State = 'off';
        handles.Tab9.State = 'off';
        handles.Tab10.State = 'off';
    case 9
        handles.Tab9.Visible = 'on';
        handles.Tab9.State = 'on';
        handles.Tab2.State = 'off';
        handles.Tab3.State = 'off';
        handles.Tab4.State = 'off';
        handles.Tab5.State = 'off';
        handles.Tab6.State = 'off';
        handles.Tab7.State = 'off';
        handles.Tab8.State = 'off';
        handles.Tab1.State = 'off';
        handles.Tab10.State = 'off';
    case 10
        handles.Tab10.Visible = 'on';
        handles.Tab10.State = 'on';
        handles.Tab2.State = 'off';
        handles.Tab3.State = 'off';
        handles.Tab4.State = 'off';
        handles.Tab5.State = 'off';
        handles.Tab6.State = 'off';
        handles.Tab7.State = 'off';
        handles.Tab8.State = 'off';
        handles.Tab9.State = 'off';
        handles.Tab1.State = 'off';
end
end

