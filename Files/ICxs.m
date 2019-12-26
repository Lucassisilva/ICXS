function varargout = ICxs(varargin)
% ICXS MATLAB code for ICxs.fig
%      ICXS, by itself, creates a new ICXS or raises the existing
%      singleton*.
%
%      H = ICXS returns the handle to a new ICXS or the handle to
%      the existing singleton*.
%
%      ICXS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ICXS.M with the given input arguments.
%
%      ICXS('Property','Value',...) creates a new ICXS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ICxs_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ICxs_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ICxs

% Last Modified by GUIDE v2.5 25-Jul-2018 10:05:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ICxs_OpeningFcn, ...
                   'gui_OutputFcn',  @ICxs_OutputFcn, ...
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

% --- Executes just before ICxs is made visible.
function ICxs_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ICxs (see VARARGIN)

% Choose default command line output for ICxs
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes ICxs wait for user response (see UIRESUME)
% uiwait(handles.ICxsPrincipal);

imshow('i_ICXS_eng.bmp', 'Parent', handles.XS0_ICXS);                       % Imagem no Layout 0

set(handles.XS0_ICXS, 'HitTest', 'off')                                     % Torna imposs�vel interagir com a imagem da logo

linkaxes([handles.XS1_1 handles.XS1_2 handles.XS1_3 handles.XS1_4], 'x');   % Faz com que os limites do eixo X de todos os gr�ficos do Layout 1 sejam iguais

t = zeros(1,4);                                                             % Declara a vari�vel t. t(1): aba selecionada, t(2): abas totais,...
setappdata(handles.ICxs_Defaut,'T',t);                                      % ... t(3): layout selecionado, t(4): idioma

set(handles.XS3_Y,'Max',2,'Min',0);                                         % Pode-se escolher m�ltiplas vari�veis no listbox do layout 3

% Declara default da vari�vel GInf, que carrega caracter�sticas dos gr�ficos
GInf.Color = [0 0.447058823529412 0.741176470588235];                       % Cor da linha
GInf.Decimal = 0;                                                           % Separador decimal: '.'
GInf.Style = '-';                                                           % Estilo de linha: cheia
GInf.FSize = 12;                                                            % Tamanho da fonte dos t�tulos
setappdata(handles.ICxs_Defaut,'GINF',GInf);        

% --- Executes on key press with focus on ICxsPrincipal or any of its controls.
function ICxsPrincipal_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ICxsPrincipal (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');

if strcmp(eventdata.Key,'escape')                                           % Caso o usu�rio aperta a tecla esc, os pain�is de "apoio" dos Layouts 1 e 2 somem
    if handles.XS1_Plus.String == '-' && t(3) == 1
        handles.XS1_Table.Visible = 'off';                                  % Some com o painel
        handles.XS1_Plus.String = '+';                                      % Bot�o muda de nome
    end
    if handles.XS2_Plus.String == '-' && t(3) == 2
        handles.XS2_Table.Visible = 'off';                                  % Some com o painel
        handles.XS2_Plus.String = '+';                                      % Bot�o muda de nome
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = ICxs_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function OpenFile_Callback(hObject, eventdata, handles)
% hObject    handle to OpenFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Lista,Matrix,pathname,filename,fullpathname] = f_OpenFile(t(4));           % Abre o arquivo com os dados
if filename                                                                 % Se o arquivo for realmente aberto
    if t(1) == 0                                                            % Caso seja o primeiro arquivo a ser aberto, � criada a primeira aba e tudo � setado como default
        t(1:2) = t(1:2) + 1;
        handles.Tab1.State = 'on';
        handles.Tab1.Visible = 'on';
        handles.PrefMenu.Enable = 'on';                                     % Torna vis�vel os menus que est�o apagados ao iniciar o programa
        handles.ExpPlotMenu.Enable = 'on';
        handles.SaveWorkspace.Enable = 'on';
        handles.LoadWorkspace.Enable = 'on';
        handles.FCMenu.Enable = 'on';
        handles.zoomin.Enable = 'on';
        handles.zoomout.Enable = 'on';
        handles.pan.Enable = 'on';
        handles.datacursor.Enable = 'on';
        var = {'Plot X','Plot AY','Plot BY','Plot CY','Plot DY','Plot AX',...
            'Plot BX','Plot CX','Plot DX','Plot AY','Plot BY','Plot CY',...
            'Plot DY','LimVar','Plot X','Plot Y'};
            Tab(t(1)).Layout(1).ContN = var(1:5);
            Tab(t(1)).Layout(2).ContN = var(6:14);
            Tab(t(1)).Layout(3).ContN = var(15:end);
%     else
%         [Tab] = f_StorePopupVar(Tab,t,handles);	N�o parece necess�rio
    end
    Tab(t(1)).Var = Lista;                                                  % Guarda em Tab o nome das vari�veis
    Tab(t(1)).Data = Matrix;                                                % Guarda em Tab os dados das vari�veis
    Tab(t(1)).Name = {pathname,filename,fullpathname};                      % Guarda em Tab o nome do arquivo e sua pasta
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    if handles.XS1_X.Value < (length(Tab(t(1)).Var) + 1)                    % Caso a vari�vel de X seja diferente do default, deve-se escrever seus limites no editbox
        handles.XS1_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS1_X.Value)));
        handles.XS1_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS1_X.Value)));
    end
    if handles.XS2_LimVar.Value < (length(Tab(t(1)).Var) + 1)
        handles.XS2_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS2_LimVar.Value)));
        handles.XS2_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS2_LimVar.Value)));
    end
    if handles.XS3_X.Value < (length(Tab(t(1)).Var) + 1)
        handles.XS3_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS3_X.Value)));
        handles.XS3_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS3_X.Value)));
    end
    
    [Tab] = f_StorePopupVar(Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
    
    setappdata(handles.ICxs_Defaut,'TAB',Tab);
    setappdata(handles.ICxs_Defaut,'T',t);
end

% --------------------------------------------------------------------
function OpenTab_Callback(hObject, eventdata, handles)
% hObject    handle to OpenTab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

if t(2) < 10                                                                % N�mero m�ximo de abas � 10
    [Lista,Matrix,pathname,filename,fullpathname] = f_OpenFile(t(4));       % Abre o arquivo com os dados
    
    if filename                                                             % Se o arquivo for realmente aberto
        if t(1) == 0                                                        % Caso seja o primeiro arquivo a ser aberto, � criada a primeira aba e tudo � setado como default
           var = {'Plot X','Plot AY','Plot BY','Plot CY','Plot DY','Plot AX',...
            'Plot BX','Plot CX','Plot DX','Plot AY','Plot BY','Plot CY',...
            'Plot DY','LimVar','Plot X','Plot Y'};
        Tab(1).Layout(1).ContN = var(1:5);
        Tab(1).Layout(2).ContN = var(6:14);
        Tab(1).Layout(3).ContN = var(15:end);
        handles.PrefMenu.Enable = 'on';                                     % Torna vis�vel os menus que est�o apagados ao iniciar o programa
        handles.ExpPlotMenu.Enable = 'on';
        handles.SaveWorkspace.Enable = 'on';
        handles.LoadWorkspace.Enable = 'on';
        handles.FCMenu.Enable = 'on';
        handles.zoomin.Enable = 'on';
        handles.zoomout.Enable = 'on';
        handles.pan.Enable = 'on';
        handles.datacursor.Enable = 'on';
        else
%             [Tab] = f_StorePopupVar(Tab,t,handles);       	N�o parece necess�rio
            var = [Tab(t(1)).Layout(1).ContN,...                            % Valores antigos contidos nos popupmenus. Eles s�o salvos para que o novo arquivo...
                Tab(t(1)).Layout(2).ContN,Tab(t(1)).Layout(3).ContN];       % ... possa ser aberto com os mesmos dados nos popupmenus.
        end
        
        t(2) = t(2) + 1;                                                    % Aumenta o valor m�ximo de abas, e esse valor m�ximo ser� o valor da aba atual
        t(1) = t(2);
        f_TabState(t(1),handles);                                           % Modifica na interface as abas
        
        Tab(t(1)).Var = Lista;                                              % Guarda em Tab o nome das vari�veis
        Tab(t(1)).Data = Matrix;                                            % Guarda em Tab os dados das vari�veis
        Tab(t(1)).Name = {pathname,filename,fullpathname};                  % Guarda em Tab o nome do arquivo e sua pasta
        
        [handles] = f_LoadDataName(Tab,t,handles);
        [handles] = f_SetPopupVar(var,Tab,t,handles);
        if handles.XS1_X.Value < (length(Tab(t(1)).Var) + 1)                % Caso a vari�vel de X seja diferente do default, deve-se escrever seus limites no editbox
            handles.XS1_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS1_X.Value)));
            handles.XS1_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS1_X.Value)));
        end
        if handles.XS2_LimVar.Value < (length(Tab(t(1)).Var) + 1)
            handles.XS2_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS2_LimVar.Value)));
            handles.XS2_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS2_LimVar.Value)));
        end
        if handles.XS3_X.Value < (length(Tab(t(1)).Var) + 1)
            handles.XS3_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS3_X.Value)));
            handles.XS3_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS3_X.Value)));
        end
        
        [Tab] = f_StorePopupVar(Tab,t,handles);
        
        [handles] = f_PrintL1(Tab,t,handles,GInf);                          % Plot dos gr�ficos
        f_PrintL2(Tab,t,handles,GInf);
        f_PrintL3(Tab,t,handles,GInf)
        
        setappdata(handles.ICxs_Defaut,'TAB',Tab);
        setappdata(handles.ICxs_Defaut,'T',t);
    end
else
    msgbox('GAME OVER');                                                    % Primeiro easter egg
    e_TetrisTheme;                                                          % M�sica do tetris � tocada
end

% --- Executes on mouse press over axes background.
function XS1_1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to XS1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on selection change in XS1_X.
function XS1_X_Callback(hObject, eventdata, handles)
% hObject    handle to XS1_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns XS1_X contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS1_X
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

if hObject.Value < (length(Tab(t(1)).Var) + 1)                              % Caso o usu�rio selecione um valor para X diferente do default, muda-se o valor dos editbox
    handles.XS1_LimX1.String = num2str(min(Tab(t(1)).Data(:,hObject.Value)));
    handles.XS1_LimX2.String = num2str(max(Tab(t(1)).Data(:,hObject.Value)));
end

[Tab] = f_StorePopupVar(Tab,t,handles);

[handles] = f_PrintL1(Tab,t,handles,GInf);                                  % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS1_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS1_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function XS1_LimX1_Callback(hObject, eventdata, handles)
% hObject    handle to XS1_LimX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XS1_LimX1 as text
%        str2double(get(hObject,'String')) returns contents of XS1_LimX1 as a double
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

AuxNum = str2double(hObject.String);                                        % Valor escrito no editbox
Min = min(Tab(t(1)).Data(:,Tab(t(1)).Layout(1).Cont(1)));                   % Limite inferior de X
Max = max(Tab(t(1)).Data(:,Tab(t(1)).Layout(1).Cont(1)));                   % Limite superior de X

if AuxNum >= Min && AuxNum <= Max && AuxNum < Tab(t(1)).Layout(1).Cont(7)   % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
    Tab(t(1)).Layout(1).Cont(6) = AuxNum;                                   % ... Al�m disso, ele deve ser menor que o valor j� escrito como limite superior.
elseif AuxNum < Min
    Tab(t(1)).Layout(1).Cont(6) = Min;
    hObject.String = num2str(Tab(t(1)).Layout(1).Cont(6));                  % Caso o valor seja menor que o m�nimo, o m�nimo ser� selecionado
else
    hObject.String = num2str(Tab(t(1)).Layout(1).Cont(6));                  % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
end

[handles] = f_PrintL1(Tab,t,handles,GInf);                                  % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function XS1_LimX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS1_LimX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function XS1_LimX2_Callback(hObject, eventdata, handles)
% hObject    handle to XS1_LimX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XS1_LimX2 as text
%        str2double(get(hObject,'String')) returns contents of XS1_LimX2 as a double
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

AuxNum = str2double(hObject.String);                                        % Valor escrito no editbox
Min = min(Tab(t(1)).Data(:,Tab(t(1)).Layout(1).Cont(1)));                   % Limite inferior de X
Max = max(Tab(t(1)).Data(:,Tab(t(1)).Layout(1).Cont(1)));                   % Limite superior de X

if AuxNum >= Min && AuxNum <= Max && AuxNum > Tab(t(1)).Layout(1).Cont(6)   % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
    Tab(t(1)).Layout(1).Cont(7) = AuxNum;                                   % ... Al�m disso, ele deve ser maior que o valor j� escrito como limite inferior.
elseif AuxNum > Max
    Tab(t(1)).Layout(1).Cont(7) = Max;
    hObject.String = num2str(Tab(t(1)).Layout(1).Cont(7));                  % Caso o valor seja maior que o m�ximo, o m�ximo ser� selecionado
else
    hObject.String = num2str(Tab(t(1)).Layout(1).Cont(7));                  % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
end

[handles] = f_PrintL1(Tab,t,handles,GInf);                                  % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function XS1_LimX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS1_LimX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS1_Y1.
function XS1_Y1_Callback(hObject, eventdata, handles)
% hObject    handle to XS1_Y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns XS1_Y1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS1_Y1
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

[handles] = f_PrintL1(Tab,t,handles,GInf);                                  % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS1_Y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS1_Y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS1_Y2.
function XS1_Y2_Callback(hObject, eventdata, handles)
% hObject    handle to XS1_Y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns XS1_Y2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS1_Y2
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

[handles] = f_PrintL1(Tab,t,handles,GInf);                                  % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS1_Y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS1_Y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS1_Y3.
function XS1_Y3_Callback(hObject, eventdata, handles)
% hObject    handle to XS1_Y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns XS1_Y3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS1_Y3
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

[handles] = f_PrintL1(Tab,t,handles,GInf);                                  % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS1_Y3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS1_Y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS1_Y4.
function XS1_Y4_Callback(hObject, eventdata, handles)
% hObject    handle to XS1_Y4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns XS1_Y4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS1_Y4
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

[handles] = f_PrintL1(Tab,t,handles,GInf);                                  % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS1_Y4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS1_Y4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function XS1_XS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS1_XS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function XS2_XS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_XS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function XS3_XS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS3_XS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in XS1_Plus.
function XS1_Plus_Callback(hObject, eventdata, handles)
% hObject    handle to XS1_Plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if hObject.String == '+'                                                    % A tabela est� sendo ativada                                   
    handles.XS1_Table.Visible = 'on';                                       % Mostra o painel referente a esse layout
    hObject.String = '-';                                                   % Bot�o muda de nome
else
    handles.XS1_Table.Visible = 'off';                                      % Some com o painel
    hObject.String = '+';                                                   % Bot�o muda de nome
end

% --- Executes on button press in XS2_Plus.
function XS2_Plus_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_Plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if hObject.String == '+'                                                    % A tabela est� sendo ativada                                   
    handles.XS2_Table.Visible = 'on';                                       % Mostra o painel referente a esse layout
    hObject.String = '-';                                                   % Bot�o muda de nome
else
    handles.XS2_Table.Visible = 'off';                                      % Some com o painel
    hObject.String = '+';                                                   % Bot�o muda de nome
end

% --- Executes on selection change in XS3_X.
function XS3_X_Callback(hObject, eventdata, handles)
% hObject    handle to XS3_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns XS3_X contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS3_X
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

if handles.XS3_X.Value < (length(Tab(t(1)).Var) + 1)                        % Caso usu�rio escolha X diferente do default, seus limites s�o exibidos nos editbox
    handles.XS3_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS3_X.Value)));
    handles.XS3_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS3_X.Value)));
end

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL3(Tab,t,handles,GInf);                                               % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS3_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS3_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS3_Y.
function XS3_Y_Callback(hObject, eventdata, handles)
% hObject    handle to XS3_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns XS3_Y contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS3_Y
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL3(Tab,t,handles,GInf);                                              % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS3_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS3_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------
function Tab1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 1;                                                                   % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada                                     
    f_TabState(1,handles)
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf);
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Tab2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 2;                                                                   % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada                                     
    f_TabState(2,handles)
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Tab3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 3;                                                                   % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada                                     
    f_TabState(3,handles)               
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Tab4_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 4;                                                                   % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada                                     
    f_TabState(4,handles)
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Tab5_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 5;                                                                   % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada                                     
    f_TabState(5,handles)
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Tab6_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 6;                                                                   % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada                                     
    f_TabState(6,handles)
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Tab7_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 7;                                                                   % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada                                     
    f_TabState(7,handles)
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Tab8_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 8;                                                                   % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada                                     
    f_TabState(8,handles)
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Tab9_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 9;                                                                   % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada                                     
    f_TabState(9,handles)
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Tab10_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Tab10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

t(1) = 10;                                                                  % Modifica em t a aba ativada

if length(hObject.State) == 2                                               % Essa aba est� sendo ativada  
    f_TabState(10,handles)
    [handles] = f_LoadDataName(Tab,t,handles);
    [handles] = f_SetPopupVar(0,Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos Layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
else
    hObject.State = 'on';                                                   % Mant�m a aba clicada mesmo quando clicam nela j� clicada
end

% --------------------------------------------------------------------
function Layout1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Layout1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');

if length(hObject.State) == 2                                               % Esse layout est� sendo ativado                                     
    [t] = f_LayoutOff(1,handles,t);                                         % Essa fun��o faz com que sempre haja apenas uma aba clicada e grava o valor de t(3)
    handles.XS1_XS.Visible = 'on';                                          % Mostra o painel referente a esse layout
else                                                                        % Esse layout est� sendo desativado  
    handles.XS1_XS.Visible = 'off';                                         % Some com o painel                             
    t(3) = 0;                                                               % Indica que o layout � o default
    dcm_obj = datacursormode(handles.ICxsPrincipal);                        % Desativa o cursor de dados para n�o interagir com a logo
    set(dcm_obj,'Enable','off');
end

setappdata(handles.ICxs_Defaut,'T',t);

% --------------------------------------------------------------------
function Layout2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Layout2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');

if length(hObject.State) == 2                                               % Esse layout est� sendo ativado                                     
    [t] = f_LayoutOff(2,handles,t);                                         % Essa fun��o faz com que sempre haja apenas uma aba clicada e grava o valor de t(3)
    handles.XS2_XS.Visible = 'on';                                          % Mostra o painel referente a esse layout
else                                                                        % Esse layout est� sendo desativado  
    handles.XS2_XS.Visible = 'off';                                         % Some com o painel
    t(3) = 0;                                                               % Indica que o layout � o default
    dcm_obj = datacursormode(handles.ICxsPrincipal);                        % Desativa o cursor de dados para n�o interagir com a logo
    set(dcm_obj,'Enable','off');
end

setappdata(handles.ICxs_Defaut,'T',t);

% --------------------------------------------------------------------
function Layout3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Layout3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');

if length(hObject.State) == 2                                               % Esse layout est� sendo ativado                                     
    [t] = f_LayoutOff(3,handles,t);                                         % Essa fun��o faz com que sempre haja apenas uma aba clicada e grava o valor de t(3)
    handles.XS3_XS.Visible = 'on';                                          % Mostra o painel referente a esse layout
else                                                                        % Esse layout est� sendo desativado  
    handles.XS3_XS.Visible = 'off';                                         % Some com o painel                            
    t(3) = 0;                                                               % Indica que o layout � o default
    dcm_obj = datacursormode(handles.ICxsPrincipal);                        % Desativa o cursor de dados para n�o interagir com a logo
    set(dcm_obj,'Enable','off');
end

setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes on selection change in XS2_X1.
function XS2_X1_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns XS2_X1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS2_X1
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS2_X1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS2_X2.
function XS2_X2_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_X2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns XS2_X2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS2_X2
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS2_X2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_X2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS2_X3.
function XS2_X3_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_X3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns XS2_X3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS2_X3
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS2_X3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_X3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS2_X4.
function XS2_X4_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_X4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns XS2_X4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS2_X4
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS2_X4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_X4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS2_Y1.
function XS2_Y1_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_Y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns XS2_Y1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS2_Y1
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS2_Y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_Y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS2_Y2.
function XS2_Y2_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_Y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns XS2_Y2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS2_Y2
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS2_Y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_Y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS2_Y3.
function XS2_Y3_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_Y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns XS2_Y3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS2_Y3
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS2_Y3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_Y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in XS2_Y4.
function XS2_Y4_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_Y4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns XS2_Y4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS2_Y4
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

% --- Executes during object creation, after setting all properties.
function XS2_Y4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_Y4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function ICxs_Defaut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ICxs_Defaut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --------------------------------------------------------------------
function SaveWorkspace_Callback(hObject, eventdata, handles)
% hObject    handle to SaveWorkspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');

var = [Tab(t(1)).Layout(1).ContN, ...                                       % Grava as vari�veis de cada popupmenu...
    Tab(t(1)).Layout(2).ContN,Tab(t(1)).Layout(3).ContN];
uisave('var','Workspace/');                                                 % ... para serem salvas como template em uma pasta escolhida pelo usu�rio

% --------------------------------------------------------------------
function LoadWorkspace_Callback(hObject, eventdata, handles)
% hObject    handle to LoadWorkspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[filename,pathname] = uigetfile('Workspace/*.mat');                         % O usu�rio escolhe o template para load
fullpathname = fullfile(pathname, filename);                                % Junta nome inteiro do arquivo

if filename                                                                 % Fun��o prosseguir� caso um arquivo seja realmente escolhido
    a = load(fullpathname);                                                 % Abre arquivo escolhido pelo usu�rio
    
    [handles] = f_SetPopupVar(a.var,Tab,t,handles);
    
    if handles.XS1_X.Value < (length(Tab(t(1)).Var) + 1)                    % Sendo o valor de X diferente do default, seus limites s�o escritos nos editbox
        handles.XS1_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS1_X.Value)));
        handles.XS1_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS1_X.Value)));
    end
    if handles.XS2_LimVar.Value < (length(Tab(t(1)).Var) + 1)
        handles.XS2_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS2_LimVar.Value)));
        handles.XS2_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS2_LimVar.Value)));
    end
    if handles.XS3_X.Value < (length(Tab(t(1)).Var) + 1)
        handles.XS3_LimX1.String = num2str(min(Tab(t(1)).Data(:,handles.XS3_X.Value)));
        handles.XS3_LimX2.String = num2str(max(Tab(t(1)).Data(:,handles.XS3_X.Value)));
    end
    
    [Tab] = f_StorePopupVar(Tab,t,handles);
    
    [handles] = f_PrintL1(Tab,t,handles,GInf);                              % Plot dos gr�ficos de todos layouts
    f_PrintL2(Tab,t,handles,GInf);
    f_PrintL3(Tab,t,handles,GInf)
    
    setappdata(handles.ICxs_Defaut,'TAB',Tab);
    setappdata(handles.ICxs_Defaut,'T',t);
end

% --------------------------------------------------------------------
function ExpPlotMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ExpPlotMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ExpL1_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ExpL2_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ExpL3_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ExpL2A_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL2A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GInf = getappdata(handles.ICxs_Defaut,'GINF');

f_ExPlot(handles.XS2_1,'-',GInf.Decimal)

% --------------------------------------------------------------------
function ExpL2B_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL2B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GInf = getappdata(handles.ICxs_Defaut,'GINF');

f_ExPlot(handles.XS2_2,'-',GInf.Decimal)

% --------------------------------------------------------------------
function ExpL2C_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL2C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GInf = getappdata(handles.ICxs_Defaut,'GINF');

f_ExPlot(handles.XS2_3,'-',GInf.Decimal)

% --------------------------------------------------------------------
function ExpL2D_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL2D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GInf = getappdata(handles.ICxs_Defaut,'GINF');

f_ExPlot(handles.XS2_4,'-',GInf.Decimal)

% --------------------------------------------------------------------
function ExpL1A_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL1A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

f_ExPlot(handles.XS1_1,Tab(t(1)).Layout(1).ContN(1),GInf.Decimal)

% --------------------------------------------------------------------
function ExpL1B_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL1B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

f_ExPlot(handles.XS1_2,Tab(t(1)).Layout(1).ContN(1),GInf.Decimal)

% --------------------------------------------------------------------
function ExpL1C_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL1C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

f_ExPlot(handles.XS1_3,Tab(t(1)).Layout(1).ContN(1),GInf.Decimal)

% --------------------------------------------------------------------
function ExpL1D_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL1D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

f_ExPlot(handles.XS1_4,Tab(t(1)).Layout(1).ContN(1),GInf.Decimal)

% --------------------------------------------------------------------
function ExpL3Y1_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL3Y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

f_ExPlot(handles.XS3_1,'-',GInf.Decimal)

p = length(Tab(t(1)).Var) + 1;                                              % Posi��o do default no popupmenu
imax = length(Tab(t(1)).Layout(3).Cont(Tab(t(1)).Layout(3).Cont(3:end)<p)); % N�mero total de vari�veis plotadas
legend(Tab(t(1)).Layout(3).ContN{2:imax})                                   % Legenda que diz o nome de cada vari�vel plotada em Y

% --------------------------------------------------------------------
function ExpL3Y2_Callback(hObject, eventdata, handles)
% hObject    handle to ExpL3Y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

p = length(Tab(t(1)).Var) + 1;                                              % Posi��o do default no listbox
aux = Tab(t(1)).Layout(3).Cont;                                             % Vari�veis plotadas no layout 3
auxmd = length(aux(aux(4:end)<p));                                          % Quantidade de vari�veis plotadas no layout 3 (n�o considera o default)
if auxmd > 1                                                                % O gr�fico s� ser� exportado caso haja mais de uma vari�vel Y selecionada
    if  aux(3) < p
        X = Tab(t(1)).Data(:,aux(3));                                       % Vari�vel em X
        Y1 = Tab(t(1)).Data(:,aux(4));                                      % Vari�vel para o Y da esquerda
        Y2 = Tab(t(1)).Data(:,aux(5));                                      % Vari�vel para o Y da direita
        
        figure('rend','painters','pos',[10 10 900 600]);                    % Abre figura
        grid on                                                             % Grid
        yyaxis left                                                         % Cria eixo Y na esquerda
        plot(X,Y1,GInf.Style,'LineWidth', 1.2);                             % Plota gr�fico definindo estilo e espessura da linha
        ylabel(Tab(t(1)).Layout(3).ContN(2))                                % T�tulo do eixo Y na esquerda
        xlabel(Tab(t(1)).Layout(3).ContN(1))                                % T�tulo do eixo X
        set(gca,'fontsize',18)                                              % Define tamanho dos t�tulos
        set(gca,'position',[0.1,0.15,0.8,0.8])                              % Define posi��o do gr�fico na figura
        
        yyaxis right                                                        % Cria eixo Y na direita
        plot(X,Y2,GInf.Style,'LineWidth', 1.2);                             % Plota gr�fico definindo estilo e espessura da linha
        ylabel(Tab(t(1)).Layout(3).ContN(3))                                % T�tulo do eixo Y na direita
        xlim(Tab(t(1)).Layout(3).Cont(1:2));                                % Os limites de X ser�o iguais aos da interface
        if GInf.Decimal                                                     % Modifica a marca decimal, quando solicitado, para v�rgula
            xl = get(gca,'XTickLabel');
            new_xl = strrep(xl(:),'.',',');
            set(gca,'XTickLabel',new_xl);
            yl = get(gca,'YTickLabel');
            new_yl = strrep(yl(:),'.',',');
            set(gca,'YTickLabel',new_yl);
            yyaxis left 
            yl = get(gca,'YTickLabel');
            new_yl = strrep(yl(:),'.',',');
            set(gca,'YTickLabel',new_yl);
        end
    end
end

% --- Executes on button press in XS2_LimCB.
function XS2_LimCB_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_LimCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of XS2_LimCB
t = getappdata(handles.ICxs_Defaut,'T');

if hObject.Value && t(1)>0                                                  % Caso o checkbox seja ativado, ele torna vis�vel seus bot�es relacionados
    handles.XS2_LimVar.Visible = 'on';
    handles.XS2_LimX1.Visible = 'on';
    handles.XS2_LimX2.Visible = 'on';
else                                                                        % Desativando ele, os bot�es ficam invis�veis
    handles.XS2_LimVar.Visible = 'off';
    handles.XS2_LimX1.Visible = 'off';
    handles.XS2_LimX2.Visible = 'off';
    hObject.Value = 0;
end

% --- Executes on selection change in XS2_LimVar.
function XS2_LimVar_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_LimVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns XS2_LimVar contents as cell array
%        contents{get(hObject,'Value')} returns selected item from XS2_LimVar
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

if hObject.Value < (length(Tab(t(1)).Var) + 1)                              % Caso a vari�vel que cria os limites seja diferente do default, seus limites s�o exibidos
    handles.XS2_LimX1.String = num2str(min(Tab(t(1)).Data(:,hObject.Value)));
    handles.XS2_LimX2.String = num2str(max(Tab(t(1)).Data(:,hObject.Value)));
end
[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function XS2_LimVar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_LimVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function XS2_LimX1_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_LimX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of XS2_LimX1 as text
%        str2double(get(hObject,'String')) returns contents of XS2_LimX1 as a double
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

AuxNum = str2double(hObject.String);                                        % Valor escrito no editbox
Min = min(Tab(t(1)).Data(:,Tab(t(1)).Layout(2).Cont(9)));                   % Limite inferior da vari�vel
Max = max(Tab(t(1)).Data(:,Tab(t(1)).Layout(2).Cont(9)));                   % Limite superior da vari�vel

if AuxNum >= Min && AuxNum <= Max && AuxNum <= Tab(t(1)).Layout(2).Cont(11) % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
    Tab(t(1)).Layout(2).Cont(10) = AuxNum;                                  % ... Al�m disso, ele deve ser menor que o valor j� escrito como limite superior.
elseif AuxNum < Min
    Tab(t(1)).Layout(2).Cont(10) = Min;
    hObject.String = num2str(Tab(t(1)).Layout(2).Cont(10));
else
    hObject.String = num2str(Tab(t(1)).Layout(2).Cont(10));                 % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
end

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function XS2_LimX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_LimX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function XS2_LimX2_Callback(hObject, eventdata, handles)
% hObject    handle to XS2_LimX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XS2_LimX2 as text
%        str2double(get(hObject,'String')) returns contents of XS2_LimX2 as a double
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

AuxNum = str2double(hObject.String);
Min = min(Tab(t(1)).Data(:,Tab(t(1)).Layout(2).Cont(9)));                   % Limite inferior da vari�vel
Max = max(Tab(t(1)).Data(:,Tab(t(1)).Layout(2).Cont(9)));                   % Limite superior da vari�vel

if AuxNum >= Min && AuxNum <= Max && AuxNum >= Tab(t(1)).Layout(2).Cont(10) % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
    Tab(t(1)).Layout(2).Cont(11) = AuxNum;                                  % ... Al�m disso, ele deve ser maior que o valor j� escrito como limite inferior.
elseif AuxNum > Max
    Tab(t(1)).Layout(2).Cont(11) = Max;
    hObject.String = num2str(Tab(t(1)).Layout(2).Cont(11));
else
    hObject.String = num2str(Tab(t(1)).Layout(2).Cont(11));                 % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
end

f_PrintL2(Tab,t,handles,GInf);                                              % Plot dos gr�ficos

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function XS2_LimX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS2_LimX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in XS3_Perc.
function XS3_Perc_Callback(hObject, eventdata, handles)
% hObject    handle to XS3_Perc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of XS3_Perc
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

[Tab] = f_StorePopupVar(Tab,t,handles);

f_PrintL3(Tab,t,handles,GInf);                                              % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'T',t);

function XS3_LimX1_Callback(hObject, eventdata, handles)
% hObject    handle to XS3_LimX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of XS3_LimX1 as text
%        str2double(get(hObject,'String')) returns contents of XS3_LimX1 as a double
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

AuxNum = str2double(hObject.String);                                        % Valor escrito no editbox
Min = min(Tab(t(1)).Data(:,Tab(t(1)).Layout(3).Cont(3)));                   % Limite inferior de X
Max = max(Tab(t(1)).Data(:,Tab(t(1)).Layout(3).Cont(3)));                   % Limite superior de X

if AuxNum >= Min && AuxNum <= Max && AuxNum < Tab(t(1)).Layout(3).Cont(2)   % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
    Tab(t(1)).Layout(3).Cont(1) = AuxNum;                                   % ... Al�m disso, ele deve ser menor que o valor j� escrito como limite superior.
elseif AuxNum < Min
    Tab(t(1)).Layout(3).Cont(1) = Min;
    hObject.String = num2str(Tab(t(1)).Layout(3).Cont(1));
else
    hObject.String = num2str(Tab(t(1)).Layout(3).Cont(1));                  % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
end

f_PrintL3(Tab,t,handles,GInf);                                              % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function XS3_LimX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS3_LimX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function XS3_LimX2_Callback(hObject, eventdata, handles)
% hObject    handle to XS3_LimX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of XS3_LimX2 as text
%        str2double(get(hObject,'String')) returns contents of XS3_LimX2 as a double
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');
GInf = getappdata(handles.ICxs_Defaut,'GINF');

AuxNum = str2double(hObject.String);                                        % Valor escrito no editbox
Min = min(Tab(t(1)).Data(:,Tab(t(1)).Layout(3).Cont(3)));                   % Limite inferior de X
Max = max(Tab(t(1)).Data(:,Tab(t(1)).Layout(3).Cont(3)));                   % Limite superior de X

if AuxNum >= Min && AuxNum <= Max && AuxNum > Tab(t(1)).Layout(3).Cont(1)   % A mudan�a s� � v�lida se o valor escrito estiver entre o maior e o menor...
    Tab(t(1)).Layout(3).Cont(2) = AuxNum;                                   % ... Al�m disso, ele deve ser maior que o valor j� escrito como limite inferior.
elseif AuxNum > Max
    Tab(t(1)).Layout(3).Cont(2) = Max;
    hObject.String = num2str(Tab(t(1)).Layout(3).Cont(2));
else
    hObject.String = num2str(Tab(t(1)).Layout(3).Cont(2));                  % Caso a mudan�a n�o seja v�lida, o valor do editbox volta a ser o antigo
end

f_PrintL3(Tab,t,handles,GInf);                                              % Plot do gr�fico

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function XS3_LimX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XS3_LimX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------
function ConvToMa_Callback(hObject, eventdata, handles)
% hObject    handle to ConvToMa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[pathname] = f_ConvToMa();

% --------------------------------------------------------------------
function ConvFromMa_Callback(hObject, eventdata, handles)
% hObject    handle to ConvFromMa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ConvMaEx_Callback(hObject, eventdata, handles)
% hObject    handle to ConvMaEx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[pathname] = f_ConvFromMa(1);

% --------------------------------------------------------------------
function ConvMaCsv_Callback(hObject, eventdata, handles)
% hObject    handle to ConvMaCsv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[pathname] = f_ConvFromMa(2);

% --------------------------------------------------------------------
function zoomin_OnCallback(hObject, eventdata, handles)
% hObject    handle to zoomin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%hObject
handles.XS1_Zooming.Visible = 'on';                                         % Tampa os editbox com os limites do eixo X
handles.XS3_Zooming.Visible = 'on';

% --------------------------------------------------------------------
function zoomin_OffCallback(hObject, eventdata, handles)
% hObject    handle to zoomin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject

if strcmp(handles.pan.State,'on') || strcmp(handles.zoomout.State,'on')     % Esse comando � para que essa fun��o n�o seja executada sempre que outro toolbox...
    return                                                                  % ... que tamb�m modifica os limites de X � ativado
end
handles.XS1_Zooming.Visible = 'off';                                        % Destampa os editbox com os limites de X
handles.XS3_Zooming.Visible = 'off';

Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');

Tab(t(1)).Layout(1).Cont(6:7) = get(handles.XS1_1,'XLim');                  % Grava em Tab os novos limites de X
Tab(t(1)).Layout(3).Cont(1:2) = get(handles.XS3_1,'XLim'); 

handles.XS1_LimX1.String = num2str(Tab(t(1)).Layout(1).Cont(6));            % Escreve nos editbox os novos limites de X
handles.XS1_LimX2.String = num2str(Tab(t(1)).Layout(1).Cont(7));
handles.XS3_LimX1.String = num2str(Tab(t(1)).Layout(3).Cont(1));
handles.XS3_LimX2.String = num2str(Tab(t(1)).Layout(3).Cont(2));

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --------------------------------------------------------------------
function pan_OffCallback(hObject, eventdata, handles)
% hObject    handle to pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if strcmp(handles.zoomin.State,'on') || strcmp(handles.zoomout.State,'on')  % Esse comando � para que essa fun��o n�o seja executada sempre que outro toolbox...
    return                                                                  % ... que tamb�m modifica os limites de X � ativado
end
handles.XS1_Zooming.Visible = 'off';                                        % Destampa os editbox com os limites de X
handles.XS3_Zooming.Visible = 'off';

Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');

Tab(t(1)).Layout(1).Cont(6:7) = get(handles.XS1_1,'XLim');                  % Grava em Tab os novos limites de X
Tab(t(1)).Layout(3).Cont(1:2) = get(handles.XS3_1,'XLim');

handles.XS1_LimX1.String = num2str(Tab(t(1)).Layout(1).Cont(6));            % Escreve nos editbox os novos limites de X
handles.XS1_LimX2.String = num2str(Tab(t(1)).Layout(1).Cont(7));
handles.XS3_LimX1.String = num2str(Tab(t(1)).Layout(3).Cont(1));
handles.XS3_LimX2.String = num2str(Tab(t(1)).Layout(3).Cont(2));

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --------------------------------------------------------------------
function pan_OnCallback(hObject, eventdata, handles)
% hObject    handle to pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% t = getappdata(handles.ICxs_Defaut,'T');
% if t(3) == 0                                                                % Para que n�o deem zoom na "logo"
%     hObject.State = 'off';
%     return
% end
handles.XS1_Zooming.Visible = 'on';                                         % Tampa os editbox com os limites do eixo X
handles.XS3_Zooming.Visible = 'on';

% --------------------------------------------------------------------
function zoomout_OffCallback(hObject, eventdata, handles)
% hObject    handle to zoomout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');
if strcmp(handles.zoomin.State,'on') || strcmp(handles.pan.State,'on')      % Esse comando � para que essa fun��o n�o seja executada sempre que outro toolbox...
    return                                                                  % ... que tamb�m modifica os limites de X � ativado
end
handles.XS1_Zooming.Visible = 'off';                                        % Destampa os editbox com os limites de X
handles.XS3_Zooming.Visible = 'off';

Tab = getappdata(handles.ICxs_Defaut,'TAB');

Tab(t(1)).Layout(1).Cont(6:7) = get(handles.XS1_1,'XLim');                  % Grava em Tab os novos limites de X
Tab(t(1)).Layout(3).Cont(1:2) = get(handles.XS3_1,'XLim');

handles.XS1_LimX1.String = num2str(Tab(t(1)).Layout(1).Cont(6));            % Escreve nos editbox os novos limites de X
handles.XS1_LimX2.String = num2str(Tab(t(1)).Layout(1).Cont(7));
handles.XS3_LimX1.String = num2str(Tab(t(1)).Layout(3).Cont(1));
handles.XS3_LimX2.String = num2str(Tab(t(1)).Layout(3).Cont(2));

setappdata(handles.ICxs_Defaut,'TAB',Tab);

% --------------------------------------------------------------------
function zoomout_OnCallback(hObject, eventdata, handles)
% hObject    handle to zoomout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.XS1_Zooming.Visible = 'on';                                         % Tampa os editbox com os limites do eixo X
handles.XS3_Zooming.Visible = 'on';

% --- Executes on button press in Pref_Res.
function Pref_Res_Callback(hObject, eventdata, handles)
% hObject    handle to Pref_Res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GInf = getappdata(handles.ICxs_Defaut,'GINF');
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');

GInf.Color = [0 0.447058823529412 0.741176470588235];                       % Salva as informa��es default de prefer�ncia dos gr�ficos em GInf
set(handles.Pref_LC,'BackgroundColor',GInf.Color);                          % E modifica no menu de prefer�ncia os bot�es, expondo as caracter�sicas default
GInf.Decimal = 0;
handles.Pref_DM.Value = 1;
GInf.Style = '-';
handles.Pref_LS.Value = 2;
GInf.FSize = 12;
handles.Pref_FS.Value = 3;

[handles] = f_PrintL1(Tab,t,handles,GInf);                                  % Plot dos gr�ficos de todos layouts com as novas configura��es
f_PrintL2(Tab,t,handles,GInf);
f_PrintL3(Tab,t,handles,GInf);

set(handles.Pref_Panel,'Visible','off');                                    % Fecha o painel

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'GINF',GInf);

% --- Executes on button press in Pref_Apply.
function Pref_Apply_Callback(hObject, eventdata, handles)
% hObject    handle to Pref_Apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GInf = getappdata(handles.ICxs_Defaut,'GINF');
Tab = getappdata(handles.ICxs_Defaut,'TAB');
t = getappdata(handles.ICxs_Defaut,'T');

if handles.Pref_LS.Value == 2                                               % Salva as informa��es dispon�veis nos bot�es do menu em GInf
    GInf.Style = '-';
elseif handles.Pref_LS.Value == 1
    GInf.Style = '.';
end
GInf.Color = get(handles.Pref_LC,'BackgroundColor');
GInf.Decimal = handles.Pref_DM.Value - 1;
auxFS = handles.Pref_FS.String;
GInf.FSize = str2double(auxFS(handles.Pref_FS.Value));

[handles] = f_PrintL1(Tab,t,handles,GInf);                                  % Plot dos gr�ficos de todos layouts com as novas configura��es
f_PrintL2(Tab,t,handles,GInf);
f_PrintL3(Tab,t,handles,GInf);

set(handles.Pref_Panel,'Visible','off');                                    % Fecha o painel

setappdata(handles.ICxs_Defaut,'TAB',Tab);
setappdata(handles.ICxs_Defaut,'GINF',GInf);

% --- Executes on selection change in Pref_DM.
function Pref_DM_Callback(hObject, eventdata, handles)
% hObject    handle to Pref_DM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Pref_DM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Pref_DM

% --- Executes during object creation, after setting all properties.
function Pref_DM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pref_DM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Pref_LS.
function Pref_LS_Callback(hObject, eventdata, handles)
% hObject    handle to Pref_LS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Pref_LS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Pref_LS

% --- Executes during object creation, after setting all properties.
function Pref_LS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pref_LS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Pref_FS.
function Pref_FS_Callback(hObject, eventdata, handles)
% hObject    handle to Pref_FS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Pref_FS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Pref_FS

% --- Executes during object creation, after setting all properties.
function Pref_FS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pref_FS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Pref_LC.
function Pref_LC_Callback(hObject, eventdata, handles)
% hObject    handle to Pref_LC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 % change the background colour to blue
 GInf = getappdata(handles.ICxs_Defaut,'GINF');
 
 c = uisetcolor(GInf.Color);                                                % Usu�rio pode escolher a cor das linhas atrav�s de um color picker
 set(hObject,'BackgroundColor',c);                                          % Essa cor � exibida no bot�o utilizado para escolh�-la

% --------------------------------------------------------------------
function OptionsMenu_Callback(hObject, eventdata, handles)
% hObject    handle to OptionsMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function PrefMenu_Callback(hObject, eventdata, handles)
% hObject    handle to PrefMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');

if t(2)                                                                     % S� pode ativar o menu de prefer�ncias caso alguma aba j� esteja aberta
    set(handles.Pref_Panel,'Visible','on');
end

% --------------------------------------------------------------------
function HelpMenu_Callback(hObject, eventdata, handles)
% hObject    handle to HelpMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ispc || ismac                                                            % Se for Windows ou Mac, o comando para abrir o arquivo � um
    dos('start h_ICXS.pdf');
elseif isunix                                                               % Se for Linux, o comando � outro
    system(['evince ' 'h_ICXS.pdf' ' &']);
end

% --------------------------------------------------------------------
function LangMenu_Callback(hObject, eventdata, handles)
% hObject    handle to LangMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function LangEng_Callback(hObject, eventdata, handles)
% hObject    handle to LangEng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');

t(4) = 0;                                                                   % Aloca em t o idioma do programa
f_Idioma(handles,t(4));

setappdata(handles.ICxs_Defaut,'T',t);

% --------------------------------------------------------------------
function LangPort_Callback(hObject, eventdata, handles)
% hObject    handle to LangPort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');

t(4) = 1;                                                                   % Aloca em t o idioma do programa
f_Idioma(handles,t(4));

setappdata(handles.ICxs_Defaut,'T',t);

% --------------------------------------------------------------------
function datacursor_OnCallback(hObject, eventdata, handles)
% hObject    handle to datacursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');
if t(3) == 0                                                                % Para que n�o usem o datacursor na "logo"
    hObject.State = 'off';
    return
end

% --------------------------------------------------------------------
function AeroMenu_Callback(hObject, eventdata, handles)
% hObject    handle to AeroMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function AtmosMenu_Callback(hObject, eventdata, handles)
% hObject    handle to AtmosMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function FCMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FCMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = getappdata(handles.ICxs_Defaut,'T');
Tab = getappdata(handles.ICxs_Defaut,'TAB');

CardName = strcat(Tab(t(1)).Name{1},'FC_',Tab(t(1)).Name{2},'.xlsx');       % Nome do arquivo a ser aberto e sua pasta
if exist(CardName,'file')                                                   % Caso o arquivo exista, ele ser� aberto pelo sistema
    system(CardName);
end

% --------------------------------------------------------------------
function DAMenu_Callback(hObject, eventdata, handles)
% hObject    handle to DynAnlMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppDenAlt

% --------------------------------------------------------------------
function StatiMenu_Callback(hObject, eventdata, handles)
% hObject    handle to StatiMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function DRejectMenu_Callback(hObject, eventdata, handles)
% hObject    handle to DRejectMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ChauveMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ChauveMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppChauvenet;

% --------------------------------------------------------------------
function PerfMenu_Callback(hObject, eventdata, handles)
% hObject    handle to PerfMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function StallSpeed_Callback(hObject, eventdata, handles)
% hObject    handle to StallSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppStallSpeed;

% --------------------------------------------------------------------
function ROCDMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ROCDMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppClimb;

% --------------------------------------------------------------------
function ErrorBarMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ErrorBarMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppErrorBar;

% --------------------------------------------------------------------
function TurnMenu_Callback(hObject, eventdata, handles)
% hObject    handle to TurnMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppTurn;

% --------------------------------------------------------------------
function TOLMenu_Callback(hObject, eventdata, handles)
% hObject    handle to TOLMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppTOL;

% --------------------------------------------------------------------
function FPMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FPMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppFP;

% --------------------------------------------------------------------
function SaCMenu_Callback(hObject, eventdata, handles)
% hObject    handle to SaCMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function NPMenu_Callback(hObject, eventdata, handles)
% hObject    handle to NPMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppLNPoint;

% --------------------------------------------------------------------
function DPMenu_Callback(hObject, eventdata, handles)
% hObject    handle to DPMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppDragPolar;

% --------------------------------------------------------------------
function MenuData3_Callback(hObject, eventdata, handles)
% hObject    handle to MenuData3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, path] = uiputfile({'*.mat';'*.xlsx';'*.csv'});                       % Usu�rio escolhe local para salvar arquivo
fullpathname = fullfile(path, file);                                        % Junta nome inteiro do arquivo

if file                                                                     % S� vai acontecer caso o usu�rio escolha um local
    t = getappdata(handles.ICxs_Defaut,'T');
    Tab = getappdata(handles.ICxs_Defaut,'TAB');
    
    LimVar = Tab(t(1)).Layout(3).Cont(3);                                   % A vari�vel que selecionar� os limites � anotada
    p = length(Tab(t(1)).Var) + 1;                                          % Posi��o do default no popupmenu
    XY = Tab(t(1)).Layout(3).Cont(1:2);                                     % Os limites do checkbox s�o anotados
    if LimVar == p                                                          % Caso n�o exista uma vari�vel limitadora dos dados
        Pos = 1:length(Tab(t(1)).Data);                                     % Todos dados ser�o plotados
    else                                                                    % Caso exista uma vari�vel limitadora dos dados,...
        Pos = find(Tab(t(1)).Data(:,LimVar) >= XY(1) & Tab(t(1)).Data(:,LimVar) <= XY(2));
    end
    
    A = Tab(t(1)).Data(Pos,:);
    N = Tab(t(1)).Var;
    
    switch file(end)
        case 'v'
            fid = fopen(fullpathname, 'w');                                 % Cria arquivo .csv com mesmo nome do arquivo .mat
            fprintf(fid, '%s,', N{1:end-1});                                % Escreve nele os elementos do cabe�alho, menos o �ltimo
            fprintf(fid, '%s\n', N{end});                                   % Escreve o �ltimo elemento do cabe�alho e pula linha
            fclose(fid) ;                                                   % Fecha o arquivo
            dlmwrite(fullpathname,A, '-append') ;                           % Escreve os valores num�ricos no arquivo
        case 'x'
            sheet = 1;                                                      % Aba do Excel
            xlRange1 = 'A1';                                                % C�dula do Excel para escrever o cabe�alho
            xlRange2 = 'A2';                                                % C�dula do Excel para escrever os dados num�ricos
            xlswrite(fullpathname,N',sheet,xlRange1);                       % Salva os nomes das vari�veis
            xlswrite(fullpathname,A,sheet,xlRange2);                        % Salva os dados das vari�veis
        case 't'
            [l,c] = size(A);                                                % Confere a quantidade de dados
            for i = 1:c                                                     % Atribui��o dos dados a cada vari�vel
                NomeVar = N{i};
                eval([NomeVar,'=A(:,i)']);                                  % Cria cada vari�vel e atribui a ela seu vetor
            end
            save(fullpathname,N{:});                                        % Salva dados em ".mat"
    end
end

% --------------------------------------------------------------------
function MenuData2_Callback(hObject, eventdata, handles)
% hObject    handle to MenuData2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, path] = uiputfile({'*.mat';'*.xlsx';'*.csv'});                       % Usu�rio escolhe local para salvar arquivo
fullpathname = fullfile(path, file);                                        % Junta nome inteiro do arquivo

if file                                                                     % S� vai acontecer caso o usu�rio escolha um local
    t = getappdata(handles.ICxs_Defaut,'T');
    Tab = getappdata(handles.ICxs_Defaut,'TAB');
    
    LimVar = Tab(t(1)).Layout(2).Cont(9);                                   % A vari�vel que selecionar� os limites � anotada
    p = length(Tab(t(1)).Var) + 1;                                          % Posi��o do default no popupmenu
    XY = Tab(t(1)).Layout(2).Cont(10:11);                                   % Os limites do checkbox s�o anotados
    if LimVar == p                                                          % Caso n�o exista uma vari�vel limitadora dos dados
        Pos = 1:length(Tab(t(1)).Data);                                     % Todos dados ser�o plotados
    else                                                                    % Caso exista uma vari�vel limitadora dos dados,...
        Pos = find(Tab(t(1)).Data(:,LimVar) >= XY(1) & Tab(t(1)).Data(:,LimVar) <= XY(2));
    end
    
    A = Tab(t(1)).Data(Pos,:);
    N = Tab(t(1)).Var;
    
    switch file(end)
        case 'v'
            fid = fopen(fullpathname, 'w');                                 % Cria arquivo .csv com mesmo nome do arquivo .mat
            fprintf(fid, '%s,', N{1:end-1});                                % Escreve nele os elementos do cabe�alho, menos o �ltimo
            fprintf(fid, '%s\n', N{end});                                   % Escreve o �ltimo elemento do cabe�alho e pula linha
            fclose(fid) ;                                                   % Fecha o arquivo
            dlmwrite(fullpathname,A, '-append') ;                           % Escreve os valores num�ricos no arquivo
        case 'x'
            sheet = 1;                                                      % Aba do Excel
            xlRange1 = 'A1';                                                % C�dula do Excel para escrever o cabe�alho
            xlRange2 = 'A2';                                                % C�dula do Excel para escrever os dados num�ricos
            xlswrite(fullpathname,N',sheet,xlRange1);                       % Salva os nomes das vari�veis
            xlswrite(fullpathname,A,sheet,xlRange2);                        % Salva os dados das vari�veis
        case 't'
            [l,c] = size(A);                                                % Confere a quantidade de dados
            for i = 1:c                                                     % Atribui��o dos dados a cada vari�vel
                NomeVar = N{i};
                eval([NomeVar,'=A(:,i)']);                                  % Cria cada vari�vel e atribui a ela seu vetor
            end
            save(fullpathname,N{:});                                        % Salva dados em ".mat"
    end
end

% --------------------------------------------------------------------
function MenuData1_Callback(hObject, eventdata, handles)
% hObject    handle to MenuData1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, path] = uiputfile({'*.mat';'*.xlsx';'*.csv'});                       % Usu�rio escolhe local para salvar arquivo
fullpathname = fullfile(path, file);                                        % Junta nome inteiro do arquivo

if file                                                                     % S� vai acontecer caso o usu�rio escolha um local
    t = getappdata(handles.ICxs_Defaut,'T');
    Tab = getappdata(handles.ICxs_Defaut,'TAB');
    
    LimVar = Tab(t(1)).Layout(1).Cont(1);                                   % A vari�vel que selecionar� os limites � anotada
    p = length(Tab(t(1)).Var) + 1;                                          % Posi��o do default no popupmenu
    XY = Tab(t(1)).Layout(1).Cont(6:7);                                     % Os limites do checkbox s�o anotados
    if LimVar == p                                                          % Caso n�o exista uma vari�vel limitadora dos dados
        Pos = 1:length(Tab(t(1)).Data);                                     % Todos dados ser�o plotados
    else                                                                    % Caso exista uma vari�vel limitadora dos dados,...
        Pos = find(Tab(t(1)).Data(:,LimVar) >= XY(1) & Tab(t(1)).Data(:,LimVar) <= XY(2));
    end
    
    A = Tab(t(1)).Data(Pos,:);
    N = Tab(t(1)).Var;
    
    switch file(end)
        case 'v'
            fid = fopen(fullpathname, 'w');                                 % Cria arquivo .csv com mesmo nome do arquivo .mat
            fprintf(fid, '%s,', N{1:end-1});                                % Escreve nele os elementos do cabe�alho, menos o �ltimo
            fprintf(fid, '%s\n', N{end});                                   % Escreve o �ltimo elemento do cabe�alho e pula linha
            fclose(fid) ;                                                   % Fecha o arquivo
            dlmwrite(fullpathname,A, '-append') ;                           % Escreve os valores num�ricos no arquivo
        case 'x'
            sheet = 1;                                                      % Aba do Excel
            xlRange1 = 'A1';                                                % C�dula do Excel para escrever o cabe�alho
            xlRange2 = 'A2';                                                % C�dula do Excel para escrever os dados num�ricos
            xlswrite(fullpathname,N',sheet,xlRange1);                       % Salva os nomes das vari�veis
            xlswrite(fullpathname,A,sheet,xlRange2);                        % Salva os dados das vari�veis
        case 't'
            [l,c] = size(A);                                                % Confere a quantidade de dados
            for i = 1:c                                                     % Atribui��o dos dados a cada vari�vel
                NomeVar = N{i};
                eval([NomeVar,'=A(:,i)']);                                  % Cria cada vari�vel e atribui a ela seu vetor
            end
            save(fullpathname,N{:});                                        % Salva dados em ".mat"
    end
end

% --------------------------------------------------------------------
function DynAnlMenu_Callback(hObject, eventdata, handles)
% hObject    handle to DynAnlMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AppDynAnl;


% --------------------------------------------------------------------
function MergFig_Callback(hObject, eventdata, handles)
% hObject    handle to MergFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename1,pathname1] = uigetfile('*.fig');                                 % O usu�rio escolhe a figura que ser� utilizada como base para a nova figura
fullpathname1 = fullfile(pathname1, filename1);                             % Junta nome inteiro do arquivo
[filename,pathname] = uigetfile(strcat(pathname1,'\*.fig'),...              % O usu�rio escolhe as figuras complementares da nova figura...
    'Select the Files','MultiSelect','on');                                 % V�rias figuras podem ser selecionadas
fullpathname = fullfile(pathname, filename);                                % Junta nome inteiro do arquivo

if iscell(fullpathname)                                                     % Junta os nomes de todos arquivos em uma c�lula
    fullpathname = [{fullpathname1} fullpathname];
    filename = [{filename1} filename];
else
    fullpathname = [{fullpathname1} {fullpathname}];
    filename = [{filename1} {filename}];
end

if ~isnumeric(filename{1}) & ~isnumeric(filename{2})                        % Esse menu s� funciona caso arquivos tenham sido selecionados nas 2 caixas de sele��o
    Leg.String = {'a'};                                                     % Apenas para inicializar a vari�vel Leg.String
    
    for i = 1:length(fullpathname)                                          % Abrange todas figuras selecionadas pelo usu�rio
        if i == 1                                                           % No caso da primeira figura...
            NewFig(i) = openfig(fullpathname{i});                           % ... Ela ser� base para a nova figura
            Ax = gca;                                                       % Guarda em Ax a refer�ncia do gr�fico
        else
            NewFig(i) = openfig(fullpathname{i},'invisible');               % Abre a figura complementar e pega suas propriedades
        end
        Axs{i} = NewFig(i).Children;                                        % Informa��es do gr�fico de cada figura aberta
        if isa(Axs{i},'matlab.graphics.axis.Axes')==0                       % Caso o arquivo tenha legenda
            Axs{i} = Axs{i}(2,1);                                           % Propriedados dos eixos da figura importada
            for j = 1:length(Axs{i}.Legend.String)
                Leg.String{length(Leg.String)+1} = Axs{i}.Legend.String{j}; % Vari�vel com o nome das legendas
            end
        else
            Leg.String{length(Leg.String)+1} = filename{i}(1:end-4);        % Caso certa figura n�o tenha legenda, sua legenda ser� o nome do arquivo
        end
        LIMX(i,:) = Axs{i}.XLim;                                            % Armazena em LIMX os limites inferior e superior de X de cada figura
        LIMY(i,:) = Axs{i}.YLim;                                            % Armazena em LIMX os limites inferior e superior de Y de cada figura
        if i ~= 1                                                           % No caso das figuras "complementares"...
            copyobj(Axs{i}.Children,Ax);                                    % ... copia seus dados para a nova figura
        end
    end
    Ax.XLim = [min(LIMX(:,1)) max(LIMX(:,2))];                              % Limites de X (inferior: menor de todas figuras, superior: maior de todas figuras)
    Ax.YLim = [min(LIMY(:,1)) max(LIMY(:,2))];                              % Limites de Y (inferior: menor de todas figuras, superior: maior de todas figuras)
    
    legend(Ax,Leg.String(2:end))                                            % Escreve as legendas no gr�fico
end