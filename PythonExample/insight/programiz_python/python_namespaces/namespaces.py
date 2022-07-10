# Note: You may get different values for the id

a = 2
print('id(2) =', id(2))

print('id(a) =', id(a))

# Note: You may get different values for the id

a = 2
print('id(a) =', id(a))

a = a+1
print('id(a) =', id(a))

print('id(3) =', id(3))

b = 2
print('id(b) =', id(b))
print('id(2) =', id(2))

a = 5
a = 'Hello World!'
a = [1,2,3]


def printHello():
    print("Hello")


a = printHello

a()