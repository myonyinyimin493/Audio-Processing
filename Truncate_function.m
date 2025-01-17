function truncate_signal = Truncate_function(filter_signal,energy,frame_size)
    % threshold = mean(energy)+std(energy);
    % threshold = mean(energy) + 0.5 * std(energy); 
    threshold = mean(energy); 
    active_frame = find(energy>threshold);
    % min_threshold = 0.1* max(energy);
    % while isempty(active_frame) && threshold > min_threshold
    %     threshold = threshold * 0.9;
    %     active_frame = find(energy > threshold);
    % end
    if isempty(active_frame)
        % truncate_signal = [];
        disp('No active frames found above the threshold.');
    else
        active_start = (active_frame(1) - 1) * frame_size + 1;  
        active_end = min(active_frame(end) * frame_size, length(filter_signal)); 
        if active_start < 1
            active_start = 1;
        end
        if active_end > length(filter_signal)
            active_end = length(filter_signal);
        end
        truncate_signal = filter_signal(active_start:active_end);
    end
end