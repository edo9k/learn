#
# Part 2 is incorrect because it took me way to long to realize 
# what they meant by "tolerate one fault" what they meant was that if one
# element is making the list unsafe, you can remove it and try to evaluate the list
# again. it if fails again, then it's unsafe. the problem here is that my code is
# not accounting for the fact that even if you remove one offeding number from the list, 
# comparing the previous and posterior number to the one removed may still yield the same
# errors you got before. that being:
#     - two equal numbers 
#     - leap two large between two numbers (more than 3 of difference)
#     - lower next number in an ascending list
#     - higher next number in a descending list
#
# I rewrote this too many times to have have any energy left to try again today. 
# bailing on day 2 part 2. 

A = "ASC"
D = "DESC"


def tuple_pairs(lst):

    pairs = []
    last_item = None

    for item in lst:
        if last_item is None:
            last_item = item
            continue

        pairs.append((last_item, item))

        last_item = item

    return pairs


# fault toleranting ordering detection bs or something
# i can't believe i had to write a bloody test to figure this out.
def asc_or_desc(lst):

    tuples = tuple_pairs(lst)

    asc = 0
    desc = 0

    for t in tuples:
        a, b = t

        if increasing(a, b):
            asc += 1

        if decreasing(a, b):
            desc += 1

    if asc > desc:
        return A
    if asc < desc:
        return D

    return None


def bad_diff(a, b):
    return abs(a - b) > 3 or abs(a - b) < 1


def increasing(a, b):
    return a < b


def decreasing(a, b):
    return a > b


def correct_ordering(order, a, b):
    if order == A:
        return increasing(a, b)
    if order == D:
        return decreasing(a, b)

    # elements are probably the same... which will be caught by bad_diff
    return False 


def is_safe(lst):
    errors = 0
    order = asc_or_desc(lst)
    pairs = tuple_pairs(lst)

    for index in range(len(pairs)):

        a, b = pairs[index]

        # offending conditions
        # cond1 = bad_diff(a, b)  # leap to big or too small between two numbers
        # cond2 = order == A and decreasing(a, b)  # should be ascending
        # cond3 = order == D and increasing(a, b)  # should be descending

        if bad_diff(a, b) or not correct_ordering(order, a, b):
            errors += 1
            
            try:
                next_pair = pairs[index + 1]
                if bad_diff(a, next_pair[0]): 
                    errors += 1
            except:
                pass

        if errors > 1:
            return False

    # if we get here, list should be safe
    return True


safe = 0
unsafe = 0

# Open the file for reading
with open("input.txt", "r") as file:
    for line in file:
        # Split the line into strings based on spaces
        numbers_as_strings = line.split()

        # Convert the strings to floats (or int if you prefer)
        numbers = [int(num) for num in numbers_as_strings]

        if is_safe(numbers):
            safe = safe + 1
        else:
            unsafe = unsafe + 1

print("Total of log lines...")
print("safe:   ", safe)
print("unsafe: ", unsafe)
