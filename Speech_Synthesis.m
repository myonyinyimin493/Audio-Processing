function synthesised_speech = Speech_Synthesis(lpc_cofficient, impulse_signal, fs, frame_index)
    % Extract LPC coefficients for a specific frame
    frame_lpc_coefficients = lpc_cofficient(frame_index, :); % Extracts a single row (vector) of coefficients

    % Synthesize speech using the extracted LPC coefficients
    synthesised_speech = filter(1, frame_lpc_coefficients, impulse_signal);

    % Normalize the synthesized speech
    % synthesised_speech = synthesised_speech / max(abs(synthesised_speech));
end
