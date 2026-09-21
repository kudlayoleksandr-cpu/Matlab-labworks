%% ================= 1. Vectors =================
% a) Column vector from -pi/2 to 3*pi with step 0.5
a = (-pi/2 : 0.5 : 3*pi)';          % ' makes it a column

% b) Square of each element
b = a.^2;                            % .^ = element-wise power

% c) Third vector: sin of (a + b)
c = sin(a + b);

% d) Display as a row in the command window
disp('Vector c as a row:');
disp(c')                             % transpose to row for display


%% ================= 2. Matrices =================
% a) 3x3 random matrix with 9 elements
Z = rand(3, 3);
disp('Original Z:');
disp(Z);

% b) Remove second row
Z(2, :) = [];                        % [] deletes that row
disp('After removing row 2:');
disp(Z);

% c) Transpose
Z = Z';
disp('Transposed Z:');
disp(Z);


%% ================= 3. Practical applications =================
% --- Data ---
A  = 4;                              % amplitude, V
f  = 3;                              % frequency, Hz
sigma = 1;                           % noise standard deviation, V
U1 = 2.5;                            % threshold 1, V
U2 = 1.5;                            % threshold 2, V

t = 0 : 0.002 : 1.5;                 % time vector
s = A * sin(2*pi*f*t);               % clean signal
n = sigma * randn(size(t));          % noise, same size as t
signal = s + n;                      % noisy signal

% a) Samples exceeding U1
aboveU1 = signal(signal > U1);       % logical indexing keeps only those

% b) Filter: replace |value| < U2 with zeros
filtered = signal;
filtered(abs(filtered) < U2) = 0;

% c) Number of samples in the unfiltered signal
numSamples = length(signal);         % = numel(signal)

% d) Number of samples selected in part (a)
numAboveU1 = length(aboveU1);

% e) Min and max of the filtered signal
minFiltered = min(filtered);
maxFiltered = max(filtered);

% --- Display results ---
fprintf('Total samples:          %d\n', numSamples);
fprintf('Samples above U1=%.1fV: %d\n', U1, numAboveU1);
fprintf('Filtered min: %.3f V\n', minFiltered);
fprintf('Filtered max: %.3f V\n', maxFiltered);

% --- Optional: visualize ---
figure;
subplot(2,1,1);
plot(t, signal); hold on;
yline( U1, '--r'); yline(-U1, '--r');
title('Noisy signal with \pmU_1 thresholds');
xlabel('t [s]'); ylabel('Voltage [V]'); grid on;

subplot(2,1,2);
plot(t, filtered);
title('Filtered signal ( |x| < U_2 set to 0 )');
xlabel('t [s]'); ylabel('Voltage [V]'); grid on;

