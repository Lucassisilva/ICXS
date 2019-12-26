function varargout = AppLNPoint(varargin)
% APPLNPOINT MATLAB code for AppLNPoint.fig
%      APPLNPOINT, by itself, creates a new APPLNPOINT or raises the existing
%      singleton*.
%
%      H = APPLNPOINT returns the handle to a new APPLNPOINT or the handle to
%      the existing singleton*.
%
%      APPLNPOINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPLNPOINT.M with the given input arguments.
%
%      APPLNPOINT('Property','Value',...) creates a new APPLNPOINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AppLNPoint_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AppLNPoint_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AppLNPoint

% Last Modified by GUIDE v2.5 30-Jul-2018 00:31:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AppLNPoint_OpeningFcn, ...
                   'gui_OutputFcn',  @AppLNPoint_OutputFcn, ...
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

% --- Executes just before AppLNPoint is made visible.
function AppLNPoint_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AppLNPoint (see VARARGIN)

% Choose default command line output for AppLNPoint
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AppLNPoint wait for user response (see UIRESUME)
% uiwait(handles.LNP);
delta = char(948);                                                          % String com delta minúsculo
axes(handles.axes1);                                                        % Seleciona o gráfico para mudar suas características
xlabel('CL');                                                               % Da nome aos títulos dos eixos
ylabel(strcat(delta,'e'));
axes(handles.axes2);                                                        % Seleciona o gráfico para mudar suas características
xlabel('Xcg');                                                              % Da nome aos títulos dos eixos
ylabel(handles.dDp_dCLIg.String(1:end-2));

% Mudar o idioma
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        handles.LNP.Name = 'Ponto neutro';
        handles.Title.String = 'PONTO NEUTRO';
        handles.ImpDataCB.String = 'Importar dados (ICXS)';
        if handles.ShowGra.Value == 0
            handles.ShowGra.String = 'Mostrar gráficos';
        else
            handles.ShowGra.String = 'Ocultar gráficos';
        end
        handles.ME.String
        handles.ME.String(1:2) = 'ME';
        handles.NewRow.String = 'Nova linha';
        handles.DelRow.String = 'Excluir linha';
        handles.Reset.String = 'Restaurar';
        handles.Calculate.String = 'Calcular';
        handles.NP.String = strcat('Ponto neutro:',...
            handles.NP.String(find(handles.NP.String==':')+1:end));
        handles.zoomin.TooltipString = 'Ampliar';
        handles.pan.TooltipString = 'Mover';
        handles.datacursor.TooltipString = 'Cursor de dados';
        handles.ExportMenu.Label = 'Exportar';
        handles.checkbox2.String = 'Selecionar confiabilidade';
        handles.ConfMenu.TooltipString = 'Nível de confiabilidade';
    else                                                                    % Inglês
        handles.LNP.Name = 'Neutral point';
        handles.Title.String = 'NEUTRAL POINT';
        handles.ImpDataCB.String = 'Import ICXS Data';
        if handles.ShowGra.Value == 0
            handles.ShowGra.String = 'Show graphics';
        else
            handles.ShowGra.String = 'Hide graphics';
        end
        handles.ME.String(1:2) = 'SM';
        handles.NewRow.String = 'New row';
        handles.DelRow.String = 'Delete row';
        handles.Reset.String = 'Reset';
        handles.Calculate.String = 'Calculate';
        handles.NP.String = strcat('Neutral point:',...
            handles.NP.String(find(handles.NP.String==':')+1:end));
        handles.zoomin.TooltipString = 'Zoom In';
        handles.pan.TooltipString = 'Pan';
        handles.datacursor.TooltipString = 'Data Cursor';
        handles.ExportMenu.Label = 'Export';
        handles.checkbox2.String = 'Select confidence level';
        handles.ConfMenu.TooltipString = 'Confidence level';
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = AppLNPoint_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes when selected cell(s) is changed in Table.
function Table_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to Table (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
hObject.UserData = eventdata.Indices;                                       % Recebe dados selecionados pelo usuário na tabela de dados

% --- Executes on selection change in PopXcg.
function PopXcg_Callback(hObject, eventdata, handles)
% hObject    handle to PopXcg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopXcg contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopXcg
Tab = getappdata(handles.ImpDataCB,'TAB');                                  % Recebe dados importados do ICXS

X = Tab.Data(:,hObject.Value);
IX = Tab.Data(:,handles.PopIXcg.Value);
Y = Tab.Data(:,handles.PopCL.Value);
IY= Tab.Data(:,handles.PopICL.Value);
Z = Tab.Data(:,handles.PopDp.Value);
IZ= Tab.Data(:,handles.PopIDp.Value);

handles.Table.Data = [X IX Y IY Z IZ];                                      % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopXcg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopXcg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIXcg.
function PopIXcg_Callback(hObject, eventdata, handles)
% hObject    handle to PopIXcg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIXcg contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIXcg
Tab = getappdata(handles.ImpDataCB,'TAB');                                  % Recebe dados importados do ICXS

X = Tab.Data(:,handles.PopXcg.Value);
IX = Tab.Data(:,hObject.Value);
Y = Tab.Data(:,handles.PopCL.Value);
IY= Tab.Data(:,handles.PopICL.Value);
Z = Tab.Data(:,handles.PopDp.Value);
IZ= Tab.Data(:,handles.PopIDp.Value);

handles.Table.Data = [X IX Y IY Z IZ];                                      % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopIXcg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIXcg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopCL.
function PopCL_Callback(hObject, eventdata, handles)
% hObject    handle to PopCL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopCL contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopCL
Tab = getappdata(handles.ImpDataCB,'TAB');                                  % Recebe dados importados do ICXS

X = Tab.Data(:,handles.PopXcg.Value);
IX = Tab.Data(:,handles.PopIXcg.Value);
Y = Tab.Data(:,hObject.Value);
IY= Tab.Data(:,handles.PopICL.Value);
Z = Tab.Data(:,handles.PopDp.Value);
IZ= Tab.Data(:,handles.PopIDp.Value);

handles.Table.Data = [X IX Y IY Z IZ];                                      % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopCL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopCL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopICL.
function PopICL_Callback(hObject, eventdata, handles)
% hObject    handle to PopICL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopICL contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopICL
Tab = getappdata(handles.ImpDataCB,'TAB');                                  % Recebe dados importados do ICXS

X = Tab.Data(:,handles.PopXcg.Value);
IX = Tab.Data(:,handles.PopIXcg.Value);
Y = Tab.Data(:,handles.PopCL.Value);
IY= Tab.Data(:,hObject.Value);
Z = Tab.Data(:,handles.PopDp.Value);
IZ= Tab.Data(:,handles.PopIDp.Value);

handles.Table.Data = [X IX Y IY Z IZ];                                      % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopICL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopICL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopDp.
function PopDp_Callback(hObject, eventdata, handles)
% hObject    handle to PopDp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopDp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopDp
Tab = getappdata(handles.ImpDataCB,'TAB');                                  % Recebe dados importados do ICXS

X = Tab.Data(:,handles.PopXcg.Value);
IX = Tab.Data(:,handles.PopIXcg.Value);
Y = Tab.Data(:,handles.PopCL.Value);
IY= Tab.Data(:,handles.PopICL.Value);
Z = Tab.Data(:,hObject.Value);
IZ= Tab.Data(:,handles.PopIDp.Value);

handles.Table.Data = [X IX Y IY Z IZ];                                      % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopDp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopDp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in PopIDp.
function PopIDp_Callback(hObject, eventdata, handles)
% hObject    handle to PopIDp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns PopIDp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PopIDp
Tab = getappdata(handles.ImpDataCB,'TAB');                                  % Recebe dados importados do ICXS

X = Tab.Data(:,handles.PopXcg.Value);
IX = Tab.Data(:,handles.PopIXcg.Value);
Y = Tab.Data(:,handles.PopCL.Value);
IY= Tab.Data(:,handles.PopICL.Value);
Z = Tab.Data(:,handles.PopDp.Value);
IZ= Tab.Data(:,hObject.Value);

handles.Table.Data = [X IX Y IY Z IZ];                                      % Escreve na tabela dos dados os valores de Xcg, IXcg, CL... importados do ICXS

% --- Executes during object creation, after setting all properties.
function PopIDp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopIDp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delta = char(948);                                                          % String com delta minúsculo
multp = char(183);                                                          % String com sinal de multiplicação (.) 
derro = char(8706);                                                         % String com derrô
handles.Table.Data = [0,0,0,0,0,0];                                         % Dados da tabela com erros são trocados por valores nulos

MES = 'SM';                                                                 % Strings em inglês para escrever nas caixas de texto
NPS = 'Neutral point: ...';
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        MES = 'ME';
        NPS = 'Ponto neutro: ...';
    end
end

handles.PopXcg.Value = length(handles.PopXcg.String);                       % Os pop-up menus são setados no default (último valor)
handles.PopIXcg.Value = length(handles.PopXcg.String);
handles.PopCL.Value = length(handles.PopXcg.String);
handles.PopICL.Value = length(handles.PopXcg.String);
handles.PopDp.Value = length(handles.PopXcg.String);
handles.PopIDp.Value = length(handles.PopXcg.String);

handles.DpSaida.String = strcat(delta,'e =');                               % Cada caixa de texto é modificada para o default
handles.dDp_dCL0.String = strcat(multp,{'  '},derro,delta,'e/',...
    derro,'CL/',derro,{'Xcg + '},derro,delta,'e/',derro,'CL0');
handles.ME.String = strcat(MES,{' = ...'});
handles.XcgU.String = 'Xcg';
handles.CLU.String = 'CL';
handles.Dp0.String = strcat(multp,{' '},derro,delta,'e/',...
    derro,{'CL  +   '},delta,'e0');
handles.NP.String = NPS;

cla(handles.axes1);                                                         % Deleta o gráfico do aplicativo
cla(handles.axes2);                                                         % Deleta o gráfico do aplicativo

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
        handles.PopXcg.Visible = 'on';                                      % Torna visível os pop up menus para escolher dado indo do ICXS
        handles.PopIXcg.Visible = 'on';
        handles.PopCL.Visible = 'on';
        handles.PopICL.Visible = 'on';
        handles.PopDp.Visible = 'on';
        handles.PopIDp.Visible = 'on';
        
        t = getappdata(ICXSData.ICxs_Defaut,'T');                           % Recebe dados do ICXS
        Tab = getappdata(ICXSData.ICxs_Defaut,'TAB');                       % Recebe dados do ICXS
        
        delta = char(948);                                                  % String com delta minúsculo
        
        handles.PopXcg.String = [Tab(t(1)).Var;'Xcg'];                      % Escreve nos pop up menus o nome das variáveis q podem ser escolhidas
        handles.PopIXcg.String = [Tab(t(1)).Var;strcat(delta,'Xcg')];
        handles.PopCL.String = [Tab(t(1)).Var;'CL'];
        handles.PopICL.String = [Tab(t(1)).Var;strcat(delta,'CL')];
        handles.PopDp.String = [Tab(t(1)).Var;strcat(delta,'e')];
        handles.PopIDp.String = [Tab(t(1)).Var;strcat(delta,delta,'e')];
        
        handles.PopXcg.Value = length(handles.PopXcg.String);               % Qndo os dados são importados, a item escolhido no pop up menu é o default (último)
        handles.PopIXcg.Value = length(handles.PopXcg.String);
        handles.PopCL.Value = length(handles.PopXcg.String);
        handles.PopICL.Value = length(handles.PopXcg.String);
        handles.PopDp.Value = length(handles.PopXcg.String);
        handles.PopIDp.Value = length(handles.PopXcg.String);
        
        Tab(t(1)).Data=[Tab(t(1)).Data zeros(length(Tab(t(1)).Data(:,1)),1)];% Salva em Tab.Data os dados das variáveis do ICXS e uma última coluna de zeros para o default
        
        setappdata(handles.ImpDataCB,'TAB',Tab(t(1)));
        
    else
        hObject.Value = 0;                                                  % Caso o ICXS não esteja aberto, não há o que importar, assim o botão é instantaneamente desativado
    end
else                                                                        % Quanto o botão de importar é desativado, os pop up menus tornam-se invisíveis
    handles.PopXcg.Visible = 'off';
    handles.PopIXcg.Visible = 'off';
    handles.PopCL.Visible = 'off';
    handles.PopICL.Visible = 'off';
    handles.PopDp.Visible = 'off';
    handles.PopIDp.Visible = 'off';
end

% --- Executes on button press in NewRow.
function NewRow_Callback(hObject, eventdata, handles)
% hObject    handle to NewRow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Table.Data = [handles.Table.Data;0,0,0,0,0,0];                      % Adiciona nova linha ao fim da tabela de dados

% --- Executes on button press in DelRow.
function DelRow_Callback(hObject, eventdata, handles)
% hObject    handle to DelRow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Rows = (1:length(handles.Table.Data(:,1)));                                 % Linhas selecionadas pelo usuário
Delete = unique(handles.Table.UserData(:,1));                               % Linhas selecionadas pelo usuário (este vetor contém apenas uma vez cada linha)
Keep = setdiff(Rows,Delete);                                                % Linhas que não serão deletadas
handles.Table.Data = handles.Table.Data(Keep,:);                            % Deleta linhas da tabela

% --- Executes on button press in Calculate.
function Calculate_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NPS = 'Neutral point: ';                                                    % String em inglês para escrever nas caixas de texto
MES = 'SM = ...';
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        NPS = 'Ponto neutro: ';
        MES = 'ME = ...';
    end
end

if handles.checkbox2.Value                                                  % Caso o usuário tenha selecionado para escolher o nível de confiabilidade
    Conf = str2double(handles.Conf.String);                                 % Recebe nível de confiabilidade
else
    Conf = 0;                                                               % Caso contrário, o nível de confiabilidade não vai alterar a incerteza
end

T = sortrows(handles.Table.Data);                                           % Dados da tabela organizados por Xcg

[XcgV,iT,iV] = unique(T(:,1));                                              % Todos valores de Xcg. Posicao da primeira aparicao dos valores em T
DT = diff(T(:,1));                                                          % DiferenÃ§a entre os valores seguintes de Xcg em T
Pxcg = find(DT(iT)==0);                                                     % Posição onde há mais de um conjunto de dados com mesmo Xcg
XcgV = XcgV(Pxcg);                                                          % Valores de Xcg unicos com pelo menos mais de uma aparição

n = length(XcgV); 														    % Quantidade de Xcg's util


Graf1 = handles.axes1;                                                      % Propriedades do grafico do aplicativo
Graf2 = handles.axes2;                                                      % Propriedades do grafico do aplicativo
cla(Graf1);                                                                 % Deleta o grafico do aplicativo
cla(Graf2);                                                                 % Deleta o grafico do aplicativo
axes(Graf1);                                                                % Seleciona gráfico que será modificado
for i = 1:n
	P = find(T(:,1) == XcgV(i)); 										    % Posicao na matriz dos dados a serem analisados
	
	IXcg(i) = sqrt(sum(T(P,2).^2))/length(T(P,2));                          % Calcula a incerteza de Xcg, sendo ela a incerteza da média
    CL = T(P,3);
	ICL = T(P,4);
	Dp = T(P,5);
	IDp = T(P,6);
    
    [Dp0V(i),IA1(i),dDp_dCLV(i),IdDp_dCLV(i),IY,d,nu,k] = ...
        f_MMQ1(CL,Dp,[0;CL],Conf,Inf);
	
	% Plotar 1
    Y = Dp0V(i) + dDp_dCLV(i)*[0;CL];                                       % Calcula Y com os dados q saíram da função MMQ1 e considerando X = [0;CL]
	plot([0;CL],Y,'-',[0;CL],Y-d,'k--',[0;CL],Y+d,'k--');                   % Plota dos dados referentes à primeira posição do CG
	hold on
	
	e = errorbar(CL,Dp,IDp,IDp,ICL,ICL);	                                % Plota barras de erro referentes aos dados da primeira posição do CG
	e.Marker = 'o';                                                         % Formato do ponto central do erro
	e.Color = 'k';                                                          % Cor da barra
	e.LineWidth = 1;                                                        % Espessura da barra
	e.LineStyle = 'none';                                                   % Não há linha ligando os pontos onde são plotadas as barras de erro
	hold on
end

Dp0 = mean(Dp0V);                                                           % Dp(CL=0) médio
IDp0 = sqrt(sum(IA1).^2)/length(Dp0V);                                      % Incerteza de Dp0
e2 = errorbar(0,Dp0,IDp0);              	                                % Plota barras de erro
e2.Marker = 'o';                                                            % Formato do ponto central do erro
e2.Color = 'r';                                                             % Cor da barra
e2.LineWidth = 1;                                                           % Espessura da barra
e2.LineStyle = 'none';                                                      % Não há linha ligando os pontos onde são plotadas as barras de erro

hold off
delta = char(948);                                                          % String com delta minúsculo
xlabel('CL');                                                               % Escreve títulos do gráfico
ylabel(strcat(delta,'e'));
grid on                                                                     % Desenha as grades no gráfico

% Calcular para plot 2

[A,IA,B,IB,IY,d,nu,k] = f_MMQ1(XcgV,dDp_dCLV',0,Conf,Inf);

PN = -A/B;                                                                  % Ponto neutro

xb = mean(XcgV); Sxx = sum((XcgV-xb).^2);  n = length(XcgV);                % Dados necessários para calcular os limites de X (PN)
Ct = Sxx/IY^2; at = Ct*B^2-1; bt = 2*A*B*Ct+2*xb; ct = A^2*Ct-xb^2-Sxx/n;   % Dados necessários para calcular os limites de X (PN)
X0(1) = (-bt - sqrt(bt^2-4*at*ct))/(2*at);                                  % Limite inferior de PN
X0(2) = (-bt + sqrt(bt^2-4*at*ct))/(2*at);                                  % Limite superior de PN

IPN(1) = PN-X0(1);                                                          % Incerteza do Ponto neutro
IPN(2) = X0(2)-PN;                                                          % Incerteza do Ponto neutro

if X0(2) < X0(1) || ~isreal(X0(2))                                          % Confere se os valores encontrados para os limites de PN fazem sentido
    X0(2) = Inf;
    IPN(2) = Inf;
end
if ~isreal(X0(1))
    X0(1) = -Inf;
    IPN(1) = -Inf;
end

Xo = [XcgV;PN;X0(2)];                                                       % Os valores de X que serão jogados na fórmula da reta
[A,IA,B,IB,IY,d,nu,k] = f_MMQ1(XcgV,dDp_dCLV',Xo,Conf,Inf);
Y = A + B*Xo;

% Plotar 2
axes(Graf2);                                                                % Seleciona gráfico que será modificado

plot(Xo,Y,'-',XcgV,dDp_dCLV,'ko',Xo,Y-d,'k--',Xo,Y+d,'k--');                % Plota a reta que encontra o PN e suas incertezas
xlabel('Xcg');                                                              % Escreve títulos do gráfico
ylabel(handles.dDp_dCLIg.String(1:end-2));
grid on                                                                     % Desenha as grades no gráfico
hold on                                                                     % Mantém a possibilidade de plotar em cima do gráfico para plotar as barras de erro

e1 = errorbar(XcgV,dDp_dCLV',IdDp_dCLV,IdDp_dCLV,IXcg,IXcg);	            % Plota barras de erro
e1.Marker = 'o';                                                            % Formato do ponto central do erro
e1.Color = 'k';                                                             % Cor da barra
e1.LineWidth = 1;                                                           % Espessura da barra
e1.LineStyle = 'none';                                                      % Não há linha ligando os pontos onde são plotadas as barras de erro

e2 = errorbar(PN,0,0,0,IPN(1),IPN(2));                                      % Plota barras de erro do ponto neutro
e2.Marker = 'o';                                                            % Formato do ponto central do erro
e2.Color = 'r';                                                             % Cor da barra
e2.LineWidth = 1;                                                           % Espessura da barra
e2.LineStyle = 'none';                                                      % Não há linha ligando os pontos onde são plotadas as barras de erro


% Escrever
InfStr = char(8734);                                                        % String com o símbolo de infinito

if isnan(d)                                                                 % Caso não existam as curvas de incerteza, só é escrito o valor do PN
    AUX = strcat(NPS,{' '},num2str(PN,4));
else
    if ~isinf(IPN(1))
        [MediaPN1,InctPN1,PN1Str,IPN1Str] = f_Round(PN,IPN(1));             % Arredonda valor da densidade e sua incerteza
        IMPN1Str = strcat('[',num2str(MediaPN1-InctPN1));
    else
        PN1Str = num2str(PN,4);
        IMPN1Str = strcat('(-',InfStr);
    end 
   
    if isinf(IPN(2))
        IMPN2Str = strcat(InfStr,')');
    else
        [MediaPN2,InctPN2,PN2Str,IPN2Str] = f_Round(PN,IPN(2));             % Arredonda valor da densidade e sua incerteza
        IMPN2Str = strcat(num2str(MediaPN2+InctPN2),']');
    end
    AUX = strcat(NPS,{' '},PN1Str,{' '},IMPN1Str,...
            {' , '},IMPN2Str);
end
handles.NP.String = AUX{:};
handles.dDp_dCL0.String = strcat(char(183),{' '},...
    num2str(B),' + (',num2str(A),')');
handles.Dp0.String = strcat(char(183),{' '},...
    handles.dDp_dCLIg.String(1:end-2),' + (',num2str(Dp0),')');

handles.ME.String = MES;
handles.DpR.String = strcat(delta,'e = ...');

if ~isnan(str2double(handles.XcgU.String))                                  % Caso o valor informado seja realmente um número...
    Form = handles.dDp_dCL0.String{1,1};                                    % Recebe os valores da fórmula e calcula dDp/dCL para certo Xcg
    a = str2num(Form(3:find(Form=='+')-1));
    b = str2num(Form(find(Form=='+')+3:end-1));
    dDp_dCL = str2double(handles.XcgU.String) * a + b;
    Dp0 = str2double(handles.Dp0.String{1,1}...
        (find(handles.Dp0.String{1,1}=='+')+3:end-1));
    handles.Dp0.String = strcat(char(183),...                               % Escreve na caixa de texto o valor calculado e a equação
        {' '},num2str(dDp_dCL),' + (',num2str(Dp0),')');
end

if ~isnan(str2double(handles.CLU.String)) && ~isnan(str2double(handles.XcgU.String))
    Form = handles.Dp0.String{1,1};
    a = str2num(Form(3:find(Form=='+')-1));
    b = str2num(Form(find(Form=='+')+3:end-1));
    Dp = str2double(handles.CLU.String) * a + b;
    handles.DpR.String = strcat(char(948),{'e = '},num2str(Dp,4));
end

% --- Executes on button press in ShowGra.
function ShowGra_Callback(hObject, eventdata, handles)
% hObject    handle to ShowGra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
St1 = 'Hide graphics';                                                      % String em inglês para escrever nas caixas de texto
St2 = 'Show graphics';
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        St1 = 'Ocultar gráficos';
        St2 = 'Mostrar gráficos';
    end
end

if hObject.Value == 1                                                       % Caso o botão seja ativado
    hObject.String = St1;                                                   % O que é escrito no botão é alterado
    handles.Panel.Visible = 'on';                                           % Os gráficos se tornam visíveis
else                                                                        % Caso o botão seja desativado
    handles.Panel.Visible = 'off';                                          % Os gráficos deixam de ser visíveis
    hObject.String = St2;                                                   % O que é escrito no botão é alterado
end

function CLU_Callback(hObject, eventdata, handles)
% hObject    handle to CLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of CLU as text
%        str2double(get(hObject,'String')) returns contents of CLU as a double
if ~isnan(str2double(hObject.String))                                       % Caso o valor informado seja realmente um número...
    Form = handles.Dp0.String{1,1};                                         % Recebe os valores da fórmula e calcula a deflexão necessária para certo trim
    a = str2num(Form(3:find(Form=='+')-1));
    b = str2num(Form(find(Form=='+')+3:end-1));
    Dp = str2double(hObject.String) * a + b;
    handles.DpR.String = strcat(char(948),{'e = '},num2str(Dp,4));          % Escreve na caixa de texto o valor calculado e a equação
end

% --- Executes during object creation, after setting all properties.
function CLU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function XcgU_Callback(hObject, eventdata, handles)
% hObject    handle to XcgU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of XcgU as text
%        str2double(get(hObject,'String')) returns contents of XcgU as a double
if ~isnan(str2double(hObject.String))                                       % Caso o valor informado seja realmente um número...
    Form = handles.dDp_dCL0.String{1,1};                                    % Recebe os valores da fórmula e calcula dDp/dCL para certo Xcg
    a = str2num(Form(3:find(Form=='+')-1));
    b = str2num(Form(find(Form=='+')+3:end-1));
    dDp_dCL = str2double(hObject.String) * a + b;
    Dp0 = str2double(handles.Dp0.String{1,1}...
        (find(handles.Dp0.String{1,1}=='+')+3:end-1));
    handles.Dp0.String = strcat(char(183),{' '},...                         % Escreve na caixa de texto o valor calculado e a equação
        num2str(dDp_dCL),' + (',num2str(Dp0),')');
end

if ~isnan(str2double(handles.CLU.String))                                   % Caso o valor informado seja realmente um número...
    Form = handles.Dp0.String{1,1};                                         % Recebe os valores da fórmula e calcula a deflexão necessária para certo trim
    a = str2num(Form(3:find(Form=='+')-1));
    b = str2num(Form(find(Form=='+')+3:end-1));
    Dp = str2double(handles.CLU.String) * a + b;
    handles.DpR.String = strcat(char(948),{'e = '},num2str(Dp,4));          % Escreve na caixa de texto o valor calculado e a equação
end

function MAC_Callback(hObject, eventdata, handles)
% hObject    handle to MAC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of MAC as text
%        str2double(get(hObject,'String')) returns contents of MAC as a double

% --- Executes during object creation, after setting all properties.
function MAC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MAC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called´
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ME.
function ME_Callback(hObject, eventdata, handles)
% hObject    handle to ME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MES = 'SM';                                                                 % String em inglês para escrever nas caixas de texto
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    t = getappdata(ICXSData.ICxs_Defaut,'T');
    if t(4) == 1                                                            % Português
        MES = 'ME';
    end
end

if ~isempty(find(handles.NP.String=='('))                                   % Localiza até onde vai o valor do ponto neutro na caixa de texto dele
    fdaux = find(handles.NP.String=='(')-2;
elseif ~isempty(find(handles.NP.String=='['))
    fdaux = find(handles.NP.String=='[')-2;
else
    fdaux = length(handles.NP.String);
end

MAC = str2double(handles.MAC.String);                                       % Recebe o valor da corda média aerodinâmica
NP = str2double(handles.NP.String(find(handles.NP.String==':')+2:...        % Recebe valor do ponto neutro
    fdaux));
CG = str2double(handles.XcgU.String);                                       % Recebe posição do CG
ME = (NP-CG)/MAC*100;                                                       % Calcula margem estática em porcentagem
AUX = strcat(MES,{' = '},num2str(ME,3),char(37));                           % Monta cell para escrever na caixa de texto
handles.ME.String = AUX{:};                                                 % Escreve na caixa de texto a margem estática

% --------------------------------------------------------------------
function ExportMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ExportMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Exp1_Callback(hObject, eventdata, handles)
% hObject    handle to Exp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    Ginf = getappdata(ICXSData.ICxs_Defaut,'GINF');                         % Recebe do ICXS as características do gráfico
    Dec = Ginf.Decimal;                                                     % Marcador decimal, 1: vírgula, 0: ponto
else
    Dec = 0;                                                                % Caso o ICXS não esteja aberto, o default é o 'ponto'
end

f_ExPlot(handles.axes1,'-',Dec);                                            % Exporta figura com o gráfico

% --------------------------------------------------------------------
function Exp2_Callback(hObject, eventdata, handles)
% hObject    handle to Exp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','ICxsPrincipal');                                         % Recebe os handles da interface principal
if ~isempty(h)                                                              % Se o ICXS estiver aberto...
    ICXSData = guidata(h);                                                  % Aloca os handles da interface principal
    Ginf = getappdata(ICXSData.ICxs_Defaut,'GINF');                         % Recebe do ICXS as características do gráfico
    Dec = Ginf.Decimal;                                                     % Marcador decimal, 1: vírgula, 0: ponto
else
    Dec = 0;                                                                % Caso o ICXS não esteja aberto, o default é o 'ponto'
end

f_ExPlot(handles.axes2,'-',Dec);                                            % Exporta figura com o gráfico

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox2
if hObject.Value                                                            % Ativando o checkbox, ativa-se a seleção da confiabilidade
    handles.Conf.Enable = 'on';
    handles.edit5.Enable = 'on';
    setappdata(handles.ConfMenu,'CONFOLD',handles.Conf.String);             % Armazena a confiabilidade para futura comparação
else                                                                        % Desativando o checkbox, desativa-se a seleção da confiabilidade
    handles.Conf.Enable = 'off';
    handles.edit5.Enable = 'off';
end

function Conf_Callback(hObject, eventdata, handles)
% hObject    handle to Conf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Conf as text
%        str2double(get(hObject,'String')) returns contents of Conf as a double
a = str2double(hObject.String);                                             % Recebe valor informado pelo usuário
if a == 0 || isnan(a) || a > 100                                            % Caso esse valor seja inválido (= 0, > 100 ou não número)...
    hObject.String = getappdata(handles.ConfMenu,'CONFOLD');                % ... ele será substituído pelo valor antigo
else
    setappdata(handles.ConfMenu,'CONFOLD',hObject.String);                  % Case o valor seja válido, ele será armazenado para futura comparação
end

% --- Executes during object creation, after setting all properties.
function Conf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Conf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --------------------------------------------------------------------
function ConfMenu_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to ConfMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ConfMenu_OffCallback(hObject, eventdata, handles)
% hObject    handle to ConfMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.PanelConf.Visible = 'off';                                          % Desativa painel para selecionar a confiabilidade

% --------------------------------------------------------------------
function ConfMenu_OnCallback(hObject, eventdata, handles)
% hObject    handle to ConfMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.PanelConf.Visible = 'on';                                           % Ativa painel para selecionar a confiabilidade

% --- Executes on key press with focus on LNP or any of its controls.
function LNP_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to LNP (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.Key,'escape')                                           % Caso o usuário aperta a tecla esc, o painel de confiabilidade some e seu menu é desativado
    handles.PanelConf.Visible = 'off';
    handles.ConfMenu.State = 'off';
end
