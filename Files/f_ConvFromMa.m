function [pathname] = f_ConvFromMa(aux)
% CONVERTE ARQUIVOS .MAT
% Esta função converte informações de MATLAB (.mat) para Excel (.xlsx) ou
% Comma-separated values (.csv).
% Os arquivos convertidos ficam na mesma pasta do arquivo a ser convertido,
% escolhido pelo usuário.
% Entrada: aux: representa qual o novo formato do arquivo: xlsx: 1, csv: 2.
% Saída: pathname: pasta onde está o arquivo.

[filename,pathname] = uigetfile('*.mat');                                   % O usuário escolhe o arquivo .mat p/ converter
fullpathname = fullfile(pathname, filename);                                % Junta nome inteiro do arquivo

if fullpathname                                                             % O programa só roda se o usuário escolher um arquivo
    load(fullpathname);                                                     % Load do arquivo
    coisas = matfile(fullpathname);                                         % Lê dados númericos do arquivo
    nomes = whos(coisas);                                                   % Lê nome das variáveis
    N = cell(length(nomes),1);                                              % Cria vetor cell no tamanho do arquivo de load
    A = zeros(length(eval(nomes(1,1).name)),length(nomes));                 % Cria matriz no tamanho do arquivo de load
    for i = 1:length(nomes)                                                 % Aloca todos dados nos vetores Lista e Matrix
        N(1,i) = {nomes(i,1).name};                                         % Vetor com os nomes dos dados
        A(:,i) = eval(nomes(i,1).name);                                     % Matriz com todos os dados numéricos
    end
    
    if aux == 1                                                             % Se o objetivo é converter para arquivo Excel
        sheet = 1;                                                          % Aba do Excel
        xlRange1 = 'A1';                                                    % Cédula do Excel para escrever o cabeçalho
        xlRange2 = 'A2';                                                    % Cédula do Excel para escrever os dados numéricos
        xlswrite(strcat(fullpathname(1:end-3),'xlsx'),N,sheet,xlRange1);    % Salva os nomes das variáveis
        xlswrite(strcat(fullpathname(1:end-3),'xlsx'),A,sheet,xlRange2);    % Salva os dados das variáveis
        
    elseif aux == 2                                                         % Se o objetivo é converter para arquivo csv
        fid = fopen(strcat(fullpathname(1:end-3),'csv'), 'w') ;             % Cria arquivo .csv com mesmo nome do arquivo .mat
        fprintf(fid, '%s,', N{1,1:end-1}) ;                                 % Escreve nele os elementos do cabeçalho, menos o último
        fprintf(fid, '%s\n', N{1,end}) ;                                    % Escreve o último elemento do cabeçalho e pula linha
        fclose(fid) ;                                                       % Fecha o arquivo
        dlmwrite(strcat(fullpathname(1:end-3),'csv'),A, '-append') ;        % Escreve os valores numéricos no arquivo
    end
end
end