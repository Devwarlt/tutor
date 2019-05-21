# Exercise 2
# Ask the user for a number. Depending on whether the number is even or odd,
# print out an appropriate message to the user.

print()
print("Exercise 2 - Practicing with input & print methods")
print("Hi there! Please insert a number to verify if you can drive a car.")

num = int(input())
msg = str("")

if (num < 18):
    msg = "You are too young to drive any car yet."
elif (num == 18):
    msg = "You're on right age to drive a car."
else:
    msg = "You still can drive a car, even if you're older."

print(msg)
