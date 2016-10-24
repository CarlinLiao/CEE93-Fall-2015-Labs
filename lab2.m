%% Task 1

% given data file
load BOD.dat
bod = BOD(:,1);
nit = BOD(:,2);
amm = BOD(:,3);

%% Task 2

figure(1);
subplot(1,3,1);
hist(amm);
xlabel('Ammonia (mg/L)');
subplot(1,3,2);
freqdm(amm); % given method
xlabel('Ammonia (mg/L)');
subplot(1,3,3);
normfreq(amm);
hold on
normpg(amm);
xlabel('Ammonia (mg/L)');

% The histogram appears to be skewed to the right somewhat.

%% Task 3

figure(2);
subplot(1,3,1);
hist(amm, [0.2 0.5 0.6 0.7 0.75 0.8 0.85 0.9 1.0 1.1]);
xlabel('Ammonia (mg/L)');
subplot(1,3,2);
freqdm(amm, [0.2 0.5 0.6 0.7 0.75 0.8 0.85 0.9 1.0 1.1]);
xlabel('Ammonia (mg/L)');
subplot(1,3,3);
normfreq(amm, [0.2 0.5 0.6 0.7 0.75 0.8 0.85 0.9 1.0 1.1]); % given method
hold on
normpg(amm, [0.2 0.5 0.6 0.7 0.75 0.8 0.85 0.9 1.0 1.1]); % given method
xlabel('Ammonia (mg/L)');

% The skewness to the right becomes markedly more pronounced with these
% changed histogram points. The unequal bin size makes the normalized
% frequency diagram a more intuitively accurate representation of the data.

%% Task 4

figure(3);
subplot(1,3,1);
cdfplot(bod);
xlabel('BOD (mg/L)');
ylabel('');
subplot(1,3,2);
cdfplot(nit);
xlabel('Nitrogen (mg/L)');
ylabel('');
subplot(1,3,3);
cdfplot(amm);
xlabel('Ammonia (mg/L)');
ylabel('');

%% Task 5

figure(4);
subplot(1,3,1);
boxplot(bod);
ylabel('BOD (mg/L)');
subplot(1,3,2);
boxplot(nit);
ylabel('Nitrogen (mg/L)');
subplot(1,3,3);
boxplot(amm);
ylabel('Ammonia (mg/L)');

figure(5);
boxplot([bod,nit,amm],'labels',{'BOD','Nitrogen','Ammonia'})
ylabel('mg/L');

% Having all three boxplots on the same graph allows you to visually
% compare them on the same scale of milligrams per liter, without having to
% do the mental gymnastics of reconciling three different y-axis scales
% that the three subplots require.

%% Task 6

figure(6);
subplot(1,3,1);
scatter(bod,nit);
xlabel('Nitrogen (mg/L)');
ylabel('BOD (mg/L)');
subplot(1,3,2);
scatter(bod,amm);
xlabel('Ammonia (mg/L)');
ylabel('BOD (mg/L)');
subplot(1,3,3);
scatter(amm,nit);
xlabel('Nitrogen (mg/L)');
ylabel('Ammonia (mg/L)');

% All three pairs of variable appear to have strong or somewhat strong
% relation with each other. The greater the mg/L of BOD, the greater the
% mg/L of nitrates and ammonia.

%% Inference

% Overall, while the different variables don't appear in the same
% quantities, the scatterplots show a clear positive correlation between
% all three variables of BOD, nitrate, and ammonia mg/L.
