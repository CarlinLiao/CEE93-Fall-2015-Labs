%% Task 1

% given data
load 'SFrainfall.dat'
days = SFrainfall(:,1);
rain = SFrainfall(:,2);

figure(1)
plot(1960:2002,rain)
title('Cumulative annual rainfall');
xlabel('Year');
ylabel('Rain (in)');

figure(2)
plot(1960:2002,days)
title('Days of rain in a given year');
xlabel('Year');
ylabel('Days of rain');

% The trend appears to be that the more rainy days there are in a year,
% the more total rainfall is seen, which makes perfect sense. More time for
% rain to fall should generally result in more cumulative rainfall.

mean(rain) % 21.8 in

%% Task 2

figure(3)
subplot(1,2,1)
cdfplot(days)
title('Days of rainfall in a year')
xlabel('Days')
ylabel('Proportion')

subplot(1,2,2)
cdfplot(rain)
title('Annual cumulative rainfall')
xlabel('Rainfall (in)')
ylabel('Proportion')

dry_years = numel(find(find(rain > .75*22)< 22));
P_dry = dry_years/numel(rain)

drought_years = numel(find(find(rain < .75*22)> .5*22));
P_drought = drought_years/numel(rain)

ex_drought_years = numel(find(rain < .5*22));
P_ex_drought = ex_drought_years/numel(rain)

% Dry, drought, and extreme drought years as a proportion of drought years
% adds up to about .5, which just so happens to be where 22 inches of
% annual rainfall is on the cdf plot. Looking at the difference on the
% y-axis between different rainfall measurements on the x-axis will give
% the number of years that the rainfall fell into those categories.

%% Task 3

P_drought_1 = numel(find(days(find(rain < 20)) < 65))/numel(days)
P_drought_2 = numel(find(days(find(rain < 22)) < 60))/numel(days)
P_drought_3 = numel(find(days(find(rain < 20)) < 60))/numel(days)

% Despite the differing drought definitions, there appears to be only a
% minimal difference of defining a certain year a drought year, with
% definition 1 differing from 2 and 3 by less than 3% probability.

days20 = days(1:20);
rain20 = rain(1:20);
P_drought_1_20 = numel(find(days20(find(rain20 < 20)) < 65))/numel(days20)
P_drought_2_20 = numel(find(days20(find(rain20 < 22)) < 60))/numel(days20)
P_drought_3_20 = numel(find(days20(find(rain20 < 20)) < 60))/numel(days20)

days20L = days((end-19):end);
rain20L = rain((end-19):end);
P_drought_1_20L = numel(find(days20L(find(rain20L < 20)) < 65))/numel(days20L)
P_drought_2_20L = numel(find(days20L(find(rain20L < 22)) < 60))/numel(days20L)
P_drought_3_20L = numel(find(days20L(find(rain20L < 20)) < 60))/numel(days20L)

% Based on the data from only the first 20 years, a drought would be
% significantly more likely (~10%) when using only the data from the first
% 10 years than when only using the data from the last 10 years. The latest
% 20 years are most likely closer to the real probability of drought
% conditions due to recency and sustained trends.
%
% As expected from Task 1, the probabilities generated from the latest 20
% years are higher, explained by there having been significantly more rain
% the latest 20 years than the first 20.


%% Task 4

figure(4);

clear m;
m(1) = sum(rain(1) <22 & rain(1) >16.5);
for i = 2: length(rain),
 m = [m ; sum(rain(1:i) <22 & rain(1:i) >16.5)];
end
n = [1:i]';
p = m./n;
plot(n,p)

% This code takes generates a probability for rainfall in a given year by
% using only the data points taken from years prior. As it moves forward,
% it gains more and more data and refines its probability calculation with
% the new data, explaining the wild fluctuations at the beginning of the
% plot that even out over time. Based on the plot, I don't think that I can
% draw much aside from the probability of a given year being a drought year
% to be around .2 to .3.

%% Discussion

% 1. Because the first 20 years in the data had lower rainfall and days of
%    rain compared to the latest 20 years, I'd expect my prediction to
%    overestimate the probability of the year being a drought year.
%
% 2. Judging from the plots in Task 1, there isn't much concrete to say
%    regarding the rainfall of any specific future year, although we should
%    expect it to be in the same order of magnitude as seen in our data.
%    The assumption in Task 2b seems relatively reasonable, as Task 4
%    demonstrated that the moving average did eventually restrict itself to
%    a relatively small spead of 10%.
%
% 3. Confidence intervals, the law of large numbers, and the inherent
%    fluctuations present in virtually any prediction we can make�
%    especially about the weather�make answering any questions regarding
%    policy difficult if the policymaker isn't already well-versed in
%    statistical uncertainity. Even then, communicating that uncertainity
%    back to the public and voters makes any policy based on this data an
%    even harder sell, as people might end up pointing to specific, perhaps
%    anomalous years / points in the data in an effort to disprove the
%    conclusion a longer-view interpretation of the data would yield
%    instead.
