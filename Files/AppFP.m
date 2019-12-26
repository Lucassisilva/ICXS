function varargout = AppFP(varargin)
% APPFP MATLAB code for AppFP.fig
%      APPFP, by itself, creates a new APPFP or raises the existing
%      singleton*.
%
%      H = APPFP returns the handle to a new APPFP or the handle to
%      the existing singleton*.
%
%      APPFP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPFP.M with the given input arguments.
%
%      APPFP('Property','Value',...) creates a new APPFP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppFP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppFP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppFP

% Last Modified by GUIDE v2.5 24-Jul-2018 15:39:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppFP_OpeningFcn, ...
                   'gui_OutputFcn',  @AppFP_OutputFcn, ...
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

% --- Executes just before AppFP is made visible.
function AppFP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppFP (see VARARGIN)

% Choose default command line output for AppFP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AppFP wait for user response (see UIRESUME)
% uiwait(handles.AppFP);
% Mudar o idioma
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.AppFP.Name = 'Trajetória de voo';
        handles.Title.String = 'TRAJETÓRIA DE VOO';
        handles.DataPanel.Title = 'Dados para plotar';
        handles.uibuttongroup1.Title = 'Sistema de coordenadas';
            handles.CartB.String = 'Cartesiano';
            handles.GeoB.String = 'Geográfico';
        handles.Import.String = 'Importar';
        if iscell(handles.PopLim.String)
            handles.PopLim.String{end} = 'Limite';
            handles.VarCM.String{end} = 'Variável';
        else
            handles.PopLim.String = 'Limite';
            handles.VarCM.String = 'Variável';
        end
        handles.ColorGr.Title = 'Cor';
            handles.CFB.String = 'Cor fixa';
            handles.CMB.String = 'Mapa de cores';
        handles.D3Plot.String = 'Gráfico em 3D';
        handles.D2Plot.String = 'Gráfico em 2D';
        handles.TypeCM.String = {'Tipo do mapa';'Mariquita';'Jato';...
            'Quente';'Frio';'Cinza'};
    else                                                                    % Inglês
        handles.AppFP.Name = 'Flight path';
        handles.Title.String = 'FLIGHT PATH';
        handles.DataPanel.Title = 'Data to plot';
        handles.uibuttongroup1.Title = 'Coordinate system';
            handles.CartB.String = 'Cartesian';
            handles.GeoB.String = 'Geographic';
        handles.Import.String = 'Import';
        if iscell(handles.PopLim.String)
            handles.PopLim.String{end} = 'Limit';
            handles.VarCM.String{end} = 'Variable';
        else
            handles.PopLim.String = 'Limit';
            handles.VarCM.String = 'Variable';
        end
        handles.ColorGr.Title = 'Color';
            handles.CFB.String = 'Fixed color';
            handles.CMB.String = 'Colormap';
        handles.D3Plot.String = '3D Plot';
        handles.D2Plot.String = '2D Plot';
        handles.TypeCM.String = {'Colormap type';'Parula';'Jet';...
            'Hot';'Cool';'Gray'};
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppFP_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox1

% --- Executes on selection change in X.
function X_Callback(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns X contents as cell array
%        contents{get(hObject,'Value')} returns selected item from X

% --- Executes during object creation, after setting all properties.
function X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Y.
function Y_Callback(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Y contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Y

% --- Executes during object creation, after setting all properties.
function Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Z.
function Z_Callback(hObject, eventdata, handles)
% hObject    handle to Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Z contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Z

% --- Executes during object creation, after setting all properties.
function Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in Limit.
function Limit_Callback(hObject, eventdata, handles)
% hObject    handle to Limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Limit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Limit

% --- Executes during object creation, after setting all properties.
function Limit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Limit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in D3Plot.
function D3Plot_Callback(hObject, eventdata, handles)
% hObject    handle to D3Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AuxPop = size(handles.PopX.String);                                         % Quantidade de elementos no popup menu
if handles.PopX.Value ~= AuxPop(1) && handles.PopY.Value ~= AuxPop(1) &&... % Só vai plotar caso os dados de X, Y e Z estiverem selecionados
        handles.PopZ.Value ~= AuxPop(1)
    Tab = getappdata(handles.Import,'TAB');
    GInf = getappdata(handles.Import,'GINF');
    XData = Tab.Data(:,handles.PopX.Value);                                 % Dados para eixo X
    YData = Tab.Data(:,handles.PopY.Value);                                 % Dados para eixo Y
    ZData = Tab.Data(:,handles.PopZ.Value);                                 % Dados para eixo Z
    if handles.PopLim.Value ~= AuxPop(1)                                    % Caso o usuário queira limitar os dados
        Lim = Tab.Data(:,handles.PopLim.Value);                             % Dados da variável limite
        P1 = find(Lim>=Tab.T(1),1,'first');                                 % Posição do limite inferior
        P2 = find(Lim<=Tab.T(2),1,'last');                                  % Posição do limite superior
        XData = XData(P1:P2);                                               % Dados para eixo X
        YData = YData(P1:P2);                                               % Dados para eixo Y
        ZData = ZData(P1:P2);                                               % Dados para eixo Z
    else
        P1 = 1; P2 = length(YData);                                         % Posição inicial e final caso não haja restrição
    end
    
    A = figure('rend','painters','pos',[10 10 900 600]);                    % Cria figura
    if handles.CFB.Value == 1                                               % Cor fixa
        plot3(XData,YData,ZData,GInf.Style,'LineWidth',1.2,'Color',GInf.Color);% Plota os dados definindo estilo da linha, sua grossura e cor
        set(gca,'position',[0.1,0.15,0.85,0.8])                             % Define a posição do gráfico na nova figura
        set(gca,'fontsize',14)                                              % Define o tamanho da fonte na nova figura
        xlabel(handles.PopX.String(handles.PopX.Value))                     % Nomeia o eixo X
        ylabel(handles.PopY.String(handles.PopY.Value))                     % Nomeia o eixo Y
        zlabel(handles.PopZ.String(handles.PopZ.Value))                     % Nomeia o eixo Z
        grid on                                                             % Grid

        if GInf.Decimal                                                     % Modifica a marca decimal, quando solicitado, para vírgula
            xl = get(A.Children,'XTickLabel');
            new_xl = strrep(xl(:),'.',',');
            set(A.Children,'XTickLabel',new_xl);
            yl = get(A.Children,'YTickLabel');
            new_yl = strrep(yl(:),'.',',');
            set(A.Children,'YTickLabel',new_yl);
            zl = get(A.Children,'ZTickLabel');
            new_zl = strrep(zl(:),'.',',');
            set(A.Children,'ZTickLabel',new_zl);
        end
        
    elseif handles.VarCM.Value ~= AuxPop(1)                                 % Mapa de cores
        Var = Tab.Data(P1:P2,handles.VarCM.Value);                          % Dados da variável de referência do mapa
        switch handles.TypeCM.Value                                         % Seleciona a escala de cores
            case 3
                map = jet(length(Var)+1);
                colormap(jet)
            case 4
                map = hot(length(Var)+1);
                colormap(hot)
            case 5
                map = cool(length(Var)+1);
                colormap(cool)
            case 6
                map = gray(length(Var)+1);
                colormap(gray)
            otherwise
                map = parula(length(Var)+1);
                colormap(parula)
        end
        Pmap = round((Var-min(Var))/(max(Var)-min(Var))*length(Var))+1;     % Posição de cada dado na escala de cores
        scatter3(XData,YData,ZData,40,map(Pmap,:),'filled')                 % Plota os dados
        set(gca,'position',[0.1,0.15,0.85,0.8])                             % Define a posição do gráfico na nova figura
        set(gca,'fontsize',14)                                              % Define o tamanho da fonte na nova figura
        xlabel(handles.PopX.String(handles.PopX.Value))                     % Nomeia o eixo X
        ylabel(handles.PopY.String(handles.PopY.Value))                     % Nomeia o eixo Y
        zlabel(handles.PopZ.String(handles.PopZ.Value))                     % Nomeia o eixo Z
        grid on                                                             % Grid
        
        if GInf.Decimal                                                     % Modifica a marca decimal, quando solicitado, para vírgula
            xl = get(A.Children,'XTickLabel');
            new_xl = strrep(xl{2},'.',',');
            set(A.Children,'XTickLabel',new_xl);
            yl = get(A.Children,'YTickLabel');
            new_yl = strrep(yl{2},'.',',');
            set(A.Children,'YTickLabel',new_yl);
            zl = get(A.Children,'ZTickLabel');
            new_zl = strrep(zl(:),'.',',');
            set(A.Children,'ZTickLabel',new_zl);
        end
        colorbar                                                            % Desenha a escala de cores na figura
        caxis([min(Var) max(Var)])                                          % Escreve os limites da escala de cores na figura
    end
end

% --- Executes on button press in D2Plot.
function D2Plot_Callback(hObject, eventdata, handles)
% hObject    handle to D2Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AuxPop = size(handles.PopX.String);                                         % Quantidade de elementos no popup menu
if handles.PopX.Value ~= AuxPop(1) && handles.PopY.Value ~= AuxPop(1)       % Só vai plotar caso os dados de X e Y estiverem selecionados
    Tab = getappdata(handles.Import,'TAB');
    GInf = getappdata(handles.Import,'GINF');
    XData = Tab.Data(:,handles.PopX.Value);                                 % Dados para eixo X
    YData = Tab.Data(:,handles.PopY.Value);                                 % Dados para eixo Y
    if handles.PopLim.Value ~= AuxPop(1)                                    % Caso o usuário queira limitar os dados
        Lim = Tab.Data(:,handles.PopLim.Value);                             % Dados da variável limite
        P1 = find(Lim>=Tab.T(1),1,'first');                                 % Posição do limite inferior
        P2 = find(Lim<=Tab.T(2),1,'last');                                  % Posição do limite superior
        XData = XData(P1:P2);                                               % Dados para eixo X
        YData = YData(P1:P2);                                               % Dados para eixo Y
    else
        P1 = 1; P2 = length(YData);% Posição inicial e final caso não haja restrição
    end
    
    if handles.CartB.Value == 1                                             % Caso os dados sejam do sistema cartesiano
        A = figure('rend','painters','pos',[10 10 900 600]);                % Cria figura
        if handles.CFB.Value == 1                                           % Cor fixa
            plot(XData,YData,GInf.Style,'LineWidth',1.2,'Color',GInf.Color);% Plota os dados definindo estilo da linha, sua grossura e cor
            set(gca,'position',[0.1,0.15,0.85,0.8])                         % Define a posição do gráfico na nova figura
            set(gca,'fontsize',14)                                          % Define o tamanho da fonte na nova figura
            xlabel(handles.PopX.String(handles.PopX.Value))                 % Nomeia o eixo X
            ylabel(handles.PopY.String(handles.PopY.Value))                 % Nomeia o eixo Y
            grid on                                                         % Grid
            
            if GInf.Decimal                                                 % Modifica a marca decimal, quando solicitado, para vírgula
                xl = get(A.Children,'XTickLabel');
                new_xl = strrep(xl(:),'.',',');
                set(A.Children,'XTickLabel',new_xl);
                yl = get(A.Children,'YTickLabel');
                new_yl = strrep(yl(:),'.',',');
                set(A.Children,'YTickLabel',new_yl);
            end
        elseif handles.VarCM.Value ~= AuxPop(1)                             % Mapa de cores
            Var = Tab.Data(P1:P2,handles.VarCM.Value);                      % Dados da variável de referência do mapa
            switch handles.TypeCM.Value                                     % Seleciona a escala de cores
                case 3
                    map = jet(length(Var)+1);
                    colormap(jet)
                case 4
                    map = hot(length(Var)+1);
                    colormap(hot)
                case 5
                    map = cool(length(Var)+1);
                    colormap(cool)
                case 6
                    map = gray(length(Var)+1);
                    colormap(gray)
                otherwise
                    map = parula(length(Var)+1);
                    colormap(parula)
            end
            Pmap = round((Var-min(Var))/(max(Var)-min(Var))*length(Var))+1; % Posição de cada dado na escala de cores
            scatter(XData,YData,25,map(Pmap,:),'filled')                    % Plota os dados
            set(gca,'position',[0.1,0.15,0.85,0.8])                         % Define a posição do gráfico na nova figura
            set(gca,'fontsize',14)                                          % Define o tamanho da fonte na nova figura
            xlabel(handles.PopX.String(handles.PopX.Value))                 % Nomeia o eixo X
            ylabel(handles.PopY.String(handles.PopY.Value))                 % Nomeia o eixo Y
            grid on                                                         % Grid
            
            if GInf.Decimal                                                 % Modifica a marca decimal, quando solicitado, para vírgula
                xl = get(A.Children,'XTickLabel');
                new_xl = strrep(xl{2},'.',',');
                set(A.Children,'XTickLabel',new_xl);
                yl = get(A.Children,'YTickLabel');
                new_yl = strrep(yl{2},'.',',');
                set(A.Children,'YTickLabel',new_yl);
            end
            colorbar                                                        % Desenha a escala de cores na figura
            caxis([min(Var) max(Var)])                                      % Escreve os limites da escala de cores na figura
        end
    else                                                                    % Caso os dados sejam do sistema geográfico
        w = webmap('World Imagery');                                        % Abre webmap com formato mostrando vista superior da terra
        wmline(w,XData,YData,'Color','red');                                % Plota os dados
        wmlimits(w,[min(XData), max(XData)], [min(YData), max(YData)]);     % Define limites da imagem
    end
end

% --- Executes on button press in CartB.
function CartB_Callback(hObject, eventdata, handles)
% hObject    handle to CartB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of CartB

% --- Executes on button press in GeoB.
function GeoB_Callback(hObject, eventdata, handles)
% hObject    handle to GeoB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of GeoB

% --- Executes on selection change in PopX.
function PopX_Callback(hObject, eventdata, handles)
% hObject    handle to PopX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopX contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopX

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

% --- Executes on selection change in PopLim.
function PopLim_Callback(hObject, eventdata, handles)
% hObject    handle to PopLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopLim contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopLim
Tab = getappdata(handles.Import,'TAB');
AuxPop = size(hObject.String);                                              % Quantidade de elementos no popup menu
if hObject.Value ~= AuxPop(1)                                               % Só altera alguma coisa caso a opção no popup menu seja diferente da Default
    handles.Lim1.String = num2str(min(Tab.Data(:,hObject.Value)));          % Escreve em Lim1 o limite inferior da restrição
    handles.Lim2.String = num2str(max(Tab.Data(:,hObject.Value)));          % Escreve em Lim2 o limite superior da restrição
    Lim1 = str2double(handles.Lim1.String);                                 % Limite inferior da restrição
    Lim2 = str2double(handles.Lim2.String);                                 % Limite superior da restrição
    Tab.T = [Lim1 Lim2];                                                    % Aloca em Tab.T os limites da restrição
else                                                                        % Caso a opção selecionada para a restrição seja Default
    handles.Lim1.String = 'Lim 1';                                          % Escreve Lim1 no box do limite inferior da restrição
    handles.Lim2.String = 'Lim 2';                                          % Escreve Lim2 no box do limite superior da restrição
end
setappdata(handles.Import,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function PopLim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopLim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lim1_Callback(hObject, eventdata, handles)
% hObject    handle to Lim1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Lim1 as text
%        str2double(get(hObject,'String')) returns contents of Lim1 as a double
Tab = getappdata(handles.Import,'TAB');
AuxPop = size(handles.PopLim.String);                                       % Quantidade de elementos no popup menu

if handles.PopLim.Value == AuxPop(1)                                        % Se estiver selecionada a opção default para a restrição...
    handles.Lim1.String = 'Lim 1';                                          % ... O usuário não consegue alterar o box Lim1, será sempre escrito Lim1 nele
else
    Time = Tab.Data(:,handles.PopLim.Value);                                % Dados para a restrição
    Min = min(Time); Max = max(Time);                                       % Limites superior e inferior da restrição
    AuxNum = str2double(hObject.String);                                    % Valor escrito no editbox
    if AuxNum >= Min && AuxNum <= Max && AuxNum < Tab.T(2)                  % A mudança só é válida se o valor escrito estiver entre o maior e o menor...
        Tab.T(1) = AuxNum;                                                  % ... Além disso, ele deve ser menor que o valor já escrito como limite superior.
    elseif AuxNum < Min                                                     % Caso o valor escrito seja menor que o limite inferior, será escrito o valor mínimo
        Tab.T(1) = Min;                                                     % Salva em Tab.T o valor do box Lim1
        handles.Lim1.String = num2str(Min);                                 % Escreve o valor no box Lim1
    else
        hObject.String = num2str(Tab.T(1));                                 % Caso a mudança não seja válida, o valor do editbox volta a ser o antigo
    end
end

setappdata(handles.Import,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function Lim1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lim1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lim2_Callback(hObject, eventdata, handles)
% hObject    handle to Lim2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Lim2 as text
%        str2double(get(hObject,'String')) returns contents of Lim2 as a double
Tab = getappdata(handles.Import,'TAB');
AuxPop = size(handles.PopLim.String);                                       % Quantidade de elementos no popup menu

if handles.PopLim.Value == AuxPop(1)                                        % Se estiver selecionada a opção default para a restrição...
    handles.Lim2.String = 'Lim 2';                                          % ... O usuário não consegue alterar o box Lim2, será sempre escrito Lim2 nele
else
    Time = Tab.Data(:,handles.PopLim.Value);                                % Dados para a restrição
    Min = min(Time); Max = max(Time);                                       % Limites superior e inferior da restrição
    AuxNum = str2double(hObject.String);                                    % Valor escrito no editbox
    if AuxNum >= Min && AuxNum <= Max && AuxNum > Tab.T(1)                  % A mudança só é válida se o valor escrito estiver entre o maior e o menor...
        Tab.T(2) = AuxNum;                                                  % ... Além disso, ele deve ser maior que o valor já escrito como limite inferior.
    elseif AuxNum > Max                                                     % Caso o valor escrito seja maior que o limite superior, será escrito o valor máximo
        Tab.T(2) = Max;                                                     % Salva em Tab.T o valor do box Lim2
        handles.Lim2.String = num2str(Max);                                 % Escreve o valor no box Lim2
    else
        hObject.String = num2str(Tab.T(2));                                 % Caso a mudança não seja válida, o valor do editbox volta a ser o antigo
    end
end

setappdata(handles.Import,'TAB',Tab);

% --- Executes during object creation, after setting all properties.
function Lim2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lim2 (see GCBO)
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
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    Tab = getappdata(ICXSData.ICxs_Defaut,'TAB');
    GInf = getappdata(ICXSData.ICxs_Defaut,'GINF');
    
    if t(4) == 1                                                            % Português
        Ax1 = 'Limite';
        Ax2 = 'Variável';
    else                                                                    % Inglês
        Ax1 = 'Limit';
        Ax2 = 'Variable';
    end
    handles.PopLim.String = [Tab(t(1)).Var;Ax1];                            % Escreve no pop up menu o nome das variáveis q podem ser escolhidas
    handles.VarCM.String = [Tab(t(1)).Var;Ax2];                             % Escreve no pop up menu o nome das variáveis q podem ser escolhidas
    handles.PopX.String = [Tab(t(1)).Var;'X'];                              % Escreve no pop up menu o nome das variáveis q podem ser escolhidas
    handles.PopY.String = [Tab(t(1)).Var;'Y'];                              % Escreve no pop up menu o nome das variáveis q podem ser escolhidas
    handles.PopZ.String = [Tab(t(1)).Var;'Z'];                              % Escreve no pop up menu o nome das variáveis q podem ser escolhidas
    handles.PopLim.Value = length(handles.PopX.String);                     % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
    handles.VarCM.Value = length(handles.PopX.String);                      % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
    handles.PopX.Value = length(handles.PopX.String);                       % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
    handles.PopY.Value = length(handles.PopX.String);                       % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
    handles.PopZ.Value = length(handles.PopX.String);                       % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
    handles.Lim1.String = 'Lim 1';                                          % Escreve Lim1 no box de Lim1
    handles.Lim2.String = 'Lim 2';                                          % Escreve Lim2 no box de Lim2
    
    
    Tab(t(1)).Data=[Tab(t(1)).Data zeros(length(Tab(t(1)).Data(:,1)),1)];   % Salva em Tab.Data os dados das variáveis do ICXS e uma última coluna de zeros para o default
    Tab(t(1)).T = [0 1];                                                    % Limites restritivos
    
    setappdata(handles.Import,'GINF',GInf);
    setappdata(handles.Import,'TAB',Tab(t(1)));
end

% --- Executes on selection change in PopY.
function PopY_Callback(hObject, eventdata, handles)
% hObject    handle to PopY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopY contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopY

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

% --- Executes on selection change in PopZ.
function PopZ_Callback(hObject, eventdata, handles)
% hObject    handle to PopZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopZ contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopZ

% --- Executes during object creation, after setting all properties.
function PopZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in VarCM.
function VarCM_Callback(hObject, eventdata, handles)
% hObject    handle to VarCM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns VarCM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from VarCM

% --- Executes during object creation, after setting all properties.
function VarCM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VarCM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in TypeCM.
function TypeCM_Callback(hObject, eventdata, handles)
% hObject    handle to TypeCM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns TypeCM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TypeCM

% --- Executes during object creation, after setting all properties.
function TypeCM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TypeCM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in CFB.
function CFB_Callback(hObject, eventdata, handles)
% hObject    handle to CFB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of CFB
if hObject.Value                                                            % Caso a cor seja fixa, desabilita as opções do mapa de cores
    handles.VarCM.Enable = 'off';
    handles.TypeCM.Enable = 'off';
end

% --- Executes on button press in CMB.
function CMB_Callback(hObject, eventdata, handles)
% hObject    handle to CMB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of CMB
if hObject.Value                                                            % Caso a cor não seja fixa, habilita as opções do mapa de cores
    handles.VarCM.Enable = 'on';
    handles.TypeCM.Enable = 'on';
end
