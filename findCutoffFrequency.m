function [lower_cutoff, upper_cutoff] = findCutoffFrequency(normalized_data, fs)


    % % Analyzing the Frequency using FFT
    % audio_length = length(normalized_data);
    % fft_signal = fft(normalized_data);
    % frequency_axis = linspace(0, fs / 2, audio_length / 2 + 1);
    % magnitude_axis = abs(fft_signal(1:audio_length / 2 + 1));
    % 
    % % Find Peaks to Identify Fundamental Frequency
    % [magnitude, frequency] = findpeaks(magnitude_axis, frequency_axis, 'MinPeakHeight', 50);
    % fundamental_Frequency = frequency(1);
    % fundamental_magnitude = magnitude(1);
    % disp(['Fundamental Frequency: ', num2str(fundamental_Frequency), ' Hz']);
    % disp(['Magnitude at Fundamental Frequency: ', num2str(fundamental_magnitude)]);

    % % Determine Cutoff Frequency Based on Fundamental Frequency
    % if fundamental_Frequency < 20
    %     cutoff_frequency = 50;  % Very low fundamental, set low cutoff
    % elseif fundamental_Frequency < 100
    %     cutoff_frequency = 150; % Low fundamental, set slightly higher cutoff
    % elseif fundamental_Frequency < 500
    %     cutoff_frequency = fundamental_Frequency * 2; % Multiply by 2 for a suitable cutoff
    % else
    %     cutoff_frequency = fundamental_Frequency * 1.5; % High fundamental, set lower multiple
    % end
    % 
    % if fundamental_Frequency < 20
    %     cutoff_frequency = 300;  
    % elseif fundamental_Frequency < 100
    %     cutoff_frequency = max(300, fundamental_Frequency * 3); 
    % elseif fundamental_Frequency < 500
    %     cutoff_frequency = min(fundamental_Frequency * 2, 3000); 
    % else
    %     cutoff_frequency = min(fundamental_Frequency * 1.5, 3000); 
    % end
    % Display the chosen cutoff frequency
    % disp(['Cutoff frequency set to: ', num2str(cutoff_frequency), ' Hz']);

    lower_cutoff = 300; 
    upper_cutoff = 3000;
    % disp(['Cutoff frequencies set to: ', num2str(lower_cutoff), ' Hz - ', num2str(upper_cutoff), ' Hz']);
end