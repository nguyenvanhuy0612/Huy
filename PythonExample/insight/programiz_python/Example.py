a = 1 + 2 + 3 + \
    4 + 5 + 6 + \
    7 + 8 + 9
print(a)

a = (1 + 2 + 3 +
     4 + 5 + 6 +
     7 + 8 + 9)
print(a)

colors = ['red',
          'blue',
          'green']

a = 1; b = 2; c = 3

print(a)
print(colors)

for i in range(1, 11):
    print(i)
    if i == 5:
        break

if True:
    print('Hello')
    a = 5

if True: print('Hello'); a1 = 5 ; print('a1', a1)

#This is a comment
#print out Hello
print('Hello')

#This is a long comment
#and it extends
#to multiple lines

"""This is also a
perfect example of
multi-line comments"""

#Docstrings in Python
def double(num):
    """Function to double the value"""
    return 2*num

print(double.__doc__)

########################################################################################################
# Python Variables
number = 10
print(type(number))
number = 1.1
print(type(number))

website = "apple.com"
print(website)
# assigning a new value to website
website = "programiz.com"
print(website)

a, b, c = 5, 3.2, "Hello"
print (a)
print (b)
print (c)

x = y = z = "same"
print (x)
print (y)
print (z)

# Constants
PI = 3.14
GRAVITY = 9.8

# Rules and Naming Convention for Variables and constants
'''Constant and variable names should have a combination of letters in lowercase (a to z) or uppercase (A to Z) or 
digits (0 to 9) or an underscore (_). For example: '''
snake_case = None
MACRO_CASE = None
camelCase = None
CapWords = None

'''If you want to create a variable name having two words, use underscore to separate them. For example:'''
my_name = None
current_salary = None

# Numeric Literals
a = 0b1010 #Binary Literals
b = 100 #Decimal Literal
c = 0o310 #Octal Literal
d = 0x12c #Hexadecimal Literal

#Float Literal
float_1 = 10.5
float_2 = 1.5e2

#Complex Literal
x = 3.14j

print(a, b, c, d)
print(float_1, float_2)
print(x, x.imag, x.real)

# String literals
strings = "This is Python"
char = "C"
multiline_str = """This is a multiline string with more than one line code."""
unicode = u"\u00dcnic\u00f6de"
raw_str = r"raw \n string"

print(strings)
print(char)
print(multiline_str)
print(unicode)
print(raw_str)

# Boolean literals
x = (1 == True)
y = (1 == False)
a = True + 4
b = False + 10

print("x is", x)
print("y is", y)
print("a:", a)
print("b:", b)
