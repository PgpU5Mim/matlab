
function [fitresult, gof] = createFit(ntc_res, ntc_temp)
%CREATEFIT(NTC_RES,NTC_TEMP)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : ntc_res
%      Y Output: ntc_temp
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 14-Dec-2021 16:20:54 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( ntc_res, ntc_temp );

% Set up fittype and options.
ft = fittype( '1/(A+B*log(x)+C*log(x)^3)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.438744359656398 0.381558457093008 0.765516788149002];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
% plot(xData, yData);
legend( h, 'ntc_temp vs. ntc_res', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'ntc_res', 'Interpreter', 'none' );
ylabel( 'ntc_temp', 'Interpreter', 'none' );
grid on


