% function impulse_train = generate_impulse_train(fs,duration,f0)
%     number_of_sample = round(duration *fs);
%     impulse_train = zeros(number_of_sample,1);
%     impulse_spacing = round (fs/f0);
%     for n=1:impulse_spacing:number_of_sample
%         impulse_train(n)=1;
%     end
%     % Plot the excitation signal
%     time_vector = (0:length(impulse_train)-1) / fs;
%     figure;
%     plot(time_vector, impulse_train);
%     title('Excitation Signal with Voiced/Unvoiced Transitions');
%     xlabel('Time (seconds)');
%     ylabel('Amplitude');
%     grid on;
% 
% end
function impulse_train = generate_impulse_train(fs, duration, f0)
    number_of_samples = round(duration * fs); % Total number of samples
    impulse_train = zeros(number_of_samples, 1); % Initialize with zeros
    impulse_spacing = round(fs / f0); % Calculate the interval between impulses
    
    % Place impulses at regular intervals
    for n = 1:impulse_spacing:number_of_samples
        impulse_train(n) = 1;
    end
end
