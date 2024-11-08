function energy = Energy_Calcu_Function(framing_signal)
    [number_of_frame] = size(framing_signal,1);
    energy = zeros(1,number_of_frame);
    for i=1:number_of_frame
        frame = framing_signal(i,:);
        energy(i)=sum(frame .^2);
    end
    energy = energy/max(energy);
    figure;
    plot(energy);
    title('Energy Across Frames');
    xlabel('Frame Index');
    ylabel('Energy');
    grid on;
end 
