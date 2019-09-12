function [ftData] = resampleFt(t, ts, data)

ftData(:,1) = interp1(ts, data(:,1)  , t,'linear','extrap')';
ftData(:,2) = interp1(ts, data(:,2)  , t,'linear','extrap')';
ftData(:,3) = interp1(ts, data(:,3)  , t,'linear','extrap')';
ftData(:,4) = interp1(ts, data(:,4)  , t,'linear','extrap')';
ftData(:,5) = interp1(ts, data(:,5)  , t,'linear','extrap')';
ftData(:,6) = interp1(ts, data(:,6)  , t,'linear','extrap')';

end