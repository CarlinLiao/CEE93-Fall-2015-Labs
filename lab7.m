%% Task 1

clf
load Concrete.dat % given data
strength = Concrete(:,2);
histogram(strength,'Normalization','Probability','BinMethod','integers')
ylabel('Frequency')
xlabel('Compressive strength (N/m^2)')
title('Frequency diagram of the compressive strength of concrete samples')

%% Task 2

[str_mu, str_sig, str_muCI, str_sigCI] = normfit(strength, 0.05)
X = 45:75;
Y = normpdf(X,str_mu,str_sig);
hold on
plot(X,Y)
legend('Actual','Theoretical','Location','NorthWest')


%% Task 3

cdf_at_52 = cdf('norm', 52, str_mu, str_sig)
% This gives .0523, which means that just over 5% of the samples taken from
% this batch do not meet the threshold compressive stength of 52 MPa.

%% Task 4

% The average of our distribution is already almost an entire MPa below the
% specified mean strength of 61 MPa, so given that the compressive strength
% is normally distributed, less than half of our 95% confidence interval
% (which falls between 58.5337 MPa to 61.7413 MPa) falls above our average
% compressive strength of 60.1375 MPa, never mind our mean strength being
% greater than 61 MPa over 95% of the time.

% If these are the real compressive strengths of the concrete in Jacobs, it
% falls both below and far below the strength specifications set by the
% structural engineer in charge of the project. This batch should likely be
% thrown out and redone to meet the specifications already set. If it's
% already been used to construct Jacobs, much reinforcement after-the-fact
% is likely very necessary.
