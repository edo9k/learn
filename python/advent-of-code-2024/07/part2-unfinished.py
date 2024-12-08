from dataclasses import dataclass
from itertools import product

@dataclass
class Line:
    expected_result: int
    numbers: list[int]
    validated: bool = False
    validated_on: list | None = None

    def get_operations(self):
        # dot will be the "concat" operator, advent of code uses || 
        return list(product(['+', '*', '.'], repeat=len(self.numbers) -  1))

    def _combine_lists(self, a, b):
        return [item for pair in zip(a, list(b) + [None])
                     for item in pair if item is not None]


    def process(self):
        _operations = self.get_operations()

        for op in _operations:
            _item_list = self._combine_lists(self.numbers, op) 
            # print(item_list)

            item_list = []

            for i in range(len(_item_list)):
                item = _item_list[i]

                if item != ".":
                    item_list.append(item)
                elif i < len(_item_list) - 2:
                    last_item = str(_item_list.pop())
                    next_item = str(_item_list[i + 1])
                    concated = int( last_item + next_item ) 
                    item_list.append(int(concated))
                    i += 1
                else:
                    print("for some stupid reason we're out of index bounds...") 
            print(_item_list) 
            print(item_list)

            # before doing the concat stuff...
            result = item_list[0]

            for i in range(1, len(item_list), 2):
                operator = item_list[i]
                # number = item_list[i + 1] 

                try: 
                    number = item_list[i + 1]
                except:
                    # this shoulnd't be needed... damn off by one errors. 
                    if operator == "+": number = 0
                    if operator == "*": number = 1 

                if operator == "+":
                    result += number
                elif operator == "*":
                    result *= number
                elif operator == ".":
                    pass # fodase
                else:
                    raise ValueError("Deu ruim, operador só podia ser * ou +")
            if result == self.expected_result:
                self.validated = True
                self.validated_on = item_list
                return True

        return False

with open('test.txt', 'r') as file:
# with open('input.txt', 'r') as file:
    lines = file.readlines()

instructions = []

for line in lines:
    result_str, operations_str = line.split(": ")

    instructions.append(Line(int(result_str), list(map(int, operations_str.split(" ")))))

puzzle_sum = 0 

for item in instructions:
    item.process()

    print(item.validated, item.numbers) 

    if item.validated:
        puzzle_sum += item.expected_result


print("result should be this? ", puzzle_sum)
