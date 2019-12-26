function varargout = AppStallSpeed(varargin)
%APPSTALLSPEED MATLAB code file for AppStallSpeed.fig
%      APPSTALLSPEED, by itself, creates a new APPSTALLSPEED or raises the existing
%      singleton*.
%
%      H = APPSTALLSPEED returns the handle to a new APPSTALLSPEED or the handle to
%      the existing singleton*.
%
%      APPSTALLSPEED('Property','Value',...) creates a new APPSTALLSPEED using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to AppStallSpeed_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      APPSTALLSPEED('CALLBACK') and APPSTALLSPEED('CALLBACK',hObject,...) call the
%      local function named CALLBACK in APPSTALLSPEED.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppStallSpeed

% Last Modified by GUIDE v2.5 30-Jan-2018 10:19:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppStallSpeed_OpeningFcn, ...
                   'gui_OutputFcn',  @AppStallSpeed_OutputFcn, ...
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

% --- Executes just before AppStallSpeed is made visible.
function AppStallSpeed_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for AppStallSpeed
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes AppStallSpeed wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% Mudar o idioma
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.StallSpeed.Name = 'Velocidade de estol';
        handles.Title.String = 'VELOCIDADE DE ESTOL';
        handles.DataRed.Title = 'Métodos de correção de dados';
            handles.DataRedW.String = 'Peso';
            handles.DataRedDen.String = 'Densidade';
            handles.DataRedDec.String = 'Taxa de desaceleração';
        handles.StdPanel.Title = 'Referência';
        handles.TestPanel.Title = 'Teste';
        handles.DRPanel.Title = 'Taxa de desaceleração';
        handles.DRCalculate.String = 'Calcular';
        handles.Calculate.String = 'Calcular';
    else                                                                    % Inglês
        handles.StallSpeed.Name = 'Stall speed';
        handles.Title.String = 'STALL SPEED';
        handles.DataRed.Title = 'Data correction methods';
            handles.DataRedW.String = 'Weight';
            handles.DataRedDen.String = 'Density';
            handles.DataRedDec.String = 'Deceleration rate';
        handles.StdPanel.Title = 'Standard';
        handles.TestPanel.Title = 'Test';
        handles.DRPanel.Title = 'Deceleration rate';
        handles.DRCalculate.String = 'Calculate';
        handles.Calculate.String = 'Calculate';
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppStallSpeed_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function Wt_Callback(hObject, eventdata, handles)
% hObject    handle to Wt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Wt as text
%        str2double(get(hObject,'String')) returns contents of Wt as a double

% --- Executes during object creation, after setting all properties.
function Wt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Rot_Callback(hObject, eventdata, handles)
% hObject    handle to Rot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Rot as text
%        str2double(get(hObject,'String')) returns contents of Rot as a double

% --- Executes during object creation, after setting all properties.
function Rot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Roref_Callback(hObject, eventdata, handles)
% hObject    handle to Roref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Roref as text
%        str2double(get(hObject,'String')) returns contents of Roref as a double

% --- Executes during object creation, after setting all properties.
function Roref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Roref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IWt_Callback(hObject, eventdata, handles)
% hObject    handle to IWt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IWt as text
%        str2double(get(hObject,'String')) returns contents of IWt as a double

% --- Executes during object creation, after setting all properties.
function IWt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IWt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IRot_Callback(hObject, eventdata, handles)
% hObject    handle to IRot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IRot as text
%        str2double(get(hObject,'String')) returns contents of IRot as a double

% --- Executes during object creation, after setting all properties.
function IRot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IRot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Ct_Callback(hObject, eventdata, handles)
% hObject    handle to Ct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Ct as text
%        str2double(get(hObject,'String')) returns contents of Ct as a double

% --- Executes during object creation, after setting all properties.
function Ct_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ICt_Callback(hObject, eventdata, handles)
% hObject    handle to ICt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of ICt as text
%        str2double(get(hObject,'String')) returns contents of ICt as a double

% --- Executes during object creation, after setting all properties.
function ICt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ICt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Calculate.
function Calculate_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Wref = str2double(handles.Wref.String);                                     % Carrega todos dados disponíveis no aplicativo
Roref = str2double(handles.Roref.String);
Vt = str2double(handles.Vso.String);
Wt = str2double(handles.Wt.String);
Rot = str2double(handles.Rot.String);
C = str2double(handles.Ct.String);
DR = str2double(handles.DR.String);

IV = str2double(handles.IVso.String);
IW = str2double(handles.IWt.String);
IRo = str2double(handles.IRot.String);
IC = str2double(handles.ICt.String);
dt = str2double(handles.DRdt.String);
if isnan(IV)                                                                % Caso o usuário não informe o valor da incerteza,...
    IV = 0;                                                                 % ... ela será igualada a zero.
end
if isnan(IW)
    IW = 0;
end
if isnan(IRo)
    IRo = 0;
end
if isnan(IC)
    IC = 0;
end

V = Vt*sqrt(Rot/1.225);                                                     % V = velocidade de estol medida no teste em CAS
IV = IV * sqrt(Rot/1.225);                                                  % Correção da incerteza da velocidade para quando V informado é TAS

% Peso
if handles.DataRedW.Value == 1                                              % Caso o checkbox esteja marcado, a velocidade medida será modificada
	V = V * sqrt(Wref/Wt);                                                  % Correção da velocidade
    IWV = sqrt(Wref/Wt);                                                    % Parcela multiplicadora da incerteza relacionada com a velocidade medida
else
    IWV = 1;                                                                % Parcela multiplicadora da incerteza relacionada com a velocidade medida
end

% Densidade
if handles.DataRedDen.Value == 1                                            % Caso o checkbox esteja marcado, a velocidade medida será modificada
	V = V * sqrt(Rot/Roref);                                                % Correção da velocidade
    IRoV = sqrt(Rot/Roref);                                                 % Parcela multiplicadora da incerteza relacionada com a velocidade medida
else
    IRoV = 1;                                                               % Parcela multiplicadora da incerteza relacionada com a velocidade medida
end

% Taxa de desaceleração
if handles.DataRedDec.Value == 1 && DR > 0.514                              % Caso o checkbox esteja marcado e DR>1nó/s, a velocidade medida será modificada
	IVC = (5*dt*V)/((20*dt+C)^2*sqrt((10*dt+C)/(40*dt+2*C))) * IC;          % Parcela da incerteza relacionada com a corda média aerodinâmica
    R = V / (C*3.28084/2*DR);                                               % Fator para correção da velocidade
	V = V * sqrt((R+2)/(R+1));                                              % Correção da velocidade
    IDRV = sqrt((R+2)/(R+1));                                               % Parcela multiplicadora da incerteza relacionada com a velocidade medida
else
    IVC = 0;                                                                % Parcela da incerteza relacionada com a corda média aerodinâmica
    IDRV = 1;                                                               % Parcela multiplicadora da incerteza relacionada com a velocidade medida
end

% Incerteza do peso
if handles.DataRedW.Value == 1
    IVW = -V/(2*Wt) * IW;                                                   % Parcela da incerteza relacionada com o peso
else
    IVW = 0;                                                                % Parcela da incerteza relacionada com o peso
end
% Incerteza da densidade
if handles.DataRedDen.Value == 1
    IVRo = V/(2*Rot) * IRo;                                                 % Parcela da incerteza relacionada com a densidade do ar
else
    IVRo = 0;                                                               % Parcela da incerteza relacionada com a densidade do ar
end

IVV = IV * IDRV * IWV * IRoV;                                               % Parcela da incerteza relacionada com a velocidade medida
I = sqrt(IVC^2+IVW^2+IVRo^2+IVV^2);                                         % Incerteza total

if I ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(V,I);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(V,I/V*100);
    handles.Result.String = strcat('CAS =',{' '},MediaStr,' ±',{' '},SDOMStr);
    handles.ResultP.String = strcat('CAS =',{' '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.Result.String = strcat('CAS =',{' '},num2str(V));
    handles.ResultP.String = strcat('CAS =',{' '},num2str(V));
end

V = V / sqrt(Roref/1.225);
I = I / sqrt(Roref/1.225);
if I ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(V,I);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(V,I/V*100);
    handles.ResultT.String = strcat('TAS =',{' '},MediaStr,' ±',{' '},SDOMStr);
    handles.ResultTP.String = strcat('TAS =',{' '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.ResultT.String = strcat('TAS =',{' '},num2str(V));
    handles.ResultTP.String = strcat('TAS =',{' '},num2str(V));
end

function Vso_Callback(hObject, eventdata, handles)
% hObject    handle to Vso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Vso as text
%        str2double(get(hObject,'String')) returns contents of Vso as a double

% --- Executes during object creation, after setting all properties.
function Vso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IVso_Callback(hObject, eventdata, handles)
% hObject    handle to IVso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IVso as text
%        str2double(get(hObject,'String')) returns contents of IVso as a double

% --- Executes during object creation, after setting all properties.
function IVso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IVso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DR_Callback(hObject, eventdata, handles)
% hObject    handle to DR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of DR as text
%        str2double(get(hObject,'String')) returns contents of DR as a double

% --- Executes during object creation, after setting all properties.
function DR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IDR_Callback(hObject, eventdata, handles)
% hObject    handle to IDR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IDR as text
%        str2double(get(hObject,'String')) returns contents of IDR as a double

% --- Executes during object creation, after setting all properties.
function IDR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IDR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function VS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function IVS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IVS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function Vso11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vso11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function DRt1_Callback(hObject, eventdata, handles)
% hObject    handle to DRt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of DRt1 as text
%        str2double(get(hObject,'String')) returns contents of DRt1 as a double
t1 = str2double(handles.DRt1.String);
t2 = str2double(handles.DRt2.String);

handles.DRdt.String = num2str(abs(t2-t1));                                  % Cálculo da diferença do tempo indicada na imagem do cálculo da desaceleração

% --- Executes during object creation, after setting all properties.
function DRt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DRt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function DRVso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DRVso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function DRIVso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DRIVso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function DRt2_Callback(hObject, eventdata, handles)
% hObject    handle to DRt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of DRt2 as text
%        str2double(get(hObject,'String')) returns contents of DRt2 as a double
t1 = str2double(handles.DRt1.String);
t2 = str2double(handles.DRt2.String);

handles.DRdt.String = num2str(abs(t2-t1));                                  % Cálculo da diferença do tempo indicada na imagem do cálculo da desaceleração

% --- Executes during object creation, after setting all properties.
function DRt2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DRt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function DRdt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DRdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in DRStr.
function DRStr_Callback(hObject, eventdata, handles)
% hObject    handle to DRStr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.DRPanel.Visible = 'on';                                             % Ativa o painel para cálculo da desaceleração
Rot = str2double(handles.Rot.String);
handles.DRVso.String = num2str(str2double(handles.Vso.String) * sqrt(Rot/1.225));
handles.DRIVso.String = num2str(str2double(handles.IVso.String) * sqrt(Rot/1.225));
handles.Vso11.String = num2str(1.1*str2double(handles.Vso.String)* sqrt(Rot/1.225));         % 1,1*Velocidade de estol medida

% --- Executes on button press in DRCalculate.
function DRCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to DRCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t1 = str2double(handles.DRt1.String);
t2 = str2double(handles.DRt2.String);
Rot = str2double(handles.Rot.String);
Vso = str2double(handles.Vso.String)* sqrt(Rot/1.225);
Vf = str2double(handles.DRVso.String);

DR = abs((1.1*Vso-Vf)/(t2-t1));                                             % Calcula a desaceleração
IDR = abs((1.1*Vso-Vf)/Vso*str2double(handles.DRIVso.String)/(t2-t1));      % Calcula a incerteza da desaceleração, esse valor não é usado futuramente

handles.DRdt.String = num2str(t2-t1);
handles.DR.String = num2str(DR);
handles.IDR.String = num2str(IDR);

handles.DRPanel.Visible = 'off';

% --- Executes on button press in DataRedW.
function DataRedW_Callback(hObject, eventdata, handles)
% hObject    handle to DataRedW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of DataRedW
n = 'on';
f = 'off';

if hObject.Value == 1                                                       % Ativando, as variáveis relacionadas ficam pretas e as caixas para escrever, brancas
    handles.WrefS.Enable = n;
    handles.WtS.Enable = n;
    handles.Wref.Enable = n;
    handles.Wt.Enable = n;
    handles.IWt.Enable = n;
    handles.text25.Enable = n;
else                                                                        % Desativando, as variáveis relacionadas e as caixas para escrever ficam cinzas
    handles.WrefS.Enable = f;
    handles.WtS.Enable = f;
    handles.Wref.Enable = f;
    handles.Wt.Enable = f;
    handles.IWt.Enable = f;
    handles.text25.Enable = f;
end

% --- Executes on button press in DataRedDen.
function DataRedDen_Callback(hObject, eventdata, handles)
% hObject    handle to DataRedDen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of DataRedDen
n = 'on';
f = 'off';

if hObject.Value == 1                                                       % Ativando, as variáveis relacionadas ficam pretas e as caixas para escrever, brancas
    handles.RorefS.Enable = n;
    handles.RotS.Enable = n;
    handles.Roref.Enable = n;
    handles.Rot.Enable = n;
    handles.IRot.Enable = n;
    handles.text26.Enable = n;
else                                                                        % Desativando, as variáveis relacionadas e as caixas para escrever ficam cinzas
    handles.RorefS.Enable = f;
    handles.RotS.Enable = f;
    handles.Roref.Enable = f;
    handles.Rot.Enable = f;
    handles.IRot.Enable = f;
    handles.text26.Enable = f;
end

% --- Executes on button press in DataRedDec.
function DataRedDec_Callback(hObject, eventdata, handles)
% hObject    handle to DataRedDec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of DataRedDec
n = 'on';
f = 'off';

if hObject.Value == 1                                                       % Ativando, as variáveis relacionadas ficam pretas e as caixas para escrever, brancas
    handles.CS.Enable = n;
    handles.DRStr.Enable = n;
    handles.Ct.Enable = n;
    handles.ICt.Enable = n;
    handles.DR.Enable = 'inactive';
    handles.IDR.Enable = 'inactive';
    handles.text28.Enable = n;
    handles.text32.Enable = n;
else                                                                        % Desativando, as variáveis relacionadas e as caixas para escrever ficam cinzas
    handles.CS.Enable = f;
    handles.DRStr.Enable = f;
    handles.Ct.Enable = f;
    handles.ICt.Enable = f;
    handles.DR.Enable = f;
    handles.IDR.Enable = f;
    handles.text28.Enable = f;
    handles.text32.Enable = f;
end

% --- Executes on key press with focus on StallSpeed or any of its controls.
function StallSpeed_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to StallSpeed (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.Key,'escape')                                           % Ao apertar esc, o usuário fecha o painel de cálculo da desaceleração
    handles.DRPanel.Visible = 'off';
end

function DRVso_Callback(hObject, eventdata, handles)
% hObject    handle to DRVso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of DRVso as text
%        str2double(get(hObject,'String')) returns contents of DRVso as a double



function DRIVso_Callback(hObject, eventdata, handles)
% hObject    handle to DRIVso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DRIVso as text
%        str2double(get(hObject,'String')) returns contents of DRIVso as a double
