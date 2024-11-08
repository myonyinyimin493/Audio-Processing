function duration = duation_function(reconstruct_signal,f0,fs)
    T0 = 1/f0;
    duration_of_reconstruct_signal = length(reconstruct_signal)/fs;
    num_cycles = round(duration_of_reconstruct_signal*f0);
    duration = T0 * num_cycles;