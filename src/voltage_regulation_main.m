function voltage_regulation_main(handles)
v_reg = str2double(get(handles.vreg, 'String'));
v_reg_t = @(t) v_reg+ t*0;
n_diode = double(int8(v_reg/0.7));
R = str2double(get(handles.resistor,'String'));
v_DD = str2double(get(handles.vdd,'String'));
amp = str2double(get(handles.amp,'String'));
n = str2double(get(handles.nmbr,'String'));
v_T = 25.3e-3;
freq = str2double(get(handles.freq,'String'));

i_DC = (v_DD - v_reg)/R;
R_0 = (n*v_T)/i_DC;
r = n_diode*R_0;
v_amp = amp*r/(r + R);
v_0 = @(t) v_amp*sin(2*pi*freq*t);
v_S =@(t) amp*sin(2*pi*freq*t);

t = 0:0.0001:0.1;
hax01=handles.plot01;
plot(hax01,t,v_reg_t(t),t,v_reg + v_0(t),'LineWidth',2);
axis(hax01,[0 max(t) min(v_reg+v_0(t)-0.05) max(v_reg+v_0(t)+0.05)]);
grid(hax01,'on');
legend(hax01,'V_D_C(Ouput)','V_T_o_t_a_l(Output)');
xlabel(hax01,'time (s)');
ylabel(hax01,'Voltage (V)');

hax02=handles.plot03;
plot(hax02,t,v_DD+v_S(t),t,v_reg+v_0(t),'LineWidth',2);
grid(hax02,'on');
legend(hax02,'V_T_o_t_a_l(Input)','V_T_o_t_a_l(Output)');
xlabel(hax02,'time (s)');
ylabel(hax02,'Voltage (V)');
axis(hax02,[0 max(t) 0 max(v_DD+v_S(t))+1]);

hax03=handles.plot04;
plot(hax03,t,v_S(t),t,v_0(t),'LineWidth',2);
grid(hax03,'on');
legend(hax03,'V_A_C(Input)','V_A_C(Output)');
xlabel(hax03,'time (s)');
ylabel(hax03,'Voltage (V)');
% axis(hax03,[0 max(t) 0 max(v_DD+v_S(t))+1]);


end

