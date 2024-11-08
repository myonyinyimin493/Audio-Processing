function reconstructed_signal= Reconstruct_Function(frames,frame_size,frame_overlap)
    step_size = frame_size-frame_overlap;
    [num_of_frame,~]=size(frames);
    signal_length = (num_of_frame-1)*step_size+frame_size;
    reconstructed_signal = zeros(1, signal_length); 
    for i = 1:num_of_frame
        start_index = (i - 1) * step_size + 1;
        end_index = start_index + frame_size - 1;
        reconstructed_signal(start_index:end_index) = reconstructed_signal(start_index:end_index) + frames(i, :);
    end
end
