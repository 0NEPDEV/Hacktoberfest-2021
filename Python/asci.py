from easyinput import read_many, read


a = read(int)
b = read(str)

print("The elements using read : ")
print(a, b)

print("Integer inputs using read many : ")
for num in read_many(int):
	print(num)

# reading the string after integers
print(read())
