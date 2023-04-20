function Project_gui_function(handles)

k = 1.38e-23 ; %Boltzmann’s constant
q =  1.60e-19; %the magnitude of electronic charge
T = str2double(get(handles.temp, 'String'));   %the absolute temperature in kelvins
v_T = k*T/q; %thermal voltage
n =  str2double(get(handles.n, 'String'));%circuit parameter
v_s = str2double(get(handles.sourcevoltage, 'String'));%source voltage
R = str2double(get(handles.resistor, 'String'));  %resistance
I_s = str2double(get(handles.saturationcurrent, 'String')); %saturation current
tol = 1e-7;
format short eng;



i_D = @(v_d) I_s*(exp(v_d/(n*v_T))-1);
i_ciruit = @(v_d) (v_s - v_d)/R;
f = @(v_d) I_s*(exp(v_d/(n*v_T))-1)-(v_s - v_d)/R;
g = @(v_d) (I_s/(n*v_T))*exp(v_d/(n*v_T))+(1/R);

v_d = 0:0.001:v_s;
i = i_D(v_d);
v_solve = newt(f,g,0,tol);
i_D_solve = i_D(v_solve);

temp=num2str(v_solve);
set(handles.text15,'String',temp);
temp=num2str(i_D_solve);
set(handles.text3,'String',temp);

hax=handles.plotAxes;
plot(hax,v_d,i_D(v_d),v_d,i_ciruit(v_d),v_solve,i_D(v_solve),'*k','LineWidth',2);
grid(hax,'on');
axis(hax,[0 v_s 0 max(i_ciruit(v_d))]);
legend(hax,'Diode currnet','Circuit current','Solution');
xlabel(hax,'V_D (V)');
ylabel(hax,'I_D (A)');

end

