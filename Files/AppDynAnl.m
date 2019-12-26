function varargout = AppDynAnl(varargin)
% APPDYNANL MATLAB code for AppDynAnl.fig
%      APPDYNANL, by itself, creates a new APPDYNANL or raises the existing
%      singleton*.
%
%      H = APPDYNANL returns the handle to a new APPDYNANL or the handle to
%      the existing singleton*.
%
%      APPDYNANL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPDYNANL.M with the given input arguments.
%
%      APPDYNANL('Property','Value',...) creates a new APPDYNANL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppDynAnl_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppDynAnl_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppDynAnl

% Last Modified by GUIDE v2.5 18-Jul-2018 12:37:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppDynAnl_OpeningFcn, ...
                   'gui_OutputFcn',  @AppDynAnl_OutputFcn, ...
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

% --- Executes just before AppDynAnl is made visible.
function AppDynAnl_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppDynAnl (see VARARGIN)
% Choose default command line output for AppDynAnl
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes AppDynAnl wait for user response (see UIRESUME)
% uiwait(handles.DynAnl);
% Mudar o idioma
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Portugu�s
        handles.DynAnl.Name = 'An�lise din�mica';
        handles.Title.String = 'AN�LISE DIN�MICA';
        
        handles.MTPRTable.ColumnName{1} = 'Tempo';
        handles.TableRes1.ColumnName{6} = 'Ajuste [%]';
        handles.TableRes2.ColumnName{6} = 'Ajuste [%]';
        handles.TableRes3.ColumnName{5} = 'Ajuste [%]';
        
        handles.ImportMTPR.String = 'Importar';
        handles.NewRowMTPR.String = 'Nova linha';
        handles.DeleteRowMTPR.String = 'Excluir linha';
        handles.ResetMTPR.String = 'Restaurar';
        handles.CalculateMTPR.String = 'Calcular';
        handles.ExportMTPR.String = 'Exportar';
        if iscell(handles.PopX.String)
            handles.PopX.String{end} = 'X (Eixo Y)';
            handles.PopTime.String{end} = 'Tempo';
        else
            handles.PopX.String = 'X (Eixo Y)';
            handles.PopTime.String = 'Tempo';
        end
        
        handles.ImportMS.String = 'Importar';
        handles.GenMS.String = 'Gerar MS';
        handles.CalculateMS.String = 'Calcular';
        handles.ExportMS.String = 'Exportar';
        handles.ResetMS.String = 'Restaurar';
        if iscell(handles.PopXMS.String)
            handles.PopXMS.String{end} = 'X (Eixo Y)';
            handles.PopTimeMS.String{end} = 'Tempo';
        else
            handles.PopXMS.String = 'X (Eixo Y)';
            handles.PopTimeMS.String = 'Tempo';
        end

        handles.O1Panel.Title = 'Resposta de Primeira Ordem';
        handles.ImportO1.String = 'Importar';
        handles.CalculateO1.String = 'Calcular';
        handles.ExportO1.String = 'Exportar';
        handles.ResetO1.String = 'Restaurar';
        if iscell(handles.PopXO1.String)
            handles.PopXO1.String{end} = 'X (Eixo Y)';
            handles.PopTimeO1.String{end} = 'Tempo';
        else
            handles.PopXO1.String = 'X (Eixo Y)';
            handles.PopTimeO1.String = 'Tempo';
        end
        
        handles.datacursor.TooltipString = 'Cursor de dados';
        handles.MTPRMenu.TooltipString = 'MTPR';
        handles.MSMenu.TooltipString = 'MS';
        handles.O1Menu.TooltipString = 'Resposta de Primeira Ordem';
    else                                                                    % Ingl�s
        handles.DynAnl.Name = 'Dynamic analysis';
        handles.Title.String = 'DYNAMIC ANALYSIS';
        
        handles.MTPRTable.ColumnName{1} = 'Time';
        handles.TableRes1.ColumnName{6} = 'Fit [%]';
        handles.TableRes2.ColumnName{6} = 'Fit [%]';
        handles.TableRes3.ColumnName{5} = 'Fit [%]';
        
        handles.ImportMTPR.String = 'Import';
        handles.NewRowMTPR.String = 'New row';
        handles.DeleteRowMTPR.String = 'Delete row';
        handles.ResetMTPR.String = 'Reset';
        handles.CalculateMTPR.String = 'Calculate';
        handles.ExportMTPR.String = 'Export';
        if iscell(handles.PopX.String)
            handles.PopX.String{end} = 'X (Y axis)';
            handles.PopTime.String{end} = 'Time';
        else
            handles.PopX.String = 'X (Y axis)';
            handles.PopTime.String = 'Time';
        end
       
        handles.ImportMS.String = 'Import';
        handles.GenMS.String = 'Generate MS';
        handles.CalculateMS.String = 'Calculate';
        handles.ExportMS.String = 'Export';
        handles.ResetMS.String = 'Reset';
        if iscell(handles.PopXMS.String)
            handles.PopXMS.String{end} = 'X (Y axis)';
            handles.PopTimeMS.String{end} = 'Time';
        else
            handles.PopXMS.String = 'X (Y axis)';
            handles.PopTimeMS.String = 'Time';
        end
        
        handles.O1Panel.Title = 'First-Order Response';
        handles.ImportO1.String = 'Import';
        handles.CalculateO1.String = 'Calculate';
        handles.ExportO1.String = 'Export';
        handles.ResetO1.String = 'Reset';
        if iscell(handles.PopXO1.String)
            handles.PopXO1.String{end} = 'X (Y axis)';
            handles.PopTimeO1.String{end} = 'Time';
        else
            handles.PopXO1.String = 'X (Y axis)';
            handles.PopTimeO1.String = 'Time';
        end
        
        handles.datacursor.TooltipString = 'Data Cursor';
        handles.MTPRMenu.TooltipString = 'MTPR';
        handles.MSMenu.TooltipString = 'MS';
        handles.O1Menu.TooltipString = 'First-Order Response';
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppDynAnl_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in PopX.
function PopX_Callback(hObject, eventdata, handles)
% hObject    handle to PopX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopX contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopX
Tab = getappdata(handles.ImportMTPR,'TAB');
GInf = getappdata(handles.ImportMTPR,'GINF');
AuxPop = size(hObject.String);                                              % Quantidade de elementos no popup menu
cla(handles.GraficoMTPR)                                                    % Deleta as informa��es do gr�fico
if hObject.Value ~= AuxPop(1) && handles.PopTime.Value ~= AuxPop(1)         % S� plota os dados caso seja selecionado nos 2 popup menus op��es diferentes da Default
    Time = Tab.Data(:,handles.PopTime.Value);                               % Dados para eixo X
    YData = Tab.Data(:,hObject.Value);                                      % Dados para eixo Y
    axes(handles.GraficoMTPR);                                              % Seleciona o gr�fico para plotar
    plot(Time,YData,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);        % Plota os dados definindo estilo da linha, sua grossura e cor
    grid(handles.GraficoMTPR,'on')                                          % Grid
    xlim(handles.GraficoMTPR,Tab.T);                                        % Coloca limites definidos nos editbox
end

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

% --- Executes on selection change in PopTime.
function PopTime_Callback(hObject, eventdata, handles)
% hObject    handle to PopTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopTime contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopTime
Tab = getappdata(handles.ImportMTPR,'TAB');
GInf = getappdata(handles.ImportMTPR,'GINF');
AuxPop = size(hObject.String);                                              % Quantidade de elementos no popup menu
cla(handles.GraficoMTPR)                                                    % Deleta as informa��es do gr�fico
if hObject.Value ~= AuxPop(1)                                               % S� altera alguma coisa caso a op��o no popup menu seja diferente da Default
    handles.T1.String = num2str(min(Tab.Data(:,hObject.Value)));            % Escreve em T1 o limite inferior do eixo X
    handles.T2.String = num2str(max(Tab.Data(:,hObject.Value)));            % Escreve em T2 o limite superior do eixo X
    T1 = str2double(handles.T1.String);                                     % Limite inferior do eixo X
    T2 = str2double(handles.T2.String);                                     % Limite superior do eixo X
    Tab.T = [T1 T2];                                                        % Aloca em Tab.T os limites do eixo X
    
    if handles.PopX.Value ~= AuxPop(1)                                      % S� plota os dados caso seja selecionado nos 2 popup menus op��es diferentes da Default
        Time = Tab.Data(:,hObject.Value);                                   % Dados para eixo X
        YData = Tab.Data(:,handles.PopX.Value);                             % Dados para eixo Y
        axes(handles.GraficoMTPR);                                          % Seleciona o gr�fico para plotar
        plot(Time,YData,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);    % Plota os dados definindo estilo da linha, sua grossura e cor
        grid(handles.GraficoMTPR,'on')                                      % Grid
        xlim(handles.GraficoMTPR,Tab.T);                                    % Coloca limites definidos nos editbox
    end
else                                                                        % Caso a op��o selecionada para o eixo X seja Default
    handles.T1.String = 'T1';                                               % Escreve T1 no box do limite inferior do eixo X
    handles.T2.String = 'T2';                                               % Escreve T2 no box do limite superior do eixo X
end
setappdata(handles.ImportMTPR,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function PopTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function T1_Callback(hObject, eventdata, handles)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of T1 as text
%        str2double(get(hObject,'String')) returns contents of T1 as a double
Tab = getappdata(handles.ImportMTPR,'TAB');
AuxPop = size(handles.PopTime.String);                                      % Quantidade de elementos no popup menu

if handles.PopTime.Value == AuxPop(1)                                       % Se estiver selecionada a op��o default para o eixo X...
    handles.T1.String = 'T1';                                               % ... O usu�rio n�o consegue alterar o box T1, ser� sempre escrito T1 nele
else
    Time = Tab.Data(:,handles.PopTime.Value);                               % Dados para eixo X
    Min = min(Time); Max = max(Time);                                       % Limites superior e inferior do tempo
    AuxNum = str2double(hObject.String);                                    % Valor escrito no editbox
    if AuxNum >= Min && AuxNum <= Max && AuxNum < Tab.T(2)                  % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
        Tab.T(1) = AuxNum;                                                  % ... Al�m disso, ele deve ser menor que o valor j� escrito como limite superior.
        xlim(handles.GraficoMTPR,Tab.T);                                    % Coloca limites definidos nos editbox
    elseif AuxNum < Min                                                     % Caso o valor escrito seja menor que o limite inferior, ser� escrito o valor m�nimo
        Tab.T(1) = Min;                                                     % Salva em Tab.T o valor do box T1
        handles.T1.String = num2str(Min);                                   % Escreve o valor no box T1
        xlim(handles.GraficoMTPR,Tab.T);                                    % Coloca limites definidos nos editbox
    else
        hObject.String = num2str(Tab.T(1));                                 % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
    end
end

setappdata(handles.ImportMTPR,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function T2_Callback(hObject, eventdata, handles)
% hObject    handle to T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of T2 as text
%        str2double(get(hObject,'String')) returns contents of T2 as a double
Tab = getappdata(handles.ImportMTPR,'TAB');
AuxPop = size(handles.PopTime.String);                                      % Quantidade de elementos no popup menu

if handles.PopTime.Value == AuxPop(1)                                       % Se estiver selecionada a op��o default para o eixo X...
    handles.T2.String = 'T2';                                               % ... O usu�rio n�o consegue alterar o box T2, ser� sempre escrito T2 nele
else
    Time = Tab.Data(:,handles.PopTime.Value);                               % Dados para eixo X
    Min = min(Time); Max = max(Time);                                       % Limites superior e inferior do tempo
    AuxNum = str2double(hObject.String);                                    % Valor escrito no editbox
    if AuxNum >= Min && AuxNum <= Max && AuxNum > Tab.T(1)                  % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
        Tab.T(2) = AuxNum;                                                  % ... Al�m disso, ele deve ser maior que o valor j� escrito como limite inferior.
        xlim(handles.GraficoMTPR,Tab.T);                                    % Coloca limites definidos nos editbox
    elseif AuxNum > Max                                                     % Caso o valor escrito seja maior que o limite superior, ser� escrito o valor m�ximo
        Tab.T(2) = Max;                                                     % Salva em Tab.T o valor do box T2
        handles.T2.String = num2str(Max);                                   % Escreve o valor no box T2
        xlim(handles.GraficoMTPR,Tab.T);                                    % Coloca limites definidos nos editbox
    else
        hObject.String = num2str(Tab.T(2));                                 % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
    end
end

setappdata(handles.ImportMTPR,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ImportMTPR.
function ImportMTPR_Callback(hObject, eventdata, handles)
% hObject    handle to ImportMTPR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    Tab = getappdata(ICXSData.ICxs_Defaut,'TAB');
    GInf = getappdata(ICXSData.ICxs_Defaut,'GINF');
    
    if t(4) == 1                                                            % Portugu�s
        Ax1 = 'X (Eixo Y)';
        Ax2 = 'Tempo';
    else                                                                    % Ingl�s
        Ax1 = 'X (Y axis)';
        Ax2 = 'Time';
    end
    handles.PopX.String = [Tab(t(1)).Var;Ax1];                              % Escreve no pop up menu o nome das vari�veis q podem ser escolhidas
    handles.PopTime.String = [Tab(t(1)).Var;Ax2];                           % Escreve no pop up menu o nome das vari�veis q podem ser escolhidas
    handles.PopX.Value = length(handles.PopX.String);                       % Qndo os dados s�o importados, a item escolhido no pop up menu � o default (�ltimo)
    handles.PopTime.Value = length(handles.PopX.String);                    % Qndo os dados s�o importados, a item escolhido no pop up menu � o default (�ltimo)
    handles.T1.String = 'T1';                                               % Escreve T1 no box de T1
    handles.T2.String = 'T2';                                               % Escreve T2 no box de T2
    
    cla(handles.GraficoMTPR);                                               % Deleta o gr�fico
    
    Tab(t(1)).Data=[Tab(t(1)).Data zeros(length(Tab(t(1)).Data(:,1)),1)];   % Salva em Tab.Data os dados das vari�veis do ICXS e uma �ltima coluna de zeros para o default
    Tab(t(1)).T = [0 1];                                                    % Limites dos gr�ficos
    
    setappdata(handles.ImportMTPR,'GINF',GInf);
    setappdata(handles.ImportMTPR,'TAB',Tab(t(1)));
end

% --- Executes on button press in NewRowMTPR.
function NewRowMTPR_Callback(hObject, eventdata, handles)
% hObject    handle to NewRowMTPR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.MTPRTable.Data = [handles.MTPRTable.Data;{0,'',0,'',''}];           % Adiciona nova linha ao fim da tabela de dados

% --- Executes when selected cell(s) is changed in MTPRTable.
function MTPRTable_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to MTPRTable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hObject.UserData = eventdata.Indices;                                       % Recebe dados selecionados pelo usu�rio na tabela de dados

% --- Executes on button press in DeleteRowMTPR.
function DeleteRowMTPR_Callback(hObject, eventdata, handles)
% hObject    handle to DeleteRowMTPR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rows = (1:length(handles.MTPRTable.Data(:,1)));                             % Linhas selecionadas pelo usu�rio
Delete = unique(handles.MTPRTable.UserData(:,1));                           % Linhas selecionadas pelo usu�rio (este vetor cont�m apenas uma vez cada linha)
Keep = setdiff(Rows,Delete(Delete~=1));                                     % Linhas que n�o ser�o deletadas (A primeira linha n�o pode ser deletadas, pois precisa de no m�nimo 2 dados)
handles.MTPRTable.Data = handles.MTPRTable.Data(Keep,:);                    % Deleta linhas da tabela

% --- Executes on button press in ResetMTPR.
function ResetMTPR_Callback(hObject, eventdata, handles)
% hObject    handle to ResetMTPR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.MTPRTable.Data = {0 '   ------------' 0 '   ------------' '    ------------';0 '' 0 '' '';0 '' 0 '' ''}; % Retorna informa��es da tabela para as condi��es iniciais
handles.TableRes1.Data = {'' '' '' '' ''};                                  % Retorna informa��es da tabela para as condi��es iniciais

Tab = getappdata(handles.ImportMTPR,'TAB');
GInf = getappdata(handles.ImportMTPR,'GINF');
AuxPop = size(handles.PopX.String);                                         % Quantidade de elementos no popup menu
% O reset do gr�fico significa plotar apenas os dados das medi��es, sem os outros plots do aplicativo
if handles.PopX.Value ~= AuxPop(1) && handles.PopTime.Value ~= AuxPop(1)    % Plota os dados caso seja selecionado nos 2 popup menus op��es diferentes da Default
    Time = Tab.Data(:,handles.PopTime.Value);                               % Dados para eixo X
    YData = Tab.Data(:,handles.PopX.Value);                                 % Dados para eixo Y
    axes(handles.GraficoMTPR);                                              % Seleciona o gr�fico para plotar
    plot(Time,YData,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);        % Plota os dados definindo estilo da linha, sua grossura e cor
    grid(handles.GraficoMTPR,'on')                                          % Grid
    xlim(handles.GraficoMTPR,Tab.T);                                        % Coloca limites definidos nos editbox
end

% --- Executes on button press in CalculateMTPR.
function CalculateMTPR_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateMTPR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if length(handles.MTPRTable.Data(:,1)) >= 3
    Tab = getappdata(handles.ImportMTPR,'TAB');
    GInf = getappdata(handles.ImportMTPR,'GINF');
    Table = handles.MTPRTable.Data;                                         % Recebe os dados da tabela para serem trabalhados
    Time = cell2mat(Table(:,1));                                            % Aloca em Time as informa��es da tabela referente ao tempo
    X = cell2mat(Table(:,3));                                               % Aloca em X as informa��es da tabela referente � "vari�vel de an�lise" X
    
    % Vetores com informa��es do diagrama para c�lculo
    KSI = [0.010 0.0150 0.0200 0.0250 0.0300 0.0350 0.0400 0.0500 0.0600 0.0700 0.0800 0.0900 0.100 0.150 0.200 0.250 0.300 0.350 0.400 0.500 0.600 0.700 0.800 0.900 1];
    TPR = [0.959043641 0.952830859 0.943009510 0.926282108 0.912878855 0.896062572 0.882605991 0.853897431 0.825162208 0.798097947 0.770989245 0.747258022 0.723526798 0.609830237 0.523206826 0.441649631 0.377033153 0.305608390 0.254608479 0.166189672 0.0999022310 0.0540663050 0.0252422010 0.01005244 0];
    
    % C�lculo
    dt = Time(2:end)-Time(1:end-1);                                         % Diferen�a de tempo (T/2)
    Tp2 = mean(dt);                                                         % Os valores de dT deveriam ser iguais, como isso n�o acontece, a m�dia � utilizada para c�lculo
    dX = abs(X(2:end)-X(1:end-1));                                          % Delta X
    dX2dX1 = dX(2:end)./dX(1:end-1);                                        % Vetor com os TPR
    Tpr = mean(dX2dX1);                                                     % Os valores de TPR deveriam ser iguais, como isso n�o acontece, a m�dia � utilizada para c�lculo
    
    wd = pi/Tp2;                                                            % Frequ�ncia amortecida
    ksi = interp1(TPR,KSI,Tpr);                                             % Interpola��o para encontrar a raz�o de amortecimento
    wn = wd/sqrt(1-ksi^2);                                                  % Frequ�ncia n�o amortecida
        
    % Digita as informa��o novamente na tabela
    handles.MTPRTable.Data(1,2) = {'   ------------'};
    handles.MTPRTable.Data(1,4) = {'   ------------'};
    handles.MTPRTable.Data(1,5) = {'   ------------'};
    for i = 1:length(dX2dX1)
        handles.MTPRTable.Data(i+1,2) = {dt(i)};
        handles.MTPRTable.Data(i+1,4) = {dX(i)};
        handles.MTPRTable.Data(i+1,5) = {dX2dX1(i)};
    end
    handles.MTPRTable.Data(end,2) = {dt(end)};
    handles.MTPRTable.Data(end,4) = {dX(end)};
    handles.MTPRTable.Data(end,5) = {'   ------------'};
    handles.TableRes1.Data = {'','',ksi,wn,''};                             % J� � escrito aqui ksi e wn pois o usu�rio pode usar o aplicativo mesmo sem importar o gr�fico
    
    % Resposta no tempo e erro RMS
    TimeTotal = Tab.Data(:,handles.PopTime.Value);                          % Todos valores da vari�vel plotada no eixo X (at� mesmo as que est�o fora dos limites)
    XTotal = Tab.Data(:,handles.PopX.Value);                                % Todos valores da vari�vel plotada no eixo Y (at� mesmo as que est�o fora dos limites)
    PTime1 = find(abs(TimeTotal-Time(1)) == min(abs(TimeTotal-Time(1))),1,'first');     % Posi��o dos limites do eixo X
    PTime2 = find(abs(TimeTotal-Time(end)) == min(abs(TimeTotal-Time(end))),1,'first'); % Posi��o dos limites do eixo X
    TimeResp = TimeTotal(PTime1:PTime2);                                    % Valores da vari�vel Tempo que est�o dentro dos limites do gr�fico
    
    
    PicX = X(1:2:end);                                                      % Valores dos picos informados
    ValX = X(2:2:end);                                                      % Valores dos vales informados
    Y = [PicX;ValX];                                                        % Uni�o dos picos e vales
    
    i = 1;                                                                  % Vari�vel auxiliar no while
    TCalcmax = length(Y)*Tp2;                                               % Tempo m�ximo do calculado
    while i == 1
        tCalc = 0:0.05:TCalcmax;                                            % Vetor de tempo usado para obter estimativa da resposta
        XRespCalc = (wn.*exp(-tCalc.*wn.*ksi).*...                          % Vetor da estimativa da resposta para obter os picos e vales
            sin(tCalc.*wn.*(1 - ksi.^2).^(1/2)))./(1 - ksi.^2).^(1/2);
        Pmax = find(XRespCalc==max(XRespCalc),1,'first');
        TimeRespCalc = TimeResp-TimeResp(1)+tCalc(Pmax);                    % Vetor tempo para c�lculo da resposta
        dx = diff(XRespCalc);
        dx = [0 dx];                                                        % Shifting because diff has one less element
        dx1 = [dx(2:end) 0];                                                % Shifting dx for 1 element
        PicCalc = find(dx>0 & dx1<0);                                       % Compare dx and dx1 to find peaks
        ValCalc = find(dx<0 & dx1>0);                                       % Compare dx and dx1 to find valleys
        PVCalc = [XRespCalc(PicCalc)';XRespCalc(ValCalc)'];
        if length(PVCalc) == length(Y)                                      % Caso o n�mero de picos e vales encontrados na estimativa da resposta seja igual ao dos informados...
            i = 0;                                                          % i = 0 e o while para aqui
        else                                                                % Caso o n�mero n�o seja igual, � modificado o tempo m�ximo da resposta
            TPic1 = tCalc(PicCalc(1));
            TVal1 = tCalc(ValCalc(1));
            TCalcmax = TPic1 + (length(Y)-0.5)*abs(TVal1-TPic1);
        end
    end
    
    Xc = ones(length(Y),2);                                                 % Vetor para c�lculo da pseudo inversa
    Xc(:,1) = PVCalc;                                                       % Vetor para c�lculo da pseudo inversa
    kXeq = pinv(Xc)*Y;                                                      % Aplicando pseudo-inversa
    k = kXeq(1);                                                            % Ganho
    XEquil = kXeq(2);                                                       % Resposta final no estado estacion�rio
    XResp = (k.*wn.*exp(-TimeRespCalc.*wn.*ksi).*...                        % Vetor com a resposta em cada tempo que foi informado
        sin(TimeRespCalc.*wn.*(1 - ksi.^2).^(1/2)))./...
        (1 - ksi.^2).^(1/2)+XEquil;
    
    RMS = sqrt(sum((XResp-XTotal(PTime1:PTime2)).^2)/(length(TimeResp)-1)); % Calcula erro RMS
    FitNRMSE = goodnessOfFit(XTotal(PTime1:PTime2),XResp,'NRMSE')*100;      % O qu�o bem as respostas medidas e calculadas batem
    
    % Digita o resultado na tabela de resultado e plota o gr�fico
    handles.TableRes1.Data = [XEquil,k,ksi,wn,RMS,FitNRMSE];                % Digita o resultado na tabela de resultado
    
    axes(handles.GraficoMTPR);                                              % Seleciona gr�fico para plotar
    plot(TimeTotal,XTotal,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);  % Plota os dados definindo estilo da linha, sua grossura e cor
    grid(handles.GraficoMTPR,'on')                                          % Grid
    xlim(handles.GraficoMTPR,Tab.T);                                        % Coloca limites definidos nos editbox
    hold on                                                                 % Mant�m gr�fico para continuar plotando em cima
    plot(TimeResp,XResp,'--k','LineWidth', 1.2)                             % Plota a resposta calculada
    plot(Time,X,'*r')                                                       % Plota os pontos selecionados pelo usu�rio para c�lculo do app
    hold off                                                                % N�o segura mais os plots para continuar plotando em cima
end

% --- Executes during object creation, after setting all properties.
function TableRes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TableRes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% set(hObject, 'Data', cell(1,3));

% --- Executes on button press in ExportMTPR.
function ExportMTPR_Callback(hObject, eventdata, handles)
% hObject    handle to ExportMTPR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ginf = getappdata(handles.ImportMTPR,'GINF');
Dec = Ginf.Decimal;                                                         % Marcador decimal, 1: v�rgula, 0: ponto
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
Leg = {'Measurements','MTPR'};                                              % Legenda em ingl�s
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Muda legenda para portugu�s
        Leg = {'Medi��es','MTPR'};
    end
end

i = round(rand(1)*1000);                                                    % N�mero rand�mico para que uma figura nunca sobreponha a outra
Fig(i) = figure('rend','painters','pos',[10 10 900 600]);                   % Cria��o da figura com seu tamanho
A = copyobj(handles.GraficoMTPR, Fig(i));                                   % Copia o gr�fico do ICxs para essa nova figura
set(gca,'fontsize',18)                                                      % Define o tamanho da fonte na nova figura
set(gca,'position',[0.1,0.15,0.85,0.8])                                     % Define a posi��o do gr�fico na nova figura
Children = get(gca, 'children');                                            % Recebe informa��es dos diferentes plots da figura
delete(Children(1));                                                        % Deleta todos plots que n�o s�o "medi��es" (importados para o app) e "resposta calculada"
if Dec                                                                      % Modifica a marca decimal, quando solicitado, para v�rgula
    xl = get(A,'XTickLabel');
    new_xl = strrep(xl(:),'.',',');
    set(A,'XTickLabel',new_xl);
    yl = get(A,'YTickLabel');
    new_yl = strrep(yl(:),'.',',');
    set(A,'YTickLabel',new_yl);
end
legend(Leg);                                                                % Adiciona legenda � figura
xlabel(handles.PopTime.String(handles.PopTime.Value));                      % Adiciona t�tulo do eixo X na figura (Nome selecionado no popup menu)
ylabel(handles.PopX.String(handles.PopX.Value));                            % Adiciona t�tulo do eixo Y na figura (Nome selecionado no popup menu)

% --------------------------------------------------------------------
function MTPRMenu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to MTPRMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if length(hObject.State) == 2                                               % Essa aba est� sendo ativada: ativa ela e desativa as outras (o mesmo para os pain�is correspondentes)                                   
    hObject.State = 'on';
    
    handles.MSMenu.State = 'off';
    handles.O1Menu.State = 'off';
    
    handles.O1Panel.Visible = 'off';
    handles.MSPanel.Visible = 'off';
    handles.MTPRPanel.Visible = 'on';
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function MSMenu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to MSMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if length(hObject.State) == 2                                               % Essa aba est� sendo ativada: ativa ela e desativa as outras (o mesmo para os pain�is correspondentes)                                   
    hObject.State = 'on';
    
    handles.MTPRMenu.State = 'off';
    handles.O1Menu.State = 'off';
    
    handles.O1Panel.Visible = 'off';
    handles.MSPanel.Visible = 'on';
    handles.MTPRPanel.Visible = 'off';
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function O1Menu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to O1Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if length(hObject.State) == 2                                               % Essa aba est� sendo ativada: ativa ela e desativa as outras (o mesmo para os pain�is correspondentes)                                    
    hObject.State = 'on';
    
    handles.MSMenu.State = 'off';
    handles.MTPRMenu.State = 'off';
    
    handles.O1Panel.Visible = 'on';
    handles.MSPanel.Visible = 'off';
    handles.MTPRPanel.Visible = 'off';
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --- Executes on selection change in PopXO1.
function PopXO1_Callback(hObject, eventdata, handles)
% hObject    handle to PopXO1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopXO1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopXO1
Tab = getappdata(handles.ImportO1,'TAB');
GInf = getappdata(handles.ImportO1,'GINF');
AuxPop = size(hObject.String);                                              % Quantidade de elementos no popup menu
cla(handles.GraficoO1)                                                      % Deleta as informa��es do gr�fico
if hObject.Value ~= AuxPop(1) && handles.PopTimeO1.Value ~= AuxPop(1)       % S� plota os dados caso seja selecionado nos 2 popup menus op��es diferentes da Default
    Time = Tab.Data(:,handles.PopTimeO1.Value);                             % Dados para eixo X
    YData = Tab.Data(:,hObject.Value);                                      % Dados para eixo Y
    axes(handles.GraficoO1);                                                % Seleciona o gr�fico para plotar
    plot(Time,YData,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);        % Plota os dados definindo estilo da linha, sua grossura e cor
    grid(handles.GraficoO1,'on')                                            % Grid
    xlim(handles.GraficoO1,Tab.T);                                          % Coloca limites definidos nos editbox
end

% --- Executes during object creation, after setting all properties.
function PopXO1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopXO1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopTimeO1.
function PopTimeO1_Callback(hObject, eventdata, handles)
% hObject    handle to PopTimeO1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopTimeO1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopTimeO1
Tab = getappdata(handles.ImportO1,'TAB');
GInf = getappdata(handles.ImportO1,'GINF');
AuxPop = size(hObject.String);                                              % Quantidade de elementos no popup menu
cla(handles.GraficoO1)                                                      % Deleta as informa��es do gr�fico
if hObject.Value ~= AuxPop(1)                                               % S� altera alguma coisa caso a op��o no popup menu seja diferente da Default
    handles.T1O1.String = num2str(min(Tab.Data(:,hObject.Value)));          % Escreve em T1 o limite inferior do eixo X
    handles.T2O1.String = num2str(max(Tab.Data(:,hObject.Value)));          % Escreve em T2 o limite superior do eixo X
    T1 = str2double(handles.T1O1.String);                                   % Limite inferior do eixo X
    T2 = str2double(handles.T2O1.String);                                   % Limite superior do eixo X
    Tab.T = [T1 T2];                                                        % Aloca em Tab.T os limites do eixo X
    
    if handles.PopXO1.Value ~= AuxPop(1)                                    % S� plota os dados caso seja selecionado nos 2 popup menus op��es diferentes da Default
        Time = Tab.Data(:,hObject.Value);                                   % Dados para eixo X
        YData = Tab.Data(:,handles.PopXO1.Value);                           % Dados para eixo Y
        axes(handles.GraficoO1);                                            % Seleciona o gr�fico para plotar
        plot(Time,YData,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);    % Plota os dados definindo estilo da linha, sua grossura e cor
        grid(handles.GraficoO1,'on')                                        % Grid
        xlim(handles.GraficoO1,Tab.T);                                      % Coloca limites definidos nos editbox
    end
else                                                                        % Caso a op��o selecionada para o eixo X seja Default
    handles.T1O1.String = 'T1';                                             % Escreve T1 no box do limite inferior do eixo X
    handles.T2O1.String = 'T2';                                             % Escreve T2 no box do limite superior do eixo X
end
setappdata(handles.ImportO1,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function PopTimeO1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopTimeO1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function T1O1_Callback(hObject, eventdata, handles)
% hObject    handle to T1O1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of T1O1 as text
%        str2double(get(hObject,'String')) returns contents of T1O1 as a double
Tab = getappdata(handles.ImportO1,'TAB');
AuxPop = size(handles.PopTimeO1.String);                                    % Quantidade de elementos no popup menu

if handles.PopTimeO1.Value == AuxPop(1)                                     % Se estiver selecionada a op��o default para o eixo X...
    handles.T1O1.String = 'T1';                                             % ... O usu�rio n�o consegue alterar o box T1, ser� sempre escrito T1 nele
else
    Time = Tab.Data(:,handles.PopTimeO1.Value);                             % Dados para eixo X
    Min = min(Time); Max = max(Time);                                       % Limites superior e inferior do tempo
    AuxNum = str2double(hObject.String);                                    % Valor escrito no editbox
    if AuxNum >= Min && AuxNum <= Max && AuxNum < Tab.T(2)                  % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
        Tab.T(1) = AuxNum;                                                  % ... Al�m disso, ele deve ser menor que o valor j� escrito como limite superior.
        xlim(handles.GraficoO1,Tab.T);                                      % Coloca limites definidos nos editbox
    elseif AuxNum < Min                                                     % Caso o valor escrito seja menor que o limite inferior, ser� escrito o valor m�nimo
        Tab.T(1) = Min;                                                     % Salva em Tab.T o valor do box T1
        handles.T1O1.String = num2str(Min);                                 % Escreve o valor no box T1
        xlim(handles.GraficoO1,Tab.T);                                      % Coloca limites definidos nos editbox
    else
        hObject.String = num2str(Tab.T(1));                                 % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
    end
end

setappdata(handles.ImportO1,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function T1O1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T1O1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function T2O1_Callback(hObject, eventdata, handles)
% hObject    handle to T2O1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of T2O1 as text
%        str2double(get(hObject,'String')) returns contents of T2O1 as a double
Tab = getappdata(handles.ImportO1,'TAB');
AuxPop = size(handles.PopTimeO1.String);                                    % Quantidade de elementos no popup menu

if handles.PopTimeO1.Value == AuxPop(1)                                     % Se estiver selecionada a op��o default para o eixo X...
    handles.T2O1.String = 'T2';                                             % ... O usu�rio n�o consegue alterar o box T2, ser� sempre escrito T2 nele
else
    Time = Tab.Data(:,handles.PopTimeO1.Value);                             % Dados para eixo X
    Min = min(Time); Max = max(Time);                                       % Limites superior e inferior do tempo
    AuxNum = str2double(hObject.String);                                    % Valor escrito no editbox
    if AuxNum >= Min && AuxNum <= Max && AuxNum > Tab.T(1)                  % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
        Tab.T(2) = AuxNum;                                                  % ... Al�m disso, ele deve ser maior que o valor j� escrito como limite inferior.
        xlim(handles.GraficoO1,Tab.T);                                      % Coloca limites definidos nos editbox
    elseif AuxNum > Max                                                     % Caso o valor escrito seja maior que o limite superior, ser� escrito o valor m�ximo
        Tab.T(2) = Max;                                                     % Salva em Tab.T o valor do box T2
        handles.T2O1.String = num2str(Max);                                 % Escreve o valor no box T2
        xlim(handles.GraficoO1,Tab.T);                                      % Coloca limites definidos nos editbox
    else
        hObject.String = num2str(Tab.T(2));                                 % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
    end
end

setappdata(handles.ImportO1,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function T2O1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T2O1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ImportO1.
function ImportO1_Callback(hObject, eventdata, handles)
% hObject    handle to ImportO1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    Tab = getappdata(ICXSData.ICxs_Defaut,'TAB');
    GInf = getappdata(ICXSData.ICxs_Defaut,'GINF');
    
    if t(4) == 1                                                            % Portugu�s
        Ax1 = 'X (Eixo Y)';
        Ax2 = 'Tempo';
    else                                                                    % Ingl�s
        Ax1 = 'X (Y axis)';
        Ax2 = 'Time';
    end
    handles.PopXO1.String = [Tab(t(1)).Var;Ax1];                            % Escreve nos pop up menus o nome das vari�veis q podem ser escolhidas
    handles.PopTimeO1.String = [Tab(t(1)).Var;Ax2];                         % Escreve no pop up menu o nome das vari�veis q podem ser escolhidas
    handles.PopXO1.Value = length(handles.PopXO1.String);                   % Qndo os dados s�o importados, a item escolhido no pop up menu � o default (�ltimo)
    handles.PopTimeO1.Value = length(handles.PopXO1.String);                % Qndo os dados s�o importados, a item escolhido no pop up menu � o default (�ltimo)
    handles.T1O1.String = 'T1';                                             % Escreve T1 no box de T1
    handles.T2O1.String = 'T2';                                             % Escreve T2 no box de T2
    
    cla(handles.GraficoO1);                                                 % Deleta o gr�fico
    
    Tab(t(1)).Data=[Tab(t(1)).Data zeros(length(Tab(t(1)).Data(:,1)),1)];   % Salva em Tab.Data os dados das vari�veis do ICXS e uma �ltima coluna de zeros para o default
    Tab(t(1)).T = [0 1];                                                    % Limites dos gr�ficos
    
    setappdata(handles.ImportO1,'GINF',GInf);
    setappdata(handles.ImportO1,'TAB',Tab(t(1)));
end

% --- Executes on button press in ResetO1.
function ResetO1_Callback(hObject, eventdata, handles)
% hObject    handle to ResetO1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.O1Table.Data = {'' ''};                                             % Retorna informa��es da tabela para as condi��es iniciais
handles.TableRes3.Data = {'' '' '' ''};                                     % Retorna informa��es da tabela para as condi��es iniciais

Tab = getappdata(handles.ImportO1,'TAB');
GInf = getappdata(handles.ImportO1,'GINF');
AuxPop = size(handles.PopXO1.String);                                       % Quantidade de elementos no popup menu
% O reset do gr�fico significa plotar apenas os dados das medi��es, sem os outros plots do aplicativo
if handles.PopXO1.Value ~= AuxPop(1) && handles.PopTimeO1.Value ~= AuxPop(1)% Plota os dados caso seja selecionado nos 2 popup menus op��es diferentes da Default
    Time = Tab.Data(:,handles.PopTimeO1.Value);                             % Dados para eixo X
    YData = Tab.Data(:,handles.PopXO1.Value);                               % Dados para eixo Y
    axes(handles.GraficoO1);                                                % Seleciona o gr�fico para plotar
    plot(Time,YData,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);        % Plota os dados definindo estilo da linha, sua grossura e cor
    grid(handles.GraficoO1,'on')                                            % Grid
    xlim(handles.GraficoO1,Tab.T);                                          % Coloca limites definidos nos editbox
end

% --- Executes on button press in CalculateO1.
function CalculateO1_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateO1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Table = handles.O1Table.Data;                                               % Recebe os dados da tabela para serem trabalhados
t1 = str2double(Table{1});                                                  % Aloca em t1 o valor do tempo que come�ou a resposta
Xend = str2double(Table{2});                                                % Aloca em Xend o valor da resposta no fim do gr�fico
if (~isnan(t1)) && (~isnan(Xend))                                           % S� � calculado caso os campos da tabela sejam preenchidos
    Tab = getappdata(handles.ImportO1,'TAB');
    GInf = getappdata(handles.ImportO1,'GINF');
    
    TimeTotal = Tab.Data(:,handles.PopTimeO1.Value);                        % Todos valores da vari�vel plotada no eixo X (at� mesmo as que est�o fora dos limites)
        PTime1 = find(abs(TimeTotal-Tab.T(1)) ==...                         % Posi��o dos limites do eixo X
            min(abs(TimeTotal-Tab.T(1))),1,'first');
        PTime2 = find(abs(TimeTotal-Tab.T(2)) ==....                        % Posi��o dos limites do eixo X
            min(abs(TimeTotal-Tab.T(2))),1,'first');
    Time = TimeTotal(PTime1:PTime2);                                        % Valores da vari�vel Tempo que est�o dentro dos limites do gr�fico
    X = Tab.Data(PTime1:PTime2,handles.PopXO1.Value);                       % Valores da vari�vel X que est�o dentro dos limites do gr�fico
%     tt1 = Time(1);
%     Time = Time - Time(1);
    % C�lculo, resposta no tempo e erro RMS
    P0 = round(mean(find((abs(Time - t1))==min(abs(Time - t1)))));          % Encontra posi��o do tempo inicial (t1) informado pelo usu�rio
    t0 = Time(P0);                                                          % Encontra o tempo t1 dentro do vetor de tempo
    tCalc = Time(P0:end)-t0;                                                % Tempo para c�lculo da resposta (joga o tempo inicial dos dados para zero)
    XTeste = X(P0:end);                                                     % Resposta X do teste apenas no intervalo que deve ser analisado
    
    k = Xend-XTeste(1);                                                     % Estimativa inicial do ganho
    XTau = 0.632*k+XTeste(1);                                               % Estimativa inicial da resposta no tempo igual � constante de tempo
%     Tau = mean(Time(find(abs(X-XTau) == min(abs(X-XTau)))));                % Estimativa inicial da constante de tempo
    PTau = find(abs(XTeste-XTau) == min(abs(XTeste-XTau)));
    Tau = interp1(XTeste(PTau-2:PTau+2),tCalc(PTau-2:PTau+2),XTau);
    
    FitNRMSEaux = -Inf;                                                     % Vari�vel auxiliar, representa no while o Fit antigo
    FitNRMSE = -10000000000;                                                % Vari�vel auxiliar, representa no while o Fit atual
    Tauaux = Inf;                                                           % Vari�vel auxiliar, representa no while o Tau antigo
    while FitNRMSE > FitNRMSEaux || abs(Tauaux-Tau)>0.05                    % Vai continuar as itera��es enquanto o Fit estiver aumentando
        Tauaux = Tau;
        FitNRMSEaux = FitNRMSE;
        XRespCalc = (1 - exp(-tCalc./Tau));                                 % Estimativa da resposta
        k = (Xend-XTeste(1))/(XRespCalc(end)-XRespCalc(1));                 % Ganho
        XTau = 0.632*k+XTeste(1);                                           % Resposta no tempo igual � constante de tempo
%         Tau = mean(Time(find(abs(X-XTau) == min(abs(X-XTau)))));            % Constante de tempo
        PTau = find(abs(XTeste-XTau) == min(abs(XTeste-XTau)));
        Tau = interp1(XTeste(PTau-2:PTau+2),tCalc(PTau-2:PTau+2),XTau);
    
        XResp = k.*(1 - exp(-tCalc./Tau))+XTeste(1);                        % Resposta
        FitNRMSE = goodnessOfFit(XTeste,XResp,'NRMSE');                     % O qu�o bem as respostas calculadas e medidas batem
    end
    
    % Recalcula o que saiu do while com o novo Tau
    XRespCalc = (1 - exp(-tCalc./Tau));
    k = (Xend-XTeste(1))/(XRespCalc(end)-XRespCalc(1));
    XTau = 0.632*k+XTeste(1);
%     Tau = mean(Time(find(abs(X-XTau) == min(abs(X-XTau)))));
    PTau = find(abs(XTeste-XTau) == min(abs(XTeste-XTau)));
    Tau = interp1(XTeste(PTau-2:PTau+2),tCalc(PTau-2:PTau+2),XTau);
    XResp = k.*(1 - exp(-tCalc./Tau))+XTeste(1);
    RMS = sqrt(sum((XResp-XTeste).^2)/(length(XTeste)-1));
    FitNRMSE = goodnessOfFit(XTeste,XResp,'NRMSE')*100;
    
    % Digita o resultado na tabela de resultado e plota o gr�fico
    handles.TableRes3.Data = [Xend/(XRespCalc(end)-XRespCalc(1)),...        % Digita o resultado na tabela de resultado
        k,Tau,RMS,FitNRMSE];

    axes(handles.GraficoO1);                                                % Seleciona gr�fico para plotar
    YDataPlot = Tab.Data(:,handles.PopXO1.Value);                           % Valores do Eixo Y para plotar o gr�fico
    plot(TimeTotal,YDataPlot,GInf.Style,'LineWidth',1.2,'Color',GInf.Color);% Plota os dados definindo estilo da linha, sua grossura e cor
    grid(handles.GraficoO1,'on')                                            % Grid
    xlim(handles.GraficoO1,Tab.T);                                          % Coloca limites definidos nos editbox
    hold on                                                                 % Mant�m gr�fico para continuar plotando em cima
    plot(tCalc+t0,XResp,'--k','LineWidth', 1.2)                             % Plota a resposta calculada
    Tau = Tau + t0;
%     plot([Tau Tau],[X(1) XTau],'--r')                                       % Plota reta vertical para indicar o ponto que foi encontrado para c�lculo da constante de tempo
%     plot([Tab.T(1) Tau],[XTau XTau],'--r')                                  % Plota reta horizontal para indicar o ponto que foi encontrado para c�lculo da constante de tempo
    plot(Tau,XTau,'*r')                                                     % Plota o ponto da curva onde t = constante de tempo
    hold off                                                                % N�o segura mais os plots para continuar plotando em cima
end

% --- Executes on button press in ExportO1.
function ExportO1_Callback(hObject, eventdata, handles)
% hObject    handle to ExportO1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ginf = getappdata(handles.ImportO1,'GINF');
Dec = Ginf.Decimal;                                                         % Marcador decimal, 1: v�rgula, 0: ponto
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
Leg = {'Measurements','Calculated'};                                        % Legenda em ingl�s
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Muda legenda para portugu�s
        Leg = {'Medi��es','Calculado'};
    end
end

i = round(rand(1)*1000);                                                    % N�mero rand�mico para que uma figura nunca sobreponha a outra
Fig(i) = figure('rend','painters','pos',[10 10 900 600]);                   % Cria��o da figura com seu tamanho
A = copyobj(handles.GraficoO1, Fig(i));                                     % Copia o gr�fico do ICxs para essa nova figura
set(gca,'fontsize',18)                                                      % Define o tamanho da fonte na nova figura
set(gca,'position',[0.1,0.15,0.85,0.8])                                     % Define a posi��o do gr�fico na nova figura
Children = get(gca, 'children');                                            % Recebe informa��es dos diferentes plots da figura
% delete(Children(2));delete(Children(3));                                    % Deleta todos plots que n�o s�o "medi��es" (importados para o app) e "resposta calculada"
delete(Children(1));                                                        % Deleta todos plots que n�o s�o "medi��es" (importados para o app) e "resposta calculada"
if Dec                                                                      % Modifica a marca decimal, quando solicitado, para v�rgula
    xl = get(A,'XTickLabel');
    new_xl = strrep(xl(:),'.',',');
    set(A,'XTickLabel',new_xl);
    yl = get(A,'YTickLabel');
    new_yl = strrep(yl(:),'.',',');
    set(A,'YTickLabel',new_yl);
end
legend(Leg);                                                                % Adiciona legenda � figura
xlabel(handles.PopTimeO1.String(handles.PopTimeO1.Value));                  % Adiciona t�tulo do eixo X na figura (Nome selecionado no popup menu)
ylabel(handles.PopXO1.String(handles.PopXO1.Value));                        % Adiciona t�tulo do eixo Y na figura (Nome selecionado no popup menu)

% --- Executes on selection change in PopXMS.
function PopXMS_Callback(hObject, eventdata, handles)
% hObject    handle to PopXMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopXMS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopXMS
Tab = getappdata(handles.ImportMS,'TAB');
GInf = getappdata(handles.ImportMS,'GINF');
AuxPop = size(hObject.String);                                              % Quantidade de elementos no popup menu
cla(handles.GraficoMS)                                                      % Deleta as informa��es do gr�fico
if hObject.Value ~= AuxPop(1) && handles.PopTimeMS.Value ~= AuxPop(1)       % S� plota os dados caso seja selecionado nos 2 popup menus op��es diferentes da Default
    Time = Tab.Data(:,handles.PopTimeMS.Value);                             % Dados para eixo X
    YData = Tab.Data(:,hObject.Value);                                      % Dados para eixo Y
    axes(handles.GraficoMS);                                                % Seleciona o gr�fico para plotar
    plot(Time,YData,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);        % Plota os dados definindo estilo da linha, sua grossura e cor
    grid(handles.GraficoMS,'on')                                            % Grid
    xlim(handles.GraficoMS,Tab.T);                                          % Coloca limites definidos nos editbox
end

% --- Executes during object creation, after setting all properties.
function PopXMS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopXMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopTimeMS.
function PopTimeMS_Callback(hObject, eventdata, handles)
% hObject    handle to PopTimeMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopTimeMS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopTimeMS
Tab = getappdata(handles.ImportMS,'TAB');
GInf = getappdata(handles.ImportMS,'GINF');
AuxPop = size(hObject.String);                                              % Quantidade de elementos no popup menu
cla(handles.GraficoMS)                                                      % Deleta as informa��es do gr�fico
if hObject.Value ~= AuxPop(1)                                               % S� altera alguma coisa caso a op��o no popup menu seja diferente da Default
    handles.T1MS.String = num2str(min(Tab.Data(:,hObject.Value)));          % Escreve em T1 o limite inferior do eixo X
    handles.T2MS.String = num2str(max(Tab.Data(:,hObject.Value)));          % Escreve em T2 o limite superior do eixo X
    T1 = str2double(handles.T1MS.String);                                   % Limite inferior do eixo X
    T2 = str2double(handles.T2MS.String);                                   % Limite superior do eixo X
    Tab.T = [T1 T2];                                                        % Aloca em Tab.T os limites do eixo X
    
    if handles.PopXMS.Value ~= AuxPop(1)                                    % S� plota os dados caso seja selecionado nos 2 popup menus op��es diferentes da Default
        Time = Tab.Data(:,hObject.Value);                                   % Dados para eixo X
        YData = Tab.Data(:,handles.PopXMS.Value);                           % Dados para eixo Y
        axes(handles.GraficoMS);                                            % Seleciona o gr�fico para plotar
        plot(Time,YData,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);    % Plota os dados definindo estilo da linha, sua grossura e cor
        grid(handles.GraficoMS,'on')                                        % Grid
        xlim(handles.GraficoMS,Tab.T);                                      % Coloca limites definidos nos editbox
    end
else                                                                        % Caso a op��o selecionada para o eixo X seja Default
    handles.T1MS.String = 'T1';                                             % Escreve T1 no box do limite inferior do eixo X
    handles.T2MS.String = 'T2';                                             % Escreve T2 no box do limite superior do eixo X
end
setappdata(handles.ImportMS,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function PopTimeMS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopTimeMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function T1MS_Callback(hObject, eventdata, handles)
% hObject    handle to T1MS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of T1MS as text
%        str2double(get(hObject,'String')) returns contents of T1MS as a double
Tab = getappdata(handles.ImportMS,'TAB');
AuxPop = size(handles.PopTimeMS.String);                                    % Quantidade de elementos no popup menu

if handles.PopTimeMS.Value == AuxPop(1)                                     % Se estiver selecionada a op��o default para o eixo X...
    handles.T1MS.String = 'T1';                                             % ... O usu�rio n�o consegue alterar o box T1, ser� sempre escrito T1 nele
else
    Time = Tab.Data(:,handles.PopTimeMS.Value);                             % Dados para eixo X
    Min = min(Time); Max = max(Time);                                       % Limites superior e inferior do tempo
    AuxNum = str2double(hObject.String);                                    % Valor escrito no editbox
    if AuxNum >= Min && AuxNum <= Max && AuxNum < Tab.T(2)                  % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
        Tab.T(1) = AuxNum;                                                  % ... Al�m disso, ele deve ser menor que o valor j� escrito como limite superior.
        xlim(handles.GraficoMS,Tab.T);                                      % Coloca limites definidos nos editbox
    elseif AuxNum < Min                                                     % Caso o valor escrito seja menor que o limite inferior, ser� escrito o valor m�nimo
        Tab.T(1) = Min;                                                     % Salva em Tab.T o valor do box T1
        handles.T1MS.String = num2str(Min);                                 % Escreve o valor no box T1
        xlim(handles.GraficoMS,Tab.T);                                      % Coloca limites definidos nos editbox
    else
        hObject.String = num2str(Tab.T(1));                                 % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
    end
end

setappdata(handles.ImportMS,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function T1MS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T1MS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function T2MS_Callback(hObject, eventdata, handles)
% hObject    handle to T2MS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of T2MS as text
%        str2double(get(hObject,'String')) returns contents of T2MS as a double
Tab = getappdata(handles.ImportMS,'TAB');
AuxPop = size(handles.PopTimeMS.String);                                    % Quantidade de elementos no popup menu

if handles.PopTimeMS.Value == AuxPop(1)                                     % Se estiver selecionada a op��o default para o eixo X...
    handles.T2MS.String = 'T2';                                             % ... O usu�rio n�o consegue alterar o box T2, ser� sempre escrito T2 nele
else
    Time = Tab.Data(:,handles.PopTimeMS.Value);                             % Dados para eixo X
    Min = min(Time); Max = max(Time);                                       % Limites superior e inferior do tempo
    AuxNum = str2double(hObject.String);                                    % Valor escrito no editbox
    if AuxNum >= Min && AuxNum <= Max && AuxNum > Tab.T(1)                  % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
        Tab.T(2) = AuxNum;                                                  % ... Al�m disso, ele deve ser maior que o valor j� escrito como limite inferior.
        xlim(handles.GraficoMS,Tab.T);                                      % Coloca limites definidos nos editbox
    elseif AuxNum > Max                                                     % Caso o valor escrito seja maior que o limite superior, ser� escrito o valor m�ximo
        Tab.T(2) = Max;                                                     % Salva em Tab.T o valor do box T2
        handles.T2MS.String = num2str(Max);                                 % Escreve o valor no box T2
        xlim(handles.GraficoMS,Tab.T);                                      % Coloca limites definidos nos editbox
    else
        hObject.String = num2str(Tab.T(2));                                 % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
    end
end

setappdata(handles.ImportMS,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function T2MS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T2MS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ImportMS.
function ImportMS_Callback(hObject, eventdata, handles)
% hObject    handle to ImportMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    Tab = getappdata(ICXSData.ICxs_Defaut,'TAB');
    GInf = getappdata(ICXSData.ICxs_Defaut,'GINF');
    
    if t(4) == 1                                                            % Portugu�s
        Ax1 = 'X (Eixo Y)';
        Ax2 = 'Tempo';
    else                                                                    % Ingl�s
        Ax1 = 'X (Y axis)';
        Ax2 = 'Time';
    end
    handles.PopXMS.String = [Tab(t(1)).Var;Ax1];                            % Escreve nos pop up menus o nome das vari�veis q podem ser escolhidas
    handles.PopTimeMS.String = [Tab(t(1)).Var;Ax2];                         % Escreve no pop up menu o nome das vari�veis q podem ser escolhidas
    handles.PopXMS.Value = length(handles.PopXMS.String);                   % Qndo os dados s�o importados, a item escolhido no pop up menu � o default (�ltimo)
    handles.PopTimeMS.Value = length(handles.PopXMS.String);                % Qndo os dados s�o importados, a item escolhido no pop up menu � o default (�ltimo)
    handles.T1MS.String = 'T1';                                             % Escreve T1 no box de T1
    handles.T2MS.String = 'T2';                                             % Escreve T2 no box de T2
    
    cla(handles.GraficoMS);                                                 % Deleta o gr�fico
    
    Tab(t(1)).Data=[Tab(t(1)).Data zeros(length(Tab(t(1)).Data(:,1)),1)];   % Salva em Tab.Data os dados das vari�veis do ICXS e uma �ltima coluna de zeros para o default
    Tab(t(1)).T = [0 1];                                                    % Limites dos gr�ficos
    
    setappdata(handles.ImportMS,'GINF',GInf);
    setappdata(handles.ImportMS,'TAB',Tab(t(1)));
end

% --- Executes on button press in ResetMS.
function ResetMS_Callback(hObject, eventdata, handles)
% hObject    handle to ResetMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.MSTable.Data = {'' '' '' ''};                                       % Retorna informa��es da tabela para as condi��es iniciais
handles.TableResMS.Data = {'' '' ''};                                       % Retorna informa��es da tabela para as condi��es iniciais
handles.TableRes2.Data = {'' '' '' '' ''};                                  % Retorna informa��es da tabela para as condi��es iniciais

Tab = getappdata(handles.ImportMS,'TAB');
GInf = getappdata(handles.ImportMS,'GINF');
AuxPop = size(handles.PopXMS.String);                                       % Quantidade de elementos no popup menu
% O reset do gr�fico significa plotar apenas os dados das medi��es, sem os outros plots do aplicativo
if handles.PopXMS.Value ~= AuxPop(1) && handles.PopTimeMS.Value ~= AuxPop(1)% Plota os dados caso seja selecionado nos 2 popup menus op��es diferentes da Default
    Time = Tab.Data(:,handles.PopTimeMS.Value);                             % Dados para eixo X
    YData = Tab.Data(:,handles.PopXMS.Value);                               % Dados para eixo Y
    axes(handles.GraficoMS);                                                % Seleciona o gr�fico para plotar
    plot(Time,YData,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);        % Plota os dados definindo estilo da linha, sua grossura e cor
    grid(handles.GraficoMS,'on')                                            % Grid
    xlim(handles.GraficoMS,Tab.T);                                          % Coloca limites definidos nos editbox
end

% --- Executes on button press in CalculateMS.
function CalculateMS_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t1 = (handles.TableResMS.Data(1));                                          % Recebe valores calculados pela metodologia ou informados pelo usu�rio para terminar os c�lculos
t2 = (handles.TableResMS.Data(2));                                          % Recebe valores calculados pela metodologia ou informados pelo usu�rio para terminar os c�lculos
Xrt2 = (handles.TableResMS.Data(3));                                        % Recebe valores calculados pela metodologia ou informados pelo usu�rio para terminar os c�lculos

if (~isnan(t1)) && (~isnan(t2)) && (~isnan(Xrt2))                           % S� funciona caso a tabela esteja preenchida
    Tab = getappdata(handles.ImportMS,'TAB');
    GInf = getappdata(handles.ImportMS,'GINF');
    Table = handles.MSTable.Data;                                           % Recebe os dados da tabela para serem trabalhados
    Xm1 = str2double(Table{1});                                             % Aloca em Xm1 o valor da tabela correspondente ao primeiro m�ximo ou m�nimo
    Xm2 = str2double(Table{2});                                             % Aloca em Xm2 o valor da tabela correspondente ao segundo m�ximo ou m�nimo
    
    TimeTotal = Tab.Data(:,handles.PopTimeMS.Value);                        % Todos valores da vari�vel plotada no eixo X (at� mesmo as que est�o fora dos limites)
        PTime1 = find(abs(TimeTotal-Tab.T(1)) ==...                         % Posi��o dos limites do eixo X
            min(abs(TimeTotal-Tab.T(1))),1,'first');
        PTime2 = find(abs(TimeTotal-Tab.T(2)) ==....                        % Posi��o dos limites do eixo X
            min(abs(TimeTotal-Tab.T(2))),1,'first');
    Time = TimeTotal(PTime1:PTime2);                                        % Valores da vari�vel Tempo que est�o dentro dos limites do gr�fico
    X = Tab.Data(PTime1:PTime2,handles.PopXMS.Value);                       % Valores da vari�vel X que est�o dentro dos limites do gr�fico
    
    % Vetores com informa��es do diagrama para c�lculo
    KSI = [0 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85 0.9 0.95 1 1.05 1.1 1.15 1.2 1.25 1.3 1.35 1.4 1.45 1.5 1.55 1.6 1.65 1.7 1.75 1.8 1.85 1.9 1.95 2];
    dX1dXV = [0.081387 0.083939 0.087125 0.090311 0.094139 0.097967 0.102429000000000 0.10562 0.110088 0.113919 0.120305 0.124454 0.131155 0.137231 0.144896 0.152248 0.159922 0.16951 0.179742 0.18966 0.199578 0.209821 0.218785 0.225833 0.233523 0.241219 0.247636 0.253741 0.259846 0.264347 0.268849 0.273362 0.277233 0.280792 0.284662 0.287578 0.290818 0.29341 0.296011 0.298612 0.300573];
    wndT = [1.998283033 2.008212159 2.013096862 2.017981566 2.032875254 2.047768942 2.057618208 2.072538515 2.092423385 2.112334875 2.147193292 2.167091472 2.196918777 2.246843909 2.291684690 2.346574385 2.406468572 2.476318504 2.556177420 2.646085249 2.735993079 2.835923202 2.925870961 3.005862975 3.095863974 3.195900576 3.285954813 3.386057964 3.486161115 3.566259608 3.646358101 3.746527801 3.836688517 3.936898147 4.027058863 4.117259508 4.217482448 4.297660799 4.392892556 4.488124314 4.578364889];
    
    % C�lculo utilizando metodologia
    dt = t2 - t1;                                                           
    dX = abs(Xm2 - Xm1);
    dX1 = abs(Xm2-Xrt2);
    dX1dX = dX1/dX;
    wndt = interp1(dX1dXV,wndT,dX1dX);                                      % Interpola valores do diagrama
    
    ksi = interp1(dX1dXV,KSI,dX1dX);                                        % Interpola valores do diagrama
    wn = wndt/dt;                                                           % Frequ�ncia n�o amortecida
    handles.TableRes2.Data = {'','',ksi,wn,''};                             % J� � escrito aqui ksi e wn pois o usu�rio pode usar o aplicativo mesmo sem importar o gr�fico
    if ksi == 1                                                             % Aproxima��o necess�ria para n�o zerar na equa��o da resposta
        ksi = 1.0000000001;
    end
    
    % Resposta no tempo e erro RMS
    P0 = round(mean(find((abs(X - Xm1))==min(abs(X - Xm1)))));              % Posi��o onde come�a a resposta
    XTeste = X(P0:end);                                                     % Resposta abtida no teste
    t0 = Time(P0);                                                          % Tempo inicial
    tCalc = Time(P0)-t0:3*(Time(end)-t0);                                   % Vetor de tempo usado para obter estimativa da resposta
    XRespCalc = (1 - exp(-ksi.*tCalc.*wn).*(cosh(tCalc.*wn.*...             % Vetor da estimativa da resposta para obter estimativa do ganho
        (ksi.^2 - 1).^(1/2)) + (ksi.*sinh(tCalc.*wn.*(ksi.^2 - 1).^...
        (1/2)))./(ksi.^2 - 1).^(1/2)));
       
    tCalc = Time(P0:end)-t0;                                                % Vetor com tempo setado para que o experimento "comece no zero"
    FitNRMSEaux = -Inf;                                                     % Vari�vel auxiliar, representa no while o Fit antigo
    FitNRMSE = -10000000000;                                                % Vari�vel auxiliar, representa no while o Fit atual
    XEquil = Xm2;                                                           % Estimativa inicial da resposta em estado estacion�rio
    dXEq = 0.001*(Xm1-Xm2)/abs(Xm2-Xm1);                                    % Incremento de XEquil
    while FitNRMSE > FitNRMSEaux                                            % Enquanto o Fit estiver aumentando, o valor de XEquil via sendo modificado
        FitNRMSEaux = FitNRMSE;
        k = (XEquil-Xm1)/abs(XRespCalc(end)-XRespCalc(1));                  % Novo valor do ganho
        XResp= k.*(1 - exp(-ksi.*tCalc.*wn).*(cosh(tCalc.*wn.*...           % Resposta calculada
            (ksi.^2 - 1).^(1/2)) + (ksi.*sinh(tCalc.*wn.*(ksi.^2 - 1).^...
            (1/2)))./(ksi.^2 - 1).^(1/2)))+Xm1;
        FitNRMSE = goodnessOfFit(XTeste,XResp,'NRMSE');
        XEquil = XEquil+dXEq;                                               % Incremento de XEquil para pr�ximo loop
    end
    XEquil = XEquil-2*dXEq;                                                 % Retira o �ltimo incremento de XEquil e o incremento que deu o resultado pior
    k = (XEquil-Xm1)/abs(XRespCalc(end)-XRespCalc(1));                      % Recalcula o ganho
    XResp= k.*(1 - exp(-ksi.*tCalc.*wn).*(cosh(tCalc.*wn.*...               % Resposta calculada
            (ksi.^2 - 1).^(1/2)) + (ksi.*sinh(tCalc.*wn.*(ksi.^2 - 1).^...
            (1/2)))./(ksi.^2 - 1).^(1/2)))+Xm1;
    RMS = sqrt(sum((XResp-XTeste).^2)/(length(XTeste)-1));                  % C�lculo do erro RMS
    FitNRMSE = goodnessOfFit(XTeste,XResp,'NRMSE')*100;                     % Calcula o qu�o bom est� o resultado com o teste    
    
    % Digita o resultado na tabela de resultado
    handles.TableRes2.Data = [XEquil,k,ksi,wn,RMS,FitNRMSE];                % Digita o resultado na tabela de resultado
    
    axes(handles.GraficoMS);                                                % Seleciona gr�fico para plotar
    YDataPlot = Tab.Data(:,handles.PopXMS.Value);                           % Todos valores da vari�vel plotada no eixo X (at� mesmo as que est�o fora dos limites)
    plot(TimeTotal,YDataPlot,GInf.Style,'LineWidth',1.2,'Color',GInf.Color);% Plota os dados definindo estilo da linha, sua grossura e cor
    grid(handles.GraficoMS,'on')                                            % Grid
    xlim(handles.GraficoMS,Tab.T);                                          % Coloca limites definidos nos editbox
    hold on                                                                 % Mant�m gr�fico para continuar plotando em cima
    plot(tCalc+t0,XResp,'--k','LineWidth', 1.2)                             % Plota a resposta calculada
    hold on                                                                 % Mant�m gr�fico para continuar plotando em cima
    plot(Tab.T,[Xm2 Xm2],'--r')                                             % Plota linha horizontal de apoio da metodologia
    plot(Tab.T,[Xm1 Xm1],'--r')                                             % Plota linha horizontal de apoio da metodologia
    plot([t1 t2],[Xm1 Xm2],'--r')                                           % Plota linha de m�ximo slope
    plot(t2,Xrt2,'*r')                                                      % Plota o ponto com o valor da resposta "no encontro de retas" da metodologia
    hold off                                                                % N�o segura mais os plots para continuar plotando em cima
end

% --- Executes on button press in ExportMS.
function ExportMS_Callback(hObject, eventdata, handles)
% hObject    handle to ExportMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ginf = getappdata(handles.ImportMS,'GINF');
Dec = Ginf.Decimal;                                                         % Marcador decimal, 1: v�rgula, 0: ponto
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
Leg = {'Measurements','MS'};                                                % Legenda em ingl�s
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Muda legenda para portugu�s
        Leg = {'Medi��es','MS'};
    end
end

i = round(rand(1)*1000  );                                                  % N�mero rand�mico para que uma figura nunca sobreponha a outra
Fig(i) = figure('rend','painters','pos',[10 10 900 600]);                   % Cria��o da figura com seu tamanho
A = copyobj(handles.GraficoMS, Fig(i));                                     % Copia o gr�fico do ICxs para essa nova figura
set(gca,'fontsize',18)                                                      % Define o tamanho da fonte na nova figura
set(gca,'position',[0.1,0.15,0.85,0.8])                                     % Define a posi��o do gr�fico na nova figura
Children = get(gca, 'children');                                            % Recebe informa��es dos diferentes plots da figura
delete(Children(1));delete(Children(2));                                    % Deleta todos plots que n�o s�o "medi��es" (importados para o app) e "resposta calculada"
delete(Children(3));delete(Children(4));                                    % Deleta todos plots que n�o s�o "medi��es" (importados para o app) e "resposta calculada"
if Dec                                                                      % Modifica a marca decimal, quando solicitado, para v�rgula
    xl = get(A,'XTickLabel');
    new_xl = strrep(xl(:),'.',',');
    set(A,'XTickLabel',new_xl);
    yl = get(A,'YTickLabel');
    new_yl = strrep(yl(:),'.',',');
    set(A,'YTickLabel',new_yl);
end
legend(Leg);                                                                % Adiciona legenda � figura
xlabel(handles.PopTimeMS.String(handles.PopTimeMS.Value));                  % Adiciona t�tulo do eixo X na figura (Nome selecionado no popup menu)
ylabel(handles.PopXMS.String(handles.PopXMS.Value));                        % Adiciona t�tulo do eixo Y na figura (Nome selecionado no popup menu)

% --- Executes during object creation, after setting all properties.
function MSTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MSTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in GenMS.
function GenMS_Callback(hObject, eventdata, handles)
% hObject    handle to GenMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ImportMS,'TAB');
GInf = getappdata(handles.ImportMS,'GINF');
Table = handles.MSTable.Data;                                               % Recebe os dados da tabela para serem trabalhados
Xm1 = str2double(Table{1});                                                 % Aloca em Xm1 o valor da tabela correspondente ao primeiro m�ximo ou m�nimo
Xm2 = str2double(Table{2});                                                 % Aloca em Xm2 o valor da tabela correspondente ao segundo m�ximo ou m�nimo
tms1 = str2double(Table{3});                                                % Aloca em tms1 o valor de tempo para calcular o slope
tms2 = str2double(Table{4});                                                % Aloca em tms2 o valor de tempo para calcular o slope

TimeTotal = Tab.Data(:,handles.PopTimeMS.Value);                            % Todos valores da vari�vel plotada no eixo X (at� mesmo as que est�o fora dos limites)
PTime1 = find(abs(TimeTotal-Tab.T(1)) ==...                                 % Posi��o dos limites do eixo X
    min(abs(TimeTotal-Tab.T(1))),1,'first');
PTime2 = find(abs(TimeTotal-Tab.T(2)) ==....                                % Posi��o dos limites do eixo X
    min(abs(TimeTotal-Tab.T(2))),1,'first');
Time = TimeTotal(PTime1:PTime2);                                            % Valores da vari�vel Tempo que est�o dentro dos limites do gr�fico
X = Tab.Data(PTime1:PTime2,handles.PopXMS.Value);                           % Valores da vari�vel X que est�o dentro dos limites do gr�fico

% C�lculos
    % Utiliza os pontos mais pr�ximos dos tempos tms1 e tms2 informados
    % para encontrar a reta de m�ximo slope. polyfit cria a interpola��o
Pms1 = find((abs(Time - tms1))==min(abs(Time - tms1))); Xms(1) = mean(X(Pms1));
Tms(1) = Time(Pms1);
Pms2 = find((abs(Time - tms2))==min(abs(Time - tms2))); Xms(2) = mean(X(Pms2));
Tms(2) = Time(Pms2);
[c] = polyfit(Tms,Xms,1);

t1 = (Xm1-c(2))/c(1);                                                       % t1 da metodologia
t2 = (Xm2-c(2))/c(1);                                                       % t2 da metodologia
Xrt2 = interp1(Time,X,t2);                                                  % Valor da resposta "no encontro de retas" da metodologia


% Digita o resultado na tabela do MS e plota o desenho no gr�fico
handles.TableResMS.Data = [t1,t2,Xrt2];                                     % Digita resultado na tabela intermedi�ria. O usu�rio pode mudar esses valores antes de calcular

axes(handles.GraficoMS);                                                    % Seleciona gr�fico para plotar
YDataPlot = Tab.Data(:,handles.PopXMS.Value);                               % Todos valores da vari�vel plotada no eixo Y (at� mesmo as que est�o fora dos limites)
plot(TimeTotal,YDataPlot,GInf.Style,'LineWidth', 1.2,'Color',GInf.Color);   % Plota os dados definindo estilo da linha, sua grossura e cor
grid(handles.GraficoMS,'on')                                                % Grid
xlim(handles.GraficoMS,Tab.T);                                              % Coloca limites definidos nos editbox
hold on                                                                     % Mant�m gr�fico para continuar plotando em cima
plot(Tab.T,[Xm2 Xm2],'--r')                                                 % Plota linha horizontal de apoio da metodologia
plot(Tab.T,[Xm1 Xm1],'--r')                                                 % Plota linha horizontal de apoio da metodologia
plot([t1 t2],[Xm1 Xm2],'--r')                                               % Plota linha de m�ximo slope
plot(t2,Xrt2,'*r')                                                          % Plota o ponto com o valor da resposta "no encontro de retas" da metodologia
hold off                                                                    % N�o segura mais os plots para continuar plotando em cima
