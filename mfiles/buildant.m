function [x,y,lat,lon,prcp,thk,topg,usrf] = buildant(doplot,filename)
% BUILDANT  helper function for ant.m, to build a Matlab/Octave set of
% variables, for Antarctic ice sheet, on 50km grid, from existing NetCDF file
% example which plots 3 fields:
%   >> buildant
% example which fills these variables, but no plot
%   >> [x,y,lat,lon,prcp,thk,topg,usrf] = buildant(0);
% as above but attempting to read a different NetCDF file:
%   >> [x,y,lat,lon,prcp,thk,topg,usrf] = buildant(0,'foobar.nc');

% notes: the preparatory steps to create Ant50km.nc require 
% the NCO ("NetCDF Operators"; ) and the download of a LARGE file:
%   $ wget http://websrv.cs.umt.edu/isis/images/e/e6/Antarctica_5km_woshelves_v0.7.nc
%   $ ncks -v lat,lon,thk,topg,usrf,presprcp -d x1,,,10 -d y1,,,10 \
%        Antarctica_5km_woshelves_v0.7.nc Ant50km.nc

if nargin < 1, doplot = 1; end
if nargin < 2, filename = 'Ant50km.nc'; end

disp(['reading variables x,y,lat,lon,prcp,thk,topg,usrf from NetCDF file ' filename])

S = netcdf(filename);  % reads NetCDF file into a large structure

x = double(S.VarArray(8).Data);
y = double(S.VarArray(9).Data);
lat = squeeze(double(S.VarArray(1).Data));
lon = squeeze(double(S.VarArray(2).Data));
prcp = squeeze(double(S.VarArray(3).Data));
thk = squeeze(double(S.VarArray(4).Data));
topg = squeeze(double(S.VarArray(6).Data));
usrf = squeeze(double(S.VarArray(7).Data));

if doplot==0, return; end

disp('plotting 3 fields')
figure(1)
surf(x/1000,y/1000,usrf), shading('flat'), view(2), axis square
xlabel('x (km)'), ylabel('y (km)'), title('surface elevation "usrf"  (m)'), colorbar
figure(2)
surf(x/1000,y/1000,topg), shading('flat'), view(2), axis square
xlabel('x (km)'), ylabel('y (km)'), title('bed elevation "topg"  (m)'), colorbar
figure(3)
surf(x/1000,y/1000,prcp), shading('flat'), view(2), axis square
xlabel('x (km)'), ylabel('y (km)'), title('precipitation "prcp"  (m a-1)'), colorbar
