function varargout = project_BH(varargin)
% PROJECT_BH MATLAB code for project_BH.fig
%      PROJECT_BH, by itself, creates a new PROJECT_BH or raises the existing
%      singleton*.
%
%      H = PROJECT_BH returns the handle to a new PROJECT_BH or the handle to
%      the existing singleton*.
%
%      PROJECT_BH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_BH.M with the given input arguments.
%
%      PROJECT_BH('Property','Value',...) creates a new PROJECT_BH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_BH_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_BH_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_BH

% Last Modified by GUIDE v2.5 15-Sep-2019 08:37:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_BH_OpeningFcn, ...
                   'gui_OutputFcn',  @project_BH_OutputFcn, ...
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


% --- Executes just before project_BH is made visible.
function project_BH_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_BH (see VARARGIN)

% Choose default command line output for project_BH
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_BH wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 hSelectedObj=get(handles.CoreMetal,'SelectedObject');
selectedObjTag=get(hSelectedObj, 'Tag');
switch selectedObjTag
case 'CastIron'
Cast_Iron_main_function(handles);
case 'CastSteel'
Cast_Steel_main_function(handles);
case 'SheetSteel'
Sheet_Steel_main_function(handles);
end


% --- Outputs from this function are returned to the command line.
function varargout = project_BH_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function turn_Callback(hObject, eventdata, handles)
% hObject    handle to turn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of turn as text
%        str2double(get(hObject,'String')) returns contents of turn as a double
hSelectedObj=get(handles.CoreMetal,'SelectedObject');
selectedObjTag=get(hSelectedObj, 'Tag');
switch selectedObjTag
case 'CastIron'
Cast_Iron_main_function(handles);
case 'CastSteel'
Cast_Steel_main_function(handles);
case 'SheetSteel'
Sheet_Steel_main_function(handles);
end


% --- Executes during object creation, after setting all properties.
function turn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to turn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function current_Callback(hObject, eventdata, handles)
% hObject    handle to turn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of turn as text
%        str2double(get(hObject,'String')) returns contents of turn as a double
hSelectedObj=get(handles.CoreMetal,'SelectedObject');
selectedObjTag=get(hSelectedObj, 'Tag');
switch selectedObjTag
case 'CastIron'
Cast_Iron_main_function(handles);
case 'CastSteel'
Cast_Steel_main_function(handles);
case 'SheetSteel'
Sheet_Steel_main_function(handles);
end


% --- Executes during object creation, after setting all properties.
function current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to turn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function area_Callback(hObject, eventdata, handles)
% hObject    handle to area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of area as text
%        str2double(get(hObject,'String')) returns contents of area as a double
hSelectedObj=get(handles.CoreMetal,'SelectedObject');
selectedObjTag=get(hSelectedObj, 'Tag');
switch selectedObjTag
case 'CastIron'
Cast_Iron_main_function(handles);
case 'CastSteel'
Cast_Steel_main_function(handles);
case 'SheetSteel'
Sheet_Steel_main_function(handles);
end


% --- Executes during object creation, after setting all properties.
function area_CreateFcn(hObject, eventdata, handles)
% hObject    handle to area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gapLength_Callback(hObject, eventdata, handles)
% hObject    handle to gapLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gapLength as text
%        str2double(get(hObject,'String')) returns contents of gapLength as a double
hSelectedObj=get(handles.CoreMetal,'SelectedObject');
selectedObjTag=get(hSelectedObj, 'Tag');
switch selectedObjTag
case 'CastIron'
Cast_Iron_main_function(handles);
case 'CastSteel'
Cast_Steel_main_function(handles);
case 'SheetSteel'
Sheet_Steel_main_function(handles);
end


% --- Executes during object creation, after setting all properties.
function gapLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gapLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function coreLength_Callback(hObject, eventdata, handles)
% hObject    handle to coreLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of coreLength as text
%        str2double(get(hObject,'String')) returns contents of coreLength as a double
hSelectedObj=get(handles.CoreMetal,'SelectedObject');
selectedObjTag=get(hSelectedObj, 'Tag');
switch selectedObjTag
case 'CastIron'
Cast_Iron_main_function(handles);
case 'CastSteel'
Cast_Steel_main_function(handles);
case 'SheetSteel'
Sheet_Steel_main_function(handles);
end


% --- Executes during object creation, after setting all properties.
function coreLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coreLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hSelectedObj=get(handles.CoreMetal,'SelectedObject');
selectedObjTag=get(hSelectedObj, 'Tag');
switch selectedObjTag
case 'CastIron'
Cast_Iron_main_function(handles);
case 'CastSteel'
Cast_Steel_main_function(handles);
case 'SheetSteel'
Sheet_Steel_main_function(handles);
end


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in CastIron.
function CastIron_Callback(hObject, eventdata, handles)
% hObject    handle to CastIron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CastIron


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in CoreMetal.
function CoreMetal_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in CoreMetal 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hSelectedObj=get(handles.CoreMetal,'SelectedObject');
selectedObjTag=get(hSelectedObj, 'Tag');
switch selectedObjTag
case 'CastIron'
Cast_Iron_main_function(handles);
case 'CastSteel'
Cast_Steel_main_function(handles);
case 'SheetSteel'
Sheet_Steel_main_function(handles);
end

% --- Executes on button press in CastSteel.
function CastSteel_Callback(hObject, eventdata, handles)
% hObject    handle to CastSteel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CastSteel


% --- Executes on button press in SheetSteel.
function SheetSteel_Callback(hObject, eventdata, handles)
% hObject    handle to SheetSteel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SheetSteel


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
axes(hObject);
imshow('magnetic_circuit.png');


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function plot04_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot04 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
axes(hObject);
imshow('magnetic_circuit.png');
% Hint: place code in OpeningFcn to populate plot04



function err02_Callback(hObject, eventdata, handles)
% hObject    handle to err02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of err02 as text
%        str2double(get(hObject,'String')) returns contents of err02 as a double


% --- Executes during object creation, after setting all properties.
function err02_CreateFcn(hObject, eventdata, handles)
% hObject    handle to err02 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function plot03_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot04 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot04
