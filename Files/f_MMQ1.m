function [A,IA,B,IB,IY,IYx,nu,k] = f_MMQ1(X,Y,X0,Conf,q)
% MÉTODO DOS MÍNIMOS QUADRADOS PARA EQUAÇÃO DE GRAU 1
% Esta função calcula os coeficientes de uma função de primeiro grau pelo
% método dos mínimos quadrados (Y = B*X+A) e as incertezas dos coeficientes
% e de Y, considerando certo nível de confiabilidade e que X não possui
% incerteza.
% Além disso, é calculada a incerteza de Y em certo X, considerando as
% incertezas da média de Y e de B.
% Referências: Taylor, An introduction to error analysis e
%              Norman R. Draper, Harry Smith-Applied Regression Analysis
% Entrada: X: medições de X; Y: medições de y; X0: valores de X, para os
% quais quer-se calcular a curva de incerteza; Conf: nível de
% confiabilidade [0<Conf<=100%]; q: observações futuras.
% Saída: A, IA, B, IB, IY: coeficientes e incertezas (Y = B*X+A); IYx:
% incerteza de Y para certo X0; nu: graus de liberdade; k: Fator para
% distribuição t com nível de confiabilidade Conf [%].

N = length(X);                                                              % Quantidade de medições
nu = N-2;                                                                   % Graus de liberdade
if Conf                                                                     % Caso Conf == 0, desconsidera-se a multiplicação para obter a incerteza em certo nível de confiabilidade
    k = tinv(1-(100-Conf)/100/2,N-2);                                       % Fator para distribuição t com nível de confiabilidade Conf
else
    k = 1;
end
Delt = N*sum(X.^2)-sum(X)^2;                                                % Auxiliar em cálculos posteriores
A = (sum(X.^2)*sum(Y)-sum(X)*sum(X.*Y))/(Delt);                             % Y = B*X+A
B = (N*sum(X.*Y)-sum(X)*sum(Y))/(Delt);                                     % Y = B*X+A

IY = k * sqrt((1/nu)*sum((Y-A-B*X).^2));                                    % Incerteza de Y
IA = IY*sqrt(sum(X.^2)/Delt);                                               % Incerteza de A
IB = IY*sqrt(N/Delt);                                                       % Incerteza de B
IYx = IY*sqrt(1/q+1/N+(X0-mean(X)).^2/sum((X-mean(X)).^2));                 % Incerteza de Y para certo X0
end