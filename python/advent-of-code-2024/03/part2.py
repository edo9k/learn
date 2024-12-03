from dataclasses import dataclass
from pprint import pprint
import re


@dataclass
class struct:
    instruction: str
    value1: str
    value2: str


# test data.
# corrupted_memory = """xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"""

# Define the regex pattern with named groups
multiply_pattern = r"(?P<instruction>[a-zA-Z]{3})\((?P<value1>\d{1,3}),(?P<value2>\d{1,3})\)"
general_pattern  = r"mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)"


# Open the file
with open("input.txt", "r") as file:
    file_content = file.read()

    # Find all matches
    matches = re.finditer(general_pattern, file_content)

    sum = 0
    do_calculate = True 

    # Iterate through matches and print named groups
    for match in matches:
        if match.group() == ("don't()"):
            do_calculate = False
        if match.group() == ("do()"):
            do_calculate = True

        if do_calculate: 

            mul_match = next(re.finditer(multiply_pattern, match.group()), None)

            if mul_match: 

                data = struct(
                    mul_match.group("instruction"),
                    mul_match.group("value1"), 
                    mul_match.group("value2")
                )

                if data.instruction == "mul":
                    sum += int(data.value1) * int(data.value2)
                   
                pprint({ "data": data, "match": match }) 

    print("Total: ", sum)
