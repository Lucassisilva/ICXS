function f_ExPlot(AxesH,X,Decimal)
% EXPORTA GR�FICO
% Esta fun��o exporta gr�ficos para extens�o .fig. Assim, o usu�rio pode
% modificar a figura e salv�-la em outros formatos.
% O gr�fico � apenas exportado para uma nova janela, ele n�o � salvo
% automaticamente.
% Entrada: AxesH: gr�fico a ser exportado; X: se n�o for '-', deve-se
% escrever o novo t�tulo do eixo x; Decimal: se for 1, ser� exportado
% gr�fico com separador decimal sendo ','.
% Sa�da: -
    
i = round(rand(1)*1000);                                                    % N�mero rand�mico para que uma figura nunca sobreponha a outra
Fig(i) = figure('rend','painters','pos',[10 10 900 600]);                   % Cria��o da figura com seu tamanho
A = copyobj(AxesH, Fig(i));                                                 % Copia o gr�fico do ICxs para essa nova figura
set(gca,'fontsize',18)                                                      % Define o tamanho da fonte na nova figura
set(gca,'position',[0.1,0.15,0.85,0.8])                                     % Define a posi��o do gr�fico na nova figura
if Decimal                                                                  % Modifica a marca decimal, quando solicitado, para v�rgula
    xl = get(A,'XTickLabel');
    new_xl = strrep(xl(:),'.',',');
    set(A,'XTickLabel',new_xl);
    yl = get(A,'YTickLabel');
    new_yl = strrep(yl(:),'.',',');
    set(A,'YTickLabel',new_yl);
end
if strcmp(X,'-') == 0                                                       % Confere se deve-se escrever o novo t�tulo do eixo x do gr�fico
    xlabel(X)                                                               % Escreve t�tulo do eixo X
end
end