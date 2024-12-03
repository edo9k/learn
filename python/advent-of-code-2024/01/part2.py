# Read the input file and process it in a functional way
with open('input.txt', 'r') as file:
    # Use map to convert each line into a tuple of floats
    data = list(map(lambda line: tuple(map(int, line.split())), file))

    # Unzip the data into two separate lists
    column1, column2 = zip(*data)

    counted_items = [(item, column2.count(item)) for item in column1]

    weighted_sum = sum(item * count for item, count in counted_items)

    print(weighted_sum )
