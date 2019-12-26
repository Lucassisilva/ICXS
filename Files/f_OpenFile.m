function [Lista,Matrix,pathname,filename,fullpathname] = f_OpenFile(Id)
% ABRE ARQUIVO
% Esta função abre arquivos de dados com as extensões: MATLAB (.mat),
% Excel (.xls*) ou Comma-separated values (.csv,.txt,.dat).
% O usuário pode escolher o arquivo na pasta onde ele estiver.
% Entrada: Id: idioma.
% Saída: Lista: célula com o nome das variáveis; Matrix: matriz com os
% dados; pathname: pasta onde está o arquivo; filename: nome do arquivo sem
% a extensão; fullpathname: pathname+filename+extensão.

[filename,pathname] = uigetfile('*');                                       % O usuário escolhe o arquivo p/ abrir
fullpathname = fullfile(pathname, filename);                                % Junta nome inteiro do arquivo

if fullpathname                                                             % O programa só roda se o usuário escolher um arquivo
    
    if filename(end-2:end) == 'mat'                                         % Descobre pelo nome do arquivo qual será o tipo do arquivo p/ abrir
        load(fullpathname);                                                 % Load do arquivo
        coisas = matfile(fullpathname);                                     % Lê dados númericos do arquivo
        nomes = whos(coisas);                                               % Lê nome das variáveis
        Lista = cell(length(nomes),1);                                      % Cria vetor cell no tamanho do arquivo de load
        Matrix = zeros(length(eval(nomes(1,1).name)),length(nomes));        % Cria matriz no tamanho do arquivo de load
        for i = 1:length(nomes)                                             % Aloca todos dados nos vetores Lista e Matrix
            Lista(i) = {nomes(i,1).name};                                   % Vetor com os nomes dos dados
            Matrix(:,i) = eval(nomes(i,1).name);                            % Matriz com todos os dados numéricos
        end
        filename = filename(1:end-4);                                       % Salva o nome do arquivo sem sua extensão
        
    elseif filename(end-3:end) == 'xlsx'
        [Matrix,Lista(:,1),raw] = xlsread(fullpathname);                    % Leitura do Excel
        filename = filename(1:end-5);                                       % Salva o nome do arquivo sem sua extensão
    elseif filename(end-2:end) == 'xls'
        [Matrix,Lista(:,1),raw] = xlsread(fullpathname);                    % Leitura do Excel
        filename = filename(1:end-4);                                       % Salva o nome do arquivo sem sua extensão
    elseif filename(end-2:end) == 'CSV' | filename(end-2:end) == 'csv' |...
            filename(end-2:end) == 'txt' | filename(end-2:end) == 'dat'
        T = readtable(fullpathname);                                        % Leitura do Comma-separated values
        Lista(:,1) = T.Properties.VariableNames;                            % Vetor com os nomes dos dados
        Matrix = T{:,:};                                                    % Matriz com todos os dados numéricos
        filename = filename(1:end-4);                                       % Salva o nome do arquivo sem sua extensão
    else                                                                    % Caso o usuário tente converter um arquivo não compatível, ICxs retorna um msgbox
        if Id == 0
            msgbox('This file I can`t open. Maybe you should read the Help file.');
        elseif Id == 1
            msgbox('Esse arquivo eu não consigo abrir. Talvez você devesse ler o Manual do Usuário.');
        end
        filename = 0; Matrix = 0; Lista = Matrix;                           % As próximas linhas previnem bugs de incompatibilidade
        pathname = Matrix; filename = Matrix; fullpathname = Matrix;
    end
else
    filename = 0; Matrix = 0; Lista = Matrix;
    pathname = Matrix; filename = Matrix; fullpathname = Matrix;
end
end