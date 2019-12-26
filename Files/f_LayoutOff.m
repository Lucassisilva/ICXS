function [t] = f_LayoutOff(Lon,handles,t)
% DESATIVA LAYOUT
% Esta função desativa os layouts quando o usuário comanda.
% Entrada: Lon: layout ativado; handles: informações do gui; t: informações
% de layout e aba.
% Saída: t: informações de layout e aba.

t(3) = Lon;                                                                 % Define novo layout ativado

switch Lon
    case 1
        handles.Layout2.State = 'off';
        handles.Layout3.State = 'off';
        handles.XS2_XS.Visible = 'off';                                     % Some com o painel
        handles.XS3_XS.Visible = 'off';                                     % Some com o painel
    case 2
        handles.Layout1.State = 'off';
        handles.Layout3.State = 'off';
        handles.XS1_XS.Visible = 'off';                                     % Some com o painel
        handles.XS3_XS.Visible = 'off';                                     % Some com o painel
    case 3
        handles.Layout1.State = 'off';
        handles.Layout2.State = 'off';
        handles.XS1_XS.Visible = 'off';                                     % Some com o painel
        handles.XS2_XS.Visible = 'off';                                     % Some com o painel
end
end