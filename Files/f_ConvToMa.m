function [pathname] = f_ConvToMa()
% CONVERTE ARQUIVOS PARA .MAT
% Esta função converte informações de Excel (.xls*) ou Comma-separated
% values (.csv,.txt,.dat) para MATLAB (.mat).
% Os arquivos convertidos ficam na mesma pasta do arquivo a ser convertido,
% escolhido pelo usuário.
% Entrada: -
% Saída: pathname: pasta onde está o arquivo.

[filename,pathname] = uigetfile('*');                                       % O usuário escolhe o arquivo p/ converter
fullpathname = fullfile(pathname, filename);                                % Junta nome inteiro do arquivo

if fullpathname                                                             % O programa só roda se o usuário escolher um arquivo
    if filename(end-2:end) == 'xls'                                         % Descobre pelo nome do arquivo qual será o tipo do arquivo a ser convertido
        [num,txt,raw] = xlsread(fullpathname);                              % Leitura do arquivo Excel
    elseif filename(end-3:end) == 'xlsx'
        [num,txt,raw] = xlsread(fullpathname);                              % Leitura do arquivo Excel
    elseif filename(end-2:end) == 'CSV' | filename(end-2:end) == 'csv' |...
            filename(end-2:end) == 'txt' | filename(end-2:end) == 'dat'
        T = readtable(fullpathname);                                        % Leitura do arquivo Comma-separated values
        txt = T.Properties.VariableNames;                                   % Nome das variáveis
        num = T{:,:};                                                       % Dados numéricos
    else                                                                    % Caso o usuário tente converter um arquivo não compatível, ICxs retorna um msgbox
        msgbox('This file I can`t convert. Maybe you should read the help file.');
        return
    end
    [l,c] = size(num);                                                      % Confere a quantidade de dados
    for i = 1:c                                                             % Atribuição dos dados a cada variável
        NomeVar = txt{1,i};                                                 
        eval([NomeVar,'=num(:,i)']);                                        % Cria cada variável e atribui a ela seu vetor
    end
    
    if fullpathname(end) == 'x'                                             % Confere se a extensão do arquivo tem 4 letras, isto é, xlsx
        save(strcat(fullpathname(1:end-4),'mat'),txt{1,:});                 % Salva dados em ".mat"
    else
        save(strcat(fullpathname(1:end-3),'mat'),txt{1,:});                 % Salva dados em ".mat"
    end
end
end