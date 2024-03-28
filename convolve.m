function y = convolve(h, x)
% convolve - convolution of signal x and impulse response h
%
% Given a length N input signal, x, and a length M impulse response, h,
% compute the outputs signal y by convolving x and h. The output signal
% will have length N+M-1.
%
% Input Variables:
% x - vector of samples for the input signal
% h - vector of samples of the impulse response
%
% Output:
% y - vector of output samples.
N = length(x);
M = length(h);
% initialize shift register and output vector
shift_register = zeros(1, M);
y = zeros(1, N+M-1);
for n = 1:N+M-1
    % gather next input sample; zeros after x ends
    % 
    % INSERT YOUR CODE
    if n<=N
        new=x(n);
    else
        new=0;
    end
    % update the shift register:
    shift_register=[new, shift_register(1:M-1)];
    % compute output
    for k=1:M
        y(n) = y(n)+ h(k) * shift_register(k);
    end
end