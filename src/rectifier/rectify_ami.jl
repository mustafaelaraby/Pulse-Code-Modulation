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


function rectify_ami(signal::Vector{T1}, A::T2=1) where {T1<:Real,T2<:Real}
    if isempty(signal)
        throw(ArgumentError("Array cannot be empty"))
    end
    threshold = A / 2
    neg_threshold = -A / 2

    rectified_signal = T1[]
    for bit in signal
        if bit > 0
            if bit < threshold
                push!(rectified_signal, 0)
            elseif bit >= threshold
                push!(rectified_signal, A)
            else
                throw("Invalid AMI signal sequence.")
            end

        elseif bit == 0
            push!(rectified_signal, 0)
        else
            if bit > neg_threshold
                push!(rectified_signal, 0)
            elseif bit <= neg_threshold
                push!(rectified_signal, -A)
            else
                throw("Invalid AMI signal sequence.")
            end
        end
    end
    return rectified_signal
end