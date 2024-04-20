#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Performs mid-rise quantization on a given signal.

    * Arguments
        * `signal`: Vector{T}
                ?? The input signal to be quantized.
        * `L`: Int64
                ?? The number of quantization levels.
        * `mp`: T
                ?? The maximum peak amplitude of the signal.

    * Returns
        * `quantized_signal`: Vector{T}
                ?? The quantized signal.
        * `bits_string`: String
                ?? The binary representation of the quantized signal.
        * `Levels`: Vector{T}
                ?? The quantization levels.
        * `err`: T
                ?? The mean squared quantization error.

    * Example
        * Perform mid-rise quantization on a signal with 8 levels and maximum peak amplitude 1.0
            quantized_signal, bits_string, Levels, err = midrise(signal, 8, 1.0)
=#
include("nearest_value.jl")
include("dec2bin.jl")

using Statistics

function midrise(signal::Vector{T}, L::Int64, mp::T) where {T<:Real}
    step = (2 * mp) / L
    Levels = collect(-L/2:1:(L/2-1))
    Levels = Levels .* step .+ 0.5 * step

    numBits = ceil(Int, log2(L))  # Convert the result to an integer
    binaryArray = dec2bin(collect(0:L-1), numBits)

    quantized_signal, error, index_arr = nearest_value(Levels, signal)

    err = mean(error.^2)
    bits_string = Vector{String}(undef, length(signal))

    for i in eachindex(index_arr)
        bits_string[i] = binaryArray[index_arr[i]]
    end

    bits_string = join(bits_string)
    return quantized_signal, bits_string, Levels, err
end