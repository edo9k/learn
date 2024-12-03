def is_sorted(lst: list[int]) -> bool:

    # Initialize flags for sorted order
    is_sorted_increasing = True
    is_sorted_decreasing = True

    # Check if the list is sorted and within the range
    for i in range(len(lst) - 1):
        # Check for sorted order
        if lst[i] > lst[i + 1]:
            is_sorted_increasing = False
        if lst[i] < lst[i + 1]:
            is_sorted_decreasing = False
        
        # Check if the difference between max and min is greater than 3
        diff = abs(lst[i] - lst[i + 1])

        if diff < 1 or diff > 3: 
            return False  # Difference is greater than 3 or lower than 1

    # Return True if either sorted order is valid
    return is_sorted_increasing or is_sorted_decreasing


safe   = 0 
unsafe = 0

# Open the file for reading
with open('input.txt', 'r') as file:
    for line in file:
        # Split the line into strings based on spaces
        numbers_as_strings = line.split()
        
        # Convert the strings to floats (or int if you prefer)
        numbers = [int(num) for num in numbers_as_strings]

        # print(numbers, is_sorted(numbers))

        if is_sorted(numbers): safe = safe + 1
        else: unsafe = unsafe + 1

print("Total of log lines...")
print("safe:   ", safe)
print("unsafe: ", unsafe) 
       
