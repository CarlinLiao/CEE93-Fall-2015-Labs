%% Task 1

% given data file
load 'congestion.dat'

%% Task 2

pop = zeros(21,85);
del = pop;
con = del;
for i = 0:84
    pop(:,i+1) = congestion((21*i+1):(21*(i+1)),1);
    del(:,i+1) = congestion((21*i+1):(21*(i+1)),2);
    con(:,i+1) = congestion((21*i+1):(21*(i+1)),3);
end

%% Task 3

mean_pop_city = mean(pop);
std_pop_city = std(pop);
mean_delay_city = mean(del);
std_delay_city = std(del);
mean_con_city = mean(con);
std_con_city = std(con);

corcoe_pop_delay = corrcoef(mean_pop_city,mean_delay_city);
corcoe_pop_delay = corcoe_pop_delay(2); % .4985, so there is some correlation

%% Task 4

mean_delay_year = mean(del');
std_delay_year = std(del');
% Up until the new millennium, it seems that the average delay has only gone
% up, until about 1999 when it started holding steady.

%% Task 5

delay_sf = del(:,73);
delay_sj = del(:,74);
delay_ak = del(:,1);

%% Task 6

[a, most_congested_city_avg] = max(mean_con_city');
% Over the 21 given years, City 85 is on average the "most congested"

[b, largest_con_change_city] = max(std_con_city);
% Over the 21 given years, City 38 has the largest standard deviation (and
% therefore variance) in its percent congestion.

[c, least_del_city_in_2002] = min(del(21,:)); % City 5
% A city's congestion probably wouldn't factor in very heavily into my city
% choices, but if I were solely going off of this data I think City 5, with
% its lowest traffic delay in 2002, might be the best choice.
