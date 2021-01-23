#!/usr/bin/python3

import string

# this unit is talking about loops

# typical for loop
for i in range(10):
    print("looping with ~for~ {} times.".format(i+1))

# typical while loop
count = 0
while(count < 10):
    print("looping with ~while~ {} times.".format(count+1))
    count+=1 # inc idx

# palindrome check
def is_palindrome(str):
    exclude = set(string.punctuation)
    str = ''.join(ch for ch in str if ch not in exclude)
    str = str.replace(" ", "").lower()
    if str == str[::-1]:
        return str + " is a palindrome!"
    else:
        return str + " is not a palindome!"


name = "Anagrom uwu Morgana"
print("Is {} a palindome?".format(name))
print("--> {}".format(is_palindrome(name)))

name = "Your Mom"
print("Is {} a palindome?".format(name))
print("--> {}".format(is_palindrome(name)))



# pestering the user & the `break` statement

def pestering():
    while True:
        user_answer = input("keep repeating until you type STAHP: ")

        if user_answer == "STAHP":
            print("done.")
            break
        
        print("Did I tell you to type {}???".format(user_answer))

