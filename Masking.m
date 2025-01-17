function Mask_function = Masking(frame_signal, energy)
    mean_energy = mean(energy);
    mask = energy/mean_energy;
    mask(mask>1)=1;
    mask(mask<0.1)=0.1;
    [Number_Of_Frame,frame_size]= size(frame_signal);
    Mask_function = zeros(Number_Of_Frame, frame_size);
    for i=1:Number_Of_Frame
        Mask_function(i,:)=frame_signal(i,:)*mask(i);
    end
    
end