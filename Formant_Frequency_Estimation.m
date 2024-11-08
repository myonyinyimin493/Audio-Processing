function Formant_Frequency_Estimation(frequency_responses, frequency_vectors, plot_frequency_limit)
    for frame_index = 1:length(frequency_responses)
        current_frequency_response = frequency_responses{frame_index};
        current_frequency_vector = frequency_vectors{frame_index};
        if isempty(current_frequency_response) || any(isnan(current_frequency_response)) || any(isinf(current_frequency_response))
            % warning(['Invalid frequency response in frame ', num2str(frame_index), '. Skipping...']);
            continue;
        end

        magnitude = 20 * log10(abs(current_frequency_response));
        disp(['Frame ', num2str(frame_index), ' - Min Magnitude: ', num2str(min(magnitude)), ', Max Magnitude: ', num2str(max(magnitude))]);
        
        % figure;
        % plot(current_frequency_vector, magnitude);
        % title(['Magnitude Response for Frame ', num2str(frame_index)]);
        % xlabel('Frequency (Hz)');
        % ylabel('Magnitude (dB)');
        % grid on;
        % xlim([0 plot_frequency_limit]);  

        [~, frequency_of_audio] = findpeaks(magnitude, current_frequency_vector,'MinPeakHeight', -30,'MinPeakDistance', 50);
        % [magnitude_of_audio, frequency_of_audio] = findpeaks(magnitude, current_frequency_vector, 'MinPeakDistance', 10);
                                                             
        valid_frequency = frequency_of_audio(frequency_of_audio < plot_frequency_limit);
        % valid_magnitude = magnitude_of_audio(frequency_of_audio < plot_frequency_limit);

        % figure;
        % plot(current_frequency_vector, magnitude);
        % title(['Magnitude Response for Frame ', num2str(frame_index)]);
        % xlabel('Frequency (Hz)');
        % ylabel('Magnitude (dB)');
        % grid on;
        % xlim([0 plot_frequency_limit]); 
        % hold on;
        % plot(valid_frequency, valid_magnitude, 'r*', 'MarkerSize', 10);
        % hold off;
        disp(['Detected Formant Frequencies for Frame ', num2str(frame_index), ':']);
        disp(valid_frequency);
    end
end
