function Mean_F0 = CalculateMeanF0(frames, fs, frame_size, frame_overlap)
    % Initialize array to store F0 values
    f0_values = zeros(1, size(frames, 1));
    
    % Loop through each frame to calculate F0
    for i = 1:size(frames, 1)
        current_frame = frames(i, :);
        
        % Calculate F0 using autocorrelation method (or another F0 method if applicable)
        f0 = EstimateF0(current_frame, fs);
        
        % Store the F0 value
        f0_values(i) = f0;
    end
    
    % Display F0 values before filtering
    % disp('F0 values before filtering:');
    disp(f0_values);
    
    % Filter out invalid F0 values (set a reasonable range)
    Mean_F0 = f0_values(f0_values > 40 & f0_values < 400); % Adjust the range if necessary

    % Replace invalid F0 values (0 or NaN) with a default F0
    default_F0 = 150; % Default value for unvoiced or invalid frames
    f0_values(isnan(f0_values) | f0_values == 0) = default_F0;
    
    % Check if there are any valid F0 values
    % if isempty(Mean_F0)
    %     disp('No valid F0 values detected.');
    %     Mean_F0 = NaN; % Return NaN if no valid F0 is found
    % else
    %     % Calculate mean F0 from valid values
    %     Mean_F0 = median(valid_f0_values); %check difference between mean and median
    %     disp(['Mean F0: ', num2str(Mean_F0), ' Hz']);
    % end

    % Plot the F0 values over time
    time_axis = (0:length(f0_values) - 1) * (frame_size - frame_overlap) / fs;
    figure;
    plot(time_axis, f0_values, 'o-');
    title('Fundamental Frequency (F0) Over Time');
    xlabel('Time (seconds)');
    ylabel('F0 (Hz)');
    grid on;
end

% Helper function to estimate F0 from a frame
function f0 = EstimateF0(frame, fs)
    % Example F0 estimation using autocorrelation
    % You may replace this with a more suitable F0 estimation method if available
    
    % Compute autocorrelation of the frame
    [acor, lag] = xcorr(frame);
    acor = acor(lag >= 0); % Use only positive lags
    lag = lag(lag >= 0);
    
    % Find the first significant peak in the autocorrelation
    [~, locs] = findpeaks(acor, 'MinPeakHeight', max(acor) * 0.4); % Adjust threshold if necessary
    
    % Estimate F0 based on the lag of the first peak
    if isempty(locs)
        f0 = NaN; % No F0 detected
    else
        period = lag(locs(1));
        f0 = fs / period;
    end
end
