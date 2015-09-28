function [yout,BER]=Addingnoise(yin,SNR)
% SNR: in decibel
% yin: signal input
% yout: signal output
% covert decibel value to ordinary ratio
ebn0 = 10^(-SNR/20);
% change yin to double
yin=double(yin);
 [row,col]=size(yin);                         %Length of the input binary message                              
 s=2.*yin-ones(row,col);                      %Change the magnitude to [-1 1]
% Create Gaussian noise
 n = (1/sqrt(2)).*(randn(row,col)); % 0dB white gaussian noise % 0dB white gaussian noise
 y = s + ebn0*n; % additive white gaussian noise
 yout = sign(y)>0;                          %Demodulation
 
 BER=((row*col)-sum(sum(yin==yout)))/(row*col);             %BER calculation, wihout any channel coding technique
