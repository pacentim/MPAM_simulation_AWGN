function [snr,Pe] = MC_M_ary_trasmission_over_AWGN(snr,Xlist,Plist,num_sim,max_err,zero_err_max)

zero_err_counter = 0;
Pe = zeros(1,length(snr));
i=1;

for SNR = snr 

    Error_monitor=0;
    num_errs=0;

    for L = 1 : num_sim

        %%%source X = {+1,-1};
        X = 2*randi(2,1)-3;


        %%%%%%AWGN channel

        Y = AWGN(X,SNR);


        %%%%Detector

        Xest = Mpam_detector(Y,Xlist,Plist,SNR);

        %%%Error monitor
        Error_monitor = (X-Xest)~=0;
        num_errs = num_errs+Error_monitor;

        if num_errs == max_err
            break;
        end

    end%end first for


if num_errs == 0
    zero_err_counter = zero_err_counter+1;
end
if zero_err_counter == zero_err_max
    break;
end   
Pe(i) = num_errs/L;
i=i+1;


end
snr = snr(1:i-zero_err_max);
Pe = Pe(1:i-zero_err_max);
thePe = qfunc(sqrt(10.^(snr/10)));

semilogy(snr,thePe);
grid on
hold on
semilogy(snr,Pe,'--','LineWidth',2);
legend('Theoretical','Simulated');
xlabel('SNR [dB]');
ylabel('Probability of error');
