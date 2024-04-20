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