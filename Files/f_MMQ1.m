function [A,IA,B,IB,IY,IYx,nu,k] = f_MMQ1(X,Y,X0,Conf,q)
% M�TODO DOS M�NIMOS QUADRADOS PARA EQUA��O DE GRAU 1
% Esta fun��o calcula os coeficientes de uma fun��o de primeiro grau pelo
% m�todo dos m�nimos quadrados (Y = B*X+A) e as incertezas dos coeficientes
% e de Y, considerando certo n�vel de confiabilidade e que X n�o possui
% incerteza.
% Al�m disso, � calculada a incerteza de Y em certo X, considerando as
% incertezas da m�dia de Y e de B.
% Refer�ncias: Taylor, An introduction to error analysis e
%              Norman R. Draper, Harry Smith-Applied Regression Analysis
% Entrada: X: medi��es de X; Y: medi��es de y; X0: valores de X, para os
% quais quer-se calcular a curva de incerteza; Conf: n�vel de
% confiabilidade [0<Conf<=100%]; q: observa��es futuras.
% Sa�da: A, IA, B, IB, IY: coeficientes e incertezas (Y = B*X+A); IYx:
% incerteza de Y para certo X0; nu: graus de liberdade; k: Fator para
% distribui��o t com n�vel de confiabilidade Conf [%].

N = length(X);                                                              % Quantidade de medi��es
nu = N-2;                                                                   % Graus de liberdade
if Conf                                                                     % Caso Conf == 0, desconsidera-se a multiplica��o para obter a incerteza em certo n�vel de confiabilidade
    k = tinv(1-(100-Conf)/100/2,N-2);                                       % Fator para distribui��o t com n�vel de confiabilidade Conf
else
    k = 1;
end
Delt = N*sum(X.^2)-sum(X)^2;                                                % Auxiliar em c�lculos posteriores
A = (sum(X.^2)*sum(Y)-sum(X)*sum(X.*Y))/(Delt);                             % Y = B*X+A
B = (N*sum(X.*Y)-sum(X)*sum(Y))/(Delt);                                     % Y = B*X+A

IY = k * sqrt((1/nu)*sum((Y-A-B*X).^2));                                    % Incerteza de Y
IA = IY*sqrt(sum(X.^2)/Delt);                                               % Incerteza de A
IB = IY*sqrt(N/Delt);                                                       % Incerteza de B
IYx = IY*sqrt(1/q+1/N+(X0-mean(X)).^2/sum((X-mean(X)).^2));                 % Incerteza de Y para certo X0
end