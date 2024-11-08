function framesSignal = Framing_function(filter_signal,frame_size,frame_overlap)
    Step_Of_Frame_Size = frame_size-frame_overlap;
    Number_Of_Frame = floor((length(filter_signal)-frame_overlap)/Step_Of_Frame_Size);
    framesSignal = zeros(Number_Of_Frame,frame_size);

    for i=1:Number_Of_Frame
        start_index=(i-1)*Step_Of_Frame_Size+1;
        end_index = start_index+ frame_size-1;
        framesSignal(i,:) = filter_signal(start_index:end_index);
    end

end 