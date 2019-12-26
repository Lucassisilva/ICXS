function [Media,Inct,MediaStr,InctStr] = f_Round(Media,Inct)
% ARREDONDA INCERTEZA E M�DIA
% Esta fun��o arredonda os valores da incerteza e da m�dia de uma
% grandeza, atentando-se aos algarismos significativos, para que o
% resultado possa ser apresentado.
% Introduction to error analysis, the study of uncertainties in physical measurements, Taylor
% Entrada: Media: m�dia do resultado; Inct: incerteza.
% Sa�da: Media: m�dia do resultado; Inct: incerteza; MediaStr: string de
% Media; InctStr: string de Inct. Esses valores de sa�da s�o arredondados.

n = 0;                                                                      % N�mero de casas decimais

if (Inct<1)                                                                 % Caso o algarismo significativo fique depois da v�rgula
    while(Inct<1)                                                           % Descobrir o n�mero de casas decimais e tornar o n�mero entre 1 e 10
        Inct = Inct*10;                                                     % Torna a incerteza em um n�mero entre 1 e 10 depois de algumas entradas no while
        n = n + 1;                                                          % Quantidade de casas decimais
    end
    if (Inct>=3)                                                            % Caso o algarismo significativo for 1 ou 2, ele ser� representado com 2 algarismos
        Inct = round(Inct,0)/10^n;                                          % Valor da incerteza j� arredondada e com algarismo significativo correto
        InctStr = num2str(Inct,1);                                          % Valor da incerteza j� arredondada e com algarismo significativo correto em string
    else
        Inct = round(Inct,1)/10^n;                                          % Valor da incerteza j� arredondada e com algarismo significativo correto
        InctStr = num2str(Inct,2);                                          % Valor da incerteza j� arredondada e com algarismo significativo correto em string
        n = n + 1;
    end
else                                                                        % Caso o algarismo significativo fique antes da v�rgula
    while(Inct>=10)                                                         % Descobrir o n�mero de casas decimais e tornar o n�mero entre 1 e 10
        Inct = Inct/10;                                                     % Torna a incerteza em um n�mero entre 1 e 10 depois de algumas entradas no while
        n = n - 1;                                                          % Quantidade de casas decimais
    end
    if (round(Inct,1)>=3)                                                   % Caso o algarismo significativo for 1 ou 2, ele ser� representado com 2 algarismos
        Inct = round(Inct,0)/10^n;                                          % Valor da incerteza j� arredondada e com algarismo significativo correto
        Digt = floor(log10(abs(Inct)+1)) + 1;                               % N�mero de d�gitos antes da v�rgula
        InctStr = num2str(Inct,Digt);                                       % Valor da incerteza j� arredondada e com algarismo significativo correto em string
    else
        Inct = round(Inct,1)/10^n;                                          % Valor da incerteza j� arredondada e com algarismo significativo correto
        Digt = floor(log10(abs(Inct)+1)) + 1;                               % N�mero de d�gitos antes da v�rgula (-1)
        InctStr = num2str(Inct,Digt+1);                                     % Valor da incerteza j� arredondada e com algarismo significativo correto em string
        n = n + 1;
    end
end
Media = round(Media,n);                                                     % M�dia arredondada
MediaStr = num2str(Media);                                                  % M�dia arredondada em string
end