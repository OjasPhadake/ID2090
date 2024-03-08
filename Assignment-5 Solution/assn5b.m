#This is my code for assignment 5, question 2
clear all;
close all;

vnum = 300;
xvalues = rand(1,vnum);
noise = 0.02*(-0.5 + rand(1,vnum));
xsorted = sort(xvalues);
original = [2 3 -4 1 5];
y = polyval(original, xsorted);
hold on;
ynew = y + noise;

final = polyfit(xsorted, ynew, 4);
yn2 = polyval(final, xsorted);
figure(1);

title('Graphs', 'FontSize', 12);
xlabel('x values', 'FontSize', 12);
ylabel('y values', 'FontSize', 12);
set (gca, "ygrid", "on");
set (gca, "xgrid", "on");

plot(xsorted, y, xsorted, y, "p", xsorted, ynew, xsorted, yn2, "s");
legend("Original Plot","Plot With Noise", "Fitted Curve");

figure(2);
plot(xsorted, y, xsorted, ynew, xsorted, yn2);
legend("Original Plot","Plot With Noise", "Fitted Curve");
