#=
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Converts an array of decimal numbers to binary representation with a specified number of bits.

    * Arguments
        * `arr::Vector{Int}`: Input array of decimal numbers.
        * `numBits::Int`: Number of bits to represent each number.

    * Returns
        * `Vector{String}`: Array containing binary representation of each decimal number.

    * Errors
        * Throws an ArgumentError if any number in the input array is negative or exceeds the maximum representable value with `numBits` bits.
=#
function dec2bin(arr::Vector{Int64}, numBits::Int64)
    # Check if numBits is positive
    if numBits <= 0
        throw(ArgumentError("Number of bits must be positive"))
    end

    binaryArray = String[]
    for i in arr
        # Check if the number is negative
        if i < 0
            throw(ArgumentError("Decimal number cannot be negative"))
        end

        # Check if the number can be represented with numBits bits
        if i >= 2^numBits
            throw(ArgumentError("Number $i cannot be represented with $numBits bits"))
        end

        # Convert the decimal number to binary string with specified number of bits
        binary = string(i, base=2, pad=numBits)
        push!(binaryArray, binary)
    end
    return binaryArray
end