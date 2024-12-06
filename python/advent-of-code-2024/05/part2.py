# with open('test.txt', 'r') as file:   
with open('input.txt', 'r') as file:
    lines = file.readlines()

pairs = []
lists = []

for line in lines:
    if '|' in line:
        pair = [int(x) for x in line.strip().split('|')]
        pairs.append(tuple(pair))
    elif ',' in line:
        list_of_nums = [int(x) for x in line.strip().split(',')]
        lists.append(list_of_nums)

safe_lines = 0

def safe_check(line, pair):
    (a, b) = pair
    try: 
        index_a = line.index(a)
        index_b = line.index(b)

        return index_a < index_b
    except:
        # if either line is not there, we just return True
        # because it does not need to be checked if not present.
        return True


def swap(line, pair):
    (a, b) = pair

    _line = [*line] 

    try: 
        index_a = _line.index(a)
        index_b = _line.index(b)

        if index_a > index_b:  
            _line.pop(index_b)
            _line.insert(index_a, b) 

    except: # do nothing if that item does not exist
        pass

    # print("before: ", line, " after: ", _line, pair, " changed? ", line != _line) 
   
    return _line


def get_middle_item(line):
    # return the center element of the list.
    # print("list -> ", line, " middle element -> ", line[ int(len(line) / 2) ]  ) 
    return line[ int(len(line) / 2) ] 

safe_count = 0
middle_page_sum = 0 
unsafe_lines = [] 
corrected_lines = [] 

for line in lists: 
    line_safe = True

    if line: 

        mutable_line = [*line] 
        
        line_safe = True

        for pair in pairs:

            safety = safe_check(mutable_line, pair)

            # print(f"checking {line} with pair {pair}, safety {safety}") 

            if not safety: 
                line_safe = False
                break

                    
    # passed all pair coordenate checks 
    if line_safe: 
        safe_count += 1
        middle_page_sum += get_middle_item(line) 
    else: 
        unsafe_lines.append(line) 

# print("Unsafe lines:")
# for line in unsafe_lines:
    # print(line) 

# print("Corrected lines:") 

for run_rules_again in range(1, 10):

    count = 0 
    unsafe_line_count = 0

    # correct unsafe lines...
    for line in unsafe_lines:
        corrected_line = [*line] 
        for _  in range(run_rules_again):
            for pair in pairs:
                corrected_line = swap(corrected_line, pair) 

        # print(line, end=" -> ")
        # print(corrected_line) 

        if line != corrected_line:

            count += get_middle_item(corrected_line) 
            unsafe_line_count += 1


    print(" --- ") 
    print("Runnings rules ", run_rules_again, " times.") 
    print("total lines", len(lists), " unsafe ones ", unsafe_line_count) 
    print("Total for corrected lines -> ", count) 



#     # print("   SAFE   " if line_safe else " NOT SAFE ",  
#           " middle elm ", get_middle_item(line), 
#           " count ", middle_page_sum, line
#     ) 
 
    
# assert safe_count == 3 # test data must have 3 safe lines only.
# # print("Pairs:", pairs)
# # print("Lists:", lists)

# # print("Safe line count ", safe_count)
# # print("Sum of middle pages ", middle_page_sum) 


