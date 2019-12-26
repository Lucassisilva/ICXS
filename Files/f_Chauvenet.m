function [Rejeitado,LRejeitado,DataNew,MediaNew,SDOMNew] = f_Chauvenet(Data)
% CRITÉRIO DE CHAUVENET
% Aplica o critério de Chauvenet (Baseado no livro do Taylor) para conferir
% se há valores outliers.
% Entrada: Data: dados a serem analisados.
% Saída: Rejeitado: outliers; LRejeitado: posição leitura do dado rejeitado;
% DataNew: dados sem outliers; MediaNew: média sem outliers;
% SDOMNew: relação entre o desvio padrão e a raiz da quantidade de dados.

N = length(Data);                                                           % Número de dados
Limite = 1/2;                                                               % Esse é o limite proposto pelo critério
Media = mean(Data);                                                         % Média inicial
DesvPad = std(Data);                                                        % Desvio Padrão inicial

t = abs(Data-Media)./DesvPad;                                               % Desvio
p = normcdf([-t t]);                                                        % Probabilidades limites da distribuição normal
Pout = p(1:N)*2;                                                            % Probability outside
n = Pout*N;                                                                 % Expepected number as deviant as x

% Rejeitar dado
DataNew = Data(n>=Limite);                                                  % Dados não rejeitados
Rejeitado = Data(n<Limite);                                                 % Dados rejeitados
LRejeitado = find(n<Limite);                                                % Posição em Data das leituras rejeitadas
NNew = length(DataNew);                                                     % Número de dados não rejeitados
NRejeitado = N - NNew;                                                      % Número de dados rejeitados

% Calcular novos valores
MediaNew = mean(DataNew);                                                   % Média dos valores não rejeitados
DesvPadNew = std(DataNew);                                                  % Desvio padrão dos valores não rejeitados
SDOMNew = DesvPadNew/sqrt(NNew);                                            % Standard deviation of mean
end