#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Quantizes a given input signal using either mid-rise or mid-tread quantization.

    * Arguments
        * `input_signal`: Vector{T}
                ?? The input signal to be quantized.
        * `L`: Int64
                ?? The number of quantization levels.
        * `mp`: T
                ?? The maximum peak amplitude of the signal.
        * `type`: String
                ?? The type of quantization to be used, should be either "mid-rise" or "mid-tread".

    * Returns
        * `quantized_signal`: Vector{T}
                ?? The quantized signal.
        * `bits`: String
                ?? The binary representation of the quantized signal.
        * `levels`: Vector{T}
                ?? The quantization levels.
        * `err`: T
                ?? The mean squared quantization error.

    * Example
        * Perform mid-rise quantization on a signal with 8 levels and maximum peak amplitude 1.0
            quantized_signal, bits, levels, err = quantizer(input_signal, 8, 1.0, "mid-rise")
=#

include("midrise.jl")
include("midtread.jl")


function quantizer(input_signal::Vector{T}, L::Int64, mp::T, type::String) where {T<:Real}
    if type == "mid-rise"
        quantized_signal, bits,levels,err = midrise(input_signal,L,mp)
    elseif type == "mid-tread"
        quantized_signal, bits,levels,err = midtread(input_signal,L,mp)
    else
        error("Invalid quantization type. Choose 'mid-rise' or 'mid-tread'.")
    end
    return quantized_signal, bits,levels,err
end





