function  Cast_Steel_main_function(handles)
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
%
H= [0 20 40 60 80 100 120 130 140 160 170 180 200 210 220 240 250 260 270 280 ...
    290 300 320 340 360 380 400 420 440 480 ...
    500 520 540 560 580 600 620 640 660 680 720 780 840 900 960 1020 1080 ...
    1140 1200 1500 1350 1680 1920 2100 2250 2520 2820 3300 3600 3900 3960 4020 ...
    4080 4140 4200  234.7871 190.302 4260 4320 4380 4440];
B = [0 0.013 0.03 0.04 0.055 0.075 0.105 0.12 0.135 .173 0.2 .224 .29 0.32 ...
    0.347 .41 .43 .46 0.2616 .48 .50 .53 .5477 .583 .62 .642 .67 .7 .72 .74 .78 .80 ...
    .82 .84 .85 .87 .89 .90 .3793 .915 .93 .95 .9747 1.0175 1.0587 1.095 1.12 1.147 1.18 ...
    1.20 1.229 1.3225 1.28 1.36 1.4 1.42 1.44 1.46 1.48 1.49 1.5 1.507 1.507 ...
    1.507 1.507 1.507 1.507 1.507 1.507 1.507 1.507 ];
H = sort(H);
B = sort(B);
n = 31;
p = gen_reg(B, H, n);
B_= 0:0.0001:max(B);
H_ = polyval(p,B_);
%
B_temp = [];
Error_ = [];
iter = [];
while 1==1
    n = n+1;
    iter = [iter n];
    H_g = B_g/mu;
    B_core = B_g;
    B_temp = [B_temp B_core];
    if B_core > max(B)
        set(handles.phi,'String','Error!!!');
        set(handles.err,'String','Error!!!');
        return;
    end
    H_core = polyval(p,B_core); %from the B-H curve
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
legend(hax,'Cast Steel','Points');
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

