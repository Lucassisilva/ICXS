function varargout = AppChauvenet(varargin)
% APPCHAUVENET MATLAB code for AppChauvenet.fig
%      APPCHAUVENET, by itself, creates a new APPCHAUVENET or raises the existing
%      singleton*.
%
%      H = APPCHAUVENET returns the handle to a new APPCHAUVENET or the handle to
%      the existing singleton*.
%
%      APPCHAUVENET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPCHAUVENET.M with the given input arguments.
%
%      APPCHAUVENET('Property','Value',...) creates a new APPCHAUVENET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppChauvenet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppChauvenet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppChauvenet

% Last Modified by GUIDE v2.5 16-Jan-2018 12:34:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppChauvenet_OpeningFcn, ...
                   'gui_OutputFcn',  @AppChauvenet_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before AppChauvenet is made visible.
function AppChauvenet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppChauvenet (see VARARGIN)

% Choose default command line output for AppChauvenet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes AppChauvenet wait for user response (see UIRESUME)
% uiwait(handles.ChauveCrit);

set(handles.ListaReject,'Max',2,'Min',0);                                   % Pode-se escolher múltiplos dados para não rejeitar
% Mudar o idioma
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.ChauveCrit.Name = 'Critério de Chauvenet';
        handles.Title.String = 'CRITÉRIO DE CHAUVENET';
        handles.ImportMenu.Label = 'Importar';
            handles.ImpPlotA.Label = 'Gráfico A';
            handles.ImpPlotB.Label = 'Gráfico B';
            handles.ImpPlotC.Label = 'Gráfico C';
            handles.ImpPlotD.Label = 'Gráfico D';
        handles.ExportMenu.Label = 'Exportar';
        handles.CalcB.String = 'Calcular';
        handles.RejDat.String = 'Dados rejeitados';
        handles.NReject.String = 'Não rejeitar';
    else                                                                    % Inglês
        handles.ChauveCrit.Name = 'Chauvenet''s Criterion';
        handles.Title.String = 'CHAUVENET''S CRITERION';
        handles.ImportMenu.Label = 'Import';
            handles.ImpPlotA.Label = 'Plot A';
            handles.ImpPlotB.Label = 'Plot B';
            handles.ImpPlotC.Label = 'Plot C';
            handles.ImpPlotD.Label = 'Plot D';
        handles.ExportMenu.Label = 'Export';
        handles.CalcB.String = 'Calculate';
        handles.RejDat.String = 'Rejected data';
        handles.NReject.String = 'Don''t reject';
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppChauvenet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in ListaReject.
function ListaReject_Callback(hObject, eventdata, handles)
% hObject    handle to ListaReject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns ListaReject contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ListaReject

% --- Executes during object creation, after setting all properties.
function ListaReject_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ListaReject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in NReject.
function NReject_Callback(hObject, eventdata, handles)
% hObject    handle to NReject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rej = handles.ListaReject.String;                                           % Dados a serem rejeitados indicados na lista
RejNum = str2num(Rej);                                                      % Lista de números que poderiam ser rejeitados
RejNum = RejNum(:,1);                                                       % Pega apenas o número que está antes do parênteses
if ~isempty(Rej)                                                            % Se houver dados a serem rejeitados, eles devem ser tirados de Data
    NRejNum = RejNum(handles.ListaReject.Value);                            % Números para não serem rejeitados
    for i = 1:length(NRejNum)                                               % Percorre os dados a não serem rejeitados para tirá-los da lista
        RejNSel = Rej((find(RejNum~=NRejNum(i))),:);                        % Dados que ainda devem ser rejeitados
        handles.ListaReject.String = RejNSel;                               % Expõe dados que ainda devem ser rejeitados
    end
    if handles.CalcB.String(end)~='*' & handles.ListaReject.Value           % Caso tenham sido modificados os dados a serem rejeitados...
        handles.CalcB.String = strcat(handles.CalcB.String,'*');            % ... o usuário deve saber que deve ser recalculado
    end
    handles.ListaReject.Value = [];                                         % Depois do processo, os dados são desselecionados
end

Rej = handles.ListaReject.String;
if ~isempty(Rej)                                                            % Modifica o valor da quantidade dos dados a serem rejeitados
    handles.N2.String = num2str(str2double(handles.N1.String)-length(Rej(:,1)));
else
    handles.ListaReject.String = '';
    handles.N2.String = handles.N1.String;
end

% --- Executes on button press in CalcB.
function CalcB_Callback(hObject, eventdata, handles)
% hObject    handle to CalcB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.CalcB.String(end)=='*'                                           % Nome do botão volta ao normal quando é ativado depois de moficação nos dados rejeitados
    handles.CalcB.String(end) = '';
end
XData = getappdata(handles.ImportMenu,'XDATA');
Data = getappdata(handles.ImportMenu,'DATA');

Rej = handles.ListaReject.String;                                           % Dados a serem rejeitados indicados na lista

if ~isempty(Rej)                                                            % Se houver dados a serem rejeitados, eles devem ser tirados de Data
    for i = 1:length(Rej(:,1))                                              % Percorre os dados a serem rejeitados
        %NumString = Rej(i,1:strfind(Rej(i,:),' (')-1);                      % Pega apenas o número que está antes do parênteses
        Num = str2num(Rej(i,:));
        Data = Data(XData ~= Num(2)); 
        XData = XData(XData ~= Num(2));    
    end
end

MediaNew = mean(Data);                                                      % Média dos valores não rejeitados
DesvPadNew = std(Data);                                                     % Desvio padrão dos valores não rejeitados
SDOMNew = DesvPadNew/sqrt(length(Data));                                    % Standard deviation of mean

set(handles.Grafico.Children,'Xdata',XData,'Ydata',Data);                   % Modifica os dados plotados no gráfico
xlim(handles.Grafico,'auto');                                               % Atualiza os limites do gráfico
ylim(handles.Grafico,'auto');                                               % Atualiza os limites do gráfico

handles.MediaNew.String = num2str(MediaNew);                                % Expõe média dos dados tratados
handles.DesvPadNew.String = num2str(std(Data));                             % Expõe desvio padrão dos dados tratados

[MediaR,InctR,MediaStr,SDOMStr] = f_Round(MediaNew,SDOMNew); 
[Not1,InctRel,Not2,SDOMRelStr] = f_Round(MediaNew,abs(SDOMNew/MediaNew*100));
handles.Result.String = strcat('x =',{' '},MediaStr,' ±',{' '},SDOMStr);    % Expõe média e incerteza dos dados tratados
handles.ResultP.String = strcat('x =',{' '},MediaStr,' ±',{' '},SDOMRelStr,'%'); % Expõe média e incerteza relativa dos dados tratados

% --------------------------------------------------------------------
function ImportMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ImportMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ImpPlotA_Callback(hObject, eventdata, handles)
% hObject    handle to ImpPlotA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    handles.MediaNew.String = '';                                           % Default para os textos...
    handles.DesvPadNew.String = '';
    handles.Result.String = 'x =    ...   ±   ...';
    handles.ResultP.String = 'x =    ...   ±   ... %';
    
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    NameX = ICXSData.XS1_X.String;                                          % Nome dos dados para usar quando for exportar
    NameY = ICXSData.XS1_Y1.String;                                         % Nome dos dados para usar quando for exportar
    setappdata(handles.ImportMenu,'NAMEX',NameX(ICXSData.XS1_X.Value));
    setappdata(handles.ImportMenu,'NAMEY',NameY(ICXSData.XS1_Y1.Value));

    cla(handles.Grafico,'reset')                                            % Deleta informações anteriores do gráfico
    lin = copyobj(get(ICXSData.XS1_1,'children'),handles.Grafico);          % Copia o que foi plotado no ICXS para o App
    grid(handles.Grafico,'on')                                              % Ativa grade
    Xlim = get(ICXSData.XS1_1,'Xlim');                                      % Limites de X
    set(handles.Grafico,'XTick',[]);                                        % Não mostra Dados do eixo X
    set(handles.Grafico,'Xlim',Xlim);                                       % Corrige os limites do eixo X
    set(handles.Grafico,'fontsize',8);                                      % Tamanho da fonte dos dados em Y
    
    XDataTot = get(lin,'Xdata');                                            % Todos dados da variável plotada em X
    YDataTot = get(lin,'Ydata');                                            % Todos dados da variável plotada em Y
    Data = YDataTot(find(XDataTot>=Xlim(1),1,'first')...                    % Dados a serem analisados
        :find(XDataTot<=Xlim(2),1,'last'));
    XData = XDataTot(find(XDataTot>=Xlim(1),1,'first')...                   % Número da "leitura" dos dados a serem analisados
        :find(XDataTot<=Xlim(2),1,'last'));
    setappdata(handles.ImportMenu,'DATA',Data);                             % Data é "salvo" para que possa entrar em outras funções
    setappdata(handles.ImportMenu,'XDATA',XData);                           % XData é "salvo" para que possa entrar em outras funções
    handles.MediaOld.String = num2str(mean(Data));                          % Expõe o valor da média com todos os dados
    handles.DesvPadOld.String = num2str(std(Data));                         % Expõe o valor do desvio padrão com todos os dados

    [Rejeitado,LRejeitado,DataNew,MediaNew,SDOMNew] = f_Chauvenet(Data);
    
    handles.N1.String = num2str(length(Data));                              % Expõe a quatidade de dados iniciais
    handles.N2.String = num2str(length(DataNew));                           % Expõe a quatidade de dados não rejeitados pelo critério
    if ~isempty(Rejeitado)
        XRejeitado = XData(LRejeitado);
        handles.ListaReject.String = strcat(num2str(Rejeitado'),' (',...    % Expõe os valores a serem rejeitados
            num2str(XRejeitado'),')');
        XData = XData(setdiff([1:length(XData)],LRejeitado));                       % Apenas dados que não serão rejeitados
        Data = Data(setdiff([1:length(Data)],LRejeitado));                          % Apenas dados que não serão rejeitados
    else
        handles.ListaReject.String = '';                                    % Caso nenhum dado deva ser rejeitado, nada é mostrado na lista
    end
    set(handles.Grafico.Children,'Xdata',XData,'Ydata',Data);               % Modifica os dados plotados no gráfico
end
% --------------------------------------------------------------------
function ImpPlotB_Callback(hObject, eventdata, handles)
% hObject    handle to ImpPlotB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    handles.MediaNew.String = '';                                           % Default para os textos...
    handles.DesvPadNew.String = '';
    handles.Result.String = 'x =    ...   ±   ...';
    handles.ResultP.String = 'x =    ...   ±   ... %';
    
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    NameX = ICXSData.XS1_X.String;                                          % Nome dos dados para usar quando for exportar
    NameY = ICXSData.XS1_Y2.String;                                         % Nome dos dados para usar quando for exportar
    setappdata(handles.ImportMenu,'NAMEX',NameX(ICXSData.XS1_X.Value));
    setappdata(handles.ImportMenu,'NAMEY',NameY(ICXSData.XS1_Y2.Value));

    cla(handles.Grafico,'reset')                                            % Deleta informações anteriores do gráfico
    lin = copyobj(get(ICXSData.XS1_2,'children'),handles.Grafico);          % Copia o que foi plotado no ICXS para o App
    grid(handles.Grafico,'on')                                              % Ativa grade
    Xlim = get(ICXSData.XS1_2,'Xlim');                                      % Limites de X
    set(handles.Grafico,'XTick',[]);                                        % Não mostra Dados do eixo X
    set(handles.Grafico,'Xlim',Xlim);                                       % Corrige os limites do eixo X
    set(handles.Grafico,'fontsize',8);                                      % Tamanho da fonte dos dados em Y
    
    XDataTot = get(lin,'Xdata');                                            % Todos dados da variável plotada em X
    YDataTot = get(lin,'Ydata');                                            % Todos dados da variável plotada em Y
    Data = YDataTot(find(XDataTot>=Xlim(1),1,'first')...                    % Dados a serem analisados
        :find(XDataTot<=Xlim(2),1,'last'));
    XData = XDataTot(find(XDataTot>=Xlim(1),1,'first')...                   % Número da "leitura" dos dados a serem analisados
        :find(XDataTot<=Xlim(2),1,'last'));
    setappdata(handles.ImportMenu,'DATA',Data);                             % Data é "salvo" para que possa entrar em outras funções
    setappdata(handles.ImportMenu,'XDATA',XData);                           % XData é "salvo" para que possa entrar em outras funções
    handles.MediaOld.String = num2str(mean(Data));                          % Expõe o valor da média com todos os dados
    handles.DesvPadOld.String = num2str(std(Data));                         % Expõe o valor do desvio padrão com todos os dados

    [Rejeitado,LRejeitado,DataNew,MediaNew,SDOMNew] = f_Chauvenet(Data);
    
    handles.N1.String = num2str(length(Data));                              % Expõe a quatidade de dados iniciais
    handles.N2.String = num2str(length(DataNew));                           % Expõe a quatidade de dados não rejeitados pelo critério
    if ~isempty(Rejeitado)
        XRejeitado = XData(LRejeitado);
        handles.ListaReject.String = strcat(num2str(Rejeitado'),' (',...    % Expõe os valores a serem rejeitados
            num2str(XRejeitado'),')');
        XData = XData(setdiff([1:length(XData)],LRejeitado));                       % Apenas dados que não serão rejeitados
        Data = Data(setdiff([1:length(Data)],LRejeitado));                          % Apenas dados que não serão rejeitados
    else
        handles.ListaReject.String = '';                                    % Caso nenhum dado deva ser rejeitado, nada é mostrado na lista
    end
    set(handles.Grafico.Children,'Xdata',XData,'Ydata',Data);               % Modifica os dados plotados no gráfico
end
% --------------------------------------------------------------------
function ImpPlotC_Callback(hObject, eventdata, handles)
% hObject    handle to ImpPlotC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    handles.MediaNew.String = '';                                           % Default para os textos...
    handles.DesvPadNew.String = '';
    handles.Result.String = 'x =    ...   ±   ...';
    handles.ResultP.String = 'x =    ...   ±   ... %';
    
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    NameX = ICXSData.XS1_X.String;                                          % Nome dos dados para usar quando for exportar
    NameY = ICXSData.XS1_Y3.String;                                         % Nome dos dados para usar quando for exportar
    setappdata(handles.ImportMenu,'NAMEX',NameX(ICXSData.XS1_X.Value));
    setappdata(handles.ImportMenu,'NAMEY',NameY(ICXSData.XS1_Y3.Value));

    cla(handles.Grafico,'reset')                                            % Deleta informações anteriores do gráfico
    lin = copyobj(get(ICXSData.XS1_3,'children'),handles.Grafico);          % Copia o que foi plotado no ICXS para o App
    grid(handles.Grafico,'on')                                              % Ativa grade
    Xlim = get(ICXSData.XS1_3,'Xlim');                                      % Limites de X
    set(handles.Grafico,'XTick',[]);                                        % Não mostra Dados do eixo X
    set(handles.Grafico,'Xlim',Xlim);                                       % Corrige os limites do eixo X
    set(handles.Grafico,'fontsize',8);                                      % Tamanho da fonte dos dados em Y
    
    XDataTot = get(lin,'Xdata');                                            % Todos dados da variável plotada em X
    YDataTot = get(lin,'Ydata');                                            % Todos dados da variável plotada em Y
    Data = YDataTot(find(XDataTot>=Xlim(1),1,'first')...                    % Dados a serem analisados
        :find(XDataTot<=Xlim(2),1,'last'));
    XData = XDataTot(find(XDataTot>=Xlim(1),1,'first')...                   % Número da "leitura" dos dados a serem analisados
        :find(XDataTot<=Xlim(2),1,'last'));
    setappdata(handles.ImportMenu,'DATA',Data);                             % Data é "salvo" para que possa entrar em outras funções
    setappdata(handles.ImportMenu,'XDATA',XData);                           % XData é "salvo" para que possa entrar em outras funções
    handles.MediaOld.String = num2str(mean(Data));                          % Expõe o valor da média com todos os dados
    handles.DesvPadOld.String = num2str(std(Data));                         % Expõe o valor do desvio padrão com todos os dados

    [Rejeitado,LRejeitado,DataNew,MediaNew,SDOMNew] = f_Chauvenet(Data);
    
    handles.N1.String = num2str(length(Data));                              % Expõe a quatidade de dados iniciais
    handles.N2.String = num2str(length(DataNew));                           % Expõe a quatidade de dados não rejeitados pelo critério
    if ~isempty(Rejeitado)
        XRejeitado = XData(LRejeitado);
        handles.ListaReject.String = strcat(num2str(Rejeitado'),' (',...    % Expõe os valores a serem rejeitados
            num2str(XRejeitado'),')');
        XData = XData(setdiff([1:length(XData)],LRejeitado));                       % Apenas dados que não serão rejeitados
        Data = Data(setdiff([1:length(Data)],LRejeitado));                          % Apenas dados que não serão rejeitados
    else
        handles.ListaReject.String = '';                                    % Caso nenhum dado deva ser rejeitado, nada é mostrado na lista
    end
    set(handles.Grafico.Children,'Xdata',XData,'Ydata',Data);               % Modifica os dados plotados no gráfico
end
% --------------------------------------------------------------------
function ImpPlotD_Callback(hObject, eventdata, handles)
% hObject    handle to ImpPlotD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    handles.MediaNew.String = '';                                           % Default para os textos...
    handles.DesvPadNew.String = '';
    handles.Result.String = 'x =    ...   ±   ...';
    handles.ResultP.String = 'x =    ...   ±   ... %';
    
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    NameX = ICXSData.XS1_X.String;                                          % Nome dos dados para usar quando for exportar
    NameY = ICXSData.XS1_Y4.String;                                         % Nome dos dados para usar quando for exportar
    setappdata(handles.ImportMenu,'NAMEX',NameX(ICXSData.XS1_X.Value));
    setappdata(handles.ImportMenu,'NAMEY',NameY(ICXSData.XS1_Y4.Value));

    cla(handles.Grafico,'reset')                                            % Deleta informações anteriores do gráfico
    lin = copyobj(get(ICXSData.XS1_4,'children'),handles.Grafico);          % Copia o que foi plotado no ICXS para o App
    grid(handles.Grafico,'on')                                              % Ativa grade
    Xlim = get(ICXSData.XS1_4,'Xlim');                                      % Limites de X
    set(handles.Grafico,'XTick',[]);                                        % Não mostra Dados do eixo X
    set(handles.Grafico,'Xlim',Xlim);                                       % Corrige os limites do eixo X
    set(handles.Grafico,'fontsize',8);                                      % Tamanho da fonte dos dados em Y
    
    XDataTot = get(lin,'Xdata');                                            % Todos dados da variável plotada em X
    YDataTot = get(lin,'Ydata');                                            % Todos dados da variável plotada em Y
    Data = YDataTot(find(XDataTot>=Xlim(1),1,'first')...                    % Dados a serem analisados
        :find(XDataTot<=Xlim(2),1,'last'));
    XData = XDataTot(find(XDataTot>=Xlim(1),1,'first')...                   % Número da "leitura" dos dados a serem analisados
        :find(XDataTot<=Xlim(2),1,'last'));
    setappdata(handles.ImportMenu,'DATA',Data);                             % Data é "salvo" para que possa entrar em outras funções
    setappdata(handles.ImportMenu,'XDATA',XData);                           % XData é "salvo" para que possa entrar em outras funções
    handles.MediaOld.String = num2str(mean(Data));                          % Expõe o valor da média com todos os dados
    handles.DesvPadOld.String = num2str(std(Data));                         % Expõe o valor do desvio padrão com todos os dados

    [Rejeitado,LRejeitado,DataNew,MediaNew,SDOMNew] = f_Chauvenet(Data);
    
    handles.N1.String = num2str(length(Data));                              % Expõe a quatidade de dados iniciais
    handles.N2.String = num2str(length(DataNew));                           % Expõe a quatidade de dados não rejeitados pelo critério
    if ~isempty(Rejeitado)
        XRejeitado = XData(LRejeitado);
        handles.ListaReject.String = strcat(num2str(Rejeitado'),' (',...    % Expõe os valores a serem rejeitados
            num2str(XRejeitado'),')');
        XData = XData(setdiff([1:length(XData)],LRejeitado));                       % Apenas dados que não serão rejeitados
        Data = Data(setdiff([1:length(Data)],LRejeitado));                          % Apenas dados que não serão rejeitados
    else
        handles.ListaReject.String = '';                                    % Caso nenhum dado deva ser rejeitado, nada é mostrado na lista
    end
    set(handles.Grafico.Children,'Xdata',XData,'Ydata',Data);               % Modifica os dados plotados no gráfico
end

% --------------------------------------------------------------------
function ExportMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ExportMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function CSVMenu_Callback(hObject, eventdata, handles)
% hObject    handle to CSVMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num(:,1) = get(handles.Grafico.Children,'Xdata');
num(:,2) = get(handles.Grafico.Children,'Ydata');
txt(:,1) = getappdata(handles.ImportMenu,'NAMEX');
txt(:,2) = getappdata(handles.ImportMenu,'NAMEY');

[FileName,PathName] = uiputfile('*.csv');                                   % Recebe o nome e o local que o arquivo será salvo
fullpathname = fullfile(PathName, FileName);                                % Junta nome inteiro do arquivo

if fullpathname                                                             % O programa só roda se o usuário escolher um arquivo
    fid = fopen(fullpathname, 'w') ;                                        % Cria arquivo .csv com mesmo nome do arquivo .mat
    fprintf(fid, '%s,', txt{1,1:end-1});                                    % Escreve nele os elementos do cabeçalho, menos o último
    fprintf(fid, '%s\n', txt{1,end});                                       % Escreve o último elemento do cabeçalho e pula linha
    fclose(fid) ;                                                           % Fecha o arquivo
    dlmwrite(fullpathname,num, '-append');                                  % Escreve os valores numéricos no arquivo
end

% --------------------------------------------------------------------
function ExcelMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ExcelMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num(:,1) = get(handles.Grafico.Children,'Xdata');
num(:,2) = get(handles.Grafico.Children,'Ydata');
txt(:,1) = getappdata(handles.ImportMenu,'NAMEX');
txt(:,2) = getappdata(handles.ImportMenu,'NAMEY');

[FileName,PathName] = uiputfile('*.xlsx');                                  % Recebe o nome e o local que o arquivo será salvo
fullpathname = fullfile(PathName, FileName);                                % Junta nome inteiro do arquivo
if fullpathname                                                             % O programa só roda se o usuário escolher um arquivo
    sheet = 1;                                                              % Aba do Excel
    xlRange1 = 'A1';                                                        % Cédula do Excel para escrever o cabeçalho
    xlRange2 = 'A2';                                                        % Cédula do Excel para escrever os dados numéricos
    xlswrite(fullpathname,txt,sheet,xlRange1);                              % Salva os nomes das variáveis
    xlswrite(fullpathname,num,sheet,xlRange2);                              % Salva os dados das variáveis
end

% --------------------------------------------------------------------
function MATMenu_Callback(hObject, eventdata, handles)
% hObject    handle to MATMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num(:,1) = get(handles.Grafico.Children,'Xdata');
num(:,2) = get(handles.Grafico.Children,'Ydata');
txt(:,1) = getappdata(handles.ImportMenu,'NAMEX');
txt(:,2) = getappdata(handles.ImportMenu,'NAMEY');

[FileName,PathName] = uiputfile('*.mat');                                   % Recebe o nome e o local que o arquivo será salvo
fullpathname = fullfile(PathName, FileName);                                % Junta nome inteiro do arquivo
if fullpathname                                                             % O programa só roda se o usuário escolher um arquivo
    [l,c] = size(num);                                                      % Confere a quantidade de dados
    for i = 1:c                                                             % Atribuição dos dados a cada variável
        eval([txt{:,i},'=num(:,i)']);                                       % Cria cada variável e atribui a ela seu vetor
    end
    save(fullpathname,txt{:});                                              % Salva dados em ".mat"
end
