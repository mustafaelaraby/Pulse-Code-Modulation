#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Encodes a binary signal using Alternate Mark Inversion (AMI) encoding.

    * Arguments
        * `bits`: Array{Int,1}
                ?? The binary signal to be encoded.

    * Returns
        * `encoded_bits`: Array{Int,1}
                ?? The AMI encoded signal.

    * Example
        * Encode a binary signal
            encoded_signal = ami_encode([1, 0, 1, 1, 0])
=#

function ami_encode(bits::Array{Int,1})
    encoded_bits = Int[]
    last_pulse = 1  # Start with positive pulse
    for bit in bits
        if bit == 0
            push!(encoded_bits, 0)  # Represents absence of pulse
        else
            push!(encoded_bits, last_pulse)
            last_pulse *= -1  # Toggle pulse polarity
        end
    end
    return encoded_bits
end