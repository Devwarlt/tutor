# Exercise 3
# Take a list, say for example this one:
# a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
# and write a program that prints out all the elements of the list that are less than 5.

print()
print("Exercise 3 - Practicing with array and loop")
print()

elements = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

for element in elements:
    if (element < 5):
        print(str(element) + " is less than 5")
