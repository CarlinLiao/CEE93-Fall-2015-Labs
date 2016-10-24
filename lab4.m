%% Task 1

% given data
load has_toxins_experiment.dat
load no_toxins_experiment.dat

tox = has_toxins_experiment;
not = no_toxins_experiment;

pos_tox = sum(tox)/numel(tox) % true positive probability
neg_tox = 1-pos_tox % false negative probability
neg_not = (numel(not)-sum(not))/numel(not) % true negative probability
pos_not = sum(not)/numel(not) % false positive probability


%% Task 2

% Bayes Theorem describes the conditional probability of an event, based on
% the known probabiities of the component events in isolation and any known
% conditional probabilities between said events.

P_tox_pos = pos_tox/(pos_tox+pos_not) % P(contam|positive test result)
P_tox_neg = neg_tox/(neg_tox+neg_not) % P(contam|negative test result)

% Case b has a 94.7% likelihood of well contamination, so I'd shut it down.
% Case c has 1.3% likelihood of well contamination, so I'd do further
%   testing instead.
% A false positive causes an abundance of caution, but a false negative
%   can create dangerous situations through neglected action. False
%   negatives are more dangerous.


%% Task 3

% given data
load UAflight.dat

dep = UAflight(:,11);
arr = UAflight(:,12);
gate = UAflight(:,12);


%% Task 4 a-c

figure(1)
histogram(dep)
xlabel('Delay (min)')
ylabel('Flights delayed this long')
title('Departure delay')

figure(2)
histogram(arr)
xlabel('Delay (min)')
ylabel('Flights delayed this long')
title('Arrival delay')

figure(3)
histogram(gate)
xlabel('Delay (min)')
ylabel('Flights delayed this long')
title('Gate-to-gate delay')

% b
arr_m = mean(arr)
dep_m = mean(dep)
gat_m = mean(gate)

% c
P_arr_delay = numel(find(arr>0))/numel(arr)
P_dep_delay = numel(find(dep>0))/numel(dep)
P_gat_delay = numel(find(gate>0))/numel(gate)

%% Task 4 d-f

arr_d = arr(find(arr>0));
dep_d = dep(find(dep>0));
gate_d = gate(find(gate>0));

figure(4)
histogram(dep_d)
xlabel('Delay (min)')
ylabel('Flights delayed this long')
title('Departure delays (no early/on-time)')

figure(5)
histogram(arr_d)
xlabel('Delay (min)')
ylabel('Flights delayed this long')
title('Arrival delay (no early/on-time)')

figure(6)
histogram(gate_d)
xlabel('Delay (min)')
ylabel('Flights delayed this long')
title('Gate-to-gate delay (no early/on-time)')

% e
arr_m = mean(arr_d)
dep_m = mean(dep_d)
gat_m = mean(gate_d)

% f
P_arr_delay15 = numel(find(arr>15))/numel(arr)
P_dep_delay15 = numel(find(dep>15))/numel(dep)
P_gat_delay15 = numel(find(gate>15))/numel(gate)

% P(arrival delay) drops from 62% to 37% with the 15 minute grace period.
% P(departure delay) drops from 60% to 31% with the grace period.
% P(gate-to-gate dealy) drops from 62% to 40% with the grace period.


%% Task 5

prob_delay_month = zeros(1,12);
for i = 1:12
    flight_in_month = arr(UAflight(:, 2) == i);
    prob_delay_month(i) = sum(flight_in_month > 15) / length(flight_in_month);
end
prob_delay_month

flight_on_weekday = arr(UAflight(:, 4) == 1|2|3|4|5);
prob_delay_weekday = sum(flight_on_weekday > 15) / length(flight_on_weekday)

% Weather, time-of-day, passenger count (more late arrivals), and air
% congestion would likely all have an effect on the probability of delay.

figure(7)
percentage_delay = zeros(1, 40);
for i = 1 : 40
    percentage_delay(i) = sum(arr > i) / length(arr);
end
plot(1 : 40, percentage_delay)
xlabel('Delay (min)')
ylabel('Percentage delayed at least this long')
title('Arrival delay v. Percentage arriving this late')

% As expected, most flights are delayed less than 10 minutes. What's
% interesting in how close the graph is to linear, with only a slight
% upward curvature to indicate that arriving less late is likelier than
% arriving more late.

% As a passenger, a twenty-minute delay is roughly tolerable, and that
% captures most flights, roughly 70% of arrivals. After that point, the
% graph begins to taper off in earnest with flights that begin to be on the
% very edges of the curve and it gets pretty clear that these flights are
% late-late.
