function [t] = f_LayoutOff(Lon,handles,t)
% DESATIVA LAYOUT
% Esta fun��o desativa os layouts quando o usu�rio comanda.
% Entrada: Lon: layout ativado; handles: informa��es do gui; t: informa��es
% de layout e aba.
% Sa�da: t: informa��es de layout e aba.

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