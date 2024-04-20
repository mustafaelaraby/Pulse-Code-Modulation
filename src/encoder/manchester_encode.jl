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