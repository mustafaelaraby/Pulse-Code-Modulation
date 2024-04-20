#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com


    * Sample a continuous signal at a specified sampling frequency.

    * Arguments
        * `signal`: Matrix{<:Real,1}
                ?? The input signal to be sampled.
        * `sampling_frequency`: Real
                ?? The desired sampling frequency in Hz.
        * `rate`: Real (optional)
                ?? The total rate of the signal.

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


function sampler(signal::Matrix{T1}, sampling_frequency::T2, rate::T3=nothing) where {T1<:Real,T2<:Real,T3<:Real}

    if rate === nothing
        rate = length(signal)
    end
    # Calculate the time step between samples
    step = rate / sampling_frequency

    # Generate the time vector
    time_vector = 0:step:(length(signal)-1)

    # Perform the sampling
    sampled_signal = Float64[]
    for i in 1:step:length(signal)
        lower = signal[floor(Int, i)]
        upper = signal[ceil(Int, i)]
        avg = (upper + lower) / 2
        push!(sampled_signal, avg)
    end
    #     return sampled_signal, time_vector
    return sampled_signal, time_vector
end