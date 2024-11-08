% function [frequency_responses, frequency_vectors] = LPC_Filter(lpc_cofficient, fs, base_number_point)
%     % Number of frames
%     num_frames = size(lpc_cofficient, 1);
% 
%     % Preallocate cell arrays to store frequency responses and vectors for each frame
%     frequency_responses = cell(num_frames, 1);
%     frequency_vectors = cell(num_frames, 1);
% 
%     % Determine the number of points dynamically or use the base number of points
%     length_threshold = fs * 5;
%     fs_threshold = fs * 0.5;
% 
%     % Loop through each frame's LPC coefficients
%     for frame_index = 1:num_frames
%         % Only plot every 10th frame
%         if mod(frame_index, 10) == 0
%             % Set number of points dynamically for each frame
%             if length(lpc_cofficient(frame_index, :)) > length_threshold || fs > fs_threshold
%                 num_of_points = round(length(lpc_cofficient(frame_index, :)) / 4);
%             else
%                 num_of_points = base_number_point;
%             end
% 
%             % Calculate the frequency response for the current frame
%             [frequency_response, frequency_vector] = freqz(1, lpc_cofficient(frame_index, :), num_of_points, fs);
% 
%             % Store the frequency response and frequency vector for this frame
%             frequency_responses{frame_index} = frequency_response;
%             frequency_vectors{frame_index} = frequency_vector;
% 
%             % Plot the Magnitude Response (in dB) for the current frame
%             figure;
%             subplot(2, 1, 1);
%             plot(frequency_vector, 20 * log10(abs(frequency_response)));
%             title(['Magnitude Response (dB) for Frame ', num2str(frame_index)]);
%             xlabel('Frequency (Hz)');
%             ylabel('Magnitude (dB)');
%             grid on;
% 
%             % Plot the Phase Response for the current frame
%             subplot(2, 1, 2);
%             plot(frequency_vector, angle(frequency_response));
%             title(['Phase Response for Frame ', num2str(frame_index)]);
%             xlabel('Frequency (Hz)');
%             ylabel('Phase (radians)');
%             grid on;
% 
%             % Plot the Amplitude Spectrum (linear) for the current frame
%             figure;
%             plot(frequency_vector, abs(frequency_response));
%             title(['Amplitude Spectrum for Frame ', num2str(frame_index)]);
%             xlabel('Frequency (Hz)');
%             ylabel('Amplitude');
%             grid on;
%         end
%     end
% end

function [frequency_responses, frequency_vectors] = LPC_Filter(lpc_coefficient, fs, base_number_point)
    % Number of frames
    num_frames = size(lpc_coefficient, 1);
    
    % Preallocate cell arrays to store frequency responses and vectors for each frame
    frequency_responses = cell(num_frames, 1);
    frequency_vectors = cell(num_frames, 1);

    % Loop through each frame's LPC coefficients
    for frame_index = 1:num_frames
        % Set number of points based on base_number_point
        num_of_points = base_number_point;

        % Calculate the frequency response for the current frame
        [frequency_response, frequency_vector] = freqz(1, lpc_coefficient(frame_index, :), num_of_points, fs);

        % Store the frequency response and frequency vector for this frame
        frequency_responses{frame_index} = frequency_response;
        frequency_vectors{frame_index} = frequency_vector;

        % Plot the Magnitude Response (in dB) for the current frame
        figure;
        subplot(2, 1, 1);
        plot(frequency_vector, 20 * log10(abs(frequency_response)));
        title(['Magnitude Response (dB) for Frame ', num2str(frame_index)]);
        xlabel('Frequency (Hz)');
        ylabel('Magnitude (dB)');
        ylim([0,50]);
        xlim([0 3000]);
        grid on;

        % Plot the Phase Response for the current frame
        subplot(2, 1, 2);
        plot(frequency_vector, angle(frequency_response));
        title(['Phase Response for Frame ', num2str(frame_index)]);
        xlabel('Frequency (Hz)');
        ylabel('Phase (radians)');
        xlim([0 3000]);
        grid on;

        % Plot the Amplitude Spectrum (linear) for the current frame
        figure;
        plot(frequency_vector, abs(frequency_response));
        title(['Amplitude Spectrum for Frame ', num2str(frame_index)]);
        xlabel('Frequency (Hz)');
        ylabel('Amplitude');
        xlim([0 3000]);
        grid on;
    end
end
