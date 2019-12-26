function [Rejeitado,LRejeitado,DataNew,MediaNew,SDOMNew] = f_Chauvenet(Data)
% CRIT�RIO DE CHAUVENET
% Aplica o crit�rio de Chauvenet (Baseado no livro do Taylor) para conferir
% se h� valores outliers.
% Entrada: Data: dados a serem analisados.
% Sa�da: Rejeitado: outliers; LRejeitado: posi��o leitura do dado rejeitado;
% DataNew: dados sem outliers; MediaNew: m�dia sem outliers;
% SDOMNew: rela��o entre o desvio padr�o e a raiz da quantidade de dados.

N = length(Data);                                                           % N�mero de dados
Limite = 1/2;                                                               % Esse � o limite proposto pelo crit�rio
Media = mean(Data);                                                         % M�dia inicial
DesvPad = std(Data);                                                        % Desvio Padr�o inicial

t = abs(Data-Media)./DesvPad;                                               % Desvio
p = normcdf([-t t]);                                                        % Probabilidades limites da distribui��o normal
Pout = p(1:N)*2;                                                            % Probability outside
n = Pout*N;                                                                 % Expepected number as deviant as x

% Rejeitar dado
DataNew = Data(n>=Limite);                                                  % Dados n�o rejeitados
Rejeitado = Data(n<Limite);                                                 % Dados rejeitados
LRejeitado = find(n<Limite);                                                % Posi��o em Data das leituras rejeitadas
NNew = length(DataNew);                                                     % N�mero de dados n�o rejeitados
NRejeitado = N - NNew;                                                      % N�mero de dados rejeitados

% Calcular novos valores
MediaNew = mean(DataNew);                                                   % M�dia dos valores n�o rejeitados
DesvPadNew = std(DataNew);                                                  % Desvio padr�o dos valores n�o rejeitados
SDOMNew = DesvPadNew/sqrt(NNew);                                            % Standard deviation of mean
end