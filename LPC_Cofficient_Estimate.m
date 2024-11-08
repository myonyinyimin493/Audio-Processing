function lpc_cofficient = LPC_Cofficient_Estimate(High_energy_frame, fs)

    if fs > 16000
        lpc_order = 28;
    elseif fs > 8000
        lpc_order = 12;
    else
        lpc_order =10;
    end

    [number_of_frame,~]=size(High_energy_frame);
     lpc_cofficient = zeros(number_of_frame,lpc_order+1);

     for i= 1:number_of_frame
         currentFrame = High_energy_frame(i,:);
         lpc_cofficient(i,:) = lpc(currentFrame,lpc_order);
     end

     disp(['LPC Order used: ', num2str(lpc_order)]);
    
    % Display LPC coefficients for the first frame
    disp('LPC Coefficients for the first frame:');
    disp(lpc_cofficient(1, :));
    
end