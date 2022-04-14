clear all;
dbstop if error

%list of possible input
listX = [-1 1]; %must be sorted in order to be decoded correctly
listP = [0.5 0.5]; %probabilities of input

%number of simulations for each SNR value
num_sim = 1e7;

%maximum error parameter : if the simulation reaches this number of error
%the code breaks
max_err = 1000;
%maximum zero-error parameter: if you got 'zero_err_max' simulations with
%no errors, the code breaks;
zero_err_max = 1;
snr = [-10 : 2 : 30];

[snr, Pe] = MC_M_ary_trasmission_over_AWGN(snr,listX,listP,num_sim,max_err,zero_err_max);