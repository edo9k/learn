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


def get_middle_item(line):
    # return the center element of the list.
    return line[ int(len(line) / 2) ] 

safe_count = 0
middle_page_sum = 0 

for line in lists: 
    if line: 
        line_safe = True

        for pair in pairs:

            safety = safe_check(line, pair)

            # print(f"checking {line} with pair {pair}, safety {safety}") 

            if not safety: 
                line_safe = False
                break
    
    # passed all pair coordenate checks 

    if line_safe: 
        safe_count += 1
        middle_page_sum += get_middle_item(line) 

    print("   SAFE   " if line_safe else " NOT SAFE ",  
          " middle elm ", get_middle_item(line), 
          " count ", middle_page_sum, line
    ) 
 
    
# assert safe_count == 3 # test data must have 3 safe lines only.
# print("Pairs:", pairs)
# print("Lists:", lists)

print("Safe line count ", safe_count)
print("Sum of middle pages ", middle_page_sum) 


