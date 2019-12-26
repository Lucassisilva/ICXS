function varargout = AppErrorBar(varargin)
% APPERRORBAR MATLAB code for AppErrorBar.fig
%      APPERRORBAR, by itself, creates a new APPERRORBAR or raises the existing
%      singleton*.
%
%      H = APPERRORBAR returns the handle to a new APPERRORBAR or the handle to
%      the existing singleton*.
%
%      APPERRORBAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPERRORBAR.M with the given input arguments.
%
%      APPERRORBAR('Property','Value',...) creates a new APPERRORBAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppErrorBar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppErrorBar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppErrorBar

% Last Modified by GUIDE v2.5 05-Feb-2018 14:00:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppErrorBar_OpeningFcn, ...
                   'gui_OutputFcn',  @AppErrorBar_OutputFcn, ...
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

% --- Executes just before AppErrorBar is made visible.
function AppErrorBar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppErrorBar (see VARARGIN)

% Choose default command line output for AppErrorBar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes AppErrorBar wait for user response (see UIRESUME)
% uiwait(handles.ErrorBar);

% Mudar o idioma
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.ErrorBar.Name = 'Barras de erro';
        handles.Title.String = 'BARRAS DE ERRO';
        handles.ImportMenu.Label = 'Importar';
        handles.ExportMenu.Label = 'Exportar';
        handles.ImpDataCB.String = 'Importar dados (ICXS)';
        handles.Legend.String = 'Legenda';
        handles.NewRow.String = 'Nova linha';
        handles.DelRow.String = 'Excluir linha';
        handles.PlotError.String = 'Plotar barras de erro';
        handles.Reset.String = 'Restaurar';
    else                                                                    % Inglês
        handles.ErrorBar.Name = 'Error bars';
        handles.Title.String = 'ERROR BARS';
        handles.ImportMenu.Label = 'Import';
        handles.ExportMenu.Label = 'Export';
        handles.ImpDataCB.String = 'Import ICXS Data';
        handles.Legend.String = 'Legend';
        handles.NewRow.String = 'New row';
        handles.DelRow.String = 'Delete row';
        handles.PlotError.String = 'Plot error bars';
        handles.Reset.String = 'Reset';
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppErrorBar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function ImportMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ImportMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.fig');                                   % O usuário escolhe o arquivo p/ abrir
fullpathname = fullfile(pathname, filename);                                % Junta nome inteiro do arquivo

if fullpathname                                                             % O programa só roda se o usuário escolher um arquivo
    Fig = openfig(fullpathname,'invisible');                                % Abre a figura e pega suas propriedades
    
    Ax = Fig.Children;                                                      % Propriedados dos eixos da figura importada
    Graf = handles.Grafico;                                                 % Propriedades do gráfico do app
    if isa(Ax,'matlab.graphics.axis.Axes')==0                               % Caso o arquivo tenha legenda
        Ax = Ax(2,1);                                                       % Propriedados dos eixos da figura importada
        Leg.String = Ax.Legend.String;                                      % Variável com o nome das legendas
        Leg.Value = 1;                                                      % Figura importada tem legenda
    else
        Leg.String = Ax.YLabel.String;
        Leg.Value = 0;
    end
    
    cla(Graf,'reset')                                                       % Deleta informações anteriores do gráfico
    copyobj(Ax.Children,Graf);                                              % Copia o que foi plotado da figura importada para o App
    
    Graf.FontSize = 8;                                                      % Tamanho da fonte do gráfico
    Graf.XLim = Ax.XLim;                                                    % Limites de X
    Graf.YLim = Ax.YLim;                                                    % Limites de Y
    grid(Graf,'on');                                                        % Ativa grade
    Graf.XLabel = Ax.XLabel;                                                % Título do eixo X
    Graf.YLabel = Ax.YLabel;                                                % Título do eixo Y
    Graf.Title = Ax.Title;                                                  % Título do gráfico
    if Leg.Value
        legend(Graf,Leg.String);                                            % Adiciona legenda, caso a figura tenha
    end
    handles.LegendTable.Data = [Leg.String';handles.ErrorBar.Name];         % Adiciona na tabela o nome das legendas da figura
    
    setappdata(handles.ImportMenu,'GRAF',Ax);
    setappdata(handles.ImportMenu,'LEG',Leg);
end

% --- Executes on button press in PlotError.
function PlotError_Callback(hObject, eventdata, handles)
% hObject    handle to PlotError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
XData = handles.Table.Data(:,1);
IX = handles.Table.Data(:,2);
YData = handles.Table.Data(:,3);
IY = handles.Table.Data(:,4);

Ax = getappdata(handles.ImportMenu,'GRAF');                                 % Propriedades da figura importada
Graf = handles.Grafico;                                                     % Propriedades do gráfico do aplicativo
cla(Graf)                                                                   % Deleta o gráfico do aplicativo
copyobj(Ax.Children,Graf);                                                  % Plota a figura importada no app
hold on                                                                     % Permite plotar as barras de erro em cima

e = errorbar(XData,YData,IY,IY,IX,IX);                                      % Plota barras de erro
e.Marker = 'o';                                                             % Formato do ponto central do erro
% e.MarkerSize = 10;
e.Color = 'k';                                                              % Cor da barra
% e.CapSize = 15;
e.LineWidth = 1;                                                            % Espessura da barra
e.LineStyle = 'none';                                                       % Não há linha ligando os pontos onde são plotadas as barras de erro

hold off

LegTable = handles.LegendTable.Data';                                       % Recebe da tabela de legenda as legendas
legend(Graf,LegTable);                                                      % Adiciona legenda
xlim auto
ylim auto

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ax = getappdata(handles.ImportMenu,'GRAF');                                 % Propriedades da figura importada
Graf = handles.Grafico;                                                     % Propriedades do gráfico do aplicativo
cla(Graf)                                                                   % Deleta o gráfico do aplicativo
copyobj(Ax.Children,Graf);                                                  % Plota a figura importada no app
handles.Table.Data = [0,0,0,0];                                             % Dados da tabela com erros são trocados por valores nulos
Leg = getappdata(handles.ImportMenu,'LEG');                                 % Propriedades da legenda da figura importada
if Leg.Value
        legend(Graf,Leg.String);                                            % Adiciona legenda
end

% --------------------------------------------------------------------
function ExportMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ExportMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    Ginf = getappdata(ICXSData.ICxs_Defaut,'GINF');                         % Recebe do ICXS as características do gráfico
    Dec = Ginf.Decimal;                                                     % Marcador decimal, 1: vírgula, 0: ponto
else
    Dec = 0;
end

Leg = getappdata(handles.ImportMenu,'LEG');                                 % Propriedades da legenda da figura importada

f_ExPlot(handles.Grafico,'-',Dec)                                           % Exporta figura com o gráfico

if Leg.Value
        legend(handles.LegendTable.Data');                                  % Adiciona legenda
end

% --- Executes on button press in ImpDataCB.
function ImpDataCB_Callback(hObject, eventdata, handles)
% hObject    handle to ImpDataCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of ImpDataCB
if hObject.Value
    h = findobj('Tag','ICxsPrincipal');                                     % Recebe os handles da interface principal
    if ~isempty(h)                                                          % Se o ICXS estiver aberto...
        ICXSData = guidata(h);                                              % Aloca os handles da interface principal
        handles.PopX.Visible = 'on';                                        % Torna visível os pop up menus para escolher dado indo do ICXS
        handles.PopIX.Visible = 'on';
        handles.PopY.Visible = 'on';
        handles.PopIY.Visible = 'on';
        
        t = getappdata(ICXSData.ICxs_Defaut,'T');
        Tab = getappdata(ICXSData.ICxs_Defaut,'TAB');
        
        delta = char(948);                                                  % String com delta minúsculo
        
        handles.PopX.String = [Tab(t(1)).Var;'X'];                          % Escreve nos pop up menus o nome das variáveis q podem ser escolhidas
        handles.PopIX.String = [Tab(t(1)).Var;strcat(delta,'X')];
        handles.PopY.String = [Tab(t(1)).Var;'Y'];
        handles.PopIY.String = [Tab(t(1)).Var;strcat(delta,'Y')];
        
        handles.PopX.Value = length(handles.PopX.String);                   % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
        handles.PopIX.Value = length(handles.PopX.String);
        handles.PopY.Value = length(handles.PopX.String);
        handles.PopIY.Value = length(handles.PopX.String);
        
        Tab(t(1)).Data=[Tab(t(1)).Data zeros(length(Tab(t(1)).Data(:,1)),1)]; % Salva em Tab.Data os dados das variáveis do ICXS e uma última coluna de zeros para o default
        
        setappdata(handles.ImportMenu,'TAB',Tab(t(1)));
        
        
        
    else
        hObject.Value = 0;
    end
else
    handles.PopX.Visible = 'off';
    handles.PopIX.Visible = 'off';
    handles.PopY.Visible = 'off';
    handles.PopIY.Visible = 'off';
end

% --- Executes on selection change in PopX.
function PopX_Callback(hObject, eventdata, handles)
% hObject    handle to PopX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopX contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopX

Tab = getappdata(handles.ImportMenu,'TAB');

XData = Tab.Data(:,hObject.Value);
IX = Tab.Data(:,handles.PopIX.Value);
YData = Tab.Data(:,handles.PopY.Value);
IY= Tab.Data(:,handles.PopIY.Value);

handles.Table.Data = [XData IX YData IY];                                   % Escreve na tabela dos dados os valores de X, IX, Y, IY importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIX.
function PopIX_Callback(hObject, eventdata, handles)
% hObject    handle to PopIX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIX contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIX
Tab = getappdata(handles.ImportMenu,'TAB');

XData = Tab.Data(:,handles.PopX.Value);
IX = Tab.Data(:,hObject.Value);
YData = Tab.Data(:,handles.PopY.Value);
IY= Tab.Data(:,handles.PopIY.Value);

handles.Table.Data = [XData IX YData IY];                                   % Escreve na tabela dos dados os valores de X, IX, Y, IY importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopIX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopY.
function PopY_Callback(hObject, eventdata, handles)
% hObject    handle to PopY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopY contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopY
Tab = getappdata(handles.ImportMenu,'TAB');

XData = Tab.Data(:,handles.PopX.Value);
IX = Tab.Data(:,handles.PopIX.Value);
YData = Tab.Data(:,hObject.Value);
IY= Tab.Data(:,handles.PopIY.Value);

handles.Table.Data = [XData IX YData IY];                                   % Escreve na tabela dos dados os valores de X, IX, Y, IY importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIY.
function PopIY_Callback(hObject, eventdata, handles)
% hObject    handle to PopIY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIY contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIY
Tab = getappdata(handles.ImportMenu,'TAB');

XData = Tab.Data(:,handles.PopX.Value);
IX = Tab.Data(:,handles.PopIX.Value);
YData = Tab.Data(:,handles.PopY.Value);
IY= Tab.Data(:,hObject.Value);

handles.Table.Data = [XData IX YData IY];                                   % Escreve na tabela dos dados os valores de X, IX, Y, IY importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopIY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in NewRow.
function NewRow_Callback(hObject, eventdata, handles)
% hObject    handle to NewRow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Table.Data = [handles.Table.Data;0,0,0,0];                          % Adiciona nova linha ao fim da tabela de dados

% --- Executes on button press in Legend.
function Legend_Callback(hObject, eventdata, handles)
% hObject    handle to Legend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Legend
if hObject.Value
    handles.LegendPanel.Visible = 'on';                                     % Abre painel com o nome das legendas
else
    handles.LegendPanel.Visible = 'off';                                    % Fecha painel com o nome das legendas
end

% --- Executes when selected cell(s) is changed in Table.
function Table_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to Table (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hObject.UserData = eventdata.Indices;                                       % Recebe dados selecionados pelo usuário na tabela de dados

% --- Executes on button press in DelRow.
function DelRow_Callback(hObject, eventdata, handles)
% hObject    handle to DelRow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rows = (1:length(handles.Table.Data(:,1)));                                 % Linhas selecionadas pelo usuário
Delete = unique(handles.Table.UserData(:,1));                               % Linhas selecionadas pelo usuário (este vetor contém apenas uma vez cada linha)
Keep = setdiff(Rows,Delete);                                                % Linhas que não serão deletadas
handles.Table.Data = handles.Table.Data(Keep,:);                            % Deleta linhas da tabela

% --- Executes on key press with focus on ErrorBar or any of its controls.
function ErrorBar_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ErrorBar (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.Key,'escape')                                           % Ao apertar esc, o usuário fecha o painel de cálculo da desaceleração
    handles.LegendPanel.Visible = 'off';
    handles.Legend.Value = 0;
end
