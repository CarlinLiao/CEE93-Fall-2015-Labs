%% Carlin Liao HW11 Matlab code

%% 5

o = [   1.750 .8
        1.632 .78
        1.594 .77
        1.623 .75
        1.495 .71
        1.465 .66
        1.272 .63 ];
x = o(:,1);
y = o(:,2);
b1 = x\y;
x_bar = mean(o(:,1));
y_bar = mean(o(:,2));
b0 = y_bar-b1*x_bar;
r_sq = .903; % from model
s = sqrt( (1-r_sq)*sum((y-y_bar).^2)/(numel(y)-2) );
s_b1 = s/sqrt(sum((x-x_bar).^2));
t = 2.57;
CI_b1 = [b1-t*s_b1,b1+t*s_b1];
s_d = s*sqrt(1/numel(y)+(1.5-x_bar).^2/sum((x-x_bar).^2));
CI_d = [b0+b1*1.5-t*s_d,b0+b1*1.5+t*s_d];

y_hat = b0+b1*1.5;
t_e = (y_hat-.75)/s_d;


s_pred = s*sqrt(1+1/numel(y)+(1.5-x_bar).^2/sum((x-x_bar).^2));
CI_pred = [b0+b1*1.5-t*s_pred,b0+b1*1.5+t*s_pred];

%% 2

clear
a = [14.02 13.97 14.11 14.12 14.10 14.02 1415 13.97 14.05 14.04 14.11 14.12 ];
s = sqrt(sum((a - mean(a)).^2)/(numel(a)-1));
n = numel(a);

%% 3 

clear
z = (7.38-8.20)/sqrt(12.83^2/92+9.84^2/123);

%% 4 

clear
test = [15.87 16.02 15.78 15.83 15.69 15.81 16.04 15.81 15.92 16.1];
t_m = mean(test);
t_sd = std(test);
z = (t_m-16)/t_sd;
