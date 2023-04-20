function  Sheet_Steel_main_function(handles)
I = str2double(get(handles.current, 'String')); %input('Current = ')
N = str2double(get(handles.turn, 'String')); %input('Number of turns = ')
A = str2double(get(handles.area, 'String')); %input('Area = ')
l_g =str2double(get(handles.gapLength, 'String')); %input('Air gap = ')
l_core = str2double(get(handles.coreLength, 'String')); %input('Length of core = ')
mx_err = str2double(get(handles.err02, 'String'))/100;
mu = (4*pi)*1e-7;
err = 1;
NI = N*I;
H = NI/l_g;
H_g =0.9*NI/l_g;
B_g = mu*H_g;
%Regression
H= [0 25 32.49 750 33.33 6.667 60 76 1110.60 65 14 20 24.7726 40 60 80 100 120 140 160 180 200 220 240 260 280 300 320 340 360 ...
    440 500 600 900 1260 1500 1800 2100 2400 2700 3000 3300 3600 3900 4200 4500 21 30 35 40 45 50 55 60];
B = [0 0.08 0.04536 .45 0.12 0.6 0.02 0.04 0.06 0.1 .16 .34 .645 .785 .84 .91 .953 .99 1.02 1.05 1.078 1.1 1.12 ...
    1.14 1.158 1.35 .1344 1.174 1.1888 1.230 1.42 1.265 1.3 1.38 1.44 1.468 1.50 1.52 1.533 ...
    1.54 1.552 1.56 1.564 1.568 1.57 1.58 0.085,0.17,0.1983,0.2267,0.255,0.283,0.31167,0.340];
H = sort(H);
B = sort(B);
n = 15;
p = gen_reg(B, H, n);
B_= 0:0.0001:max(B);
H_= polyval(p,B_);


%
B_temp = [];
Error_ = [];
iter = [];
while 1==1
    n = n+1;
    iter = [iter n];
    H_g = B_g/mu;
    B_core = B_g;
    B_temp = [B_core B_temp];
    if B_core > max(B)%finding the error
        set(handles.phi,'String','Error!!!');
        set(handles.err,'String','Error!!!');
        return;
    end
    
    H_core = polyval(p,B_core);%from the B-H curve%plotting each and every time
    
    if H_core > max(H)
        set(handles.phi,'String','Error!!!');
        set(handles.err,'String','Error!!!');
        return;
    end
    NI_temp = H_core*l_core +H_g*l_g;
    %     NI;
    
    err = (NI - NI_temp)/NI;
    Error_ = [Error_ abs(err*100)];
    
    if abs(err)<mx_err
        break;
    end
    
    B_g = (1 + err)*B_g;
    
end
H_temp = polyval(p,B_temp);
hax=handles.plotAxes;
plot(hax,H_,B_,H_temp,B_temp,'*','LineWidth',2);
legend(hax,'Sheet Steel','Points');
axis(hax,[0 max(H_) 0 max(B_)]);
grid(hax,'on');
xlabel(hax,'H (A/m)');
ylabel(hax,'B (T)');


phi = A*B_g;
err = abs(err*100);
set(handles.phi,'String',phi);
set(handles.err,'String',err);

hax02=handles.plot02;
plot(hax02,iter,Error_,iter,Error_,'*','LineWidth',2);
grid(hax02,'on');
legend(hax02,'Error','Points');
xlabel(hax02,'Iteration');
ylabel(hax02,'Error (%)');
end

