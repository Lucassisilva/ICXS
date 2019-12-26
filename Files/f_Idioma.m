function f_Idioma(handles,Id)
% MODIFICA IDIOMA DO PROGRAMA
% Esta função modifica o idioma do programa.
% Entrada: handles: informações do gui; Id: idioma.
% Saída: -

switch Id
    case 0                                                                  % Inglês
        %% Menubar
        handles.FileMenu.Label = 'File';
            handles.OpenFile.Label = 'Open';
            handles.OpenTab.Label = 'Open in new tab';
            handles.ConvToMa.Label = 'Convert file to .mat...';
            handles.ConvFromMa.Label = 'Convert from .mat...';
                handles.ConvMaEx.Label = '...to .xlsx';
                handles.ConvMaCsv.Label = '...to .csv';
            handles.MergFig.Label = 'Merge figures (.fig)';
            handles.SaveWorkspace.Label = 'Save workspace';
            handles.LoadWorkspace.Label = 'Load workspace';
        handles.ExpPlotMenu.Label = 'Export';
            handles.ExpL1.Label = 'Layout 1';
                handles.ExpL1A.Label = 'Plot A';
                handles.ExpL1B.Label = 'Plot B';
                handles.ExpL1C.Label = 'Plot C';
                handles.ExpL1D.Label = 'Plot D';
                handles.MenuData1.Label = 'Data';
            handles.ExpL2.Label = 'Layout 2';
                handles.ExpL2A.Label = 'Plot A';
                handles.ExpL2B.Label = 'Plot B';
                handles.ExpL2C.Label = 'Plot C';
                handles.ExpL2D.Label = 'Plot D';
                handles.MenuData2.Label = 'Data';                
            handles.ExpL3.Label = 'Layout 3';
                handles.ExpL3Y1.Label = 'One y-axis';
                handles.ExpL3Y2.Label = 'Two y-axes';
                handles.MenuData3.Label = 'Data';                
        handles.OptionsMenu.Label = 'Options';
            handles.PrefMenu.Label = 'Preferences';
            handles.LangMenu.Label = 'Language';
                handles.handles.LangEng.Label = 'English';
                handles.LangPort.Label = 'Portuguese';
        handles.AeroMenu.Label = 'Aeronautics';
            handles.AtmosMenu.Label = 'Atmosphere';
                handles.DAMenu.Label = 'Density altitude';
            handles.FCMenu.Label = 'Flight card';
            handles.PerfMenu.Label = 'Performance';
                handles.ROCDMenu.Label = 'Rate of climb/descent';
                handles.StallSpeed.Label = 'Stall speed';
                handles.TurnMenu.Label = 'Turn';
                handles.TOLMenu.Label = 'Takeoff and landing';
                handles.FPMenu.Label = 'Flight path';
                handles.DPMenu.Label = 'Drag polar';
            handles.SaCMenu.Label = 'Stability and Control';
                handles.NPMenu.Label = 'Neutral point';
                handles.DynAnlMenu.Label = 'Dynamic analysis';
        handles.StatiMenu.Label = 'Statistics';
            handles.DRejectMenu.Label = 'Data rejection';
                handles.ChauveMenu.Label = 'Chauvenet''s Criterion';
            handles.ErrorBarMenu.Label = 'Error bars';
        handles.HelpMenu.Label = 'Help';
        
        %% Toolbar
        handles.Layout1.TooltipString = 'Layout 1';
        handles.Layout2.TooltipString = 'Layout 2';
        handles.Layout3.TooltipString = 'Layout 3';
        handles.zoomin.TooltipString = 'Zoom In';
        handles.zoomout.TooltipString = 'Zoom Out';
        handles.pan.TooltipString = 'Pan';
        handles.datacursor.TooltipString = 'Data Cursor';
        
        %% Preferences        
        handles.Pref_Panel.Title = 'Preferences';
        handles.Pref_LST.String = 'Line style';
        handles.Pref_LS.String = {'Dotted';'Solid'};
        handles.Pref_LCT.String = 'Line color';
        handles.Pref_DMT.String = 'Decimal mark';
        handles.text9.String = '(Export)';
        handles.Pref_FST.String = 'Font size';
        handles.Pref_Res.String = 'Reset';
        handles.Pref_Apply.String = 'Apply';
        
        %% Layout 1
        handles.XS1_Zooming.String = 'Zooming';
        
        %% Layout 2
        handles.XS2_LimCB.String = 'Choose range';
        
        %% Layout 3
        handles.XS3_Zooming.String = 'Zooming';
        handles.XS3_Perc.String = 'Plot using percentage';
        
        %% Layout 0
        imshow('i_ICXS_eng.bmp', 'Parent', handles.XS0_ICXS);
        set(handles.XS0_ICXS, 'HitTest', 'off')                             % Torna impossível interagir com a imagem da logo
    case 1                                                                  % Português
        %% Menubar
        handles.FileMenu.Label = 'Arquivo';
            handles.OpenFile.Label = 'Abrir';
            handles.OpenTab.Label = 'Abrir em nova aba';
            handles.ConvToMa.Label = 'Converter arquivo para .mat...';
            handles.ConvFromMa.Label = 'Converter de .mat...';
                handles.ConvMaEx.Label = '...para .xlsx';
                handles.ConvMaCsv.Label = '...para .csv';
            handles.MergFig.Label = 'Mesclar figuras (.fig)';
            handles.SaveWorkspace.Label = 'Salvar workspace';
            handles.LoadWorkspace.Label = 'Carregar workspace';
        handles.ExpPlotMenu.Label = 'Exportar';
            handles.ExpL1.Label = 'Layout 1';
                handles.ExpL1A.Label = 'Gráfico A';
                handles.ExpL1B.Label = 'Gráfico B';
                handles.ExpL1C.Label = 'Gráfico C';
                handles.ExpL1D.Label = 'Gráfico D';
                handles.MenuData1.Label = 'Dados';
            handles.ExpL2.Label = 'Layout 2';
                handles.ExpL2A.Label = 'Gráfico A';
                handles.ExpL2B.Label = 'Gráfico B';
                handles.ExpL2C.Label = 'Gráfico C';
                handles.ExpL2D.Label = 'Gráfico D';
                handles.MenuData2.Label = 'Dados';
            handles.ExpL3.Label = 'Layout 3';
                handles.ExpL3Y1.Label = 'Um eixo y';
                handles.ExpL3Y2.Label = 'Dois eixos y';
                handles.MenuData3.Label = 'Dados';
        handles.OptionsMenu.Label = 'Opções';
            handles.PrefMenu.Label = 'Preferências';
            handles.LangMenu.Label = 'Idioma';
                handles.LangEng.Label = 'Inglês';
                handles.LangPort.Label = 'Português';
        handles.AeroMenu.Label = 'Aeronáutica';
            handles.AtmosMenu.Label = 'Atmosfera';
                handles.DAMenu.Label = 'Altitude densidade';
            handles.FCMenu.Label = 'Cartão de voo';
            handles.PerfMenu.Label = 'Desempenho';
                handles.ROCDMenu.Label = 'Razão de subida/descida';
                handles.StallSpeed.Label = 'Velocidade de estol';
                handles.TurnMenu.Label = 'Curva';
                handles.TOLMenu.Label = 'Decolagem e pouso';
                handles.FPMenu.Label = 'Trajetória de voo';
                handles.DPMenu.Label = 'Polar de arrasto';
            handles.SaCMenu.Label = 'Estabilidade e Controle';
                handles.NPMenu.Label = 'Ponto neutro';
                handles.DynAnlMenu.Label = 'Análise dinâmica';
        handles.StatiMenu.Label = 'Estatística';
            handles.DRejectMenu.Label = 'Rejeição de dados';
                handles.ChauveMenu.Label = 'Critério de Chauvenet';
            handles.ErrorBarMenu.Label = 'Barras de erro';
        handles.HelpMenu.Label = 'Ajuda';
        
        %% Toolbar
        handles.Layout1.TooltipString = 'Layout 1';
        handles.Layout2.TooltipString = 'Layout 2';
        handles.Layout3.TooltipString = 'Layout 3';
        handles.zoomin.TooltipString = 'Ampliar';
        handles.zoomout.TooltipString = 'Reduzir';
        handles.pan.TooltipString = 'Mover';
        handles.datacursor.TooltipString = 'Cursor de dados';
        
        %% Preferences        
        handles.Pref_Panel.Title = 'Preferências';
        handles.Pref_LST.String = 'Estilo da linha';
        handles.Pref_LS.String = {'Pontos';'Sólido'};
        handles.Pref_LCT.String = 'Cor da linha';
        handles.Pref_DMT.String = 'Marca decimal';
        handles.text9.String = '(Ao exportar)';
        handles.Pref_FST.String = 'Tamanho da fonte';
        handles.Pref_Res.String = 'Restaurar';
        handles.Pref_Apply.String = 'Aplicar';
        
        %% Layout 1
        handles.XS1_Zooming.String = 'Zoom ativado';
        
        %% Layout 2
        handles.XS2_LimCB.String = 'Escolha o intervalo';
        
        %% Layout 3
        handles.XS3_Zooming.String = 'Zoom ativado';
        handles.XS3_Perc.String = 'Plotar usando porcentagem';
        
        %% Layout 0
        imshow('i_ICXS_pt.bmp', 'Parent', handles.XS0_ICXS);
        set(handles.XS0_ICXS, 'HitTest', 'off')                             % Torna impossível interagir com a imagem da logo
end
end