%%
%% ECCE 302: SIGNALS AND SYSTEMS LABORATORY Mini Project

%%
% *Experiment Mini Project: Ten Channel Audio Equalizer*

%%
% *Group Number: _[Gr06]_*
%
% *Laboratory Group: _[Lateefa Mahmoud, Nardos Daniel, Nathnael Ghebrehiwet]_*

%% 1. PROBLEM STATEMENT
% Design and implement in Matlab a 10-channel system emulating the console 
%for music recording/playing.

%% 2. EXPERIMENT
%clear  delete all variables
%close all  close all the plots
%clc  clear the command line

% _Code is made as clean as possible to make it easier for a reader to
% understand. Almost all redundant auto-generated comments are cleared._
%% 2.1 GUI setup

%2.1.1 Initializing 
function varargout = MiniProject_AudioEqualizer(varargin)
% MiniProject_AudioEqualizer M-file for MiniProject_AudioEqualizer.fig
%      MiniProject_AudioEqualizer, by itself, creates a new MiniProject_AudioEqualizer or raises the existing
%      singleton*.
%
%      H = MiniProject_AudioEqualizer returns the handle to a new MiniProject_AudioEqualizer or the handle to
%      the existing singleton*.
%
%      MiniProject_AudioEqualizer('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MiniProject_AudioEqualizer.M with the given input arguments.
%
%      MiniProject_AudioEqualizer('Property','Value',...) creates a new MiniProject_AudioEqualizer or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MiniProject_AudioEqualizer_OpeningFcn gets called.  An
%      unrecognized property address or invalid value makes property application
%      stop.  All inputs are passed to MiniProject_AudioEqualizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MiniProject_AudioEqualizer

% Last Modified by GUIDE v2.5 10-Dec-2018 17:20:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyEqualizer_OpeningFcn, ...
                   'gui_OutputFcn',  @MyEqualizer_OutputFcn, ...
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


% --- Executes just before MyEqualizer is made visible.
function MyEqualizer_OpeningFcn(hObject, eventdata, handles, varargin)
global C;

%An array for storing gain values as specified by the user.
C=zeros(1,10);

%The maximum and mininum values the sliders in the GUI is specified. Plus
%their steps. Their initial values values set at 0. The editText fields
%are also set to zero.
set(handles.C1_var,'min',-80);
set(handles.C1_var,'max',30);
set(handles.C1_var,'value',0);
set(handles.C1_var,'SliderStep',[0.025,0.05]);
set(handles.C1_val,'string',num2str(0));

set(handles.C2_var,'min',-80);
set(handles.C2_var,'max',30);
set(handles.C2_var,'value',0);
set(handles.C2_var,'SliderStep',[0.025,0.05]);
set(handles.C2_val,'string',num2str(0));

set(handles.C3_var,'min',-80);
set(handles.C3_var,'max',30);
set(handles.C3_var,'value',0);
set(handles.C3_var,'SliderStep',[0.025,0.05]);
set(handles.C3_val,'string',num2str(0));

set(handles.C4_var,'min',-80);
set(handles.C4_var,'max',30);
set(handles.C4_var,'value',0);
set(handles.C4_var,'SliderStep',[0.025,0.05]);
set(handles.C4_val,'string',num2str(0));

set(handles.C5_var,'min',-80);
set(handles.C5_var,'max',30);
set(handles.C5_var,'value',0);
set(handles.C5_var,'SliderStep',[0.025,0.05]);
set(handles.C5_val,'string',num2str(0));

set(handles.C6_var,'min',-80);
set(handles.C6_var,'max',30);
set(handles.C6_var,'value',0);
set(handles.C6_var,'SliderStep',[0.025,0.05]);
set(handles.C6_val,'string',num2str(0));

set(handles.C7_var,'min',-80);
set(handles.C7_var,'max',30);
set(handles.C7_var,'value',0);
set(handles.C7_var,'SliderStep',[0.025,0.05]);
set(handles.C7_val,'string',num2str(0));

set(handles.C8_var,'min',-80);
set(handles.C8_var,'max',30);
set(handles.C8_var,'value',0);
set(handles.C8_var,'SliderStep',[0.025,0.05]);
set(handles.C8_val,'string',num2str(0));

set(handles.C9_var,'min',-80);
set(handles.C9_var,'max',30);
set(handles.C9_var,'value',0);
set(handles.C9_var,'SliderStep',[0.025,0.05]);
set(handles.C9_val,'string',num2str(0));

set(handles.C10_var,'min',-80);
set(handles.C10_var,'max',30);
set(handles.C10_var,'value',0);
set(handles.C10_var,'SliderStep',[0.025,0.05]);
set(handles.C10_val,'string',num2str(0));

% Choose default command line output for MyEqualizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = MyEqualizer_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%2.1.2 Callbacks for each slider

%Each slider has a listener that takes its value, stores it in the gain
%array. This also sets the editText values.

% --- Executes on slider movement.
function C1_var_Callback(hObject, eventdata, handles)
global C;
C(1)=get(hObject,'value');
set(handles.C1_val,'string',num2str(C(1)));

% --- Executes during object creation, after setting all properties.
function C1_var_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C2_var_Callback(hObject, eventdata, handles)
global C;
C(2)=get(hObject,'value');
set(handles.C2_val,'string',num2str(C(2)));

% --- Executes during object creation, after setting all properties.
function C2_var_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C3_var_Callback(hObject, eventdata, handles)
global C;
C(3)=get(hObject,'value');
set(handles.C3_val,'string',num2str(C(3)));

% --- Executes during object creation, after setting all properties.
function C3_var_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C4_var_Callback(hObject, eventdata, handles)
global C;
C(4)=get(hObject,'value');
set(handles.C4_val,'string',num2str(C(4)));

% --- Executes during object creation, after setting all properties.
function C4_var_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C5_var_Callback(hObject, eventdata, handles)
global C;
C(5)=get(hObject,'value');
set(handles.C5_val,'string',num2str(C(5)));

% --- Executes during object creation, after setting all properties.
function C5_var_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C6_var_Callback(hObject, eventdata, handles)
global C;
C(6)=get(hObject,'value');
set(handles.C6_val,'string',num2str(C(6)));

% --- Executes during object creation, after setting all properties.
function C6_var_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C7_var_Callback(hObject, eventdata, handles)
global C;
C(7)=get(hObject,'value');
set(handles.C7_val,'string',num2str(C(7)));

% --- Executes during object creation, after setting all properties.
function C7_var_CreateFcn(hObject, eventdata, handles)
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C8_var_Callback(hObject, eventdata, handles)
global C;
C(8)=get(hObject,'value');
set(handles.C8_val,'string',num2str(C(8)));

% --- Executes during object creation, after setting all properties.
function C8_var_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C9_var_Callback(hObject, eventdata, handles)
global C;
C(9)=get(hObject,'value');
set(handles.C9_val,'string',num2str(C(9)));

% --- Executes during object creation, after setting all properties.
function C9_var_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C10_var_Callback(hObject, eventdata, handles)
global C;
C(10)=get(hObject,'value');
set(handles.C10_val,'string',num2str(C(10)));

% --- Executes during object creation, after setting all properties.
function C10_var_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%2.1.2 Callbacks for each editText

%Each editText has a listener that checks its value (the value can neither
%be less than 30 nor can exceed 80), stores its value in the array of gain,
%set the respective handlers to the current correct value.

function C1_val_Callback(hObject, eventdata, handles)
global C;
C(1)=str2num(get(hObject,'string'));
minn=get(handles.C1_var,'min');
maxx=get(handles.C1_var,'max');
if(C(1)<minn || C(1)>maxx)
    C(1)=get(handles.C1_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C1_var,'value',C(1));
end


% --- Executes during object creation, after setting all properties.
function C1_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C2_val_Callback(hObject, eventdata, handles)
global C;
C(2)=str2num(get(hObject,'string'));
minn=get(handles.C2_var,'min');
maxx=get(handles.C2_var,'max');
if(C(2)<minn || C(2)>maxx)
    C(2)=get(handles.C2_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C2_var,'value',C(2));
end

% --- Executes during object creation, after setting all properties.
function C2_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C3_val_Callback(hObject, eventdata, handles)
global C;
C(3)=str2num(get(hObject,'string'));
minn=get(handles.C3_var,'min');
maxx=get(handles.C3_var,'max');
if(C(3)<minn || C(3)>maxx)
    C(3)=get(handles.C3_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C3_var,'value',C(3));
end

% --- Executes during object creation, after setting all properties.
function C3_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C4_val_Callback(hObject, eventdata, handles)
C(4)=str2num(get(hObject,'string'));
minn=get(handles.C4_var,'min');
maxx=get(handles.C4_var,'max');
if(C(4)<minn || C(4)>maxx)
    C(4)=get(handles.C4_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C4_var,'value',C(4));
end

% --- Executes during object creation, after setting all properties.
function C4_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C5_val_Callback(hObject, eventdata, handles)
global C;
C(5)=str2num(get(hObject,'string'));
minn=get(handles.C5_var,'min');
maxx=get(handles.C5_var,'max');
if(C(5)<minn || C(5)>maxx)
    C(5)=get(handles.C5_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C5_var,'value',C(5));
end

% --- Executes during object creation, after setting all properties.
function C5_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function C6_val_Callback(hObject, eventdata, handles)
global C;
C(6)=str2num(get(hObject,'string'));
minn=get(handles.C6_var,'min');
maxx=get(handles.C6_var,'max');
if(C(6)<minn || C(6)>maxx)
    C(6)=get(handles.C6_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C6_var,'value',C(6));
end

% --- Executes during object creation, after setting all properties.
function C6_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C7_val_Callback(hObject, eventdata, handles)
global C;
C(7)=str2num(get(hObject,'string'));
minn=get(handles.C7_var,'min');
maxx=get(handles.C7_var,'max');
if(C(7)<minn || C(7)>maxx)
    C(7)=get(handles.C7_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C7_var,'value',C(7));
end

% --- Executes during object creation, after setting all properties.
function C7_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C8_val_Callback(hObject, eventdata, handles)
global C;
C(8)=str2num(get(hObject,'string'));
minn=get(handles.C8_var,'min');
maxx=get(handles.C8_var,'max');
if(C(8)<minn || C(8)>maxx)
    C(8)=get(handles.C8_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C8_var,'value',C(8));
end

% --- Executes during object creation, after setting all properties.
function C8_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function C9_val_Callback(hObject, eventdata, handles)
global C;
C(9)=str2num(get(hObject,'string'));
minn=get(handles.C9_var,'min');
maxx=get(handles.C9_var,'max');
if(C(9)<minn || C(9)>maxx)
    C(9)=get(handles.C9_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C9_var,'value',C(9));
end

% --- Executes during object creation, after setting all properties.
function C9_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function C10_val_Callback(hObject, eventdata, handles)
global C;
C(10)=str2num(get(hObject,'string'));
minn=get(handles.C10_var,'min');
maxx=get(handles.C10_var,'max');
if(C(10)<minn || C(10)>maxx)
    C(10)=get(handles.C1_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C10_var,'value',C(10));
end

% --- Executes during object creation, after setting all properties.
function C10_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%2.1.3 Callbacks for each button

% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)

myGui=guidata(handles.figure1);
[file,path] = uigetfile('*.wav','File Selector');
[x,fs] = audioread([path file]);

myGui.freqSam=fs;
myGui.datasound=x;
myGui.flag=2;

xdft = fft(x);
xdft = xdft(1:length(x)/2+1);
freq = 0:fs/length(x):fs/2;
plot(myGui.originalAxis,(freq),real(xdft));
title(myGui.originalAxis,'Original Audio'); 
ylabel(myGui.originalAxis,'Amplitude');
xlabel(myGui.originalAxis,'frequencies');
grid off

set(handles.address,'String',[path file]);
guidata(handles.figure1,myGui)

% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
global Fs datasound;

Fs=44100;

myGui=guidata(handles.figure1);

equalizer_play(myGui.datasound);

if(myGui.flag==2)
    myGui.player = audioplayer(datasound, Fs);
    
    xdft = fft(datasound);
    xdft = xdft(1:length(datasound)/2+1);
    freq = 0:Fs/length(datasound):Fs/2;
    plot(myGui.equalizedAxis,(freq),real(xdft));
    title(myGui.equalizedAxis,'Equalized Audio'); 
    ylabel(myGui.equalizedAxis,'Amplitude');
    xlabel(myGui.equalizedAxis,'frequencies');
    %grid on
    
    myGui.flag=1;
    disp('Now playing');
    play(myGui.player);
else
    if(myGui.flag == 1)
        disp('|| paused');
        myGui.flag=0;
        pause(myGui.player);
    else
        disp('|> resumed');
        myGui.flag=1;
        resume(myGui.player)
    end
end
guidata(handles.figure1,myGui);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
global C;

C=zeros(1,10);

set(handles.C1_val,'string',num2str(0));
set(handles.C2_val,'string',num2str(0));
set(handles.C3_val,'string',num2str(0));
set(handles.C4_val,'string',num2str(0));
set(handles.C5_val,'string',num2str(0));
set(handles.C6_val,'string',num2str(0));
set(handles.C7_val,'string',num2str(0));
set(handles.C8_val,'string',num2str(0));
set(handles.C9_val,'string',num2str(0));
set(handles.C10_val,'string',num2str(0));

set(handles.C1_var,'value',0);
set(handles.C2_var,'value',0);
set(handles.C3_var,'value',0);
set(handles.C4_var,'value',0);
set(handles.C5_var,'value',0);
set(handles.C6_var,'value',0);
set(handles.C7_var,'value',0);
set(handles.C8_var,'value',0);
set(handles.C9_var,'value',0);
set(handles.C10_var,'value',0);

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
myGui=guidata(handles.figure1);
myGui.flag=2;
disp('stopped');
stop(myGui.player);
guidata(handles.figure1,myGui);

%% 2.2 Processing the music
%The following function does the whole filtering process when called by the
%play_Callback.
function equalizer_play(Audio)

global C Fs datasound;
%Where C --> is an array gain values,
%Fs --> sampling frequency, 
%datasound--> a vector of signal(audio) data

%An array of Analog Center Frequencies
ACF= [80 170 310 600 1000 3000 6000 12000 14000 16000]; 
NACF = (ACF.*2*pi)./Fs; %Normalizing the Analog Center frequencies
DCF = tan(NACF./2);     %Frequency pre-warping (Analog to digital 
                        %frequencies)
DCf = [];               %An empty array for storing cut-off frequencies 
BWBP =[];               %An empty array for storing the bandwidth

%order = [1,1,1,1,1,1,1,1,1,1];         %The worst possible order for all
order = [6,3,3,4,4,5,7,10,10,10];       %An array of order for each filter
%order = [10,10,4,4,7,1,1,1,1,1];       %3rd filter problem at n=10 order
%order = [10,10,10,10,10,10,10,10,10,10];   %quite a high order even matlab
                                            %couldn't handle

%%Digital Cuttoff frequencies Setup
DCf(1)= DCF(1);
DCf(10)=DCF(10);        %LPF and HPF cut-off frequencies will just be the 
                        %given frequencies (no-modifications)
BWBP(1) = 0;
BWBP(10) = 0;           %Actually,no need to specify the bandwidth when 
                        %designing the LPF or HPF, however,
                        %the value

for i=2:9
    DCf(i) = sqrt(DCF(i)*DCF(i+1)); %Calculating cutoff frequencies from 
                                    %center frequencies for each BPF.
    BWBP(i) = DCf(i) - DCf(i-1);    %Banwidth for each BPF.
end;

[AN{1},AD{1}] = butter(6,DCf(1),'low','s'); %LPF for the first frequency.
[AN{10},AD{10}] = butter(10,DCf(10),'high','s');%HPF for the last frequency.
                                    
%For each of the 8 frequncies in the middle, a LPF is designed first and 
%then converted to BPF using lp2bp function.
for i=2:9
    [NUM,DEN] = butter(order(i), 1,'low','s');
    [AN{i},AD{i}] = lp2bp(NUM,DEN,DCf(i),BWBP(i));
end
                                    

%Applying bilinear transformation to obtain digitalized filters.
for i=1:10
    [DN{i},DD{i}] = bilinear(AN{i},AD{i},1);
    [BDN{i},BDD{i}] = bilinear(AN{i},AD{i},1);
end

%Taking the gain values from user (in DB) applying to each digitized filter
for i=1:10
    DN{i} = (10.^(C(i)/20)) * DN{i};     
end


%This is the final step where the magic of filtering happens.
datasound = zeros(size(Audio)); %An array of zeros for storing the output 
                                %of the filtering process.
for i = 1:10
    datasound = datasound + filter(DN{i},DD{i},Audio); 
end

audiowrite('EQAudio.wav',datasound,Fs); %The equalized audio being stored.


W = 0:0.001:pi;	% Range of digital frequencies
NDCF = (0.5*W*Fs)./pi;% Digital frequencies converted back to hertz

%{
for i=1:10
    FR{i} = freqz(BDN{i},BDD{i},W); %% freqz used to obtain the frequency response 
    figure(10+i)
    plot(NDCF,real(20*log10(FR{i}))) %Plot of gain in db vs. freq
    title(['Filter ',int2str(i),' before the equalization'])
    ylabel('Amplitude [dB]')
    xlabel('frequency [Hz]') 
    ylim([-100 50])
    grid on
end

for i=1:10
    FR{i} = freqz(DN{i},DD{i},W); %% freqz used to obtain the frequency response
    figure (20+i)
    plot(NDCF,real(20*log10(FR{i}))) %Plot of gain in db vs. freq
    title(['Filter', int2str(i),'After the equalization'])
    ylabel('Amplitude [dB]') 
    xlabel('frequency [Hz]') 
    ylim([-100 50])
    grid
end
%}