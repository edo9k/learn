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
pattern = r"(?P<instruction>[a-zA-Z]{3})\((?P<value1>\d{1,3}),(?P<value2>\d{1,3})\)"

# Open the file
with open("input.txt", "r") as file:
    file_content = file.read()

    # Find all matches
    matches = re.finditer(pattern, file_content)

    sum = 0

    # Iterate through matches and print named groups
    for match in matches:
        data = struct(
            match.group("instruction"), match.group("value1"), match.group("value2")
        )

        if data.instruction == "mul":
            sum += int(data.value1) * int(data.value2)

        pprint(data) 

    print("Total: ", sum)
