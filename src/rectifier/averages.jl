#=

    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com


    * Compute the moving averages of a given array.

    * Parameters:
        * arr::Vector{T} where {T<:Real}: Input array of Real Numbers.
        * number::Int: Number of elements to include in each average.

    * Returns:
        * result::Vector{Float64}: Vector containing the computed moving averages.

    * Raises:
        * ArgumentError: If the length of the input array is less than the specified number.

    ?? Example:

        julia> averages([1, 2, 3, 4, 5], 3)
        3-element Vector{Float64}:
        2.0
        3.0
        4.0
=#

function averages(arr::Vector{T}, number::Int) where {T<:Real}
    if isempty(arr)
        throw(ArgumentError("Array cannot be empty"))
    end

    if number < 1
        throw(ArgumentError("Number of adjacent elements must be at least 1"))
    end

    result = Float64[]
    for i in 1:number:length(arr)-number+1
        avg = sum(arr[i:i+number-1]) / number
        push!(result, avg)
    end
    return result
end