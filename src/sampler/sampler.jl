#=  
    * Copyright (c) 2024 Mustafa Elaraby, Cairo,
    * Egypt. All rights reserved.
    * Email: mustafaelaraby78@gmail.com
    * Sample a continuous signal at a specified sampling frequency.

    * Arguments
        * `signal`: Array{<:Real,1}
                ?? The input signal to be sampled.
        * `sampling_frequency`: Real
                ?? The desired sampling frequency in Hz.
        * `time`: Real (optional)
                ?? The total duration of the signal. If provided, the sampling frequency is calculated as the ratio of the signal length to the time duration.

    * Returns
        * `sampled_signal`: Array{<:Real,1}
                ?? The sampled signal.
        * `time_vector`: Array{Int,1}
                ?? The time vector corresponding to the sampled signal.

    * Example
        * Generate a random signal of length 100
            signal = rand(100)
        * Set the desired sampling frequency to 10 Hz
            sampling_frequency = 10
        *  Sample the signal
            sampled_signal, time_vector = sampler(signal, sampling_frequency)
=#


function sampler(signal, sampling_frequency,time=Nothing)

    if time == nothing
        original_fs = length(signal)
    else
        original_fs = length(signal)/time
    end
    # Calculate the time step between samples
    original_fs = length(signal)/time
    step = ceil(Int, original_fs / sampling_frequency)

    # Generate the time vector
    time_vector = 0:step:(length(signal)-1)

    # Perform the sampling
    sampled_signal = signal[1:step:end]

    return sampled_signal, time_vector
end
