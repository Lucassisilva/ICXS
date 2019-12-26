%--------------------------------------------%
%------------MATLAB Musical JukeBox----------%
%--------Mark--Belbin----Athan--Bourganos----%
%--------------------------------------------%
%--------------Enjoy-The-Jukebox-------------%
%--~~~---~~~---~~~---~~~~---~~~---~~~---~~~--%
%____________________________________________%

function TetrisTheme()

yALL = [];
Fs = 8000;


G88 = 97.9989;
Ab88 = 103.826;
D8 = 146.832;
Gb8 = 184.997;
Ab8 = 207.652;
A8 = 220.000;
Bb8 = 233.082;
B8 = 246.942;
C = 261.626;
Db = 277.183;
D = 293.665;
Eb = 311.127;
E = 329.628;
F = 349.228;
Gb = 369.994;
G = 391.995;
Ab = 415.305;
A = 440.000;
Bb = 466.164;
B = 493.883;
c = 523.251;
db = 554.365;
d = 587.330;
eb = 622.254;
e = 659.255;
f = 698.456;
gb = 739.989;
g = 783.991;
ab = 830.609;
a = 880.000;
bb = 932.328;
b = 987.767;
c8 = 1046.50;
db8 = 1108.73;
d8 = 1174.66;
eb8 = 1244.51;
e8 = 1318.51;

pause_value = 0.05;
pause_logic = 0;
pause_count = 0;

tetris_tones = [e B c d c  B A A c e d c   B B c d e c   A A 0   d f a g   f e c e   d c B B c d  e c A A 0  E C D B8  C A8 Ab8 B8  E C D B8  C E A A Ab 0];
tetris_times = [6 3 3 6 3 3   6 3 3 6 3 3   6 3 3   6 6 6 6 6  9 9 3  6 3 3  9 3 6  3 3 6 3 3 6 6 6 6 6 9   12 12 12 12 12   12 12 12 12 12   12 12   6 6 6 6  24 12 ];
tetris_times = tetris_times/1.5;
for (a = 1: 1: ((length(tetris_tones) * 2) - 1))
    if pause_logic == 0
        
    t = 1/Fs:1/Fs:(tetris_times(a - pause_count)/16);
    y = sin(tetris_tones(a - pause_count)*2*pi*t);
    yALL = [yALL, y];
    
    elseif pause_logic == 1
        
    t = 1/Fs:1/Fs:(pause_value/24);
    y = sin(0*2*pi*t);
    yALL = [yALL, y];
    pause_count = pause_count + 1;
    
    end
    
    if pause_logic == 1
        pause_logic = 0;
        
    elseif pause_logic == 0
        pause_logic = 1;
        
    end
    
end

sound(yALL, Fs);

end