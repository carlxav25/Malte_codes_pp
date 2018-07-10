close all
clear all

run1 = load(['/home/local/carltonx/Work/Malte_box/Project_runs/Isop_ms/iso100_run_1.dat']);
run2 = load(['/home/local/carltonx/Work/Malte_box/Project_runs/Isop_ms/iso100_run_2.dat']);
run3 = load(['/home/local/carltonx/Work/Malte_box/Project_runs/Isop_ms/iso100_run_3.dat']);
run4 = load(['/home/local/carltonx/Work/Malte_box/Project_runs/Isop_ms/iso100_run_4.dat']);
run5 = load(['/home/local/carltonx/Work/Malte_box/Project_runs/Isop_ms/iso100_run_5.dat']);

[r,c]=size(run1)

figure(1)
clf
box on
set(gca, 'fontsize', [16], 'linewidth', [2])
hold on
P = plot(run3(1:r-1,1), run3(1:r-1,2), 'r'); set(P, 'linewidth', 2);
hold on 
P = plot(run4(1:r-1,1), run4(1:r-1,2), 'k'); set(P, 'linewidth', 2);
hold on
P = plot(run5(1:r-1,1), run5(1:r-1,2), 'b'); set(P, 'linewidth', 2);
hold on 
legend ('OH(10)', 'OH(50)','OH(100)')
title('Isoprene(100 ppb) + OH (Vapors in particle phase)')
xlabel('Mass')
ylabel('Volume concentration (um3/m3)')
xlim([90, 350])