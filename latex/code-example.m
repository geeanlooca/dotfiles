function [ uL ] = NLSE_solve(u0, dt, L, k2, gamma, fft_points) 

    omega = linspace(-pi/dt, pi/dt, fft_points);
    
    % apply nonlinearity
    u0_NL = u0 .* exp(1i*gamma*abs(u0).^2*L);
    input_spectrum = fftshift(fft(u0_NL, fft_points));
    
    
    % dispersion term in 'frequency' domain
    dispersion = exp(1i*0.5*k2.*omega.^2*L);
    
    uL = ifft(ifftshift(input_spectrum .* dispersion));
    uL = uL(1:length(u0));
end