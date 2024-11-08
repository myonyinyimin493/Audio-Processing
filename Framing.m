function [frame_size, frame_overlap]= Framing(filter_signal,magnitude_axis,fs)


    %Calculate the length of audio
    duration = length(filter_signal);

    %Calculate estimate of Average Energy
    Est_Energy = mean(filter_signal .^ 2);

    %Calculate average frequency
    Avg_Freq = mean(magnitude_axis);

    %Condtion Check to selecct proper frame setting
    if Est_Energy > 0.05 && Avg_Freq > 200
        if duration < 60
            frame_duration = 0.025;
            frame_overlap =0.5;
        else
            frame_duration = 0.04;
            frame_overlap =0.5;
        end
    else
        frame_duration = 0.05;
        frame_overlap =0.5;
    end
    frame_size = round(frame_duration * fs);
    frame_overlap = round(frame_overlap * frame_size);
end

% function [frame_size, frame_overlap] = Framing(filter_signal, magnitude_axis, fs)
%     % Fixed frame duration in seconds
%     frame_duration = 0.023; % ~1024 samples at 44100 Hz (23 ms)
% 
%     % Calculate frame size and overlap in samples
%     frame_size = round(frame_duration * fs); % 1024 samples at 44100 Hz
%     frame_overlap = round(0.5 * frame_size); % 50% overlap
% 
%     % Display frame parameters for verification
%     disp(['Frame Size (samples): ', num2str(frame_size)]);
%     disp(['Frame Overlap (samples): ', num2str(frame_overlap)]);
% end
