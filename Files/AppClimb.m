function varargout = AppClimb(varargin)
%APPCLIMB MATLAB code file for AppClimb.fig
%      APPCLIMB, by itself, creates a new APPCLIMB or raises the existing
%      singleton*.
%
%      H = APPCLIMB returns the handle to a new APPCLIMB or the handle to
%      the existing singleton*.
%
%      APPCLIMB('Property','Value',...) creates a new APPCLIMB using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to AppClimb_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      APPCLIMB('CALLBACK') and APPCLIMB('CALLBACK',hObject,...) call the
%      local function named CALLBACK in APPCLIMB.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppClimb

% Last Modified by GUIDE v2.5 06-Aug-2018 15:41:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppClimb_OpeningFcn, ...
                   'gui_OutputFcn',  @AppClimb_OutputFcn, ...
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

% --- Executes just before AppClimb is made visible.
function AppClimb_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for AppClimb
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AppClimb wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Mudar o idioma
rho = char(961);
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.ROCD.Name = 'Razão de subida / descida';
        handles.Title.String = 'RAZÃO DE SUBIDA / DESCIDA';
        handles.VyPanel.Title = 'Razão de subida / descida';
            handles.ImpPlot.String = {'Importar';'Gráfico A';...
                'Gráfico B';'Gráfico C';'Gráfico D'};
            handles.CalculateVy.String = 'Calcular';
        handles.VcPanel.Title = 'Velocidade';
            handles.ImpPlotVc.String = {'Entrada do usuário';'Importar Gráfico A';...
                'Importar Gráfico B';'Importar Gráfico C';'Importar Gráfico D'};
        handles.DensityPanel.Title = 'Correção da densidade';
            handles.DataRedDen.String = 'Ativar';
            handles.RorefS.String = [rho,'ref ='];
        handles.WPanel.Title = 'Correção do peso';
            handles.DataRedW.String = 'Ativar';
            handles.WrefS.String = 'Wref =';
        handles.DragPanel.Title = 'Correção do arrasto';
            handles.DataRedDrag.String = 'Ativar';
        handles.Calculate.String = 'Calcular';
    else                                                                    % Inglês
        handles.ROCD.Name = 'Rate of climb / descent';
        handles.Title.String = 'RATE OF CLIMB / DESCENT';
        handles.VyPanel.Title = 'Rate of climb / descent';
            handles.ImpPlot.String = {'Import';'Plot A';...
                'Plot B';'Plot C';'Plot D'};
            handles.CalculateVy.String = 'Calculate';
            handles.DataRedDen.String = 'Activate';
        handles.VcPanel.Title = 'Speed';
            handles.ImpPlotVc.String = {'User input';'Import Plot A';...
                'Import Plot B';'Import Plot C';'Import Plot D'};
        handles.DensityPanel.Title = 'Density correction';
            handles.DataRedDen.String = 'Activate';
            handles.RorefS.String = [rho,'std ='];
        handles.WPanel.Title = 'Weight correction';
            handles.DataRedW.String = 'Activate';
            handles.WrefS.String = 'Wstd =';
        handles.DragPanel.Title = 'Drag correction';
            handles.DataRedDrag.String = 'Activate';
        handles.Calculate.String = 'Calculate';
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppClimb_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Calculate.
function Calculate_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Wref = str2double(handles.Wref.String);                                     % Carrega todos dados disponíveis no aplicativo
Roref = str2double(handles.Roref.String);
Vy = str2double(handles.Vy.String);
V = str2double(handles.Vc.String);
Wt = str2double(handles.Wt.String);
Rot = str2double(handles.Rot.String);
e = str2double(handles.Osw.String);
b = str2double(handles.b.String);

IVy = str2double(handles.IVy.String);
IV = str2double(handles.dVc.String);
IW = str2double(handles.IWt.String);
IRo = str2double(handles.IRot.String);
if isnan(IVy)                                                               % Caso o usuário não informe o valor da incerteza,...
    IVy = 0;                                                                % ... ela será igualada a zero.
end
if isnan(IW)
    IW = 0;
end
if isnan(IRo)
    IRo = 0;
end
if isnan(IV)
    IV = 0;
end
if isnan(V)
    V = 0;
end
if isnan(Vy)
    Vy = 0;
end

if handles.BTCAS.Value                                                      % Caso a velocidade informada seja CAS, calcula-se TAS
    Vt = V*sqrt(1.225/Rot);                                                 % TAS
    IVt = sqrt((sqrt(1.225/Rot)*IV)^2 + (0.553399*V*(1/Rot)^1.5*IRo)^2);    % Incerteza da velocidade
else
    Vt = V;
    IVt = IV;
end

V = Vy;

% Peso
if handles.DataRedW.Value == 1                                              % Caso o checkbox esteja marcado, a velocidade medida será modificada
	V = V * Wt/Wref;                                                        % Correção da velocidade
    IWV = Wt/Wref;                                                          % Parcela multiplicadora da incerteza relacionada com ROC
    IVW = Vy /Wref * IW;                                                    % Parcela da incerteza relacionada com o peso
else
    IWV = 1;                                                                % Parcela multiplicadora da incerteza relacionada com ROC
    IVW = 0;                                                                % Parcela da incerteza relacionada com o peso
end

% Densidade
if handles.DataRedDen.Value == 1                                            % Caso o checkbox esteja marcado, a velocidade medida será modificada
	V = V * Rot/Roref;                                                      % Correção da velocidade
    IVRo = Vy * IWV/Roref * IRo;                                            % Parcela da incerteza relacionada com a densidade do ar
    IRoV = Rot/Roref;                                                       % Parcela multiplicadora da incerteza relacionada com ROC
    IVW = IVW * Rot/Roref;                                                  % Parcela da incerteza relacionada com o peso
else
    IVRo = 0;                                                               % Parcela da incerteza relacionada com a densidade do ar
    IRoV = 1;                                                               % Parcela multiplicadora da incerteza relacionada com ROC
end

% Arrasto
if handles.DataRedDrag.Value == 1                                           % Caso o checkbox esteja marcado, a velocidade medida será modificada
	V = V - 2*(Wref^2-Wt^2)/(Wref*pi()*e*b^2*Vt*Rot);                       % Correção da velocidade
    IVW = IVW + 4*Wt/(Wref*pi()*e*b^2*Vt*Rot) * IW;                         % Parcela da incerteza relacionada com o peso
    IVVt = 2*(Wref^2-Wt^2)/(Wref*pi()*e*b^2*(Vt)^2*Rot) * IVt;  % Parcela da incerteza relacionada com a velocidade do ar calibrada
else
	IVVt = 0;
end

IVVy = IWV * IRoV * IVy;                                                    % Parcela da incerteza relacionada com ROC
I = sqrt(IVW^2+IVRo^2+IVVt^2+IVVy^2);                                       % Incerteza total

% Ângulo de subida
%Vt = Vc/sqrt(Roref/1.225);  %%%%%%%
%IVt = IVc/sqrt(Roref/1.225);%%%%%%%

gama = asin(V/Vt) * 180/pi();
if handles.DataRedDrag.Value == 1
    IVW = IVW/Vt;
    IVRo = IVRo/Vt;
    IVVy = IVVy/Vt;
    IVVt = (-Vy * IWV * IRoV / Vt^2 + 4*(Wref^2-Wt^2)/(Wref*pi()*e*b^2*Vt^3*Rot)) * IVt;
    IVpVt = sqrt(IVW^2+IVRo^2+IVVt^2+IVVy^2);
    Igama = 180/(pi()*sqrt(1-(V/Vt)^2)) * IVpVt;
else
    IgamaV = 180/(pi()*Vt*sqrt(1-V^2/Vt^2)) * I;
    IgamaVt = 180*V/(pi()*Vt^2*sqrt(1-V^2/Vt^2)) * IVt;
    Igama = sqrt(IgamaV^2+IgamaVt^2);
end

if I ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(V,I);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(V,abs(I/V)*100);
    handles.Result.String = strcat('Vy =',{' '},MediaStr,' ±',{' '},SDOMStr);
    handles.ResultP.String = strcat('Vy =',{' '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.Result.String = strcat('Vy =',{' '},num2str(V));
    handles.ResultP.String = strcat('Vy =',{' '},num2str(V));
end

if IVt ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(Vt,IVt);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(Vt,abs(IVt/Vt)*100);
    handles.ResultVt.String = strcat('Vt =',{' '},MediaStr,' ±',{' '},SDOMStr);
    handles.ResultPVt.String = strcat('Vt =',{' '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.ResultVt.String = strcat('Vt =',{' '},num2str(Vt));
    handles.ResultPVt.String = strcat('Vt =',{' '},num2str(Vt));
end

gamaS = char(947);
if Igama ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(gama,Igama);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(gama,abs(Igama/gama)*100);
    handles.ResultAng.String = strcat(gamaS,{' = '},MediaStr,' ±',{' '},SDOMStr);
    handles.ResultPAng.String = strcat(gamaS,{' = '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.ResultAng.String = strcat(gamaS,{' = '},num2str(gama));
    handles.ResultPAng.String = strcat(gamaS,{' = '},num2str(gama));
end

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
    handles.WPM.Enable = n;
else                                                                        % Desativando, as variáveis relacionadas e as caixas para escrever ficam cinzas
    handles.WrefS.Enable = f;
    handles.WtS.Enable = f;
    handles.Wref.Enable = f;
    handles.Wt.Enable = f;
    handles.IWt.Enable = f;
    handles.WPM.Enable = f;
    
    handles.DataRedDrag.Value = 0;
    handles.bS.Enable = f;
    handles.OswS.Enable = f;
    handles.b.Enable = f;
    handles.Osw.Enable = f;
end

function Wref_Callback(hObject, eventdata, handles)
% hObject    handle to Wref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Wref as text
%        str2double(get(hObject,'String')) returns contents of Wref as a double

% --- Executes during object creation, after setting all properties.
function Wref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

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
    handles.RoPM.Enable = n;
else                                                                        % Desativando, as variáveis relacionadas e as caixas para escrever ficam cinzas
    handles.RorefS.Enable = f;
    handles.RotS.Enable = f;
    handles.Roref.Enable = f;
    handles.Rot.Enable = f;
    handles.IRot.Enable = f;
    handles.RoPM.Enable = f;
    
    handles.DataRedDrag.Value = 0;
    handles.bS.Enable = f;
    handles.OswS.Enable = f;
    handles.b.Enable = f;
    handles.Osw.Enable = f;
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

% --- Executes on button press in DataRedDrag.
function DataRedDrag_Callback(hObject, eventdata, handles)
% hObject    handle to DataRedDrag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of DataRedDrag
n = 'on';
f = 'off';

if hObject.Value == 1                                                       % Ativando, as variáveis relacionadas ficam pretas e as caixas para escrever, brancas
    handles.bS.Enable = n;
    handles.OswS.Enable = n;
    handles.b.Enable = n;
    handles.Osw.Enable = n;
    handles.RorefS.Enable = n;
    handles.RotS.Enable = n;
    handles.Roref.Enable = n;
    handles.Rot.Enable = n;
    handles.IRot.Enable = n;
    handles.RoPM.Enable = n;
    handles.WPM.Enable = n;
    handles.WrefS.Enable = n;
    handles.WtS.Enable = n;
    handles.Wref.Enable = n;
    handles.Wt.Enable = n;
    handles.IWt.Enable = n;
    handles.DataRedDen.Value = 1;
    handles.DataRedW.Value = 1;
else                                                                        % Desativando, as variáveis relacionadas e as caixas para escrever ficam cinzas
    handles.bS.Enable = f;
    handles.OswS.Enable = f;
    handles.b.Enable = f;
    handles.Osw.Enable = f;
end

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
% Hint: get(hObject,'Value') returns toggle state of checkbox3

function edit41_Callback(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit41 as text
%        str2double(get(hObject,'String')) returns contents of edit41 as a double

% --- Executes during object creation, after setting all properties.
function edit41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit42_Callback(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit42 as text
%        str2double(get(hObject,'String')) returns contents of edit42 as a double

% --- Executes during object creation, after setting all properties.
function edit42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit43_Callback(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit43 as text
%        str2double(get(hObject,'String')) returns contents of edit43 as a double

% --- Executes during object creation, after setting all properties.
function edit43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit44_Callback(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit44 as text
%        str2double(get(hObject,'String')) returns contents of edit44 as a double

% --- Executes during object creation, after setting all properties.
function edit44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Osw_Callback(hObject, eventdata, handles)
% hObject    handle to Osw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Osw as text
%        str2double(get(hObject,'String')) returns contents of Osw as a double

% --- Executes during object creation, after setting all properties.
function Osw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Osw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double

% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Vy_Callback(hObject, eventdata, handles)
% hObject    handle to Vy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Vy as text
%        str2double(get(hObject,'String')) returns contents of Vy as a double

% --- Executes during object creation, after setting all properties.
function Vy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IVy_Callback(hObject, eventdata, handles)
% hObject    handle to IVy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IVy as text
%        str2double(get(hObject,'String')) returns contents of IVy as a double

% --- Executes during object creation, after setting all properties.
function IVy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IVy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Vc_Callback(hObject, eventdata, handles)
% hObject    handle to Vc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Vc as text
%        str2double(get(hObject,'String')) returns contents of Vc as a double

% --- Executes during object creation, after setting all properties.
function Vc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IVc_Callback(hObject, eventdata, handles)
% hObject    handle to dVc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of dVc as text
%        str2double(get(hObject,'String')) returns contents of dVc as a double

% --- Executes during object creation, after setting all properties.
function IVc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dVc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in ImpPlot.
function ImpPlot_Callback(hObject, eventdata, handles)
% hObject    handle to ImpPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns ImpPlot contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ImpPlot
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    switch hObject.Value
        case 2
            lin = get(ICXSData.XS1_1,'children');
            Xlim = get(ICXSData.XS1_1,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_1,'Ylim');                              % Limites de Y
        case 3
            lin = get(ICXSData.XS1_2,'children');
            Xlim = get(ICXSData.XS1_2,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_2,'Ylim');                              % Limites de Y
        case 4
            lin = get(ICXSData.XS1_3,'children');
            Xlim = get(ICXSData.XS1_3,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_3,'Ylim');                              % Limites de Y
        case 5
            lin = get(ICXSData.XS1_4,'children');
            Xlim = get(ICXSData.XS1_4,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_4,'Ylim');                              % Limites de Y
    end
    XDataTot = get(lin,'Xdata');                                            % Todos dados da variável plotada em X
    YDataTot = get(lin,'Ydata');                                            % Todos dados da variável plotada em Y
    hV = YDataTot(find(XDataTot>=Xlim(1) & XDataTot<=Xlim(2) &...           % Dados a serem analisados (valores para a altura)
        YDataTot>=Ylim(1) & YDataTot<=Ylim(2)));
    tV = XDataTot(find(XDataTot>=Xlim(1) & XDataTot<=Xlim(2) &...           % Dados a serem analisados (valores para o tempo)
        YDataTot>=Ylim(1) & YDataTot<=Ylim(2)));
    
    [C,S] = polyfit(tV,hV,1);                                               % Monta reta que contém os pontos da altura no tempo
    [hVnew,delta] = polyval(C,tV,S);                                        % Consegue valor de altura no início e no fim
%     Ihran = sqrt(sum(delta.^2))/sqrt(length(tV));
    
    h1 = hVnew(1);                                                          % Altura inicial
    h2 = hVnew(end);                                                        % Altura final
    dt = tV(end)-tV(1);                                                     % diferença do tempo
    
    handles.H1.String = num2str(h1);
    handles.H2.String = num2str(h2);
    handles.dt.String = num2str(dt);    
else
    hObject.Value = 1;
end

% --- Executes during object creation, after setting all properties.
function ImpPlot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImpPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function H1_Callback(hObject, eventdata, handles)
% hObject    handle to H1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of H1 as text
%        str2double(get(hObject,'String')) returns contents of H1 as a double

% --- Executes during object creation, after setting all properties.
function H1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IH_Callback(hObject, eventdata, handles)
% hObject    handle to IH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IH as text
%        str2double(get(hObject,'String')) returns contents of IH as a double

% --- Executes during object creation, after setting all properties.
function IH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function H2_Callback(hObject, eventdata, handles)
% hObject    handle to H2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of H2 as text
%        str2double(get(hObject,'String')) returns contents of H2 as a double

% --- Executes during object creation, after setting all properties.
function H2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dt_Callback(hObject, eventdata, handles)
% hObject    handle to dt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of dt as text
%        str2double(get(hObject,'String')) returns contents of dt as a double

% --- Executes during object creation, after setting all properties.
function dt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Import.
function Import_Callback(hObject, eventdata, handles)
% hObject    handle to Import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of Import
    
% --- Executes on button press in CalculateVy.
function CalculateVy_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateVy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h1 = str2double(handles.H1.String);
h2 = str2double(handles.H2.String);
Ih = str2double(handles.IH.String);
dt = str2double(handles.dt.String);

Vy = (h2-h1)/dt;                                                            % Velocidade vertical
IVy = sqrt((Ih/dt)^2+(Ih/dt)^2);                                            % Incerteza da velocidade vertical

handles.Vy.String = num2str(Vy);
if isnan(IVy)
    handles.IVy.String = '';
else
    handles.IVy.String = num2str(IVy);
end

% --- Executes during object creation, after setting all properties.
function CalculateVy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CalculateVy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on selection change in ImpPlotVc.
function ImpPlotVc_Callback(hObject, eventdata, handles)
% hObject    handle to ImpPlotVc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns ImpPlotVc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ImpPlotVc
if hObject.Value == 1                                                       % Os dados serão manualmente informados. Nos outros casos, eles vêm do ICXS
    handles.dVcranS.Enable = 'off';
    handles.dVcran.Enable = 'off';                                          % Manualmente, é considerado que a incertiza tipo A é zero
    handles.dVcran.String = '';
    handles.dVc.String = handles.dVcsys.String;
    return
end
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    switch hObject.Value                                                            
        case 2
            lin = get(ICXSData.XS1_1,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_1,'Xlim');                              % Limites de X (tempo)
            Ylim = get(ICXSData.XS1_1,'Ylim');                              % Limites de Y (velocidade)
            handles.dVcranS.Enable = 'on';
            handles.dVcran.Enable = 'inactive';
        case 3
            lin = get(ICXSData.XS1_2,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_2,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_2,'Ylim');                              % Limites de Y
            handles.dVcranS.Enable = 'on';
            handles.dVcran.Enable = 'inactive';
        case 4
            lin = get(ICXSData.XS1_3,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_3,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_3,'Ylim');                              % Limites de Y
            handles.dVcranS.Enable = 'on';
            handles.dVcran.Enable = 'inactive';
        case 5
            lin = get(ICXSData.XS1_4,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_4,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_4,'Ylim');                              % Limites de Y
            handles.dVcranS.Enable = 'on';
            handles.dVcran.Enable = 'inactive';
    end
    XDataTot = get(lin,'Xdata');                                            % Todos dados da variável plotada em X
    YDataTot = get(lin,'Ydata');                                            % Todos dados da variável plotada em Y
    VcV = YDataTot(find(XDataTot>=Xlim(1) & XDataTot<=Xlim(2) &...          % Dados a serem analisados (valores para CAS)
        YDataTot>=Ylim(1) & YDataTot<=Ylim(2)));
    Vc = mean(VcV);                                                         % Média
    IVcran = std(VcV);                                                      % Desvio padrão
%     IVcsys = str2double(handles.dVcsys.String);                             % Incerteza tipo B, indicada pelo usuário
%     if isnan(IVcsys)                                                        % Caso o usuário não informe o valor da incerteza,...
%         IVcsys = 0;                                                         % ... ela será igualada a zero.
%     end
%     IVc = sqrt((IVcsys)^2+(IVcran)^2);                                      % Incerteza de CAS
    
    handles.dVcran.String = num2str(IVcran);
    handles.Vc.String = num2str(Vc);
%     handles.dVc.String = num2str(IVc);    
else
    hObject.Value = 1;
end

% --- Executes during object creation, after setting all properties.
function ImpPlotVc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImpPlotVc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function dVcsys_Callback(hObject, eventdata, handles)
% hObject    handle to dVcsys (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of dVcsys as text
%        str2double(get(hObject,'String')) returns contents of dVcsys as a double
% if handles.ImpPlotVc.Value == 1
%     handles.dVc.String = hObject.String;
% else
%     IVcran = str2double(handles.dVcran.String);
%     IVcsys = str2double(hObject.String);
%     if isnan(IVcsys)                                                        % Caso o usuário não informe o valor da incerteza,...
%         IVcsys = 0;                                                         % ... ela será igualada a zero.
%     end
%     IVc = sqrt((IVcsys)^2+(IVcran)^2);
%     
%     handles.dVc.String = num2str(IVc);
% end

% --- Executes during object creation, after setting all properties.
function dVcsys_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dVcsys (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dVcran_Callback(hObject, eventdata, handles)
% hObject    handle to dVcran (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of dVcran as text
%        str2double(get(hObject,'String')) returns contents of dVcran as a double

% --- Executes during object creation, after setting all properties.
function dVcran_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dVcran (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dVc_Callback(hObject, eventdata, handles)
% hObject    handle to dVc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of dVc as text
%        str2double(get(hObject,'String')) returns contents of dVc as a double

% --- Executes during object creation, after setting all properties.
function dVc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dVc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in BTCAS.
function BTCAS_Callback(hObject, eventdata, handles)
% hObject    handle to BTCAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of BTCAS
n = 'on';
if hObject.Value == 1                                                       % Caso a velocidade informada seja CAS, necessita-se da densidade, então as caixas dela são ativadas
    handles.RotS.Enable = n;
    handles.Rot.Enable = n;
    handles.RoPM.Enable = n;
    handles.IRot.Enable = n;
end

% --- Executes on button press in BTTAS.
function BTTAS_Callback(hObject, eventdata, handles)
% hObject    handle to BTTAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of BTTAS
f = 'off';
if hObject.Value == 1 && handles.DataRedDen.Value == 0                      % Caso a velocidade informada seja TAS e não haja correção da densidade, as caixas dela podem ser desativadas
    handles.RotS.Enable = f;
    handles.Rot.Enable = f;
    handles.RoPM.Enable = f;
    handles.IRot.Enable = f;
end
