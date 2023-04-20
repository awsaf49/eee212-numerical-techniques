function small_signal_main(handles)
k = 1.38e-23 ; %Boltzmann’s constant
q =  1.6e-19; %the magnitude of electronic charge
T = str2double(get(handles.temp, 'String'));   %the absolute temperature in kelvins
v_T = k*T/q;
n =  str2double(get(handles.nmbr, 'String')); %circuit parameter
v_DD = str2double(get(handles.vdd, 'String')); %source voltage
R = str2double(get(handles.resistor, 'String'));  %resistance
I_s = str2double(get(handles.currentsat, 'String')); %saturation current
tol = 1e-7;
amp = str2double(get(handles.amp, 'String'));
freq = str2double(get(handles.freq, 'String'));

v_S = @(t) amp*sin(2*pi*freq*t);
i_DC = @(v_d) I_s*(exp(v_d/(n*v_T))-1);
i_ciruit = @(v_d) (v_DD - v_d)/R;
f = @(v_d) I_s*(exp(v_d./(n*v_T))-1)-(v_DD - v_d)/R;
g = @(v_d) (I_s/(n*v_T))*exp(v_d/(n*v_T))+(1/R);

v_d = 0:0.001:v_DD;
v_DC = newt(f,g,0,tol);

i_D = i_DC(v_DC);
%small signal model
i_total = @(t) i_D*exp((amp*sin(2*pi*freq*t))/(n*v_T));
i_AC = @(t) i_D*exp((amp*sin(2*pi*freq*t))/(n*v_T))- i_D;
i_AC_approx = @(t) i_D*(amp*sin(2*pi*freq*t))/(n*v_T);

R_0 = n*v_T/i_D;
v_AC_amp = amp*R_0/(R_0 + R);
v_AC = @(t) v_AC_amp*sin(2*pi*freq*t);


t = 0:0.0001:0.1;

hax01=handles.plot01;
plot(hax01,t,i_AC(t),t,i_AC_approx(t),'Linewidth',2);
legend(hax01,'I_A_C','I_A_C approx.');
grid(hax01,'on');
xlabel(hax01,'time (s)');
ylabel(hax01,'Current (A)');

hax02=handles.plot02;
plot(hax02,t,5000*v_AC(t)+v_DC,t,50*v_S(t)+v_DD,'LineWidth',2);
grid(hax02,'on');
xlabel(hax02,'time (s)');
ylabel(hax02,'Voltage (V)')
legend(hax02,'5000*V_t_o_t_a_l(Output) approx.','50*V_t_o_t_a_l(Input)');
% axis(hax02,[0 0.1 min((v_AC(t)+v_DC))-0.1 max(v_S(t)+v_DD)+0.1]);

hax03=handles.plot03;
plot(hax03,t,20*v_AC(t),t,v_S(t),'LineWidth',2);%scaling (output) by 20
grid(hax03,'on');
legend(hax03,'20*V_A_C(Output)','V_A_C(Input)');
xlabel(hax03,'time (s)');
ylabel(hax03,'Voltage (V)');

end

