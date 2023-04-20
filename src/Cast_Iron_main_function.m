function  Cast_Iron_main_function(handles)
I = str2double(get(handles.current, 'String')); %input('Current = ')
N = str2double(get(handles.turn, 'String')); %input('Number of turns = ')
A = str2double(get(handles.area, 'String')); %input('Area = ')
l_g =str2double(get(handles.gapLength, 'String')); %input('Air gap = ')
l_core = str2double(get(handles.coreLength, 'String')); %input('Length of core = ')
mx_err = str2double(get(handles.err02, 'String'))/100;
mu = (4*pi)*1e-7;
err = 1;%dummy
NI = N*I;
H = NI/l_g;
H_g =0.9*NI/l_g;%first iteration 90% assumption
B_g = mu*H_g;

%B-H curve
H= [0 60 26.67 1020 1140 300 960 100 140 220 240 360 520 700 420 540 900 1200 1380 1500 1650 1800 1980 2220 2580 2880 3180 3300 3600 3900 4050 4260 4380 4500];
B = [0 0.04 0.4 .14 0.424 .38 0.02 0.06 0.08 0.12 0.18 0.24 0.3 .12 0.20 .24 .36 .44 .48 .50 .52 .54 .56 .58 .6 .613 .62 .623 .6295 .635 .636 .64 .64 .64];
H = sort(H);
B = sort(B);
n = 15;
p = gen_reg(B, H, n);%cofficent
B_= 0:0.0001:max(B);
H_= polyval(p,B_);



%calculation
B_temp = [];
Error_ = [];
iter = [];
while 1==1
    n = n+1;
    iter = [iter n];
    H_g = B_g/mu;
    B_core = B_g;
    B_temp = [B_core B_temp];%saving point
    %error finding in input
    if B_core > max(B)
        set(handles.phi,'String','Error!!!');
        set(handles.err,'String','Error!!!');
        return;
    end
    H_core = polyval(p,B_core);%from the B-H curve
    
    if H_core > max(H)
        set(handles.phi,'String','Error!!!');
        set(handles.err,'String','Error!!!');
        return;
    end
    NI_temp = H_core*l_core +H_g*l_g;
    
    err = (NI - NI_temp)/NI;
    Error_ = [Error_ abs(err*100)];
    
    if abs(err)<mx_err
        break;
    end
    
    B_g = (1 + err)*B_g;%reducing B(magnetic flux)
    
end
H_temp = polyval(p,B_temp);%point used in the calculation
hax=handles.plotAxes;
plot(hax,H_,B_,H_temp,B_temp,'*','LineWidth',2);
legend(hax,'Cast Iron','Points');
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

