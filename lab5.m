%% Task 1

a = randomPGA([0 50], 100); % given function
mean_a = mean(a)
var_a = var(a)
figure(1)
histogram(a)
title('Peak ground accelation (PGA) at a');
xlabel('Peak ground acceleration (g)');
ylabel('Instances');
qr_a = quantile(a,3)


%% Task 2

b = randomPGA([0 0], 100);
mean_b = mean(b)
var_b = var(b)
figure(2)
histogram(b)
title('Peak ground accelation (PGA) at b');
xlabel('Peak ground acceleration (g)');
ylabel('Instances');
qr_b = quantile(b,3)


%% Task 3

% Not only does location a have a higher average peak ground acceleration,
% over multiple trials the variance and quartile markers are also larger,
% suggesting higher possibilities of even larger quakes. b is probably a
% better choice.


%% Task 4

pgas = schoolPGA([[0 0]; [15 35]; [50 100]; [100 30]; [200 15]], 0.5, 1000); % given data
mean_b = mean(b)
var_b = var(b)
figure(3)
histogram(pgas)
title('Number of schools experience PGA greater than .5g over 1000 trials');
ylabel('Number of trials');
xlabel('Schools experiencing PGA greater than .5g');
P_all_quake = numel(pgas(pgas == 5))/numel(pgas)


%% Task 5

P_3on_surviving = numel(pgas(pgas <= 2))/numel(pgas)
pgas_3 = schoolPGA([[0 0]; [15 35]; [50 100]; [100 30]; [200 15]], 0.3, 1000);
pgas_4 = schoolPGA([[0 0]; [15 35]; [50 100]; [100 30]; [200 15]], 0.4, 1000);
pgas_6 = schoolPGA([[0 0]; [15 35]; [50 100]; [100 30]; [200 15]], 0.6, 1000);
pgas_7 = schoolPGA([[0 0]; [15 35]; [50 100]; [100 30]; [200 15]], 0.7, 1000);
pgas_8 = schoolPGA([[0 0]; [15 35]; [50 100]; [100 30]; [200 15]], 0.8, 1000);
pgas_9 = schoolPGA([[0 0]; [15 35]; [50 100]; [100 30]; [200 15]], 0.9, 1000);
P_3on_surv_3 = numel(pgas_3(pgas_3 <= 2))/numel(pgas_3)
P_3on_surv_4 = numel(pgas_4(pgas_4 <= 2))/numel(pgas_4)
P_3on_surv_6 = numel(pgas_6(pgas_6 <= 2))/numel(pgas_6)
P_3on_surv_7 = numel(pgas_7(pgas_7 <= 2))/numel(pgas_7)
P_3on_surv_8 = numel(pgas_8(pgas_8 <= 2))/numel(pgas_8)
P_3on_surv_9 = numel(pgas_9(pgas_9 <= 2))/numel(pgas_9)
% After increasing the PGA threshold past .6g or .7g, survival gains become
% marginal (< 3% between .7g and .8g compared to ~5% between .5g and .6g).
% I would suggest cutting off reinforcement costs at .6g if we're on a
% budget, .7g if not, and .9g to reach a 99.6% three-school+ survival rate.
