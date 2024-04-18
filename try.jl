# Original array of strings
original_array = ["apple", "banana", "orange", "grape"]

# Empty array to store assigned elements
assigned_array = Vector{String}(undef, length(original_array))

# Assigning elements one by one using a loop
for i in eachindex(original_array)
    assigned_array[i] = original_array[3]
end

# Print the assigned array
println(assigned_array)
