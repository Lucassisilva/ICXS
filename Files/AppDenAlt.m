function varargout = AppDenAlt(varargin)
% APPDENALT MATLAB code for AppDenAlt.fig
%      APPDENALT, by itself, creates a new APPDENALT or raises the existing
%      singleton*.
%
%      H = APPDENALT returns the handle to a new APPDENALT or the handle to
%      the existing singleton*.
%
%      APPDENALT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPDENALT.M with the given input arguments.
%
%      APPDENALT('Property','Value',...) creates a new APPDENALT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppDenAlt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppDenAlt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppDenAlt

% Last Modified by GUIDE v2.5 09-Jan-2018 18:53:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppDenAlt_OpeningFcn, ...
                   'gui_OutputFcn',  @AppDenAlt_OutputFcn, ...
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

% --- Executes just before AppDenAlt is made visible.
function AppDenAlt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppDenAlt (see VARARGIN)

% Choose default command line output for AppDenAlt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes AppDenAlt wait for user response (see UIRESUME)
% uiwait(handles.DenAlt);

% Introduction to error analysis, the study of uncertainties in physical measurements, Taylor
% https://wahiduddin.net/calc/density_altitude.htm

% Mudar o idioma
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.DenAlt.Name = 'Altitude Densidade';
        handles.Title.String = 'Altitude Densidade';
        handles.TxtTemp.String = 'Temperatura [°C]';
        handles.TxtPress.String = 'Pressão [Pa]';
        handles.TxtRH.String = 'Umidade relativa (%)';
        handles.TxtD1.String = 'Densidade [kg/m³]';
        handles.TxtAD1.String = 'A. densidade [m]';
        handles.TxtD2.String = 'Densidade [kg/m³]';
        handles.TxtAD2.String = 'A. densidade [m]';
        handles.Calculate.String = 'Calcular';
    else                                                                    % Inglês
        handles.DenAlt.Name = 'Density altitude';
        handles.Title.String = 'DENSITY ALTITUDE';
        handles.TxtTemp.String = 'Temperature [°C]';
        handles.TxtPress.String = 'Pressure [Pa]';
        handles.TxtRH.String = 'Relative humidity (%)';
        handles.TxtD1.String = 'Density [kg/m³]';
        handles.TxtAD1.String = 'D. altitude [m]';
        handles.TxtD2.String = 'Density [kg/m³]';
        handles.TxtAD2.String = 'D. altitude [m]';
        handles.Calculate.String = 'Calculate';
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppDenAlt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function Dens1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dens1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function Temp_Callback(hObject, eventdata, handles)
% hObject    handle to Temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Temp as text
%        str2double(get(hObject,'String')) returns contents of Temp as a double

% --- Executes during object creation, after setting all properties.
function Temp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Press_Callback(hObject, eventdata, handles)
% hObject    handle to Press (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Press as text
%        str2double(get(hObject,'String')) returns contents of Press as a double

% --- Executes during object creation, after setting all properties.
function Press_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Press (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function RH_Callback(hObject, eventdata, handles)
% hObject    handle to RH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of RH as text
%        str2double(get(hObject,'String')) returns contents of RH as a double

% --- Executes during object creation, after setting all properties.
function RH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in CalcDen.
function CalcDen_Callback(hObject, eventdata, handles)
% hObject    handle to CalcDen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AD = str2double(handles.AD2.String);                                        % Recebe valor da altitude densidade
ro = (1-AD/(0.3048*145539))^(2/0.4699)*1.225;                               % Calcula valor da densidade
% ro = ((44.3308 - AD/1000)/(42.2665))^(1/0.234969);
% Iro = 1.0069e-04*(1.0488 - (2*AD)/84533)^(3.2559)*IAD;
set(handles.Dens2,'String',num2str(ro));                                    % Apresenta valor da densidade

% --- Executes on button press in CalcDA.
function CalcDA_Callback(hObject, eventdata, handles)
% hObject    handle to CalcDA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.Dens1.String
ro = str2double(handles.Dens2.String);                                      % Recebe valor da densidade
AD = 0.3048*145539*(1-sqrt(ro/1.225)^0.4699);                               % Calcula valor da altitude densidade
% AD = (44.3308-42.2665*ro^0.234969)*1000;    
% IAD = 42266.5*0.234969*ro^(-0.765031)*Iro;
handles.AD2.String = num2str(round(AD));                                    % Apresenta valor da altitude densidade

function Dens2_Callback(hObject, eventdata, handles)
% hObject    handle to Dens1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Dens1 as text
%        str2double(get(hObject,'String')) returns contents of Dens1 as a double
ro = str2double(hObject.String);                                            % Recebe valor da densidade
AD = 0.3048*145539*(1-sqrt(ro/1.225)^0.4699);                               % Calcula valor da altitude densidade
% AD = (44.3308-42.2665*ro^0.234969)*1000;
% IAD = 42266.5*0.234969*ro^(-0.765031)*Iro;
handles.AD2.String = num2str(round(AD));                                    % Apresenta valor da altitude densidade

function AD2_Callback(hObject, eventdata, handles)
% hObject    handle to AD2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of AD2 as text
%        str2double(get(hObject,'String')) returns contents of AD2 as a double
AD = str2double(hObject.String);                                            % Recebe valor da altitude densidade
ro = (1-AD/(0.3048*145539))^(2/0.4699)*1.225;                               % Calcula valor da densidade
% ro = ((44.3308 - AD/1000)/(42.2665))^(1/0.234969);                          
% Iro = 1.0069e-04*(1.0488 - (2*AD)/84533)^(3.2559)*IAD;
set(handles.Dens2,'String',num2str(ro));                                    % Apresenta valor da densidade

function Dens2_CreateFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function AD2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ITemp_Callback(hObject, eventdata, handles)
% hObject    handle to ITemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of ITemp as text
%        str2double(get(hObject,'String')) returns contents of ITemp as a double

% --- Executes during object creation, after setting all properties.
function ITemp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ITemp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IPress_Callback(hObject, eventdata, handles)
% hObject    handle to IPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IPress as text
%        str2double(get(hObject,'String')) returns contents of IPress as a doubl

% --- Executes during object creation, after setting all properties.
function IPress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IRH_Callback(hObject, eventdata, handles)
% hObject    handle to IRH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of IRH as text
%        str2double(get(hObject,'String')) returns contents of IRH as a double

% --- Executes during object creation, after setting all properties.
function IRH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IRH (see GCBO)
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
Tm = str2double(get(handles.Temp,'String'));                                % Recebe valor da temperatura [°C]
Pm = str2double(get(handles.Press,'String'));                               % Recebe valor da pressão [Pa]
RHm = str2double(get(handles.RH,'String'))/100;                             % Recebe valor da humidade relativa e transforma para ()
ITm = str2double(get(handles.ITemp,'String'));                              % Recebe valor da incerteza da temperatura [°C]
IPm = str2double(get(handles.IPress,'String'));                             % Recebe valor da incerteza da pressão [Pa]
IRHm = str2double(get(handles.IRH,'String'))/100;                           % Recebe valor da incerteza da humidade relativa e transforma para ()
                             
Es = 6.1078 * exp((17.2694*Tm)/(237.3+Tm))*100;                             % Pressão de vapor de água saturada [Pa]

Pv = RHm * Es;                                                              % Pressão de vapor de água [Pa]
ro = (Pm/(287.05*(Tm+273.15)))*(1-0.378*Pv/Pm);                             % Densidade [kg/m3]
IroRHm = abs((0.804302*exp((17.2694*Tm)/(237.3+Tm)))/(273.15+Tm))*IRHm;
IroPm = abs(1/(287.05*(Tm+273.15)))*IPm;
IroTm = abs((RHm*exp((17.2694*Tm)/(Tm+237.3))*((0.804302*Tm-2914.33)*Tm-855025)+Pm*((-0.00348371*Tm-1.65337)*Tm-196.172))/((Tm+237.3)^2*(Tm+273.15)^2))*ITm;
Iro = sqrt(IroRHm^2+IroPm^2+IroTm^2);                                       % Incerteza da densidade [kg/m3]
AD = 0.3048*145539*(1-sqrt(ro/1.225)^0.4699);                               % Altitude Densidade [m]
IAD = 9937.16*ro^(-0.76505)*Iro;                                            % Incerteza da altitude densidade [m]


if Iro                                                                      % Caso a incerteza seja igual a 0, significa que não há incerteza, então não arredonda e n é apresentado
    [Mediaro,Inctro,roStr,IroStr] = f_Round(ro,Iro);                        % Arredonda valor da densidade e sua incerteza
    [MediaAD,InctAD,ADStr,IADStr] = f_Round(AD,IAD);                        % Arredonda valor da altitude densidade e sua incerteza
    [Media,Inct,MediaStr,IroRelStr] = f_Round(AD,Iro/ro*100);               % Arredonda valor da densidade relativa
    [Media,Inct,MediaStr,IADRelStr] = f_Round(AD,IAD/AD*100);               % Arredonda valor da altitude densidade relativa
    
    % Apresenta resultados no programa
    handles.Dens1.String = strcat(roStr,'±',IroStr);
    handles.AD1.String = strcat(ADStr,'±',IADStr);
    handles.Dens1r.String = strcat(roStr,'±',IroRelStr,'%');
    handles.AD1r.String = strcat(ADStr,'±',IADRelStr,'%');
else
    handles.Dens1.String = num2str(ro);
    handles.AD1.String = num2str(AD);
    handles.Dens1r.String = '';
    handles.AD1r.String = '';
end

function Dens1_Callback(hObject, eventdata, handles)
% hObject    handle to Dens1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Dens1 as text
%        str2double(get(hObject,'String')) returns contents of Dens1 as a double
