#=
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Splits a string of bits into chunks of the specified size.

    * Arguments
        * `bits::String`: Input string of bits.
        * `chunk_size::Int`: Size of each chunk.

    * Returns
        * `Vector{String}`: Array containing chunks of the input string.

    * Errors
        * Throws an ArgumentError if `chunk_size` is less than or equal to 0.
=#



function binary_chunks(bits::String, chunk_size::Int)
    # Check if chunk_size is positive
    if chunk_size <= 0
        throw(ArgumentError("Chunk size must be positive"))
    end

    # Initialize an empty array to store the chunks
    chunks = String[]

    # Loop through the string in steps of chunk_size
    for i in 1:chunk_size:length(bits)
        # Extract a chunk of the specified size
        chunk = bits[i:min(i + chunk_size - 1, end)]
        push!(chunks, chunk)
    end

    return chunks
end