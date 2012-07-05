%./ssaflowline -snes_monitor -snes_rtol 1e-12 -ksp_rtol 1e-12 -da_grid_x M
%
%10
%  0 SNES Function norm 3.979713672947e+02 
%  1 SNES Function norm 7.766382465525e+01 
%  2 SNES Function norm 2.404156448421e+00 
%  3 SNES Function norm 1.986720244139e-03 
%  4 SNES Function norm 1.321384257636e-09 
%  5 SNES Function norm 3.126852687924e-12 
%                                2.9558e-02 relative maximum
%
%100
%  0 SNES Function norm 7.870351074374e+01 
%  1 SNES Function norm 3.209027494638e+01 
%  2 SNES Function norm 4.834345937837e+00 
%  3 SNES Function norm 8.999433068099e-02 
%  4 SNES Function norm 2.291236188859e-05 
%  5 SNES Function norm 7.072932971384e-12 
%                                1.0423e-03 relative maximum
%
%1000
%  0 SNES Function norm 3.766758314013e+00 
%  1 SNES Function norm 1.693769180722e+00 
%  2 SNES Function norm 3.171353992297e-01 
%  3 SNES Function norm 9.594973802986e-03 
%  4 SNES Function norm 6.716690014169e-06 
%  5 SNES Function norm 2.077546936158e-11 
%  6 SNES Function norm 2.067377917940e-11 
%                                1.3418e-05 relative maximum
%
%10000
%  0 SNES Function norm 1.249015744098e-01 
%  1 SNES Function norm 5.671607139826e-02 
%  2 SNES Function norm 1.084637949604e-02 
%  3 SNES Function norm 3.437076084550e-04 
%  4 SNES Function norm 2.651602017867e-07 
%  5 SNES Function norm 6.942840305909e-11 
%  6 SNES Function norm 6.904016598908e-11 
%                                2.2258e-06 relative maximum
%
%100000
%  0 SNES Function norm 3.968737812348e-03 
%  1 SNES Function norm 1.803900987142e-03 
%  2 SNES Function norm 3.456988494211e-04 
%  3 SNES Function norm 1.100436498406e-05 
%  4 SNES Function norm 8.571529285622e-09 
%  5 SNES Function norm 2.192331935997e-10 
%  6 SNES Function norm 2.184588436404e-10 
%                                2.1139e-06 relative maximum


C = [
10     3.979713672947e+02 7.766382465525e+01 2.404156448421e+00 1.986720244139e-03 1.321384257636e-09  3.126852687924e-12 -1 2.9558e-02;
100    7.870351074374e+01 3.209027494638e+01 4.834345937837e+00 8.999433068099e-02 2.291236188859e-05  7.072932971384e-12 -1 1.0423e-03;
1000   3.766758314013e+00 1.693769180722e+00 3.171353992297e-01 9.594973802986e-03 6.716690014169e-06  2.077546936158e-11 2.067377917940e-11 1.3418e-05;
10000  1.249015744098e-01 5.671607139826e-02 1.084637949604e-02 3.437076084550e-04 2.651602017867e-07  6.942840305909e-11 6.904016598908e-11 2.2258e-06;
100000 3.968737812348e-03 1.803900987142e-03 3.456988494211e-04 1.100436498406e-05 8.571529285622e-09 2.192331935997e-10 2.184588436404e-10 2.1139e-06]

figure(1)
loglog(C(:,1),C(:,9),'o','markersize',15)
xlabel M, ylabel('relative maximum numerical error'), grid on
print -dpdf numerr.pdf

semilogy(0:6,C(:,2:8),'*','markersize',10)
xlabel('Newton iteration'), ylabel('residual norm'), grid on
legend('M=10','M=100','M=10^3','M=10^4','M=10^5')
print -dpdf quadconv.pdf
