function varargout = AppDragPolar(varargin)
%APPDRAGPOLAR MATLAB code file for AppDragPolar.fig
%      APPDRAGPOLAR, by itself, creates a new APPDRAGPOLAR or raises the existing
%      singleton*.
%
%      H = APPDRAGPOLAR returns the handle to a new APPDRAGPOLAR or the handle to
%      the existing singleton*.
%
%      APPDRAGPOLAR('Property','Value',...) creates a new APPDRAGPOLAR using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to AppDragPolar_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      APPDRAGPOLAR('CALLBACK') and APPDRAGPOLAR('CALLBACK',hObject,...) call the
%      local function named CALLBACK in APPDRAGPOLAR.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppDragPolar

% Last Modified by GUIDE v2.5 12-Jul-2018 15:38:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppDragPolar_OpeningFcn, ...
                   'gui_OutputFcn',  @AppDragPolar_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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

% --- Executes just before AppDragPolar is made visible.
function AppDragPolar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for AppDragPolar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AppDragPolar wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% LegApp.A = handles.ACMCB.Value;
% LegApp.B = handles.SGMCB.Value;
% LegApp.C = handles.RSMCB.Value;
% setappdata(handles.PanelPlot,'LEGAPP',LegApp);

handles.Table1.UserData = 0;
handles.Table1I.UserData = 0;
handles.Table2.UserData = 0;
handles.Table2I.UserData = 0;
handles.Table3.UserData = 0;
handles.Table3I.UserData = 0;

% Mudar o idioma
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.DragP.Name = 'Polar de arrasto';
        handles.Title.String = 'POLAR DE ARRASTO';
        
        handles.PanelAM.Title = 'Método ''Accelerometer''';
        handles.ImpData1.String = 'Importar';
        handles.NewRow1.String = 'Nova linha';
        handles.DelRow1.String = 'Excluir linha';
        handles.Reset1.String = 'Restaurar';
        handles.Calculate1.String = 'Calcular';
        
        handles.PanelSGM.Title = 'Método ''Stabilized-glide''';
        handles.ImpData2.String = 'Importar';
        handles.NewRow2.String = 'Nova linha';
        handles.DelRow2.String = 'Excluir linha';
        handles.Reset2.String = 'Restaurar';
        handles.Calculate2.String = 'Calcular';
        handles.CalcS2.String = 'Calcular usando:';
        
        handles.PanelRSM.Title = 'Método ''Rate-of-sink''';
        handles.ImpData3.String = 'Importar';
        handles.NewRow3.String = 'Nova linha';
        handles.DelRow3.String = 'Excluir linha';
        handles.Reset3.String = 'Restaurar';
        handles.CalcS3.String = 'Calcular usando:';
        handles.Calculate3.String = 'Calcular';
        
        handles.PopX.String{1} = 'Eixo X';
        handles.PopY.String{1} = 'Eixo Y';
        handles.PanelMet.Title = 'Métodos';
        handles.ACMCB.String = '''Accelerometer''';
        handles.ACCol.String{1} = 'Cor';
        handles.ACMar.String{1} = 'Marcador';
        handles.ACEB.String = 'Barra de erro';
        handles.SGMCB.String = '''Stabilized-glide''';
        handles.SGCol.String{1} = 'Cor';
        handles.SGMar.String{1} = 'Marcador';
        handles.SGEB.String = 'Barra de erro';
        handles.RSMCB.String = '''Rate-of-sink''';
        handles.RSCol.String{1} = 'Cor';
        handles.RSMar.String{1} = 'Marcador';
        handles.RSEB.String = 'Barra de erro';
        handles.Plot.String = 'Plotar';
        handles.Import.String = 'Importar';
        handles.Export.String = 'Exportar';
        handles.Legend.String = 'Legenda';

        handles.PopResult.String{1} = 'Selecionar método';
        handles.WriteData.String = 'Escrever dados';
        
        handles.zoomin.TooltipString = 'Ampliar';
        handles.pan.TooltipString = 'Mover';
        handles.datacursor.TooltipString = 'Cursor de dados';
        handles.ResultMenu.TooltipString = 'Resultados';
        handles.PlotMenu.TooltipString = 'Gráfico';
        handles.ACMenu.TooltipString = 'Método ''Accelerometer''';
        handles.SGMenu.TooltipString = 'Método ''Stabilized-glide''';
        handles.RSMenu.TooltipString = 'Método ''Rate-of-sink''';
    else                                                                    % Inglês
        handles.DragP.Name = 'Drag polar';
        handles.Title.String = 'DRAG POLAR';
        
        handles.ImpData1.String = 'Import';
        handles.NewRow1.String = 'New row';
        handles.DelRow1.String = 'Delete row';
        handles.Reset1.String = 'Reset';
        handles.Calculate1.String = 'Calculate';
        
        handles.PanelSGM.Title = 'Stabilized-glide method';
        handles.ImpData2.String = 'Import';
        handles.NewRow2.String = 'New row';
        handles.DelRow2.String = 'Delete row';
        handles.Reset2.String = 'Reset';
        handles.Calculate2.String = 'Calculate';
        handles.CalcS2.String = 'Calculate using:';
        
        handles.PanelRSM.Title = 'Rate-of-sink method';
        handles.ImpData3.String = 'Import';
        handles.NewRow3.String = 'New row';
        handles.DelRow3.String = 'Delete row';
        handles.Reset3.String = 'Reset';
        handles.CalcS3.String = 'Calculate using:';
        handles.Calculate3.String = 'Calculate';
        
        handles.PopX.String{1} = 'X Axis';
        handles.PopY.String{1} = 'Y Axis';
        handles.PanelMet.Title = 'Methods';
        handles.ACMCB.String = 'Accelerometer';
        handles.ACCol.String{1} = 'Color';
        handles.ACMar.String{1} = 'Marker';
        handles.ACEB.String = 'Error bar';
        handles.SGMCB.String = 'Stabilized-glide';
        handles.SGCol.String{1} = 'Color';
        handles.SGMar.String{1} = 'Marker';
        handles.SGEB.String = 'Error bar';
        handles.RSMCB.String = 'Rate-of-sink';
        handles.RSCol.String{1} = 'Color';
        handles.RSMar.String{1} = 'Marker';
        handles.RSEB.String = 'Error bar';
        handles.Plot.String = 'Plot';
        handles.Import.String = 'Import';
        handles.Export.String = 'Export';
        handles.Legend.String = 'Legend';
        
        handles.PopResult.String{1} = 'Select method';
        handles.WriteData.String = 'Write data';
        
        handles.zoomin.TooltipString = 'Zoom In';
        handles.pan.TooltipString = 'Pan';
        handles.datacursor.TooltipString = 'Data Cursor';
        handles.ResultMenu.TooltipString = 'Results';
        handles.PlotMenu.TooltipString = 'Graph';
        handles.ACMenu.TooltipString = 'Accelerometer method';
        handles.SGMenu.TooltipString = 'Stabilized-glide method';
        handles.RSMenu.TooltipString = 'Rate-of-sink method';
    end
end

axes(handles.Grafico);                                                      % Seleciona o gráfico para mudar suas características
xlabel(handles.PopX.String{1});                                                           % Da nome aos títulos dos eixos
ylabel(handles.PopY.String{1});

% --- Outputs from this function are returned to the command line.
function varargout = AppDragPolar_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes when selected cell(s) is changed in Table1.
function Table1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to Table1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hObject.UserData = eventdata.Indices;                                       % Recebe dados selecionados pelo usuário na tabela de dados

% --- Executes on selection change in PopW.
function PopW_Callback(hObject, eventdata, handles)
% hObject    handle to PopW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopW contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopW
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D = Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,hObject.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopW_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Popq.
function Popq_Callback(hObject, eventdata, handles)
% hObject    handle to Popq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Popq contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popq
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D= Tab.Data(:,hObject.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function Popq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopAlpha.
function PopAlpha_Callback(hObject, eventdata, handles)
% hObject    handle to PopAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopAlpha contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopAlpha
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,hObject.Value);
    D= Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopAlpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Popal.
function Popal_Callback(hObject, eventdata, handles)
% hObject    handle to Popal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Popal contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popal
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,hObject.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D= Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function Popal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Popan.
function Popan_Callback(hObject, eventdata, handles)
% hObject    handle to Popan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Popan contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popan
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,hObject.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D= Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                             % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function Popan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ImpData1.
function ImpData1_Callback(hObject, eventdata, handles)
% hObject    handle to ImpData1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if hObject.Value
    h = findobj('Tag','ICxsPrincipal');                                     % Recebe os handles da interface principal
    if ~isempty(h)                                                          % Se o ICXS estiver aberto...
        ICXSData = guidata(h);                                              % Aloca os handles da interface principal
       
        t = getappdata(ICXSData.ICxs_Defaut,'T');                           % Recebe dados do ICXS
        Tab = getappdata(ICXSData.ICxs_Defaut,'TAB');                       % Recebe dados do ICXS
        
        delta = char(948);                                                  % String com delta minúsculo
        alpha = char(945);                                                  % String com alpha minúsculo
        
        handles.Popan.String = [Tab(t(1)).Var;'an'];                        % Escreve nos pop up menus o nome das variáveis q podem ser escolhidas
        handles.Popal.String = [Tab(t(1)).Var;'al'];
        handles.PopAlpha.String = [Tab(t(1)).Var;alpha];
        handles.Popq.String = [Tab(t(1)).Var;'q'];
        handles.PopW.String = [Tab(t(1)).Var;'W'];
        handles.PopF.String = [Tab(t(1)).Var;'F'];
        
        handles.PopIan.String = [Tab(t(1)).Var;strcat(delta,'an')];         % Escreve nos pop up menus o nome das variáveis q podem ser escolhidas
        handles.PopIal.String = [Tab(t(1)).Var;strcat(delta,'al')];
        handles.PopIAlpha.String = [Tab(t(1)).Var;strcat(delta,alpha)];
        handles.PopIq.String = [Tab(t(1)).Var;strcat(delta,'q')];
        handles.PopIW.String = [Tab(t(1)).Var;strcat(delta,'W')];
        handles.PopIF.String = [Tab(t(1)).Var;strcat(delta,'F')];
        
        Pos = size(handles.Popan.String);
        handles.Popan.Value = Pos(1);                                       % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
        handles.Popal.Value = Pos(1);
        handles.PopAlpha.Value = Pos(1);
        handles.Popq.Value = Pos(1);
        handles.PopW.Value = Pos(1);
        handles.PopF.Value = Pos(1);
        handles.PopIan.Value = Pos(1);
        handles.PopIal.Value = Pos(1);
        handles.PopIAlpha.Value = Pos(1);
        handles.PopIq.Value = Pos(1);
        handles.PopIW.Value = Pos(1);
        handles.PopIF.Value = Pos(1);
        
        Tab(t(1)).Data=[Tab(t(1)).Data zeros(length(Tab(t(1)).Data(:,1)),1)];% Salva em Tab.Data os dados das variáveis do ICXS e uma última coluna de zeros para o default
        
        setappdata(handles.ImpData1,'TAB',Tab(t(1)));
        handles.Table1.Data = [0,0,0,0,0,0];                                % Dados da tabela com erros são trocados por valores nulos
        handles.Table1I.Data = [0,0,0,0,0,0];                               % Dados da tabela com erros são trocados por valores nulos
    end
end

% --- Executes on button press in NewRow1.
function NewRow1_Callback(hObject, eventdata, handles)
% hObject    handle to NewRow1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Table1.Data = [handles.Table1.Data;0,0,0,0,0,0];                    % Adiciona nova linha ao fim da tabela de dados
handles.Table1I.Data = [handles.Table1I.Data;0,0,0,0,0,0];                  % Adiciona nova linha ao fim da tabela de dados

% --- Executes on button press in DelRow1.
function DelRow1_Callback(hObject, eventdata, handles)
% hObject    handle to DelRow1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rows = (1:length(handles.Table1.Data(:,1)));                                % Linhas selecionadas pelo usuário
Delete = unique([handles.Table1.UserData(:,1),handles.Table1I.UserData(:,1)]);                               % Linhas selecionadas pelo usuário (este vetor contém apenas uma vez cada linha)
Keep = setdiff(Rows,Delete);                                                % Linhas que não serão deletadas
handles.Table1.Data = handles.Table1.Data(Keep,:);                          % Deleta linhas da tabela
handles.Table1I.Data = handles.Table1I.Data(Keep,:);                        % Deleta linhas da tabela

% --- Executes on button press in Reset1.
function Reset1_Callback(hObject, eventdata, handles)
% hObject    handle to Reset1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Table1.Data = [0,0,0,0,0,0];                                        % Dados da tabela com erros são trocados por valores nulos
handles.Table1I.Data = [0,0,0,0,0,0];                                       % Dados da tabela com erros são trocados por valores nulos

Pos = size(handles.Popan.String);
handles.Popan.Value = Pos(1);                                               % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
handles.Popal.Value = Pos(1);
handles.PopAlpha.Value = Pos(1);
handles.Popq.Value = Pos(1);
handles.PopW.Value = Pos(1);
handles.PopF.Value = Pos(1);
handles.PopIan.Value = Pos(1);
handles.PopIal.Value = Pos(1);
handles.PopIAlpha.Value = Pos(1);
handles.PopIq.Value = Pos(1);
handles.PopIW.Value = Pos(1);
handles.PopIF.Value = Pos(1);

% --- Executes on button press in Calculate1.
function Calculate1_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%an = 1.017; al = -0.19; alpha = 0.16; S = 12.91; W = 567; q = 1089.7

g = 9.78;
	Ig = 0;
S = str2double(handles.S1.String);
	IS = str2double(handles.IS1.String);
    
T = handles.Table1.Data;                                                    % Dados da tabela 1
IT = handles.Table1I.Data;                                                  % Dados da tabela 1I

an = T(:,1);
	Ian = IT(:,1);
al = T(:,2);
	Ial = IT(:,2);
alpha = T(:,3);
	Ialpha = IT(:,3);
q = T(:,4);
	Iq = IT(:,4);
W = T(:,5).*g;                                                              % Tabela estará em kg
	IW = IT(:,5).*g;
F = T(:,6);
	IF = IT(:,6);
    
%% Accelerometer Method
% Esse método possibilita conseguir um grande número de dados em um único
% voo. É possível conseguir toda a polar em apenas uma manobra com atuação
% do profundor.
L = W.*an.*cos(alpha) - (F-W.*al).*sin(alpha);
	ILW = (an.*cos(alpha) + al.*sin(alpha)) .* IW;
	ILan = (W.*cos(alpha)) .* Ian;
	ILal = (W.*sin(alpha)) .* Ial;
	ILalpha = -(F.*cos(alpha) - al.*W.*cos(alpha) + an.*W.*sin(alpha)) .* Ialpha;
	ILF = -sin(alpha) .* IF;
	IL = sqrt(ILW.^2+ILan.^2+ILal.^2+ILalpha.^2+ILF.^2);
	
	
D = (F-W.*al).*cos(alpha) + W.*an.*sin(alpha);
	IDW = (-(al.* cos(alpha)) + an.* sin(alpha)) .* IW;
	IDan = W.* sin(alpha) .* Ian;
	IDal = -(W.* cos(alpha)) .* Ial;
	IDalpha = (an.*W.* cos(alpha) + (-F + al.*W).* sin(alpha)) .* Ialpha;
	IDF = cos(alpha) .* IF;
	ID = sqrt(IDW.^2+IDan.^2+IDal.^2+IDalpha.^2+IDF.^2);
    
LD = L/D;
    ILDalpha = -((F.^2 - 2.*al.*F.*W + (al.^2 + an.^2).*W.^2)./((F - al.*W).*cos(alpha) + an.*W.*sin(alpha)).^2) .* Ialpha;
    ILDW = (an.*F)./((F - al.*W).*cos(alpha) + an.*W.*sin(alpha)).^2 .* IW;
    ILDan = (W.*(F - al.*W))./((F - al.*W).*cos(alpha) + an.*W.*sin(alpha)).^2 .* Ian;
    ILDal = (an.*W.^2)./((F - al.*W).*cos(alpha) + an.*W.*sin(alpha)).^2 .* Ial;
    ILDF = -((an.*W)./((F - al.*W).*cos(alpha) + an.*W.*sin(alpha)).^2) .* IF;
    ILD = sqrt(ILDW.^2+ILDan.^2+ILDal.^2+ILDalpha.^2+ILDF.^2);
    
CL = L./(q.*S);
	ICLL = 1./(q.*S) .* IL;
	ICLq = -L./(q.^2.*S) .* Iq;
	ICLS = -L./(q.*S.^2) .* IS;
	ICL = sqrt(ICLL.^2+ICLq.^2+ICLS.^2);
	
CD = D./(q.*S);
	ICDD = 1./(q.*S) .* ID;
	ICDq = -D./(q.^2.*S) .* Iq;
	ICDS = -D./(q.*S.^2) .* IS;
	ICD = sqrt(ICDD.^2+ICDq.^2+ICDS.^2);

Result.L = L;
Result.D = D;
Result.CL = CL;
Result.CD = CD;
Result.LD = LD;
Result.alpha = rad2deg(alpha);

Result.IL = IL;
Result.ID = ID;
Result.ICL = ICL;
Result.ICD = ICD;
Result.ILD = ILD;
Result.Ialpha = rad2deg(Ialpha);
    
setappdata(handles.Calculate1,'RESULT',Result);

% --- Executes on selection change in PopIW.
function PopIW_Callback(hObject, eventdata, handles)
% hObject    handle to PopIW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIW contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIW
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D= Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,hObject.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIW_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIq.
function PopIq_Callback(hObject, eventdata, handles)
% hObject    handle to PopIq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIq contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIq
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D= Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,hObject.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIAlpha.
function PopIAlpha_Callback(hObject, eventdata, handles)
% hObject    handle to PopIAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIAlpha contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIAlpha
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D= Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,hObject.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIAlpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIal.
function PopIal_Callback(hObject, eventdata, handles)
% hObject    handle to PopIal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIal contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIal
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D= Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,hObject.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIan.
function PopIan_Callback(hObject, eventdata, handles)
% hObject    handle to PopIan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIan contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIan
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D= Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,hObject.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IS1_Callback(hObject, eventdata, handles)
% hObject    handle to IS1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IS1 as text
%        str2double(get(hObject,'String')) returns contents of IS1 as a double

% --- Executes during object creation, after setting all properties.
function IS1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IS1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function S1_Callback(hObject, eventdata, handles)
% hObject    handle to S1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of S1 as text
%        str2double(get(hObject,'String')) returns contents of S1 as a double

% --- Executes during object creation, after setting all properties.
function S1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopW2.
function PopW2_Callback(hObject, eventdata, handles)
% hObject    handle to PopW2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopW2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopW2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopAlpha2.Value);
    B = Tab.Data(:,handles.PopTheta2.Value);
    C = Tab.Data(:,handles.Popal2.Value);
    D= Tab.Data(:,handles.Popq2.Value);
    E = Tab.Data(:,hObject.Value);
    
    IA = Tab.Data(:,handles.PopIAlpha2.Value);
    IB = Tab.Data(:,handles.PopITheta2.Value);
    IC = Tab.Data(:,handles.PopIal2.Value);
    ID= Tab.Data(:,handles.PopIq2.Value);
    IE = Tab.Data(:,handles.PopIW2.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopW2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopW2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Popq2.
function Popq2_Callback(hObject, eventdata, handles)
% hObject    handle to Popq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Popq2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popq2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopAlpha2.Value);
    B = Tab.Data(:,handles.PopTheta2.Value);
    C = Tab.Data(:,handles.Popal2.Value);
    D= Tab.Data(:,hObject.Value);
    E = Tab.Data(:,handles.PopW2.Value);
    
    IA = Tab.Data(:,handles.PopIAlpha2.Value);
    IB = Tab.Data(:,handles.PopITheta2.Value);
    IC = Tab.Data(:,handles.PopIal2.Value);
    ID= Tab.Data(:,handles.PopIq2.Value);
    IE = Tab.Data(:,handles.PopIW2.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function Popq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Popal2.
function Popal2_Callback(hObject, eventdata, handles)
% hObject    handle to Popal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Popal2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popal2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopAlpha2.Value);
    B = Tab.Data(:,handles.PopTheta2.Value);
    C = Tab.Data(:,hObject.Value);
    D= Tab.Data(:,handles.Popq2.Value);
    E = Tab.Data(:,handles.PopW2.Value);
    
    IA = Tab.Data(:,handles.PopIAlpha2.Value);
    IB = Tab.Data(:,handles.PopITheta2.Value);
    IC = Tab.Data(:,handles.PopIal2.Value);
    ID= Tab.Data(:,handles.PopIq2.Value);
    IE = Tab.Data(:,handles.PopIW2.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function Popal2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopTheta2.
function PopTheta2_Callback(hObject, eventdata, handles)
% hObject    handle to PopTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopTheta2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopTheta2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopAlpha2.Value);
    B = Tab.Data(:,hObject.Value);
    C = Tab.Data(:,handles.Popal2.Value);
    D= Tab.Data(:,handles.Popq2.Value);
    E = Tab.Data(:,handles.PopW2.Value);
    
    IA = Tab.Data(:,handles.PopIAlpha2.Value);
    IB = Tab.Data(:,handles.PopITheta2.Value);
    IC = Tab.Data(:,handles.PopIal2.Value);
    ID= Tab.Data(:,handles.PopIq2.Value);
    IE = Tab.Data(:,handles.PopIW2.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopTheta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopAlpha2.
function PopAlpha2_Callback(hObject, eventdata, handles)
% hObject    handle to PopAlpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopAlpha2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopAlpha2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,hObject.Value);
    B = Tab.Data(:,handles.PopTheta2.Value);
    C = Tab.Data(:,handles.Popal2.Value);
    D= Tab.Data(:,handles.Popq2.Value);
    E = Tab.Data(:,handles.PopW2.Value);
    
    IA = Tab.Data(:,handles.PopIAlpha2.Value);
    IB = Tab.Data(:,handles.PopITheta2.Value);
    IC = Tab.Data(:,handles.PopIal2.Value);
    ID= Tab.Data(:,handles.PopIq2.Value);
    IE = Tab.Data(:,handles.PopIW2.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopAlpha2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopAlpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ImpData2.
function ImpData2_Callback(hObject, eventdata, handles)
% hObject    handle to ImpData2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if hObject.Value
    h = findobj('Tag','ICxsPrincipal');                                     % Recebe os handles da interface principal
    if ~isempty(h)                                                          % Se o ICXS estiver aberto...
        ICXSData = guidata(h);                                              % Aloca os handles da interface principal
       
        t = getappdata(ICXSData.ICxs_Defaut,'T');                           % Recebe dados do ICXS
        Tab = getappdata(ICXSData.ICxs_Defaut,'TAB');                       % Recebe dados do ICXS
        
        delta = char(948);                                                  % String com delta minúsculo
        alpha = char(945);                                                  % String com alpha minúsculo
        theta = char(952);                                                  % String com theta minúsculo
        
        handles.PopAlpha2.String = [Tab(t(1)).Var;alpha];                   % Escreve nos pop up menus o nome das variáveis q podem ser escolhidas
        handles.PopTheta2.String = [Tab(t(1)).Var;theta];
        handles.Popal2.String = [Tab(t(1)).Var;'al'];
        handles.Popq2.String = [Tab(t(1)).Var;'q'];
        handles.PopW2.String = [Tab(t(1)).Var;'W'];
        
        handles.PopIAlpha2.String = [Tab(t(1)).Var;strcat(delta,alpha)];    % Escreve nos pop up menus o nome das variáveis q podem ser escolhidas
        handles.PopITheta2.String = [Tab(t(1)).Var;strcat(delta,theta)];
        handles.PopIal2.String = [Tab(t(1)).Var;strcat(delta,'al')];
        handles.PopIq2.String = [Tab(t(1)).Var;strcat(delta,'q')];
        handles.PopIW2.String = [Tab(t(1)).Var;strcat(delta,'W')];
        
        Pos = size(handles.PopAlpha2.String);
        handles.PopAlpha2.Value = Pos(1);         % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
        handles.PopTheta2.Value = Pos(1);
        handles.Popal2.Value = Pos(1);
        handles.Popq2.Value = Pos(1);
        handles.PopW2.Value = Pos(1);
        handles.PopIAlpha2.Value = Pos(1);
        handles.PopITheta2.Value = Pos(1);
        handles.PopIal2.Value = Pos(1);
        handles.PopIq2.Value = Pos(1);
        handles.PopIW2.Value = Pos(1);
        
        Tab(t(1)).Data=[Tab(t(1)).Data zeros(length(Tab(t(1)).Data(:,1)),1)];% Salva em Tab.Data os dados das variáveis do ICXS e uma última coluna de zeros para o default
        
        setappdata(handles.ImpData2,'TAB',Tab(t(1)));
        handles.Table2.Data = [0,0,0,0,0];                                  % Dados da tabela com erros são trocados por valores nulos
        handles.Table2I.Data = [0,0,0,0,0];                                 % Dados da tabela com erros são trocados por valores nulos
    end
end

% --- Executes on button press in NewRow2.
function NewRow2_Callback(hObject, eventdata, handles)
% hObject    handle to NewRow2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Table2.Data = [handles.Table2.Data;0,0,0,0,0];                    % Adiciona nova linha ao fim da tabela de dados
handles.Table2I.Data = [handles.Table2I.Data;0,0,0,0,0];                  % Adiciona nova linha ao fim da tabela de dados

% --- Executes on button press in DelRow2.
function DelRow2_Callback(hObject, eventdata, handles)
% hObject    handle to DelRow2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rows = (1:length(handles.Table2.Data(:,1)));                                 % Linhas selecionadas pelo usuário
Delete = unique([handles.Table2.UserData(:,1),handles.Table2I.UserData(:,1)]);                               % Linhas selecionadas pelo usuário (este vetor contém apenas uma vez cada linha)
Keep = setdiff(Rows,Delete);                                                % Linhas que não serão deletadas
handles.Table2.Data = handles.Table2.Data(Keep,:);                            % Deleta linhas da tabela
handles.Table2I.Data = handles.Table2I.Data(Keep,:);                            % Deleta linhas da tabela

% --- Executes on button press in Reset2.
function Reset2_Callback(hObject, eventdata, handles)
% hObject    handle to Reset2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Table2.Data = [0,0,0,0,0];                                          % Dados da tabela com erros são trocados por valores nulos
handles.Table2I.Data = [0,0,0,0,0];                                         % Dados da tabela com erros são trocados por valores nulos

Pos = size(handles.PopAlpha2.String);
handles.PopAlpha2.Value = Pos(1);                                           % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
handles.PopTheta2.Value = Pos(1);
handles.Popal2.Value = Pos(1);
handles.Popq2.Value = Pos(1);
handles.PopW2.Value = Pos(1);
handles.PopIAlpha2.Value = Pos(1);
handles.PopITheta2.Value = Pos(1);
handles.PopIal2.Value = Pos(1);
handles.PopIq2.Value = Pos(1);
handles.PopIW2.Value = Pos(1);

% --- Executes on button press in Calculate2.
function Calculate2_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g = 9.78;
	Ig = 0;
S = str2double(handles.S2.String);
	IS = str2double(handles.IS2.String);

T = handles.Table2.Data;                                                    % Dados da tabela 2
IT = handles.Table2I.Data;                                                  % Dados da tabela 2I

alpha = T(:,1);
	Ialpha = IT(:,1);
if handles.PopThetaAL.Value == 1
    theta = T(:,2);
        Itheta = IT(:,2);
else
    al = T(:,3);
	Ial = IT(:,3);
    theta = asin(al);
	Itheta = 1./sqrt(1-theta.^2).* Ial;
end
q = T(:,4);
	Iq = IT(:,4);
W = T(:,5).*g;                                                              % Tabela estará em kg
	IW = IT(:,5).*g;
    
   
  
%% Stabilized-glide Method
% Esse método considera a velocidade "Vi" constante. É o método mais
% simples e direto para conseguir a polar de arrasto, mas é também o mais
% difícil de aplicar por causa dos requisitos para conseguir um voo com
% alta estabilidade em diferentes ângulos de ataque.
gama = theta-alpha;
	Igama = sqrt(Itheta.^2 + Ialpha.^2);
	
L = W.*cos(gama);
	ILW = cos(gama) .* IW;
	ILgama = -W.*sin(gama) .* Igama;
	IL = sqrt(ILW.^2+ILgama.^2);
	
D = -W.*sin(gama);
	IDW = -sin(gama) .* IW;
	IDgama = -W.*cos(gama) .* Igama;
	ID = sqrt(IDW.^2+IDgama.^2);
	
CL = L./(q.*S);
	ICLL = 1./(q.*S) .* IL;
	ICLq = -L./(q.^2.*S) .* Iq;
	ICLS = -L./(q.*S.^2) .* IS;
	ICL = sqrt(ICLL.^2+ICLq.^2+ICLS.^2);
	
CD = D./(q.*S);
	ICDD = 1./(q.*S) .* ID;
	ICDq = -D./(q.^2.*S) .* Iq;
	ICDS = -D./(q.*S.^2) .* IS;
	ICD = sqrt(ICDD.^2+ICDq.^2+ICDS.^2);

LD = -cot(gama);
	ILD = csc(gama).^2 .* Igama;

%%
Result.L = L;
Result.D = D;
Result.CL = CL;
Result.CD = CD;
Result.LD = LD;
Result.alpha = rad2deg(alpha);

Result.IL = IL;
Result.ID = ID;
Result.ICL = ICL;
Result.ICD = ICD;
Result.ILD = ILD;
Result.Ialpha = rad2deg(Ialpha);
    
setappdata(handles.Calculate2,'RESULT',Result);
% --- Executes on selection change in PopIW2.
function PopIW2_Callback(hObject, eventdata, handles)
% hObject    handle to PopIW2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIW2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIW2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopAlpha2.Value);
    B = Tab.Data(:,handles.PopTheta2.Value);
    C = Tab.Data(:,handles.Popal2.Value);
    D= Tab.Data(:,handles.Popq2.Value);
    E = Tab.Data(:,handles.PopW2.Value);
    
    IA = Tab.Data(:,handles.PopIAlpha2.Value);
    IB = Tab.Data(:,handles.PopITheta2.Value);
    IC = Tab.Data(:,handles.PopIal2.Value);
    ID= Tab.Data(:,handles.PopIq2.Value);
    IE = Tab.Data(:,hObject.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIW2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIW2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIq2.
function PopIq2_Callback(hObject, eventdata, handles)
% hObject    handle to PopIq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIq2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIq2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopAlpha2.Value);
    B = Tab.Data(:,handles.PopTheta2.Value);
    C = Tab.Data(:,handles.Popal2.Value);
    D= Tab.Data(:,handles.Popq2.Value);
    E = Tab.Data(:,handles.PopW2.Value);
    
    IA = Tab.Data(:,handles.PopIAlpha2.Value);
    IB = Tab.Data(:,handles.PopITheta2.Value);
    IC = Tab.Data(:,handles.PopIal2.Value);
    ID= Tab.Data(:,hObject.Value);
    IE = Tab.Data(:,handles.PopIW2.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIal2.
function PopIal2_Callback(hObject, eventdata, handles)
% hObject    handle to PopIal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIal2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIal2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopAlpha2.Value);
    B = Tab.Data(:,handles.PopTheta2.Value);
    C = Tab.Data(:,handles.Popal2.Value);
    D= Tab.Data(:,handles.Popq2.Value);
    E = Tab.Data(:,handles.PopW2.Value);
    
    IA = Tab.Data(:,handles.PopIAlpha2.Value);
    IB = Tab.Data(:,handles.PopITheta2.Value);
    IC = Tab.Data(:,hObject.Value);
    ID= Tab.Data(:,handles.PopIq2.Value);
    IE = Tab.Data(:,handles.PopIW2.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIal2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopITheta2.
function PopITheta2_Callback(hObject, eventdata, handles)
% hObject    handle to PopITheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopITheta2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopITheta2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopAlpha2.Value);
    B = Tab.Data(:,handles.PopTheta2.Value);
    C = Tab.Data(:,handles.Popal2.Value);
    D= Tab.Data(:,handles.Popq2.Value);
    E = Tab.Data(:,handles.PopW2.Value);
    
    IA = Tab.Data(:,handles.PopIAlpha2.Value);
    IB = Tab.Data(:,hObject.Value);
    IC = Tab.Data(:,handles.PopIal2.Value);
    ID= Tab.Data(:,handles.PopIq2.Value);
    IE = Tab.Data(:,handles.PopIW2.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopITheta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopITheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIAlpha2.
function PopIAlpha2_Callback(hObject, eventdata, handles)
% hObject    handle to PopIAlpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIAlpha2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIAlpha2
Tab = getappdata(handles.ImpData2,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopAlpha2.Value);
    B = Tab.Data(:,handles.PopTheta2.Value);
    C = Tab.Data(:,handles.Popal2.Value);
    D= Tab.Data(:,handles.Popq2.Value);
    E = Tab.Data(:,handles.PopW2.Value);
    
    IA = Tab.Data(:,hObject.Value);
    IB = Tab.Data(:,handles.PopITheta2.Value);
    IC = Tab.Data(:,handles.PopIal2.Value);
    ID= Tab.Data(:,handles.PopIq2.Value);
    IE = Tab.Data(:,handles.PopIW2.Value);
    
    handles.Table2.Data = [A B C D E];                                          % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table2I.Data = [IA IB IC ID IE];                                    % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIAlpha2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIAlpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IS2_Callback(hObject, eventdata, handles)
% hObject    handle to IS2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IS2 as text
%        str2double(get(hObject,'String')) returns contents of IS2 as a double

% --- Executes during object creation, after setting all properties.
function IS2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IS2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function S2_Callback(hObject, eventdata, handles)
% hObject    handle to S2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of S2 as text
%        str2double(get(hObject,'String')) returns contents of S2 as a double

% --- Executes during object creation, after setting all properties.
function S2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when selected cell(s) is changed in Table1I.
function Table1I_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to Table1I (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hObject.UserData = eventdata.Indices;                                       % Recebe dados selecionados pelo usuário na tabela de dados


% --- Executes when selected cell(s) is changed in Table2.
function Table2_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to Table2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hObject.UserData = eventdata.Indices;                                       % Recebe dados selecionados pelo usuário na tabela de dados

% --- Executes when selected cell(s) is changed in Table2I.
function Table2I_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to Table2I (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hObject.UserData = eventdata.Indices;                                       % Recebe dados selecionados pelo usuário na tabela de dados

% --- Executes on selection change in PopX.
function PopX_Callback(hObject, eventdata, handles)
% hObject    handle to PopX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopX contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopX
axes(handles.Grafico);                                                      % Seleciona o gráfico para mudar suas características
xlabel(hObject.String{hObject.Value});                                      % Da nome aos títulos dos eixos

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

% --- Executes on selection change in PopY.
function PopY_Callback(hObject, eventdata, handles)
% hObject    handle to PopY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopY contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopY
axes(handles.Grafico);                                                      % Seleciona o gráfico para mudar suas características
ylabel(hObject.String{hObject.Value});                                      % Da nome aos títulos dos eixos

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

% --- Executes on button press in Plot.
function Plot_Callback(hObject, eventdata, handles)
% hObject    handle to Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

PX = handles.PopX.Value;                                                    % Armazena posição de X selecionada pelo usuário
PY = handles.PopY.Value;                                                    % Armazena posição de Y selecionada pelo usuário

i = 1;                                                                      % Auxiliar para legenda

if PX ~= 1 && PY ~= 1 &&...                                                 % Só será plotado se o usuário escolheu X e Y diferentes do default e...
        (handles.ACMCB.Value || handles.SGMCB.Value || handles.RSMCB.Value) %... pelo menos um método
    
    axes(handles.Grafico);                                                  % Seleciona gráfico para modificações
    %%
    if handles.ACMCB.Value                                                  % Caso esteja selecionado para plotar o método do acelerômetro
        Leg{i} = handles.PanelAM.Title;                                     % Guarda as strings das legendas
        i = i + 1;                                                          % Modifica o auxiliar da legenda
        Result1 = getappdata(handles.Calculate1,'RESULT');                  % Recebe os dados dos resultados do método em questão
        switch PX                                                           % Para cada posição escolhida para X, seleciona-se um X diferente
            case 2
                X1 = Result1.LD;
                IX1 = Result1.ILD;
            case 3
                X1 = Result1.CL;
                IX1 = Result1.ICL;
            case 4
                X1 = Result1.CL.*Result1.CL;
                IX1 = Result1.ICL.*Result1.ICL;
            case 5
                X1 = Result1.CD;
                IX1 = Result1.ICD;
            case 6
                X1 = Result1.alpha;
                IX1 = Result1.Ialpha;
            case 7
                X1 = Result1.L;
                IX1 = Result1.IL;
            case 8
                X1 = Result1.D;
                IX1 = Result1.ID;
        end
        switch PY                                                           % Para cada posição escolhida para Y, seleciona-se um Y diferente
            case 2
                Y1 = Result1.LD;
                IY1 = Result1.ILD;
            case 3
                Y1 = Result1.CL;
                IY1 = Result1.ICL;
            case 4
                Y1 = Result1.CL.*Result1.CL;
                IY1 = Result1.ICL.*Result1.ICL;
            case 5
                Y1 = Result1.CD;
                IY1 = Result1.ICD;
            case 6
                Y1 = Result1.alpha;
                IY1 = Result1.Ialpha;
            case 7
                Y1 = Result1.L;
                IY1 = Result1.IL;
            case 8
                Y1 = Result1.D;
                IY1 = Result1.ID;
        end
        if handles.ACEB.Value                                               % Confere se o usuário quer plotar os erros
            P1 = errorbar(X1,Y1,IY1,IY1,IX1,IX1);	                        % Plota barras de erro referentes ao
            P1.LineWidth = 1;                                               % Espessura da barra
            P1.LineStyle = 'none';                                          % Não há linha ligando os pontos plotados
            if handles.ACMar.Value ~= 1
                P1.Marker = handles.ACMar.String{handles.ACMar.Value};      % Formato do ponto central do erro
            end
            if handles.ACCol.Value ~= 1
                P1.Color = handles.ACCol.String{handles.ACCol.Value};       % Cor das barras
            end
        else
            P1 = plot(X1,Y1);                                               % Plota os dados sem barras de erro
            P1.LineStyle = 'none';                                          % Não há linha ligando os pontos plotados
            if handles.ACMar.Value ~= 1
                P1.Marker = handles.ACMar.String{handles.ACMar.Value};      % Formato do ponto plotado
            end
            if handles.ACCol.Value ~= 1
                P1.Color = handles.ACCol.String{handles.ACCol.Value};       % Cor dos pontos
            end
        end  
        hold on                                                             % Segura o gráfico para plotar outras coisas depois
    end
    %%
    if handles.SGMCB.Value                                                  % Caso esteja selecionado para plotar o método do planeio estabilizado
        Leg{i} = handles.PanelSGM.Title;                                 % Guarda as strings das legendas
        i = i + 1;                                                          % Modifica o auxiliar da legenda
        Result2 = getappdata(handles.Calculate2,'RESULT');                  % Recebe os dados dos resultados do método em questão
        switch PX                                                           % Para cada posição escolhida para X, seleciona-se um X diferente
            case 2
                X2 = Result2.LD;
                IX2 = Result2.ILD;
            case 3
                X2 = Result2.CL;
                IX2 = Result2.ICL;
            case 4
                X2 = Result2.CL.*Result2.CL;
                IX2 = Result2.ICL.*Result2.ICL;
            case 5
                X2 = Result2.CD;
                IX2 = Result2.ICD;
            case 6
                X2 = Result2.alpha;
                IX2 = Result2.Ialpha;
            case 7
                X2 = Result2.L;
                IX2 = Result2.IL;
            case 8
                X2 = Result2.D;
                IX2 = Result2.ID;
        end
        switch PY                                                           % Para cada posição escolhida para Y, seleciona-se um Y diferente
            case 2
                Y2 = Result2.LD;
                IY2 = Result2.ILD;
            case 3
                Y2 = Result2.CL;
                IY2 = Result2.ICL;
            case 4
                Y2 = Result2.CL.*Result2.CL;
                IY2 = Result2.ICL.*Result2.ICL;
            case 5
                Y2 = Result2.CD;
                IY2 = Result2.ICD;
            case 6
                Y2 = Result2.alpha;
                IY2 = Result2.Ialpha;
            case 7
                Y2 = Result2.L;
                IY2 = Result2.IL;
            case 8
                Y2 = Result2.D;
                IY2 = Result2.ID;
        end
        if handles.SGEB.Value                                               % Confere se o usuário quer plotar os erros
            P2 = errorbar(X2,Y2,IY2,IY2,IX2,IX2);	                        % Plota barras de erro referentes ao
            P2.LineWidth = 1;                                               % Espessura da barra
            P2.LineStyle = 'none';                                          % Não há linha ligando os pontos plotados
            if handles.SGMar.Value ~= 1
                P2.Marker = handles.SGMar.String{handles.SGMar.Value};      % Formato do ponto central do erro
            end
            if handles.SGCol.Value ~= 1
                P2.Color = handles.SGCol.String{handles.SGCol.Value};       % Cor das barras
            end
        else
            P2 = plot(X2,Y2);                                               % Plota os dados sem barras de erro
            P2.LineStyle = 'none';                                          % Não há linha ligando os pontos plotados
            if handles.SGMar.Value ~= 1
                P2.Marker = handles.SGMar.String{handles.SGMar.Value};      % Formato do ponto plotado
            end
            if handles.SGCol.Value ~= 1
                P2.Color = handles.SGCol.String{handles.SGCol.Value};       % Cor dos pontos
            end
        end  
        hold on                                                             % Segura o gráfico para plotar outras coisas depois
    end
    
    %%
    if handles.RSMCB.Value                                                  % Caso esteja selecionado para plotar o método de razão de descida
        Leg{i} = handles.PanelRSM.Title;                                    % Guarda as strings das legendas
        i = i + 1;                                                          % Modifica o auxiliar da legenda
        Result3 = getappdata(handles.Calculate3,'RESULT');                  % Recebe os dados dos resultados do método em questão
        switch PX                                                           % Para cada posição escolhida para X, seleciona-se um X diferente
            case 2
                X3 = Result3.LD;
                IX3 = Result3.ILD;
            case 3
                X3 = Result3.CL;
                IX3 = Result3.ICL;
            case 4
                X3 = Result3.CL.*Result3.CL;
                IX3 = Result3.ICL.*Result3.ICL;
            case 5
                X3 = Result3.CD;
                IX3 = Result3.ICD;
            case 6
                X3 = Result3.alpha;
                IX3 = Result3.Ialpha;
            case 7
                X3 = Result3.L;
                IX3 = Result3.IL;
            case 8
                X3 = Result3.D;
                IX3 = Result3.ID;
        end
        switch PY                                                           % Para cada posição escolhida para Y, seleciona-se um Y diferente
            case 2
                Y3 = Result3.LD;
                IY3 = Result3.ILD;
            case 3
                Y3 = Result3.CL;
                IY3 = Result3.ICL;
            case 4
                Y3 = Result3.CL.*Result3.CL;
                IY3 = Result3.ICL.*Result3.ICL;
            case 5
                Y3 = Result3.CD;
                IY3 = Result3.ICD;
            case 6
                Y3 = Result3.alpha;
                IY3 = Result3.Ialpha;
            case 7
                Y3 = Result3.L;
                IY3 = Result3.IL;
            case 8
                Y3 = Result3.D;
                IY3 = Result3.ID;
        end
        if handles.RSEB.Value                                               % Confere se o usuário quer plotar os erros
            P3 = errorbar(X3,Y3,IY3,IY3,IX3,IX3);	                        % Plota barras de erro referentes ao
            P3.LineWidth = 1;                                               % Espessura da barra
            P3.LineStyle = 'none';                                          % Não há linha ligando os pontos plotados
            if handles.RSMar.Value ~= 1
                P3.Marker = handles.RSMar.String{handles.RSMar.Value};      % Formato do ponto central do erro
            end
            if handles.RSCol.Value ~= 1
                P3.Color = handles.RSCol.String{handles.RSCol.Value};       % Cor das barras
            end
        else
            P3 = plot(X3,Y3);                                               % Plota os dados sem barras de erro
            P3.LineStyle = 'none';                                          % Não há linha ligando os pontos plotados
            if handles.RSMar.Value ~= 1
                P3.Marker = handles.RSMar.String{handles.RSMar.Value};      % Formato do ponto plotado
            end
            if handles.RSCol.Value ~= 1
                P3.Color = handles.RSCol.String{handles.RSCol.Value};       % Cor dos pontos
            end
        end  
        hold on                                                             % Segura o gráfico para plotar outras coisas depois
    end
    
    %%
    legend(Leg);                                                            % Adiciona legenda ao gráfico
    grid on                                                                 % Ativa grade no gráfico
    xlabel(handles.PopX.String(PX));                                        % Define título dos eixos do gráfico
    ylabel(handles.PopY.String(PY));
    set(gca,'fontsize',10)                                                  % Define o tamanho da fonte
    hold off
    setappdata(handles.Plot,'LEG',Leg);                                     % Armazena o conteúdo da legenda
end

% --- Executes on button press in ACMCB.
function ACMCB_Callback(hObject, eventdata, handles)
% hObject    handle to ACMCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of ACMCB

if hObject.Value
    handles.ACCol.Enable = 'on';
    handles.ACMar.Enable = 'on';
    handles.ACEB.Enable = 'on';
else
    handles.ACCol.Enable = 'off';
    handles.ACMar.Enable = 'off';
    handles.ACEB.Enable = 'off';
end

% --- Executes on button press in SGMCB.
function SGMCB_Callback(hObject, eventdata, handles)
% hObject    handle to SGMCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of SGMCB

if hObject.Value
    handles.SGCol.Enable = 'on';
    handles.SGMar.Enable = 'on';
    handles.SGEB.Enable = 'on';
else
    handles.SGCol.Enable = 'off';
    handles.SGMar.Enable = 'off';
    handles.SGEB.Enable = 'off';
end 

% --- Executes on button press in RSMCB.
function RSMCB_Callback(hObject, eventdata, handles)
% hObject    handle to RSMCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of RSMCB

if hObject.Value
    handles.RSCol.Enable = 'on';
    handles.RSMar.Enable = 'on';
    handles.RSEB.Enable = 'on';
else
    handles.RSCol.Enable = 'off';
    handles.RSMar.Enable = 'off';
    handles.RSEB.Enable = 'off';
end

% --- Executes on selection change in ACCol.
function ACCol_Callback(hObject, eventdata, handles)
% hObject    handle to ACCol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns ACCol contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ACCol

% --- Executes during object creation, after setting all properties.
function ACCol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ACCol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in ACMar.
function ACMar_Callback(hObject, eventdata, handles)
% hObject    handle to ACMar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns ACMar contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ACMar

% --- Executes during object creation, after setting all properties.
function ACMar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ACMar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ACEB.
function ACEB_Callback(hObject, eventdata, handles)
% hObject    handle to ACEB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of ACEB

% --- Executes on selection change in SGCol.
function SGCol_Callback(hObject, eventdata, handles)
% hObject    handle to SGCol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns SGCol contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SGCol

% --- Executes during object creation, after setting all properties.
function SGCol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SGCol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in SGMar.
function SGMar_Callback(hObject, eventdata, handles)
% hObject    handle to SGMar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns SGMar contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SGMar

% --- Executes during object creation, after setting all properties.
function SGMar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SGMar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in SGEB.
function SGEB_Callback(hObject, eventdata, handles)
% hObject    handle to SGEB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of SGEB

% --- Executes on selection change in RSCol.
function RSCol_Callback(hObject, eventdata, handles)
% hObject    handle to RSCol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns RSCol contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RSCol

% --- Executes during object creation, after setting all properties.
function RSCol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RSCol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in RSMar.
function RSMar_Callback(hObject, eventdata, handles)
% hObject    handle to RSMar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns RSMar contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RSMar

% --- Executes during object creation, after setting all properties.
function RSMar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RSMar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in RSEB.
function RSEB_Callback(hObject, eventdata, handles)
% hObject    handle to RSEB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of RSEB

% --- Executes on selection change in PopResult.
function PopResult_Callback(hObject, eventdata, handles)
% hObject    handle to PopResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopResult contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopResult

% --- Executes during object creation, after setting all properties.
function PopResult_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in WriteData.
function WriteData_Callback(hObject, eventdata, handles)
% hObject    handle to WriteData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch handles.PopResult.Value
    case 1
        return
    case 2
        Result = getappdata(handles.Calculate1,'RESULT');
    case 3
        Result = getappdata(handles.Calculate2,'RESULT');
    case 4
        Result = getappdata(handles.Calculate3,'RESULT');
end
T = [Result.LD,Result.CL,Result.CD,Result.L,Result.D,Result.alpha];
IT = [Result.ILD,Result.ICL,Result.ICD,Result.IL,Result.ID,Result.Ialpha];

handles.TableRes.Data = T;
handles.TableIRes.Data = IT;

% --- Executes on button press in Export.
function Export_Callback(hObject, eventdata, handles)
% hObject    handle to Export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.ACMCB.Value || handles.SGMCB.Value || handles.RSMCB.Value
    h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
    if ~isempty(h)                                                              % Se o ICXS estiver aberto...
        ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
        Ginf = getappdata(ICXSData.ICxs_Defaut,'GINF');                         % Recebe do ICXS as características do gráfico
        Dec = Ginf.Decimal;                                                     % Marcador decimal, 1: vírgula, 0: ponto
    else
        Dec = 0;                                                                % Caso o ICXS não esteja aberto, o default é o 'ponto'
    end
    
    f_ExPlot(handles.Grafico,'-',Dec);                                          % Exporta figura com o gráfico
    legend(getappdata(handles.Plot,'LEG'));                                     % Adiciona legenda à figura exportada
end
% --------------------------------------------------------------------
function ACMenu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to ACMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if length(hObject.State) == 2                                               % Essa aba está sendo ativada                                     
    hObject.State = 'on';
    
    handles.PlotMenu.State = 'off';
    handles.ResultMenu.State = 'off';
    handles.RSMenu.State = 'off';
    handles.SGMenu.State = 'off';
    
    handles.PanelPlot.Visible = 'off';
    handles.PanelResult.Visible = 'off';
    handles.PanelRSM.Visible = 'off';
    handles.PanelSGM.Visible = 'off';
    handles.PanelAM.Visible = 'on';
else
    hObject.State = 'on';                                                   % Mantém a aba clicada mesmo quando clicam nela já clicada
end

% --------------------------------------------------------------------
function SGMenu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to SGMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if length(hObject.State) == 2                                               % Essa aba está sendo ativada                                     
    hObject.State = 'on';
    
    handles.PlotMenu.State = 'off';
    handles.ResultMenu.State = 'off';
    handles.RSMenu.State = 'off';
    handles.ACMenu.State = 'off';
    
    handles.PanelPlot.Visible = 'off';
    handles.PanelResult.Visible = 'off';
    handles.PanelRSM.Visible = 'off';
    handles.PanelSGM.Visible = 'on';
    handles.PanelAM.Visible = 'off';
else
    hObject.State = 'on';                                                   % Mantém a aba clicada mesmo quando clicam nela já clicada
end

% --------------------------------------------------------------------
function RSMenu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to RSMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if length(hObject.State) == 2                                               % Essa aba está sendo ativada                                     
    hObject.State = 'on';
    
    handles.PlotMenu.State = 'off';
    handles.ResultMenu.State = 'off';
    handles.SGMenu.State = 'off';
    handles.ACMenu.State = 'off';
    
    handles.PanelPlot.Visible = 'off';
    handles.PanelResult.Visible = 'off';
    handles.PanelRSM.Visible = 'on';
    handles.PanelSGM.Visible = 'off';
    handles.PanelAM.Visible = 'off';
else
    hObject.State = 'on';                                                   % Mantém a aba clicada mesmo quando clicam nela já clicada
end


% --------------------------------------------------------------------
function PlotMenu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to PlotMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if length(hObject.State) == 2                                               % Essa aba está sendo ativada                                     
    hObject.State = 'on';
    
    handles.ResultMenu.State = 'off';
    handles.RSMenu.State = 'off';
    handles.SGMenu.State = 'off';
    handles.ACMenu.State = 'off';
    
    handles.PanelPlot.Visible = 'on';
    handles.PanelResult.Visible = 'off';
    handles.PanelRSM.Visible = 'off';
    handles.PanelSGM.Visible = 'off';
    handles.PanelAM.Visible = 'off';
else
    hObject.State = 'on';                                                   % Mantém a aba clicada mesmo quando clicam nela já clicada
end

% --------------------------------------------------------------------
function ResultMenu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to ResultMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if length(hObject.State) == 2                                               % Essa aba está sendo ativada                                     
    hObject.State = 'on';
    
    handles.PlotMenu.State = 'off';
    handles.RSMenu.State = 'off';
    handles.SGMenu.State = 'off';
    handles.ACMenu.State = 'off';
    
    handles.PanelPlot.Visible = 'off';
    handles.PanelResult.Visible = 'on';
    handles.PanelRSM.Visible = 'off';
    handles.PanelSGM.Visible = 'off';
    handles.PanelAM.Visible = 'off';
else
    hObject.State = 'on';                                                   % Mantém a aba clicada mesmo quando clicam nela já clicada
end

% --- Executes on key press with focus on DragP or any of its controls.
function DragP_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to DragP (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.Key,'escape')                                           % Ao apertar esc, o usuário fecha o painel de cálculo da desaceleração
    handles.LegendPanel.Visible = 'off';
    handles.Legend.Value = 0;
end

% --- Executes on selection change in PopV1.
function PopV1_Callback(hObject, eventdata, handles)
% hObject    handle to PopV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopV1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopV1
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,hObject.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopV1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIV1.
function PopIV1_Callback(hObject, eventdata, handles)
% hObject    handle to PopIV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIV1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIV1
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,hObject.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIV1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PopV2.
function PopV2_Callback(hObject, eventdata, handles)
% hObject    handle to PopV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopV2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopV2
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,hObject.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopV2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PopIV2.
function PopIV2_Callback(hObject, eventdata, handles)
% hObject    handle to PopIV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIV2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIV2
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,hObject.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIV2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PopdH.
function PopdH_Callback(hObject, eventdata, handles)
% hObject    handle to PopdH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopdH contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopdH
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,hObject.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopdH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopdH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Popdt.
function Popdt_Callback(hObject, eventdata, handles)
% hObject    handle to Popdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Popdt contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popdt
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,hObject.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function Popdt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PopRo.
function PopRo_Callback(hObject, eventdata, handles)
% hObject    handle to PopRo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopRo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopRo
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,hObject.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopRo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopRo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopW3.
function PopW3_Callback(hObject, eventdata, handles)
% hObject    handle to PopW3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopW3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopW3
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,hObject.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopW3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopW3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIW3.
function PopIW3_Callback(hObject, eventdata, handles)
% hObject    handle to PopIW3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIW3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIW3
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,hObject.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIW3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIW3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopAlpha3.
function PopAlpha3_Callback(hObject, eventdata, handles)
% hObject    handle to PopAlpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopAlpha3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopAlpha3
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,hObject.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopAlpha3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopAlpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ImpData3.
function ImpData3_Callback(hObject, eventdata, handles)
% hObject    handle to ImpData3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if hObject.Value
    h = findobj('Tag','ICxsPrincipal');                                     % Recebe os handles da interface principal
    if ~isempty(h)                                                          % Se o ICXS estiver aberto...
        ICXSData = guidata(h);                                              % Aloca os handles da interface principal
       
        t = getappdata(ICXSData.ICxs_Defaut,'T');                           % Recebe dados do ICXS
        Tab = getappdata(ICXSData.ICxs_Defaut,'TAB');                       % Recebe dados do ICXS
        
        Delta = char(916);                                                  % String com delta maiúsculo
        delta = char(948);                                                  % String com delta minúsculo
        alpha = char(945);                                                  % String com alpha minúsculo
        ro = char(961);                                                     % String com ro minúsculo
        
        handles.PopV1.String = [Tab(t(1)).Var;'V1'];                        % Escreve nos pop up menus o nome das variáveis q podem ser escolhidas
        handles.PopIV1.String = [Tab(t(1)).Var;strcat(delta,'V1')];
        handles.PopV2.String = [Tab(t(1)).Var;'V2'];
        handles.PopIV2.String = [Tab(t(1)).Var;strcat(delta,'V2')];
        handles.PopdH.String = [Tab(t(1)).Var;strcat(Delta,'H')];
        handles.PopIdH.String = [Tab(t(1)).Var;strcat(delta,Delta,'H')];
        
        handles.Popdt.String = [Tab(t(1)).Var;strcat(Delta,'t')];           % Escreve nos pop up menus o nome das variáveis q podem ser escolhidas
        handles.PopRo.String = [Tab(t(1)).Var;ro];
        handles.PopW3.String = [Tab(t(1)).Var;'W'];
        handles.PopIW3.String = [Tab(t(1)).Var;strcat(delta,'W')];
        handles.PopAlpha3.String = [Tab(t(1)).Var;alpha];
        handles.PopIAlpha3.String = [Tab(t(1)).Var;strcat(delta,alpha)];
        
        Pos = size(handles.PopV1.String);
        handles.PopV1.Value = Pos(1);                                       % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
        handles.PopIV1.Value = Pos(1);
        handles.PopV2.Value = Pos(1);
        handles.PopIV2.Value = Pos(1);
        handles.PopdH.Value = Pos(1);
        handles.PopIdH.Value = Pos(1);
        handles.Popdt.Value = Pos(1);
        handles.PopRo.Value = Pos(1);
        handles.PopW3.Value = Pos(1);
        handles.PopIW3.Value = Pos(1);
        handles.PopAlpha3.Value = Pos(1);
        handles.PopIAlpha3.Value = Pos(1);
        
        Tab(t(1)).Data=[Tab(t(1)).Data zeros(length(Tab(t(1)).Data(:,1)),1)];% Salva em Tab.Data os dados das variáveis do ICXS e uma última coluna de zeros para o default
        
        setappdata(handles.ImpData3,'TAB',Tab(t(1)));
        handles.Table3.Data = [0,0,0,0,0,0];                                  % Dados da tabela com erros são trocados por valores nulos
        handles.Table3I.Data = [0,0,0,0,0,0];                                 % Dados da tabela com erros são trocados por valores nulos
    end
end

% --- Executes on button press in NewRow3.
function NewRow3_Callback(hObject, eventdata, handles)
% hObject    handle to NewRow3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Table3.Data = [handles.Table3.Data;0,0,0,0,0,0];                    % Adiciona nova linha ao fim da tabela de dados
handles.Table3I.Data = [handles.Table3I.Data;0,0,0,0,0,0];                  % Adiciona nova linha ao fim da tabela de dados

% --- Executes on button press in DelRow3.
function DelRow3_Callback(hObject, eventdata, handles)
% hObject    handle to DelRow3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rows = (1:length(handles.Table3.Data(:,1)));                                 % Linhas selecionadas pelo usuário
Delete = unique([handles.Table3.UserData(:,1),handles.Table3I.UserData(:,1)]);                               % Linhas selecionadas pelo usuário (este vetor contém apenas uma vez cada linha)
Keep = setdiff(Rows,Delete);                                                % Linhas que não serão deletadas
handles.Table3.Data = handles.Table3.Data(Keep,:);                          % Deleta linhas da tabela
handles.Table3I.Data = handles.Table3I.Data(Keep,:);                        % Deleta linhas da tabela

% --- Executes on button press in Reset3.
function Reset3_Callback(hObject, eventdata, handles)
% hObject    handle to Reset3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Table3.Data = [0,0,0,0,0,0];                                        % Dados da tabela com erros são trocados por valores nulos
handles.Table3I.Data = [0,0,0,0,0,0];                                       % Dados da tabela com erros são trocados por valores nulos

Pos = size(handles.PopV1.String);
handles.PopV1.Value = Pos(1);                                               % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
handles.PopIV1.Value = Pos(1);
handles.PopV2.Value = Pos(1);
handles.PopIV2.Value = Pos(1);
handles.PopdH.Value = Pos(1);
handles.PopIdH.Value = Pos(1);
handles.Popdt.Value = Pos(1);
handles.PopRo.Value = Pos(1);
handles.PopW3.Value = Pos(1);
handles.PopIW3.Value = Pos(1);
handles.PopAlpha3.Value = Pos(1);
handles.PopIAlpha3.Value = Pos(1);

function S3_Callback(hObject, eventdata, handles)
% hObject    handle to S3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of S3 as text
%        str2double(get(hObject,'String')) returns contents of S3 as a double

% --- Executes during object creation, after setting all properties.
function S3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IS3_Callback(hObject, eventdata, handles)
% hObject    handle to IS3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IS3 as text
%        str2double(get(hObject,'String')) returns contents of IS3 as a double

% --- Executes during object creation, after setting all properties.
function IS3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IS3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Calculate3.
function Calculate3_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g = 9.78;
	Ig = 0;
S = str2double(handles.S3.String);
	IS = str2double(handles.IS3.String);
    
T = handles.Table3.Data;                                                    % Dados da tabela 3
IT = handles.Table3I.Data;                                                  % Dados da tabela 3I

ro = IT(:,2);
if handles.PopVcVt.Value == 1                                               % TAS
    Vt1 = T(:,1);
    IVt1 = T(:,2);
    Vt2 = T(:,3);
    IVt2 = T(:,4);
else                                                                        % CAS
    Vt1 = T(:,1)./sqrt(ro./1.225);
    IVt1 = T(:,2)./sqrt(ro./1.225);
    Vt2 = T(:,3)./sqrt(ro./1.225);
    IVt2 = T(:,4)./sqrt(ro./1.225);
end
    
    
dh = T(:,5);
	Idh = T(:,6);
    
t2 = IT(:,1);
t1 = 0;
It = 0;
W = IT(:,3).*g;                                                              % Tabela estará em kg
	IW = IT(:,4).*g;
alpha = IT(:,5);
	Ialpha = IT(:,6);
    
%% Rate-of-sink Method
% Método diferente dos outros por não medir ângulos e acelerações, mas
% velocidade, altura, tempo e temperatura (densidade).
% Para maior acurácia, o avião deve planar com Vi mais próximo de constante
% possível por um longo período de tempo.
Vt = (Vt1+Vt2)/2;
    IVt = 1/2*sqrt(IVt1.^2+IVt2.^2);
    q = ro.*Vt.^2/2;
    Iq = ro.*Vt.*IVt;
d = Vt .* (t2-t1);
    IdVt = (t2-t1) .* IVt;
    Idt = Vt.*sqrt(2) .* It;
    Id = sqrt(IdVt.^2 + Idt.^2);

hl = (Vt2.^2 - Vt1.^2)./2./g;
    Ihl = sqrt((Vt2/g .* IVt2).^2 + (-Vt1/g .* IVt1).^2);
dhc = dh-hl;
    Idh = sqrt(Idh.^2+Ihl.^2);
    
LD = sqrt(d.^2-dhc.^2)./dhc;

% sqrt(((Vt1+Vt2)/2*(t2-t1))^2-(dh-(Vt2^2-Vt1^2)/2/g)^2)/(dh-(Vt2^2-Vt1^2)/2/g);
% sqrt(((v+V)/2*(T-t))^2-(h-(V^2-v^2)/2/g)^2)/(h-(V^2-v^2)/2/g)

if hl
    ILDVt1 = (-(((Vt1 + Vt2).*(t2 - t1).^2.*g.*(Vt1.^2 + 2*Vt1.*Vt2+...
        Vt2.^2 - 2*g.*dh))./((Vt1.^2 - Vt2.^2 + 2*g.*dh).^2.*...
        sqrt((-Vt1.^4 - Vt2.^4 + 2*Vt1.*Vt2.*(t2 - t1).^2.*g.^2 + Vt1.^2.*...
        (2*Vt2.^2 + g*(t2.^2*g - 2*t2.*t1.*g+ t1.^2*g - 4*dh))-4*g.^2*dh.^2+...
        Vt2.^2.*g.*(t2.^2.*g - 2*t2.*t1.*g + t1.^2.*g + 4.*dh))./g.^2)))) .* IVt1;
    ILDVt2 = (-(((Vt1 + Vt2).*(t2 - t1).^2.*g.*(Vt1.^2 + 2*Vt1.*Vt2+...
        Vt2.^2 - 2*g.*dh))./((Vt1.^2 - Vt2.^2 + 2*g.*dh).^2.*...
        sqrt((-Vt1.^4 - Vt2.^4 + 2*Vt1.*Vt2.*(t2 - t1).^2*g.^2 + Vt1.^2.*...
        (2*Vt2.^2 + g*(t2.^2*g - 2*t2.*t1.*g+ t1.^2*g - 4*dh))-4.*g.^2*dh.^2+...
        Vt2.^2.*g.*(t2.^2.*g - 2*t2.*t1.*g + t1.^2*g + 4*dh))./g.^2)))) .* IVt2;
    ILDt = sqrt(2) * ((Vt1+Vt2).^2.*(t2-t1).*g)./((Vt1.^2-Vt2.^2+2*g*dh).*...
        sqrt((Vt1+Vt2).^2.*(t2-t1).^2-(Vt1.^2-Vt2.^2+2.*g.*dh).^2./g.^2)) .* It;
    ILDdh = (-2*(Vt1+Vt2).^2.*(t2-t1).^2.*g.^2)./((Vt1.^2-Vt2.^2+2*g.*dh).^2.*...
        sqrt((Vt1+Vt2).^2.*(t2-t1).^2-(Vt1.^2-Vt2.^2+2*g.*dh).^2/g^2)) .* Idh;
    ILD = sqrt(ILDVt1.^2+ILDVt2.^2+ILDt.^2+ILDdh.^2);
else
    ILDd = d./(dhc.*sqrt(d.^2-dhc.^2)) .* Id;
    ILDdh = -d.^2./(dhc.^2.*sqrt(d.^2-dhc.^2)) .* Idh;
    ILD = sqrt(ILDd.^2+ILDdh.^2);
end

gama = acot(-LD);
    Igama = 1./(LD.^2+1) .* ILD;

L = W.*cos(gama);
	ILW = cos(gama) .* IW;
	ILgama = -W.*sin(gama) .* Igama;
	IL = sqrt(ILW.^2+ILgama.^2);
	
D = -W.*sin(gama);
	IDW = -sin(gama) .* IW;
	IDgama = -W.*cos(gama) .* Igama;
	ID = sqrt(IDW.^2+IDgama.^2);
	
CL = L./(q.*S);
	ICLL = 1./(q.*S) .* IL; % Conferir o quão errado está
	ICLq = -L./(q.^2.*S) .* Iq; % Conferir o quão errado está
	ICLS = -L./(q.*S.^2) .* IS;
	ICL = sqrt(ICLL.^2+ICLq.^2+ICLS.^2); % Conferir o quão errado está
	
CD = D./(q.*S);
	ICDD = 1./(q.*S) .* ID; % Conferir o quão errado está
	ICDq = -D./(q.^2.*S) .* Iq; % Conferir o quão errado está
	ICDS = -D./(q.*S.^2) .* IS;
	ICD = sqrt(ICDD.^2+ICDq.^2+ICDS.^2); % Conferir o quão errado está

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Result.L = L;
Result.D = D;
Result.CL = CL;
Result.CD = CD;
Result.LD = LD;
Result.alpha = rad2deg(alpha);

Result.IL = IL;
Result.ID = ID;
Result.ICL = ICL;
Result.ICD = ICD;
Result.ILD = ILD;
Result.Ialpha = rad2deg(Ialpha);
    
setappdata(handles.Calculate3,'RESULT',Result);

% --- Executes on selection change in PopIAlpha3.
function PopIAlpha3_Callback(hObject, eventdata, handles)
% hObject    handle to PopIAlpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIAlpha3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIAlpha3
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D= Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,handles.PopIdH.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,hObject.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIAlpha3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIAlpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIdH.
function PopIdH_Callback(hObject, eventdata, handles)
% hObject    handle to PopIdH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIdH contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIdH
Tab = getappdata(handles.ImpData3,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.PopV1.Value);
    B = Tab.Data(:,handles.PopIV1.Value);
    C = Tab.Data(:,handles.PopV2.Value);
    D = Tab.Data(:,handles.PopIV2.Value);
    E = Tab.Data(:,handles.PopdH.Value);
    F = Tab.Data(:,hObject.Value);
    
    G = Tab.Data(:,handles.Popdt.Value);
    H = Tab.Data(:,handles.PopRo.Value);
    I = Tab.Data(:,handles.PopW3.Value);
    J = Tab.Data(:,handles.PopIW3.Value);
    K = Tab.Data(:,handles.PopAlpha3.Value);
    L = Tab.Data(:,handles.PopIAlpha3.Value);
    
    handles.Table3.Data = [A B C D E F];                                        % Escreve na tabela dos dados os valores importados do ICXS
    handles.Table3I.Data = [G H I J K L];                                       % Escreve na tabela dos dados os valores importados do ICXS
end
% --- Executes during object creation, after setting all properties.
function PopIdH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIdH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopVcVt.
function PopVcVt_Callback(hObject, eventdata, handles)
% hObject    handle to PopVcVt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopVcVt contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopVcVt

% --- Executes during object creation, after setting all properties.
function PopVcVt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopVcVt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when selected cell(s) is changed in Table3.
function Table3_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to Table3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hObject.UserData = eventdata.Indices;                                       % Recebe dados selecionados pelo usuário na tabela de dados

% --- Executes when selected cell(s) is changed in Table3I.
function Table3I_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to Table3I (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hObject.UserData = eventdata.Indices;                                       % Recebe dados selecionados pelo usuário na tabela de dados


% --- Executes on selection change in PopF.
function PopF_Callback(hObject, eventdata, handles)
% hObject    handle to PopF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopF contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopF
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D = Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,hObject.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,handles.PopIF.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end

% --- Executes during object creation, after setting all properties.
function PopF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in PopIF.
function PopIF_Callback(hObject, eventdata, handles)
% hObject    handle to PopIF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIF contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIF
Tab = getappdata(handles.ImpData1,'TAB');                                  % Recebe dados importados do ICXS
if ~isempty(Tab)
    A = Tab.Data(:,handles.Popan.Value);
    B = Tab.Data(:,handles.Popal.Value);
    C = Tab.Data(:,handles.PopAlpha.Value);
    D = Tab.Data(:,handles.Popq.Value);
    E = Tab.Data(:,handles.PopW.Value);
    F = Tab.Data(:,handles.PopF.Value);
    
    IA = Tab.Data(:,handles.PopIan.Value);
    IB = Tab.Data(:,handles.PopIal.Value);
    IC = Tab.Data(:,handles.PopIAlpha.Value);
    ID= Tab.Data(:,handles.PopIq.Value);
    IE = Tab.Data(:,handles.PopIW.Value);
    IF = Tab.Data(:,hObject.Value);
    
    handles.Table1.Data = [A B C D E F];                                          % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
    handles.Table1I.Data = [IA IB IC ID IE IF];                                    % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS
end

% --- Executes during object creation, after setting all properties.
function PopIF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Import.
function Import_Callback(hObject, eventdata, handles)
% hObject    handle to Import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% LegApp = getappdata(handles.PanelPlot,'LEGAPP');
% [filename,pathname] = uigetfile('*.fig');                                   % O usuário escolhe o arquivo p/ abrir
% fullpathname = fullfile(pathname, filename);                                % Junta nome inteiro do arquivo
% 
% if fullpathname                                                             % O programa só roda se o usuário escolher um arquivo
%     Fig = openfig(fullpathname,'invisible');                                % Abre a figura e pega suas propriedades
%     
%     Ax = Fig.Children;                                                      % Propriedados dos eixos da figura importada
%     Graf = handles.Grafico;                                                 % Propriedades do gráfico do app
%     if isa(Ax,'matlab.graphics.axis.Axes')==0                               % Caso o arquivo tenha legenda
%         Ax = Ax(2,1);                                                       % Propriedados dos eixos da figura importada
%         Leg.String = Ax.Legend.String;                                      % Variável com o nome das legendas
%         Leg.Value = 1;                                                      % Figura importada tem legenda
%     else
%         Leg.String = Ax.YLabel.String;
%         Leg.Value = 0;
%     end
%     
%     cla(Graf,'reset')                                                       % Deleta informações anteriores do gráfico
%     copyobj(Ax.Children,Graf);                                              % Copia o que foi plotado da figura importada para o App
%     
%     Graf.FontSize = 8;                                                      % Tamanho da fonte do gráfico
%     Graf.XLim = Ax.XLim;                                                    % Limites de X
%     Graf.YLim = Ax.YLim;                                                    % Limites de Y
%     grid(Graf,'on');                                                        % Ativa grade
%     axes(handles.Grafico);                                                  % Seleciona o gráfico para mudar suas características
%     xlabel(handles.PopX.String{handles.PopX.Value});                        % Da nome aos títulos dos eixos
%     ylabel(handles.PopY.String{handles.PopY.Value});
% %     Graf.Title = Ax.Title;                                                  % Título do gráfico
%     if Leg.Value
%         legend(Graf,Leg.String);                                            % Adiciona legenda, caso a figura tenha
%     end
%     LegTestes = 0;
%     if handles.ACMCB.Value == 1
%         LegTestes = {'Accelerometer'};
%     end
%     if handles.SGMCB.Value == 1 & iscell(LegTestes)
%         LegTestes = [LegTestes;{'Stabilized-glide'}];
%     elseif handles.SGMCB.Value == 1
%         LegTestes = {'Stabilized-glide'};
%     end
%     if handles.RSMCB.Value == 1 & iscell(LegTestes)
%         LegTestes = [LegTestes;{'Rate-of-sink'}];
%     elseif handles.RSMCB.Value == 1
%         LegTestes = {'Rate-of-sink'};
%     end
%     
%     handles.LegendTable.Data = [Leg.String';LegTestes];                     % Adiciona na tabela o nome das legendas da figura
%     
%     setappdata(handles.Import,'GRAF',Ax);
%     setappdata(handles.Import,'LEG',Leg);
%     setappdata(handles.PanelPlot,'LEGAPP',LegApp);
% end

% --- Executes on button press in Legend.
function Legend_Callback(hObject, eventdata, handles)
% hObject    handle to Legend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Legend
% if hObject.Value
%     handles.LegendPanel.Visible = 'on';                                     % Abre painel com o nome das legendas
% else
%     handles.LegendPanel.Visible = 'off';                                    % Fecha painel com o nome das legendas
% end
