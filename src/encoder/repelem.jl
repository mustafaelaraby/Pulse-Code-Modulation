#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Repeats each element of an array a specified number of times.

    * Arguments
        * `arr`: Array
                ?? The input array.
        * `counts`: Int (optional)
                ?? The number of times each element should be repeated. Default is 2.

    * Returns
        * `result`: Array
                ?? The array with each element repeated `counts` times.

    * Example
        * Repeat each element of an array twice
            repeated_array = repelem([1, 2, 3, 4])
        * Repeat each element of an array three times
            repeated_array = repelem([1, 2, 3, 4], 3)
=#

function repelem(arr::Array, counts::Int=2)
    return vcat(broadcast(x -> fill(x, counts), arr)...)
end