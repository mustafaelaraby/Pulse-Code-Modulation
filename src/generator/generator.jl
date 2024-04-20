#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Generates a signal from a binary bit stream using a specified set of quantization levels.

    * Arguments
        * `bit_stream`: String
                ?? The binary bit stream.
        * `Levels`: Vector{T}
                ?? The set of quantization levels.

    * Returns
        * `generated`: Vector{Float64}
                ?? The generated signal.

    * Example
        * Generate a signal from a binary bit stream using specified quantization levels
            generated_signal = generator(bit_stream, Levels)
=#

include("binary_chunks.jl")
include("bin2dec.jl")


function generator(bit_stream::String, Levels::Vector{T}) where {T<:Real}
    num_bits = Int64(log2(length(Levels)))
    chunks = binary_chunks(bit_stream, num_bits)
    indices = bin2dec(chunks)

    generated = Float64[]
    for i in indices
        push!(generated, Levels[i+1])
    end
    return generated
end