function varargout = AppTOL(varargin)
% APPTOL MATLAB code for AppTOL.fig
%      APPTOL, by itself, creates a new APPTOL or raises the existing
%      singleton*.
%
%      H = APPTOL returns the handle to a new APPTOL or the handle to
%      the existing singleton*.
%
%      APPTOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPTOL.M with the given input arguments.
%
%      APPTOL('Property','Value',...) creates a new APPTOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppTOL_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppTOL_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE'st Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppTOL

% Last Modified by GUIDE v2.5 25-Jul-2019 21:17:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppTOL_OpeningFcn, ...
                   'gui_OutputFcn',  @AppTOL_OutputFcn, ...
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


% --- Executes just before AppTOL ist made visible.
function AppTOL_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppTOL (see VARARGIN)

% Choose default command line output for AppTOL
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AppTOL wait for user response (see UIRESUME)
% uiwait(handles.TOL);
% Mudar o idioma
rho = char(961);
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.TOL.Name = 'Decolagem e pouso';
        handles.Title.String = 'DECOLAGEM E POUSO';
        handles.BG.Title = 'Desempenho em solo';
            handles.TO.String = 'Decolagem';
            handles.La.String = 'Pouso';
        handles.PW.Title = 'Correção do vento';
        handles.PTWD.Title = 'Correção do empuxo, peso e densidade';
            handles.WrS.String = 'Wref =';
            handles.RorS.String = [rho,'ref ='];
            handles.NrS.String = 'Tref =';
%             handles.ParS.String = 'Paref =';
        handles.Calculate.String = 'Calcular';
    else                                                                    % Inglês
        handles.TOL.Name = 'Takeoff and landing';
        handles.Title.String = 'TAKEOFF AND LANDING';
        handles.BG.Title = 'Ground performance';
            handles.TO.String = 'Take off';
            handles.La.String = 'Landing';
        handles.PW.Title = 'Wind correction';
        handles.PTWD.Title = 'Thrust, weight, and density correction';
            handles.WrS.String = 'Wstd =';
            handles.RorS.String = [rho,'std ='];
            handles.NrS.String = 'Tstd =';
%             handles.ParS.String = 'Pastd =';
        handles.Calculate.String = 'Calculate';
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppTOL_OutputFcn(hObject, eventdata, handles) 
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
if handles.TO.Value == 1
    %% Decolagem
    Vw = str2double(handles.Vw.String);% Vento de proa: Vw>0
    V = str2double(handles.V.String);% Ground velocity (GPS)
    Wr = str2double(handles.Wr.String);
    Wt = str2double(handles.Wt.String);
    Rot = str2double(handles.Rot.String);
    Ror = str2double(handles.Ror.String);
    St = str2double(handles.St.String);
    %Par = 101325.0 * ((Ror/1.225)^(1/4.255863))^5.225863;
    Nt = str2double(handles.Nt.String)+273.15; % Temperatura
    Nr = str2double(handles.Nr.String)+273.15;
    
    IVw = str2double(handles.IVw.String);
    IV = str2double(handles.IV.String);
    IWt = str2double(handles.IWt.String);
    IRot = str2double(handles.IRot.String);
    ISt = str2double(handles.ISt.String);
    INt = str2double(handles.INt.String);
    
    
    Sr = St .* (1+Vw./V).^1.85 .* (Wr./Wt).^2.4 .* (Rot./Ror).^2.4 .* (Nr./Nt).^0.5;
    
    ISSt = (1+Vw./V).^1.85 .* (Wr./Wt).^2.4 .* (Rot./Ror).^2.4 .* (Nr./Nt).^0.5 .* ISt;
    
    ISVw = 1.85 * St .* (1+Vw./V).^0.85 .* (Wr./Wt).^2.4 .* (Rot./Ror).^2.4 .* (Nr./Nt).^0.5 ./ V .* IVw;
    
    ISV = -1.85 * St .* Vw .* (1+Vw./V).^0.85 .* (Wr./Wt).^2.4 .* (Rot./Ror).^2.4 .* (Nr./Nt).^0.5 ./ V.^2 .* IV;
    
    ISWt = - 2.4 * St .* (1+Vw./V).^1.85 .* (Wr./Wt).^2.4 .* (Rot./Ror).^2.4 .* (Nr./Nt).^0.5 ./ Wt .* IWt;
    
    ISRot = 1.9 * St .* (1+Vw./V).^1.85 .* (Wr./Wt).^2.4 .* (Rot./Ror).^1.4 .* (Nr./Nt).^0.5 ./ Ror .* IRot;
    
    ISNt = -0.5 * St .* (1+Vw./V).^1.85 .* (Wr./Wt).^2.4 .* (Rot./Ror).^2.4 .* (Nr./Nt).^0.5 ./ Nt .* INt;
    
    
    
    IS = sqrt(ISSt.^2 + ISWt.^2 + ISV.^2 + ISVw.^2 + ISRot.^2 + ISNt.^2);
else
    %% Pouso
    
    Vw = str2double(handles.Vw.String);% Vento de proa: Vw>0
    V = str2double(handles.V.String);% Ground velocity (GPS)
    Wr = str2double(handles.Wr.String);
    Wt = str2double(handles.Wt.String);
    Rot = str2double(handles.Rot.String);
    Ror = str2double(handles.Ror.String);
    St = str2double(handles.St.String);
        
    IVw = str2double(handles.IVw.String);
    IV = str2double(handles.IV.String);
    IWt = str2double(handles.IWt.String);
    IRot = str2double(handles.IRot.String);
    ISt = str2double(handles.ISt.String);
      
    
    Sr = St .* (1+Vw./V).^1.85 .* (Wr./Wt).^2 .* (Rot./Ror);
    
    
    ISSt = (1+Vw./V).^1.85 .* (Wr./Wt).^2 .* (Rot./Ror) .* ISt;
    
    ISWt = -2 * St .* (1+Vw./V).^1.85 .* (Wr).^2 .* (Rot./Ror) ./ Wt.^3 .* IWt;
    
    ISV = - 1.85 * St .* Vw .* (1+Vw./V).^0.85 .* (Wr./Wt).^2 .* (Rot./Ror)./V.^2 .* IV;
    
    ISVw = 1.85 * St .* (1+Vw./V).^0.85 .* (Wr./Wt).^2 .* (Rot./Ror)./V .* IVw;
    
    ISRot = St .* (1+Vw./V).^1.85 .* (Wr./Wt).^2 .* (1./Ror) .* IRot;
    
    IS = sqrt(ISSt.^2 + ISWt.^2 + ISV.^2 + ISVw.^2 + ISRot.^2);
end

if IS ~= 0
    [MediaR,InctR,MediaStr,SDOMStr] = f_Round(Sr,IS);
    [Not1,InctRel,Not2,SDOMRelStr] = f_Round(Sr,abs(IS/Sr)*100);
    handles.Result.String = strcat('S =',{' '},MediaStr,' ±',{' '},SDOMStr);
    handles.ResultP.String = strcat('S =',{' '},MediaStr,' ±',{' '},SDOMRelStr,'%');
else
    handles.Result.String = strcat('S =',{' '},num2str(Sr));
    handles.ResultP.String = strcat('S =',{' '},num2str(Sr));
end

function St_Callback(hObject, eventdata, handles)
% hObject    handle to St (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of St as text
%        str2double(get(hObject,'String')) returns contents of St as a double


% --- Executes during object creation, after setting all properties.
function St_CreateFcn(hObject, eventdata, handles)
% hObject    handle to St (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ISt_Callback(hObject, eventdata, handles)
% hObject    handle to ISt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ISt as text
%        str2double(get(hObject,'String')) returns contents of ISt as a double


% --- Executes during object creation, after setting all properties.
function ISt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ISt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TO.
function TO_Callback(hObject, eventdata, handles)
% hObject    handle to TO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of TO
handles.Nt.Enable = 'on';
handles.INt.Enable = 'on';
handles.Nr.Enable = 'on';
handles.NrS.Enable = 'on';
handles.text23.Enable = 'on';
handles.text24.Enable = 'on';


% --- Executes on button press in La.
function La_Callback(hObject, eventdata, handles)
% hObject    handle to La (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of La
handles.Nt.Enable = 'off';
handles.INt.Enable = 'off';
handles.Nr.Enable = 'off';
handles.NrS.Enable = 'off';
handles.text23.Enable = 'off';
handles.text24.Enable = 'off';


function Ror_Callback(hObject, eventdata, handles)
% hObject    handle to Ror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Ror as text
%        str2double(get(hObject,'String')) returns contents of Ror as a double
% Ror = str2double(hObject.String);
% Par = 101325.0 * ((Ror/1.225)^(1/4.255863))^5.225863;
% handles.Par.String = num2str(Par,7);


% --- Executes during object creation, after setting all properties.
function Ror_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ror (see GCBO)
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



function Wr_Callback(hObject, eventdata, handles)
% hObject    handle to Wr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wr as text
%        str2double(get(hObject,'String')) returns contents of Wr as a double


% --- Executes during object creation, after setting all properties.
function Wr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wr (see GCBO)
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



function Vw_Callback(hObject, eventdata, handles)
% hObject    handle to Vw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vw as text
%        str2double(get(hObject,'String')) returns contents of Vw as a double


% --- Executes during object creation, after setting all properties.
function Vw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IVw_Callback(hObject, eventdata, handles)
% hObject    handle to IVw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IVw as text
%        str2double(get(hObject,'String')) returns contents of IVw as a double


% --- Executes during object creation, after setting all properties.
function IVw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IVw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Nr_Callback(hObject, eventdata, handles)
% hObject    handle to Nr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nr as text
%        str2double(get(hObject,'String')) returns contents of Nr as a double


% --- Executes during object creation, after setting all properties.
function Nr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Nt_Callback(hObject, eventdata, handles)
% hObject    handle to Nt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nt as text
%        str2double(get(hObject,'String')) returns contents of Nt as a double


% --- Executes during object creation, after setting all properties.
function Nt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function INt_Callback(hObject, eventdata, handles)
% hObject    handle to INt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of INt as text
%        str2double(get(hObject,'String')) returns contents of INt as a double


% --- Executes during object creation, after setting all properties.
function INt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to INt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Par_Callback(hObject, eventdata, handles)
% hObject    handle to Par (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Par as text
%        str2double(get(hObject,'String')) returns contents of Par as a double


% --- Executes during object creation, after setting all properties.
function Par_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Par (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pat_Callback(hObject, eventdata, handles)
% hObject    handle to Pat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pat as text
%        str2double(get(hObject,'String')) returns contents of Pat as a double


% --- Executes during object creation, after setting all properties.
function Pat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IPat_Callback(hObject, eventdata, handles)
% hObject    handle to IPat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IPat as text
%        str2double(get(hObject,'String')) returns contents of IPat as a double


% --- Executes during object creation, after setting all properties.
function IPat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IPat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CalcTstd.
function CalcTstd_Callback(hObject, eventdata, handles)
% hObject    handle to CalcTstd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ror = str2double(handles.Ror.String);
Tar = 288.15 * (Ror/1.225)^(1/4.255863)-273.15;
handles.Nr.String = num2str(Tar,3);
