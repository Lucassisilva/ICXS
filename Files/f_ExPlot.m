function f_ExPlot(AxesH,X,Decimal)
% EXPORTA GRÁFICO
% Esta função exporta gráficos para extensão .fig. Assim, o usuário pode
% modificar a figura e salvá-la em outros formatos.
% O gráfico é apenas exportado para uma nova janela, ele não é salvo
% automaticamente.
% Entrada: AxesH: gráfico a ser exportado; X: se não for '-', deve-se
% escrever o novo título do eixo x; Decimal: se for 1, será exportado
% gráfico com separador decimal sendo ','.
% Saída: -
    
i = round(rand(1)*1000);                                                    % Número randômico para que uma figura nunca sobreponha a outra
Fig(i) = figure('rend','painters','pos',[10 10 900 600]);                   % Criação da figura com seu tamanho
A = copyobj(AxesH, Fig(i));                                                 % Copia o gráfico do ICxs para essa nova figura
set(gca,'fontsize',18)                                                      % Define o tamanho da fonte na nova figura
set(gca,'position',[0.1,0.15,0.85,0.8])                                     % Define a posição do gráfico na nova figura
if Decimal                                                                  % Modifica a marca decimal, quando solicitado, para vírgula
    xl = get(A,'XTickLabel');
    new_xl = strrep(xl(:),'.',',');
    set(A,'XTickLabel',new_xl);
    yl = get(A,'YTickLabel');
    new_yl = strrep(yl(:),'.',',');
    set(A,'YTickLabel',new_yl);
end
if strcmp(X,'-') == 0                                                       % Confere se deve-se escrever o novo título do eixo x do gráfico
    xlabel(X)                                                               % Escreve título do eixo X
end
end