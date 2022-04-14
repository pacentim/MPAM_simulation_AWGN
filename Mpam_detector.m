function Xest = Mpam_detector(Y,listX,listP,SNR)

%optimal detector for MPAM; it first calculate the optimal thresholds
%between every possible input, then procedes with a binary search over the
%tresholds to find the right estimate

natSNR = 10^(SNR/10);
sigmaq = 1/natSNR; %sigma^2
th = zeros(1,length(listX)-1);
for i = 1 : length(listX)-1
    
    s_i = listX(i);
    p_i = listP(i);
    s_j = listX(i+1);
    p_j = listP(i+1);

    th(i) = (sigmaq*log(p_j/p_i)+(s_i^2-s_j^2)/2)/(s_i-s_j);

end

new_th_vec = th;
res_X = listX;
%binary search

while 1

    if length(new_th_vec)==1
        if Y<= new_th_vec
            Xest = res_X(1);
        else
            Xest = res_X(2);
        end
        break;
    else
   vec_spl = floor(length(new_th_vec)/2);

   th_i = new_th_vec(vec_spl);
   if Y <= th_i
       new_th_vec = new_th_vec(1:vec_spl);
       res_X = res_X(1:vec_spl+1);
   else
       new_th_vec = new_th_vec(vec_spl+1:end);
       res_X = res_X(vec_spl+1:end);
   end

    end

end





end