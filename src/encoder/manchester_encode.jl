#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Encodes a binary signal using Manchester encoding.

    * Arguments
        * `bits`: Array{Int,1}
                ?? The binary signal to be encoded.

    * Returns
        * `encoded_bits`: Array{Int,1}
                ?? The Manchester encoded signal.

    * Example
        * Encode a binary signal
            encoded_signal = manchester_encode([1, 0, 1, 1, 0])
=#


function manchester_encode(bits::Array{Int,1})
    encoded_bits = Int[]
    for bit in bits
        if bit == 0
            push!(encoded_bits, 1)  # Represents transition from high to low
            push!(encoded_bits, -1) # Represents transition from low to high
        else
            push!(encoded_bits, -1) # Represents transition from low to high
            push!(encoded_bits, 1)  # Represents transition from high to low
        end
    end
    return encoded_bits
end