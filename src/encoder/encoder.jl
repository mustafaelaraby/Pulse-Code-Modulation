#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Encodes a bitstream using either Manchester or AMI encoding.

    * Arguments
        * `bitstream`: String
                ?? The bitstream to be encoded.
        * `signaling_type`: String
                ?? The signaling type to be used for encoding, should be either "Manchester" or "AMI".
        * `A`: T (optional)
                ?? The amplitude used in encoding. Default value is 1.0.
        * `bit_length`: Int64 (optional)
                ?? The length of each encoded bit. Default value is 10.

    * Returns
        * `stream_encoded`: Array{T,1}
                ?? The encoded signal.

    * Example
        * Encode a bitstream using AMI encoding with default parameters
            encoded_signal = encoder("10001001101010111100110111101111", "AMI")
        * Encode a bitstream using Manchester encoding with custom amplitude and bit length
            encoded_signal = encoder("10001001101010111100110111101111", "Manchester", 2.0, 8)
=#

include("manchester_encode.jl")
include("ami_encode.jl")
include("repelem.jl")

function encoder(bitstream::String, signaling_type::String, A::T=1.0, bit_length::Int64=10) where {T<:Real}
    bits_signal = [parse(Int64, digit) for digit in bitstream]
    if signaling_type == "Manchester"
        encoded = manchester_encode(bits_signal)
    elseif signaling_type == "AMI"
        encoded = ami_encode(bits_signal)
    else
        error("Unknown signaling type!")
    end
    stream_encoded = repelem(encoded, bit_length)
    stream_encoded = stream_encoded .* A

    return stream_encoded
end