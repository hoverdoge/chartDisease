clear;clf; hold off;
count = 0;
%%% GENERAL %%%
n = 50000;            % population
lastDay = 2000;        % last day to plot

%%% INFECTED %%%
b = 1 / (20 * n);     % infection rate
i = 0.01 * n;         % infected
iprev = i;            % previous day's infected
infectedVec = [];     % stores infected in vector

%%% SUSCEPTIBLE %%%
s = n - i;            % susceptible people
sprev = s;            % previous day's susceptible people
susceptibleVec = [];  % stores susceptible in vector

%%% RECOVERY %%%
a = 1000/n;           % recovery rate
r = 0;                % amount recovered
rprev = r;            % previous day's recovered
recoveredVec = [];    % stores amount recovered in vector
y = 250/n;

%%% LOCKDOWN %%%
lStart = 100;

for i = 1:lastDay
    if (i == lStart)
        b = 1/(60 * n);
    elseif (i == lStart + 50)
        b = 1/(24 * n);
    endif
    
    s = -b * sprev * iprev + y * rprev + sprev;
    i = b * sprev * iprev - a * iprev + iprev;
    r = a * iprev - y * rprev + rprev;
    sprev = s;
    iprev = i;
    rprev = r;
    
    infectedVec = [infectedVec, i];
    susceptibleVec = [susceptibleVec, s];
    recoveredVec = [recoveredVec, r];
endfor

%%% PLOTTING & FORMATTING %%%
plot(infectedVec, "linewidth", 2); 
hold on;
plot(susceptibleVec, "linewidth", 2);
plot(recoveredVec, "linewidth", 2);

title("Impact of a Disease");
legend("Infected", "Susceptible", "Recovered");
xlabel("Days"); ylabel("People");










