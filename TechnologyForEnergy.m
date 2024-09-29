%Julia Faubus
%Dr.Yeaman
%2-29-2024

%initializes the data samples
year =	[2015 2016 2017 2018 2019 2020 2021];
bioEnergyC = [98374 108098 116703 124076 130692 135432 136887];
SolarEnergyC = [351457 394662 440703 487886 530737 574705 587098];

%initializes the data samples for the subcategories of patents
bioFuels = [64871 70700 75972 80534 84793 87639 88539];
fuelFromWaste = [33503 37398 40731 43542 45899 47793 48348];
PVThermalHybrid = [26367 30235 33341 35429 37332 39003 39529];
Photovoltaic = [226475 257179 291725 328596 360359 391922 401206];
thermal = [98615 107248 115637 123861 133046 143780 146363];

%everything below is on figure one
figure(1)
%create a blue scatter plot with year as the x-values and bioEnergyC as y-values
scatter(year, bioEnergyC, "blue");
hold on
%create a red scatter plot with year as the x-values and SolarEnergyC as y-values
scatter(year, SolarEnergyC, "red");

%gives the plot a title
title("Number of Patents VS year for Bionergy and Solar Energy");
%labels the x-axis
xlabel("Years");
%labels the y-axis
ylabel("Number of Patents (10^5)");
%creates a legend outside of the graph
legends = legend("Bionergy", "Solar Energy", "location", "bestoutside");

hold on
%returns the coefficients for the polynomial
p1 = polyfit(year, bioEnergyC, 1);
%evalutes p1 for each year
val1 = polyval(p1, year);
%plots the best fit line
plot(year, val1);
%creates a variable for the slope of bioEnergy x year
slope1 = p1(1);
%prints the slope
fprintf('The slope of bio energy graphed against year is %.4f\n', slope1)

%returns the coefficients for the polynomial
p2 = polyfit(year, SolarEnergyC, 1);
%evalutes p2 for each year
val2 = polyval(p2, year);
%plots the best fit line
plot(year, val2);
%creates a variable for the slope of SolarEnergyC x year
slope2 = p2(1);
%prints the slope
fprintf('The slope of solar energy graphed against year is %.4f\n', slope2)
hold off

figure(2)
%the following scatter functions scatter five different sets of y-values
%all with year as their x-value. Additionally, "MarkerFaceColor" followed
%by rgb values sets that data set to that color
scatter(year, bioFuels,  "MarkerFaceColor", [0 0.4470 0.7410]);
hold on
scatter(year, fuelFromWaste, "MarkerFaceColor", [0.3010 0.7450 0.9330]);
scatter(year, Photovoltaic,"MarkerFaceColor",[0.8500 0.3250 0.0980]);
scatter(year, thermal, "MarkerFaceColor", [0.9290 0.6940 0.1250]);
scatter(year, PVThermalHybrid, "MarkerFaceColor", [0.6350 0.0780 0.1840]);

%creates a legend
legend("bioFuels", "Fuel From Waste", "PV Thermal hybrid", "Solar Photovoltaic", "Solar Thermal", "location","bestoutside");
%creates a title
title("Subsections of the Patents for Solar Energy and Bio Energy")
%creates a subtitle for further understanding
subtitle("Solar Energy is in warm colors and Bio Energy is in cool colors (so it is easier to read).")
%creates an x-axis label
xlabel("Year")
%labels the y-axis
ylabel("Number of patents (10^5)")
hold off

%Everything below is on figure 3
figure(3)
%a suplot thats one by two, marking this one as the first one
subplot(1,2,1);
%creates a boxplot of bioEnergyC 
boxplot(bioEnergyC);
%determines the variance of bioEnergyC
variance1 = var(bioEnergyC);
%prints the variance
fprintf('The variance of patents in bio energy tech is %.4f\n', variance1)

%creates the title
title("# of Patents in Bio Energy");
%labels the y-axis
ylabel("# of Patents (10^5)")

%a suplot thats one by two, marking this one as the second one
subplot(1,2,2);
%creates a boxplot of SolarEnergyC 
boxplot(SolarEnergyC);
%determines the variance
variance2 = var(SolarEnergyC);
%prints the variance
fprintf('The variance of patents in solar energy tech is %.4f\n', variance2)
%creates a title
title("# of Patents in Solar Energy");
%creates a y-axis label
ylabel("# of Patents (10^5)");
