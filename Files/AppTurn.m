function varargout = AppTurn(varargin)
% APPTURN MATLAB code for AppTurn.fig
%      APPTURN, by itself, creates a new APPTURN or raises the existing
%      singleton*.
%
%      H = APPTURN returns the handle to a new APPTURN or the handle to
%      the existing singleton*.
%
%      APPTURN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPTURN.M with the given input arguments.
%
%      APPTURN('Property','Value',...) creates a new APPTURN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppTurn_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppTurn_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppTurn

% Last Modified by GUIDE v2.5 07-Feb-2018 15:56:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppTurn_OpeningFcn, ...
                   'gui_OutputFcn',  @AppTurn_OutputFcn, ...
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

% --- Executes just before AppTurn is made visible.
function AppTurn_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppTurn (see VARARGIN)
% Choose default command line output for AppTurn
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes AppTurn wait for user response (see UIRESUME)
% uiwait(handles.TurnPerf);
% Mudar o idioma
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.TurnPerf.Name = 'Curva';
        handles.Title.String = 'CURVA';
        handles.nPanel.Title = 'Fator de carga';
            handles.nImport.String = {'Entrada do usuário';'Importar Gráfico A';...
                'Importar Gráfico B';'Importar Gráfico C';'Importar Gráfico D'};
        handles.SpeedPanel.Title = 'Velocidade';
            handles.SpeedImport.String = {'Entrada do usuário';'Importar Gráfico A';...
                'Importar Gráfico B';'Importar Gráfico C';'Importar Gráfico D'};
        handles.uibuttongroup2.Title = 'Métodos de correção de dados';
            handles.WCorr.String = 'Peso';
            handles.RoCorr.String = 'Densidade';
        handles.uipanel3.Title = 'Referência';
        handles.uipanel4.Title = 'Teste';
        handles.Calculate.String = 'Calcular';
    else                                                                    % Inglês
        handles.TurnPerf.Name = 'Turn';
        handles.Title.String = 'TURN';
        handles.nPanel.Title = 'Load factor';
            handles.nImport.String = {'User input';'Import Plot A';...
                'Import Plot B';'Import Plot C';'Import Plot D'};
        handles.SpeedPanel.Title = 'Speed';
            handles.SpeedImport.String = {'User input';'Import Plot A';...
                'Import Plot B';'Import Plot C';'Import Plot D'};
        handles.uibuttongroup2.Title = 'Data correction methods';
            handles.WCorr.String = 'Weight';
            handles.RoCorr.String = 'Density';
        handles.uipanel3.Title = 'Standard';
        handles.uipanel4.Title = 'Test';
        handles.Calculate.String = 'Calculate';
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppTurn_OutputFcn(hObject, eventdata, handles) 
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
n = str2double(handles.n.String);
V = str2double(handles.V.String);
Wt = str2double(handles.Wt.String);
Rot = str2double(handles.Rot.String);
g = 9.8; Ig = 0;                                                            % Esse valor não precisa de precisão maior, pois não afeta no resultado arredondado

In = str2double(handles.In.String);
IV = str2double(handles.IV.String);
IW = str2double(handles.IWt.String);
IRo = str2double(handles.IRot.String);
if isnan(In)                                                                % Caso o usuário não informe o valor da incerteza,...
    In = 0;                                                                 % ... ela será igualada a zero.
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
if isnan(n)
    n = 0;
end

n = n - str2double(handles.nTar.String);                                    % Fator de carga tarado
N = n;                                                                      % Fator de carga sem correção

if handles.BTCAS.Value                                                      % Caso a velocidade informada seja CAS, calcula-se TAS
    Vt = V*sqrt(1.225/Rot);                                                 % TAS
    IVt = sqrt((sqrt(1.225/Rot)*IV)^2 + (0.553399*V*(1/Rot)^1.5*IRo)^2);    % Incerteza da velocidade
else
    Vt = V;
    IVt = IV;
end

% Peso
if handles.WCorr.Value == 1                                                 % Caso o checkbox esteja marcado, o fator de carga medido será modificado
	n = n * Wt/Wref;                                                        % Correção do fator de carga
    FInW = Wt/Wref;                                                         % Parcela multiplicadora da incerteza relacionada com n medido
    IWn = N/Wref * IW;                                                      % Parcela da incerteza relacionada com o peso
else
    FInW = 1;                                                               % Parcela multiplicadora da incerteza relacionada com n medido
    IWn = 0;                                                                % Parcela da incerteza relacionada com o peso
end

% Densidade
if handles.RoCorr.Value == 1                                                % Caso o checkbox esteja marcado, o fator de carga medido será modificado
	n = n * (Roref/Rot)^(5.255863/4.255863);                                % Correção do fator de carga
    FInRo = (Roref/Rot)^(5.255863/4.255863);                                % Parcela multiplicadora da incerteza relacionada com n medido
    IRon = N * FInW * (1.23497*(Roref/Rot)^1.23497)/Rot * IRo;              % Parcela da incerteza relacionada com a densidade do ar
    IWn = IWn * (Roref/Rot)^(5.255863/4.255863);                            % Parcela da incerteza relacionada com o peso
else
    IRon = 0;                                                               % Parcela da incerteza relacionada com a densidade do ar
    FInRo = 1;                                                              % Parcela multiplicadora da incerteza relacionada com n medido
end


Inn = FInW * FInRo * In;                                                    % Parcela da incerteza relacionada com o fator de carga medido
In = sqrt(IWn^2+IRon^2+Inn^2);                                              % Incerteza total do fator de carga

R = Vt^2/(g*sqrt(n^2-1));                                                   % Raio da curva
    IVtR = 2*Vt/(g*sqrt(n^2-1)) * IVt;                                      % Teoricamente, caso seja informado CAS, precisaria calcular IRo
    InR = n*Vt^2/(g*(n^2-1)^1.5) * In;                                      % No entando, essa incerteza é muito pequena e pouco altera o resultado final
    IgR = Vt^2/(g^2*sqrt(n^2-1)) * Ig;
    IR = sqrt(IVtR^2+InR^2+IgR^2);                                          % Incerteza do raio da curva
    
w = rad2deg(g*sqrt(n^2-1)/Vt);                                              % Velocidade angular
    IVtw = g*sqrt(n^2-1)/Vt^2 * IVt;                                        
    Inw = g*n/(sqrt(n^2-1)*Vt) * In;
    Igw = sqrt(n^2-1)/Vt * Ig;
    Iw = rad2deg(sqrt(IVtw^2+Inw^2+Igw^2));                                 % Incerteza da velocidade angular
    
phi = acos(1/n) * 180/pi();                                                 % Ângulo de inclinação lateral
    Iphi = 180/(pi()*sqrt(1-1/n^2)*n^2) * In;                               % Incerteza do ângulo de inclinação lateral

if In ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(n,In);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(n,abs(In/n)*100);
    handles.nR.String = strcat('n =',{' '},MediaStr,' ±',{' '},SDOMStr);
    handles.nRP.String = strcat('n =',{' '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.nR.String = strcat('n =',{' '},num2str(n));
    handles.nRP.String = strcat('n =',{' '},num2str(n));
end

if IVt ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(Vt,IVt);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(Vt,abs(IVt/Vt)*100);
    handles.VtR.String = strcat('Vt =',{' '},MediaStr,' ±',{' '},SDOMStr);
    handles.VtRP.String = strcat('Vt =',{' '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.VtR.String = strcat('Vt =',{' '},num2str(Vt));
    handles.VtRP.String = strcat('Vt =',{' '},num2str(Vt));
end

if IR ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(R,IR);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(R,abs(IR/R)*100);
    handles.RR.String = strcat('R =',{' '},MediaStr,' ±',{' '},SDOMStr);
    handles.RRP.String = strcat('R =',{' '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.RR.String = strcat('R =',{' '},num2str(R));
    handles.RRP.String = strcat('R =',{' '},num2str(R));
end

wS = char(969);                                                             % String com a letra grega omega
if Iw ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(w,Iw);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(w,abs(Iw/w)*100);
    handles.OmegaR.String = strcat(wS,{' = '},MediaStr,' ±',{' '},SDOMStr);
    handles.OmegaRP.String = strcat(wS,{' = '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.OmegaR.String = strcat(wS,{' = '},num2str(w));
    handles.OmegaRP.String = strcat(wS,{' = '},num2str(w));
end

phiS = char(966);                                                           % String com a letra grega phi
if Iphi ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(phi,Iphi);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(phi,abs(Iphi/phi)*100);
    handles.PhiR.String = strcat(phiS,{' = '},MediaStr,' ±',{' '},SDOMStr);
    handles.PhiRP.String = strcat(phiS,{' = '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.PhiR.String = strcat(phiS,{' = '},num2str(phi));
    handles.PhiRP.String = strcat(phiS,{' = '},num2str(phi));
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

% --- Executes on button press in WCorr.
function WCorr_Callback(hObject, eventdata, handles)
% hObject    handle to WCorr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of WCorr
n = 'on';
f = 'off';

if hObject.Value                                                            % Caso a correção do peso seja abilitada, suas "caixas" também serão
    handles.WrefS.Enable = n;
    handles.Wref.Enable = n;
    
    handles.WtS.Enable = n;
    handles.Wt.Enable = n;
    handles.WPM.Enable = n;
    handles.IWt.Enable = n;
else                                                                        % O mesmo vale para quando desabilitado
    handles.WrefS.Enable = f;
    handles.Wref.Enable = f;
    
    handles.WtS.Enable = f;
    handles.Wt.Enable = f;
    handles.WPM.Enable = f;
    handles.IWt.Enable = f;
end

% --- Executes on button press in RoCorr.
function RoCorr_Callback(hObject, eventdata, handles)
% hObject    handle to RoCorr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of RoCorr
n = 'on';
f = 'off';

if hObject.Value                                                            % Caso a correção da densidade seja abilitada, suas "caixas" também serão
    handles.RorefS.Enable = n;
    handles.Roref.Enable = n;
    
    handles.RotS.Enable = n;
    handles.Rot.Enable = n;
    handles.RoPM.Enable = n;
    handles.IRot.Enable = n;
else                                                                        % O mesmo vale para quando desabilidato
    handles.RorefS.Enable = f;
    handles.Roref.Enable = f;
    if handles.BTTAS.Value                                                  % No entanto, caso CAS esteja selecionado, a densidade do teste continua abilitada. Ela é necessária para calcular TAS
        handles.RotS.Enable = f;
        handles.Rot.Enable = f;
        handles.RoPM.Enable = f;
        handles.IRot.Enable = f;
    end
end

% --- Executes on selection change in SpeedImport.
function SpeedImport_Callback(hObject, eventdata, handles)
% hObject    handle to SpeedImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns SpeedImport contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SpeedImport
if hObject.Value == 1                                                       % Os dados serão manualmente informados. Nos outros casos, eles vêm do ICXS
    handles.IVAS.Enable = 'off';
    handles.IVA.Enable = 'off';                                             % Manualmente, é considerado que a incertiza tipo A é zero
    handles.IVA.String = '';
    handles.IV.String = handles.IVB.String;
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
            handles.IVAS.Enable = 'on';
            handles.IVA.Enable = 'inactive';
        case 3
            lin = get(ICXSData.XS1_2,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_2,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_2,'Ylim');                              % Limites de Y
            handles.IVAS.Enable = 'on';
            handles.IVA.Enable = 'inactive';
        case 4
            lin = get(ICXSData.XS1_3,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_3,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_3,'Ylim');                              % Limites de Y
            handles.IVAS.Enable = 'on';
            handles.IVA.Enable = 'inactive';
        case 5
            lin = get(ICXSData.XS1_4,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_4,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_4,'Ylim');                              % Limites de Y
            handles.IVAS.Enable = 'on';
            handles.IVA.Enable = 'inactive';
    end
    XDataTot = get(lin,'Xdata');                                            % Todos dados da variável plotada em X
    YDataTot = get(lin,'Ydata');                                            % Todos dados da variável plotada em Y
    VV = YDataTot(find(XDataTot>=Xlim(1) & XDataTot<=Xlim(2) &...           % Dados a serem analisados (valores para velocidade)
        YDataTot>=Ylim(1) & YDataTot<=Ylim(2)));
    V = mean(VV);                                                           % Média
    IVA = std(VV);                                                          % Desvio padrão
%     IVB = str2double(handles.IVB.String);                                   % Incerteza tipo B, indicada pelo usuário
%     if isnan(IVB)                                                           % Caso o usuário não informe o valor da incerteza,...
%         IVB = 0;                                                            % ... ela será igualada a zero.
%     end    
%     IV = sqrt((IVB)^2+(IVA)^2);                                             % Incerteza da velocidade
        
    handles.IVA.String = num2str(IVA);
    handles.V.String = num2str(V);
%     handles.IV.String = num2str(IV);    
else
    hObject.Value = 1;                                                      % Caso o ICXS não esteja aberto, a opção do popupmenu volta a ser o input do usuário
end

% --- Executes during object creation, after setting all properties.
function SpeedImport_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SpeedImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function V_Callback(hObject, eventdata, handles)
% hObject    handle to V (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of V as text
%        str2double(get(hObject,'String')) returns contents of V as a double

% --- Executes during object creation, after setting all properties.
function V_CreateFcn(hObject, eventdata, handles)
% hObject    handle to V (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IVB_Callback(hObject, eventdata, handles)
% hObject    handle to IVB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IVB as text
%        str2double(get(hObject,'String')) returns contents of IVB as a double
% if handles.SpeedImport.Value == 1                                           % Caso não exista incerteza do tipo A, a incerteza da velocidade será igual a do tipo B
%     handles.IV.String = hObject.String;
% else
%     IVA = str2double(handles.IVA.String);
%     IVB = str2double(hObject.String);
%     if isnan(IVB)                                                           % Caso o usuário não informe o valor da incerteza,...
%         IVB = 0;                                                            % ... ela será igualada a zero.
%     end
%     IV = sqrt((IVB)^2+(IVA)^2);                                             % Incerteza da velocidade
%     
%     handles.IV.String = num2str(IV);
% end

% --- Executes during object creation, after setting all properties.
function IVB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IVB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IVA_Callback(hObject, eventdata, handles)
% hObject    handle to IVA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IVA as text
%        str2double(get(hObject,'String')) returns contents of IVA as a double

% --- Executes during object creation, after setting all properties.
function IVA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IVA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IV_Callback(hObject, eventdata, handles)
% hObject    handle to IV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IV as text
%        str2double(get(hObject,'String')) returns contents of IV as a double

% --- Executes during object creation, after setting all properties.
function IV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in nImport.
function nImport_Callback(hObject, eventdata, handles)
% hObject    handle to nImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns nImport contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nImport
if hObject.Value == 1                                                       % Os dados serão manualmente informados. Nos outros casos, eles vêm do ICXS
    handles.InAS.Enable = 'off';
    handles.InA.Enable = 'off';                                             % Manualmente, é considerado que a incertiza tipo A é zero
    handles.InA.String = '';
    handles.In.String = handles.InB.String;
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
            handles.InAS.Enable = 'on';
            handles.InA.Enable = 'inactive';
        case 3
            lin = get(ICXSData.XS1_2,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_2,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_2,'Ylim');                              % Limites de Y
            handles.InAS.Enable = 'on';
            handles.InA.Enable = 'inactive';
        case 4
            lin = get(ICXSData.XS1_3,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_3,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_3,'Ylim');                              % Limites de Y
            handles.InAS.Enable = 'on';
            handles.InA.Enable = 'inactive';
        case 5
            lin = get(ICXSData.XS1_4,'children');                           % Recebe os dados plotados no ICXS
            Xlim = get(ICXSData.XS1_4,'Xlim');                              % Limites de X
            Ylim = get(ICXSData.XS1_4,'Ylim');                              % Limites de Y
            handles.InAS.Enable = 'on';
            handles.InA.Enable = 'inactive';
    end
    XDataTot = get(lin,'Xdata');                                            % Todos dados da variável plotada em X
    YDataTot = get(lin,'Ydata');                                            % Todos dados da variável plotada em Y
    nV = YDataTot(find(XDataTot>=Xlim(1) & XDataTot<=Xlim(2) &...           % Dados a serem analisados (valores para o fator de carga)
        YDataTot>=Ylim(1) & YDataTot<=Ylim(2)));
    n = mean(nV);                                                           % Média
    InA = std(nV);                                                          % SDOM
%     InB = str2double(handles.InB.String);                                   % Incerteza tipo B, indicada pelo usuário
%     if isnan(InB)                                                           % Caso o usuário não informe o valor da incerteza,...
%         InB = 0;                                                            % ... ela será igualada a zero.
%     end
%     In = sqrt((InB)^2+(InA)^2);                                             % Incerteza do fator de carga
        
    handles.InA.String = num2str(InA);
    handles.n.String = num2str(n);
%     handles.In.String = num2str(In);    
else
    hObject.Value = 1;                                                      % Caso o ICXS não esteja aberto, a opção do popupmenu volta a ser o input do usuário
end

% --- Executes during object creation, after setting all properties.
function nImport_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double

% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function InB_Callback(hObject, eventdata, handles)
% hObject    handle to InB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of InB as text
%        str2double(get(hObject,'String')) returns contents of InB as a double
% if handles.nImport.Value == 1                                               % Caso não exista incerteza do tipo A, a incerteza do fator de carga será igual a do tipo B
%     handles.In.String = hObject.String;
% else
%     InA = str2double(handles.InA.String);
%     InB = str2double(hObject.String);
%     if isnan(InB)                                                           % Caso o usuário não informe o valor da incerteza,...
%         InB = 0;                                                            % ... ela será igualada a zero.
%     end
%     In = sqrt((InB)^2+(InA)^2);                                             % Incerteza do fator de carga
%     
%     handles.In.String = num2str(In);
% end

% --- Executes during object creation, after setting all properties.
function InB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function InA_Callback(hObject, eventdata, handles)
% hObject    handle to InA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of InA as text
%        str2double(get(hObject,'String')) returns contents of InA as a double

% --- Executes during object creation, after setting all properties.
function InA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function In_Callback(hObject, eventdata, handles)
% hObject    handle to In (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of In as text
%        str2double(get(hObject,'String')) returns contents of In as a double

% --- Executes during object creation, after setting all properties.
function In_CreateFcn(hObject, eventdata, handles)
% hObject    handle to In (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nTar_Callback(hObject, eventdata, handles)
% hObject    handle to nTar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of nTar as text
%        str2double(get(hObject,'String')) returns contents of nTar as a double

% --- Executes during object creation, after setting all properties.
function nTar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nTar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in BTTAS.
function BTTAS_Callback(hObject, eventdata, handles)
% hObject    handle to BTTAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of BTTAS
f = 'off';
if hObject.Value == 1 && handles.RoCorr.Value == 0                          % Caso a velocidade informada seja TAS e não haja correção da densidade, as caixas dela podem ser desativadas
    handles.RotS.Enable = f;
    handles.Rot.Enable = f;
    handles.RoPM.Enable = f;
    handles.IRot.Enable = f;
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
