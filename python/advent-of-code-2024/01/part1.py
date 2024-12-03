# Read the input file and process it in a functional way
with open('input.txt', 'r') as file:
    # Use map to convert each line into a tuple of floats
    data = list(map(lambda line: tuple(map(int, line.split())), file))

    # Unzip the data into two separate lists
    column1, column2 = zip(*data)

    # Sort both columns
    sorted_column1 = sorted(column1)
    sorted_column2 = sorted(column2)

    # Calculate the differences and store them in a tally list
    tally = [abs(a - b) for a, b in zip(sorted_column1, sorted_column2)]
    aggregate = sum(tally)

    # Print the sorted columns and the tally of differences
    print("items form sorted column 1:", sorted_column1[0:5])
    print("items form sorted column 2:", sorted_column2[0:5])
    print("sum of differences: ", aggregate)

