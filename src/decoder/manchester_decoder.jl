#=
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Decodes a Manchester encoded signal to obtain the original binary data.

    * Arguments
        * `signal::Vector{Int}`: Input signal as an array of 1s and 0s representing high and low levels.

    * Returns
        * `String`: Decoded binary data.

    * Errors
    * Throws an ArgumentError if the length of the input signal is not even.
=#


function manchester_decoder(signal::Vector{T1}, A::T2=1) where {T1<:Real,T2<:Real}
    if length(signal) % 2 != 0
        throw(ArgumentError("Length of signal must be even"))
    end

    decoded_data = Bool[]
    for i in 1:2:length(signal)
        if (signal[i] == A && signal[i+1] == -A) || (signal[i] == A && signal[i+1] == A)
            push!(decoded_data, 1)
        else
            push!(decoded_data, 0)
        end
    end
    binary_string = join(string.(Int.(decoded_data)))
    return binary_string
end