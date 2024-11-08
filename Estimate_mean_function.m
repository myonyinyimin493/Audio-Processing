function f0 = Estimate_mean_function(frames_reconstructed,fs)
    frame = frames_reconstructed(:);
    window_frame = frame .* hamming(length(frame));
    autocorr_frame = xcorr(window_frame);
    % [~, locs] = findpeaks(autocorr_frame);
    min_lag = round(fs / 50);
    max_allowed_distance = length(autocorr_frame) - 1;
    min_peak_distance = min(min_lag, max_allowed_distance - 1);
    [~, locs] = findpeaks(autocorr_frame, 'MinPeakDistance', min_peak_distance);
    if~isempty(locs)
        peak_lag = locs(1);
        f0 = fs/peak_lag;
    else
        f0 = NaN;
        warning('F0 could not be detected for this frame.');
    end
end
