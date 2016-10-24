%% Task 1

% given data
load 'LA_rainfall_inches.csv'
years = LA_rainfall_inches(:,1);
rain = LA_rainfall_inches(:,2);
mean_r = mean(rain);
var_r = var(rain);
std_r = std(rain);
quart_r = quantile(rain,[.25 .50 .75]);
figure(1)
boxplot(rain)
xlabel('Los Angeles')
ylabel('Annual rainfall (in)')
title('Annual rainfall boxplot')
figure(2)
plot(years,rain)
xlabel('Year')
ylabel('Cumulative rainfall that year (in)')
title('Annual rainfall in LA over time')
% Not a lot of rain falls in Los Angeles. The upper tail is a lot
 longer
% than the lower tail, which has no outliers. The shape of the boxplot
 does
% not suggest a remotely normal distribution.
% The mean rainfall is 14.8 in, the quartiles are 9.25 in and 19.2 in,
% with a standard deviation of 7.06.


%% Task 2

p_drought = sum(rain < .75*mean_r)/numel(rain);
nGroup = 17;
nObsPerGroup = 8;
sample_r = rain(randperm(numel(rain),nGroup*nObsPerGroup));
sample_r = reshape(sample_r,[nGroup,nObsPerGroup]);
samp_drought = zeros(nGroup,1);
for i = 1:nGroup
 samp_drought(i) = sum(sample_r(i,:) < .75*mean_r);
end
figure(3)
histogram(samp_drought,'Normalization','probability')
xlabel('Drought years')
ylabel('Frequency')
title('Number of drought years over sample groups')


%% Task 3

n = 8;
% The binomial distribution X has only two possible outcomes, 1 or 0,
% success or failure, with a probability P for success and 1-P for
 failure.
% This fits perfectly with how we have defined the number of dry
 years, as
% we've taken the P of having a dry year to be the same every every
 year,
% with only two possibilities: having a dry year, and not having a dry
% year.
% Formula: f(X = k) = (8 choose k)*(P^k)*(1-P)^(8-k)
rain_s_pmf = binopdf([0:nObsPerGroup],nObsPerGroup,p_drought);
figure(4)
plot(rain_s_pmf)
xlabel('Number of drought years')
ylabel('Probability')
title('Binomial pdf of drought years')
figure(5)
clf
plot(rain_s_pmf)
hold on
histogram(samp_drought,'Normalization','probability')
xlabel('Number of drought years')
ylabel('Probability / Frequency')
title('Binomial pdf (line) v frequency (bars) of drought years')
% There is some similarity (they are both heavy in the same general
 area),
% but it looks like the frequency diagram peaks one drought year less
% than the pdf does, but that may have just been this one iteration.


%% Task 4 1a

for j = 1:3
 sample_r = rain(randperm(numel(rain),nGroup*nObsPerGroup));
 sample_r = reshape(sample_r,[nGroup,nObsPerGroup]);
 samp_drought = zeros(nGroup,1);
 for i = 1:nGroup
 samp_drought(i) = sum(sample_r(i,:) < .75*mean_r);
 end
 figure(5+j)
 plot(rain_s_pmf)
 hold on
 histogram(samp_drought,'Normalization','probability')
 hold off
 xlabel('Number of drought years')
 ylabel('Probability / Frequency')
 title('Binomial pdf (line) v frequency (bars) of drought years')
end
% The frequency diagram has a lot of variability, with its max jumping
% around between 1 to 3 a in each iteration.


%% Task 4 1b

% Try 1
nObsPerGroup = 20;
nGroup = 5;
sample_r = rain(randperm(numel(rain),nGroup*nObsPerGroup));
sample_r = reshape(sample_r,[nGroup,nObsPerGroup]);
samp_drought = zeros(nGroup,1);
for i = 1:nGroup
 samp_drought(i) = sum(sample_r(i,:) < .75*mean_r);
end
rain_s_pmf = binopdf([0:nObsPerGroup],nObsPerGroup,p_drought);
figure(9)
plot(rain_s_pmf)
hold on
histogram(samp_drought,'Normalization','probability')
hold off
xlabel('Number of drought years')
ylabel('Probability / Frequency')
title('Binomial pdf (line) v frequency (bars) of drought years')
% Try 2
nObsPerGroup = 5;
nGroup = 20;
sample_r = rain(randperm(numel(rain),nGroup*nObsPerGroup));
sample_r = reshape(sample_r,[nGroup,nObsPerGroup]);
samp_drought = zeros(nGroup,1);
for i = 1:nGroup
 samp_drought(i) = sum(sample_r(i,:) < .75*mean_r);
end
rain_s_pmf = binopdf([0:nObsPerGroup],nObsPerGroup,p_drought);
figure(10)
plot(rain_s_pmf)
hold on
histogram(samp_drought,'Normalization','probability')
hold off
xlabel('Number of drought years')
ylabel('Probability / Frequency')
title('Binomial pdf (line) v frequency (bars) of drought years')
% Try 3
nObsPerGroup = 10;
nGroup = 13;
sample_r = rain(randperm(numel(rain),nGroup*nObsPerGroup));
sample_r = reshape(sample_r,[nGroup,nObsPerGroup]);
samp_drought = zeros(nGroup,1);
for i = 1:nGroup
 samp_drought(i) = sum(sample_r(i,:) < .75*mean_r);
end
rain_s_pmf = binopdf([0:nObsPerGroup],nObsPerGroup,p_drought);
figure(11)
plot(rain_s_pmf)
hold on
histogram(samp_drought,'Normalization','probability')
hold off
xlabel('Number of drought years')
ylabel('Probability / Frequency')
title('Binomial pdf (line) v frequency (bars) of drought years')


% Task 4 1c

% Assumption 1: the P_drought is constant over all time
% Assumption 2: each year is an independent trial from all other years,
% especially the years immediately before and after


%% Task 4 2

% Whether or not a piece of equipment fails at a given and consistent load
% can be modeled by a binomial distribution. X is 1 (a "success") if the
% equipment fails and 0 if it does not fail. We will be summing the
% outcomes over however many trials the equipment is subjected to.
% Failure should be rare, so P should be low, somewhere in the magnitude of
% 0.01. n would have to be over many trials with a P this low, something
% like 1000 trials. Calculating P would be done from doing N trials of
% subjecting equipment to load, counting failures, and then dividing by the
% number of trials, just as we did in this lab to find the probability of
% drought.
