function varargout = Guide(varargin)
% GUIDE MATLAB code for Guide.fig
%      GUIDE, by itself, creates a new GUIDE or raises the existing
%      singleton*.
%
%      H = GUIDE returns the handle to a new GUIDE or the handle to
%      the existing singleton*.
%
%      GUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE.M with the given input arguments.
%
%      GUIDE('Property','Value',...) creates a new GUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Guide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Guide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Guide

% Last Modified by GUIDE v2.5 27-Sep-2018 18:28:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Guide_OpeningFcn, ...
                   'gui_OutputFcn',  @Guide_OutputFcn, ...
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


% --- Executes just before Guide is made visible.
function Guide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Guide (see VARARGIN)

% Choose default command line output for Guide
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Guide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Guide_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cargaImgs.

function cargaImgs_Callback(hObject, eventdata, handles)
% hObject    handle to cargaImgs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = ...
    uigetfile({'*.jpg'; '*.bmp';'*.giff'; '*.jpeg';'*.png';'*.tiff'},...
    'Selector de Imagenes','MultiSelect','on');
%table headers
handles.tablaImg.ColumnName = {'Nombre','Vista Rapida','Procesamiento'};
celda = cell(length(filename),3);
celda(:,1) = filename';
celda(:,2) = {'...'};
celda(:,3) = {true};
handles.tablaImg.Data = celda;
handles.tablaImg.ColumnEditable = true;
guidata(hObject,pathname) %store in hObj the pathname string
%guidata(hObject,handles)

% --- Executes when selected cell(s) is changed in tablaImg.
function tablaImg_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to tablaImg (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
if isempty(eventdata.Indices)
    %Do nothing but...
elseif eventdata.Indices(2) == 2
    pathname = guidata(hObject); %retrieve the pathname stored in uitable
    imshow([pathname hObject.Data{eventdata.Indices(1),1}])
    hObject.Data(:,2) = {'...'};
    hObject.Data(eventdata.Indices(1),eventdata.Indices(2)) = {'displayed'};
else
    %nothing
end


% --------------------------------------------------------------------
function armaVideo_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to armaVideo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = findobj('tag','tablaImg');
truefalseColumn = handles.Data(:,3);
pics = handles.Data(:,1);
pathname = guidata(hObject);

ind = find(cell2mat(truefalseColumn)); %indices of nonzero elements
selected_names = pics(ind);

cell_full_name = cell(numel(ind),1);

for k=1:numel(ind)
    cell_full_name{k} = [pathname selected_names{k}];
end

prompt = {'Enter the name of the video: ', 'Frame rate: '};
dlg_title = 'Save';
num_lines = 1;
def = {'myVid','5'};
video_info = inputdlg(prompt,dlg_title,num_lines,def);

pathfor_video = [pathname video_info{1}];
video_Obj = VideoWriter(pathfor_video);
video_Obj.FrameRate = eval(video_info{2});

open(video_Obj);
progress_bar = waitbar(0,'Processing video...');
for t=1:length(cell_full_name)
    Frame = imread(cell_full_name{t});
    writeVideo(video_Obj,im2frame(Frame));
    waitbar(t/length(cell_full_name));
end
close(video_Obj);
close(progress_bar);
winopen([pathfor_video '.avi']);
