#=  
    * Copyright (c) 2024 Mustafa Elaraby, Cairo,
    * Egypt. All rights reserved.
    * Email: mustafaelaraby78@gmail.com
    * Find the nearest values in a reference array for each element in a sample array.
    *
    * Arguments:
    *     - `reference_array`: Array{<:Real,1}
    *         The array containing reference values.
    *     - `sample_array`: Array{<:Real,1}
    *         The array containing sample values.
    *
    * Returns:
    *     - `result_array`: Array{<:Real,1}
    *         The array containing the nearest values in the reference array for each element in the sample array.
    *     - `error_array`: Array{<:Real,1}
    *         The array containing the differences between the sample values and their nearest reference values.
    *     - `index_array`: Array{Int,1}
    *         The array containing the indices of the nearest values in the reference array for each element in the sample array.
    *
    * Example:
    *     reference_array = [1.0, 2.0, 3.0, 4.0, 5.0]
    *     sample_array = [1.5, 3.8, 4.2]
    *     result_array, error_array, index_array = nearest_value(reference_array, sample_array)
=#



function nearest_value(reference_array, sample_array)
    result_array = zeros(eltype(reference_array), length(sample_array))
    error_array = zeros(eltype(reference_array), length(sample_array))
    index_array = zeros(Int64, length(sample_array))

    for i in eachindex(sample_array)
        sample_value = sample_array[i]
        index = argmin(abs.(reference_array .- sample_value))
        result_array[i] = reference_array[index]
        error_array[i] = sample_value - result_array[i]
        index_array[i] = index
    end

    return result_array, error_array, index_array
end