#=
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Adjusts positive elements in the array to match the threshold value and negative elements to the negative of the threshold value.

    * Arguments
        * `arr::Vector{T1}`: Input array of real numbers.
        * `A::T2`: A value of the same type as elements in the array.

    * Returns
        * `Vector{T1}`: Adjusted array with positive elements set to the threshold value and negative elements set to the negative of the threshold value.

    * Errors
        * Throws an ArgumentError if the array is empty.
=#


function rectify_manchester(arr::Vector{T1}, A::T2=1) where {T1<:Real,T2<:Real}
    if isempty(arr)
        throw(ArgumentError("Array cannot be empty"))
    end

    for i in 1:length(arr)
        if arr[i] > zero(T1)
            arr[i] = A
        elseif arr[i] <= zero(T1)
            arr[i] = -A
        end
    end
    return arr
end