#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com


    Arguments
        * `signal`: Vector{T1}
                ?? The input signal to which noise is added.
        * `snr`: T2
                ?? The desired signal-to-noise ratio (SNR) in dB.

    Returns
        * `noisy_signal`: Vector{T1}
                ?? The noisy signal with added white Gaussian noise.

    Example
        * Generate a random signal of length 100
            signal = rand(100)
        * Add white Gaussian noise with SNR of 10 dB
            noisy_signal = awgn(signal, 10)
=#

using Random

function awgn(signal::Vector{T1}, snr::T2) where {T1<:Real,T2<:Real}
    # Calculate signal power
    signal_power = sum(abs2, signal) / length(signal)

    # Convert SNR from dB to linear scale
    snr_linear = 10^(snr / 10)

    # Calculate noise power based on SNR
    noise_power = signal_power / snr_linear

    # Generate white Gaussian noise
    noise = randn(length(signal)) * sqrt(noise_power)

    # Add noise to the signal
    noisy_signal = signal + noise

    return noisy_signal
end
