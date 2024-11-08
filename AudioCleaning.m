function [filter_signal, magnitude_axis, frequency_axis] = AudioCleaning(normalized_data,fs,lower_cutoff, upper_cutoff)
    
    %Create High press filter 
    % [b, a] = butter(4, cutoff_frequency/(fs/2), 'high');
    filter_order = 6;
    %Create band pass filter
    [b, a] = butter(filter_order, [lower_cutoff, upper_cutoff] / (fs / 2), 'bandpass');

    %Apply band press filter
    filter_signal = filter(b,a,normalized_data);

    pre_emphasis_coeff = 0.97;
    pre_emphasized_signal = filter([1 -pre_emphasis_coeff], 1, filter_signal);

    % Apply FFT
    audio_length = length(pre_emphasized_signal);
    fft_filter = fft(pre_emphasized_signal);
    frequency_axis = linspace(0, fs / 2, audio_length / 2 + 1);
    magnitude_axis = abs(fft_filter(1:audio_length / 2 + 1));

    
    %Plot for Frequency Spectrum
    figure;
    plot(frequency_axis, magnitude_axis);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Frequency Spectrum After Bandpass Filtering');
    grid on;
    xlim([0 4000]);
    ylim([0 max(magnitude_axis)]);

    %Compare two result with plot in time frame
    t = (0:audio_length-1) / fs;  
    figure;
    subplot(2,1,1);
    plot(t, normalized_data);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Original Signal');
    xlim([0, 0.1]); 
    
    subplot(2,1,2);
    plot(t, filter_signal);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Filtered Signal (BandPass)');
    xlim([0, 0.1]); 

end