pd = 0;         % Power density of the noise
k = 1;          % Multiplicative constant
t0 = 0;         % Time delay
t = -pi:0.001:pi;
N = length(t);

% Set the signal
%signal = rectangularPulse(-1/2, 1/2, t);
%signal = sinc(t);
%signal = sin(2*pi*t);
signal = t;
% Generate some noise
noise = wgn(1, N, pd);
% Add noise to the signal
nsignal = signal + noise;
% Get the filter
%h = rectangularPulse(-1/2, 1/2, t0 - t);
%h = sinc(t0 - t);
%h = sin(2*pi*(t0 - t));
h = t0 - t;

% Get the output
y = conv(nsignal, h);

% n = 1;
% while n <= length(y)
%     if y(n) < 0.5
%         y(n) = 0;
%     else
%         y(n) = 1;
%     end
%     n = n + 1;
% end

% Plot the signal
figure
plot(t, signal);
grid on;
legend('Input signal');
xlabel('t', 'FontSize', 24, 'FontName', 'TimesNewRoman');
ylabel('s(t)', 'FontSize', 24, 'FontName', 'TimesNewRoman');
ylim([min(signal)-0.1 max(signal)+0.1]);
% Plot the signal with noise
figure
plot(t, nsignal);
grid on;
legend('Signal with noise');
xlabel('t', 'FontSize', 24, 'FontName', 'TimesNewRoman');
ylabel('x(t)', 'FontSize', 24, 'FontName', 'TimesNewRoman');
ylim([min(nsignal)-0.1 max(nsignal)+0.1]);
% Plot the filter
figure
plot(t, h);
grid on;
legend('Filter');
xlabel('t', 'FontSize', 24, 'FontName', 'TimesNewRoman');
ylabel('h(t)', 'FontSize', 24, 'FontName', 'TimesNewRoman');
ylim([min(h)-0.1 max(h)+0.1]);
% Plot the output signal
figure
plot(y)
grid on;
legend('Output signal');
xlabel('t', 'FontSize', 24, 'FontName', 'TimesNewRoman');
ylabel('y(t)', 'FontSize', 24, 'FontName', 'TimesNewRoman');
ylim([min(y)-0.1 max(y)+0.1]);