def exponentiation_by_squaring(base, exponent):
    if exponent == 0:
        return 1
    elif exponent % 2 == 0:
        half_power = exponentiation_by_squaring(base, exponent // 2)
        return half_power * half_power
    else:
        half_power = exponentiation_by_squaring(base, (exponent - 1) // 2)
        return base * half_power * half_power

# Example usage
base = 2
exponent = 10
print(exponentiation_by_squaring(base, exponent))  # Output: 1024

