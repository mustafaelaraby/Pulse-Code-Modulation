#=
    *                           [[bin2dec(arr)]]

    * Converts an array of binary strings to decimal numbers.

    * Arguments
        * `arr::Vector{String}`: Input array of binary strings.

    * Returns
        * `Vector{Int}`: Array containing decimal representation of each binary number.

    * Errors
        * Throws an ArgumentError if any binary string in the input array is invalid (contains characters other than '0' and '1').
=#



function bin2dec(arr::Vector{String})
    decimalArray = Int[]
    for binary in arr
        # Check if the binary string contains only '0' and '1'
        if !all(c -> c in ('0', '1'), binary)
            throw(ArgumentError("Invalid binary string: $binary"))
        end

        # Convert the binary string to decimal number
        decimal = parse(Int, binary, base=2)
        push!(decimalArray, decimal)
    end
    return decimalArray
end
