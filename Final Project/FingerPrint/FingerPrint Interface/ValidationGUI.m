function varargout = ValidationGUI(varargin)
% VALIDATIONGUI M-file for ValidationGUI.fig
%      VALIDATIONGUI, by itself, creates a new VALIDATIONGUI or raises the existing
%      singleton*.
%
%      H = VALIDATIONGUI returns the handle to a new VALIDATIONGUI or the handle to
%      the existing singleton*.
%
%      VALIDATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VALIDATIONGUI.M with the given input arguments.
%
%      VALIDATIONGUI('Property','Value',...) creates a new VALIDATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ValidationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ValidationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ValidationGUI

% Last Modified by GUIDE v2.5 01-Aug-2007 15:20:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ValidationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ValidationGUI_OutputFcn, ...
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


% --- Executes just before ValidationGUI is made visible.
function ValidationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ValidationGUI (see VARARGIN)

% Choose default command line output for ValidationGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ValidationGUI wait for user response (see UIRESUME)
% uiwait(handles.ValidationGUI);
I=varargin{1};
CentroidFinX=varargin{2};
CentroidFinY=varargin{3};
OrientationFin=varargin{4};
CentroidSepX=varargin{5};
CentroidSepY=varargin{6};
OrientationSep=varargin{7};
% OrientationFin=getappdata(handles.FingerPrintGUI,'OrientationFin');
% OrientationSep=getappdata(handles.FingerPrintGUI,'OrientationSep');
NanFin=isnan(CentroidFinX);
NanSep=isnan(CentroidSepX);
CentroidFinX(NanFin)=[];
CentroidFinY(NanFin)=[];
CentroidSepX(NanSep)=[];
CentroidSepY(NanSep)=[];
OrientationFin(NanFin)=[];
OrientationSep(NanSep,:)=[];
image(I)
hold on



for i=1:min([20 length(CentroidFinX)])
    var=eval(['handles.term' num2str(i)]);
    set(var,'string',['X = ' num2str(CentroidFinX(i)) ...
        '  ,  Y = ' num2str(CentroidFinY(i))]);
    set(var,'value',1);
    p=plot(CentroidFinX(i),CentroidFinY(i),'ro','linewidth',2);
    set(var,'userdata',[i p])
end
for j=i+1:20
    var=eval(['handles.term' num2str(j)]);
    set(var,'visible','off');
end
for i=1:length(CentroidSepX)
    var=eval(['handles.bif' num2str(i)]);
    set(var,'string',['X = ' num2str(CentroidSepX(i)) ...
        '  ,  Y = ' num2str(CentroidSepY(i))]);
    set(var,'value',1);
    p=plot(CentroidSepX(i),CentroidSepY(i),'go','linewidth',2);
    set(var,'userdata',[i p])
end
for j=i+1:20
    var=eval(['handles.bif' num2str(j)]);
    set(var,'visible','off');
end
hold off
setappdata(handles.ValidationGUI,'CentroidFinX',CentroidFinX);
setappdata(handles.ValidationGUI,'CentroidFinY',CentroidFinY);
setappdata(handles.ValidationGUI,'CentroidSepX',CentroidSepX);
setappdata(handles.ValidationGUI,'CentroidSepY',CentroidSepY);
setappdata(handles.ValidationGUI,'OrientationFin',OrientationFin);
setappdata(handles.ValidationGUI,'OrientationSep',OrientationSep);
setappdata(handles.ValidationGUI,'OriginalImage',I);
% --- Outputs from this function are returned to the command line.
function varargout = ValidationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bif1.
function bif1_Callback(hObject, eventdata, handles)
% hObject    handle to bif1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif1
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif2.
function bif2_Callback(hObject, eventdata, handles)
% hObject    handle to bif2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif2
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif3.
function bif3_Callback(hObject, eventdata, handles)
% hObject    handle to bif3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif3
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif4.
function bif4_Callback(hObject, eventdata, handles)
% hObject    handle to bif4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif4
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in bif5.
function bif5_Callback(hObject, eventdata, handles)
% hObject    handle to bif5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif5
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif6.
function bif6_Callback(hObject, eventdata, handles)
% hObject    handle to bif6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif6

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in bif7.
function bif7_Callback(hObject, eventdata, handles)
% hObject    handle to bif7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif7
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif8.
function bif8_Callback(hObject, eventdata, handles)
% hObject    handle to bif8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif8
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif9.
function bif9_Callback(hObject, eventdata, handles)
% hObject    handle to bif9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif9

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in bif10.
function bif10_Callback(hObject, eventdata, handles)
% hObject    handle to bif10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif10
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif11.
function bif11_Callback(hObject, eventdata, handles)
% hObject    handle to bif11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif11
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in bif12.
function bif12_Callback(hObject, eventdata, handles)
% hObject    handle to bif12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif12

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in bif13.
function bif13_Callback(hObject, eventdata, handles)
% hObject    handle to bif13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif13

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in bif14.
function bif14_Callback(hObject, eventdata, handles)
% hObject    handle to bif14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif14

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in bif15.
function bif15_Callback(hObject, eventdata, handles)
% hObject    handle to bif15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif15
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif16.
function bif16_Callback(hObject, eventdata, handles)
% hObject    handle to bif16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif16
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif17.
function bif17_Callback(hObject, eventdata, handles)
% hObject    handle to bif17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif17

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in bif18.
function bif18_Callback(hObject, eventdata, handles)
% hObject    handle to bif18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif18
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in bif20.
function bif20_Callback(hObject, eventdata, handles)
% hObject    handle to bif20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif20

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in checkbox39.

% --- Executes on button press in term1.
function term1_Callback(hObject, eventdata, handles)
% hObject    handle to term1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term1
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term2.
function term2_Callback(hObject, eventdata, handles)
% hObject    handle to term2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term2
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term3.
function term3_Callback(hObject, eventdata, handles)
% hObject    handle to term3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term3
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term4.
function term4_Callback(hObject, eventdata, handles)
% hObject    handle to term4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term4
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term5.
function term5_Callback(hObject, eventdata, handles)
% hObject    handle to term5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term5
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in term6.
function term6_Callback(hObject, eventdata, handles)
% hObject    handle to term6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term6
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term7.
function term7_Callback(hObject, eventdata, handles)
% hObject    handle to term7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term7

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in term8.
function term8_Callback(hObject, eventdata, handles)
% hObject    handle to term8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term8

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in term9.
function term9_Callback(hObject, eventdata, handles)
% hObject    handle to term9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term9
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term10.
function term10_Callback(hObject, eventdata, handles)
% hObject    handle to term10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term10

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in term11.
function term11_Callback(hObject, eventdata, handles)
% hObject    handle to term11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term11
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in term12.
function term12_Callback(hObject, eventdata, handles)
% hObject    handle to term12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term12

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in term13.
function term13_Callback(hObject, eventdata, handles)
% hObject    handle to term13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term13

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in term14.
function term14_Callback(hObject, eventdata, handles)
% hObject    handle to term14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term14
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term15.
function term15_Callback(hObject, eventdata, handles)
% hObject    handle to term15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term15
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in term16.
function term16_Callback(hObject, eventdata, handles)
% hObject    handle to term16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term16
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term17.
function term17_Callback(hObject, eventdata, handles)
% hObject    handle to term17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term17

g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end
% --- Executes on button press in term18.
function term18_Callback(hObject, eventdata, handles)
% hObject    handle to term18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term18
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term19.
function term19_Callback(hObject, eventdata, handles)
% hObject    handle to term19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term19
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in term20.
function term20_Callback(hObject, eventdata, handles)
% hObject    handle to term20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of term20
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in Validation.
function Validation_Callback(hObject, eventdata, handles)
% hObject    handle to Validation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CentroidFinX=getappdata(handles.ValidationGUI,'CentroidFinX');
CentroidFinY=getappdata(handles.ValidationGUI,'CentroidFinY');
CentroidSepX=getappdata(handles.ValidationGUI,'CentroidSepX');
CentroidSepY=getappdata(handles.ValidationGUI,'CentroidSepY');
OrientationFin=getappdata(handles.ValidationGUI,'OrientationFin');
OrientationSep=getappdata(handles.ValidationGUI,'OrientationSep');

f=findobj('tag','FingerPrintGUI');
getappdata(f)
setappdata(f,'CentroidFinX',CentroidFinX)
setappdata(f,'CentroidFinY',CentroidFinY)
setappdata(f,'CentroidSepX',CentroidSepX)
setappdata(f,'CentroidSepY',CentroidSepY)
setappdata(f,'OrientationFin',OrientationFin)
setappdata(f,'OrientationSep',OrientationSep)

close(handles.ValidationGUI)    

% --- Executes on button press in SupressBifurcation.
function SupressBifurcation_Callback(hObject, eventdata, handles)
% hObject    handle to SupressBifurcation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
objets=findobj('Style','checkbox','visible','on');
for i=1:length(objets)
    ch=get(objets(i),'tag');
    if strcmp(ch(1:3),'bif')
        indSep(i)=1;
    else
        indSep(i)=0;
    end
end
objets=objets(logical(indSep));

I=getappdata(handles.ValidationGUI,'OriginalImage');
CentroidFinX=getappdata(handles.ValidationGUI,'CentroidFinX');
CentroidFinY=getappdata(handles.ValidationGUI,'CentroidFinY');
CentroidSepX=getappdata(handles.ValidationGUI,'CentroidSepX');
CentroidSepY=getappdata(handles.ValidationGUI,'CentroidSepY');
OrientationFin=getappdata(handles.ValidationGUI,'OrientationFin');
OrientationSep=getappdata(handles.ValidationGUI,'OrientationSep');
for i=1:length(objets)
    if get(objets(i),'value')==0
        val=get(objets(i),'userdata');
        ind=val(1);
        CentroidSepX(ind)=NaN;
        CentroidSepY(ind)=NaN;
        OrientationSep(ind,:)=NaN;
    end
end
close(handles.ValidationGUI)    
ValidationGUI(I,CentroidFinX,CentroidFinY,OrientationFin,CentroidSepX,CentroidSepY,OrientationSep);
% --- Executes on button press in bif19.
function bif19_Callback(hObject, eventdata, handles)
% hObject    handle to bif19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bif19
g=get(hObject,'value');
val=get(hObject,'userdata');
if g==1
    set(val(2),'linewidth',2)
else
    set(val(2),'linewidth',1)
end

% --- Executes on button press in SuppressTermination.
function SuppressTermination_Callback(hObject, eventdata, handles)
% hObject    handle to SuppressTermination (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

objets=findobj('Style','checkbox','visible','on');
for i=1:length(objets)
    ch=get(objets(i),'tag');
    if strcmp(ch(1:4),'term')
        indFin(i)=1;
    else
        indFin(i)=0;
    end
end
objets=objets(logical(indFin));

I=getappdata(handles.ValidationGUI,'OriginalImage');
CentroidFinX=getappdata(handles.ValidationGUI,'CentroidFinX');
CentroidFinY=getappdata(handles.ValidationGUI,'CentroidFinY');
CentroidSepX=getappdata(handles.ValidationGUI,'CentroidSepX');
CentroidSepY=getappdata(handles.ValidationGUI,'CentroidSepY');
OrientationFin=getappdata(handles.ValidationGUI,'OrientationFin');
OrientationSep=getappdata(handles.ValidationGUI,'OrientationSep');
for i=1:length(objets)
    if get(objets(i),'value')==0
        val=get(objets(i),'userdata');
        ind=val(1);
        CentroidFinX(ind)=NaN;
        CentroidFinY(ind)=NaN;
        OrientationFin(ind)=NaN;
    end
end
close(handles.ValidationGUI)    

ValidationGUI(I,CentroidFinX,CentroidFinY,OrientationFin,CentroidSepX,CentroidSepY,OrientationSep);
