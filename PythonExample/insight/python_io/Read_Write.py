# open and read the file after the appending:
def write_example():
    f = open("demofile2.txt", "a")
    f.write("\nNow the file has more content!")
    f.close()


def read_example():
    f = open("demofile2.txt", "r")
    print(f.read())
    f.close()


def read_open_example():
    with open('demofile2.txt', "r") as f:
        d = f.read()
    print(d)


if __name__ == '__main__':
    write_example()
    read_example()
    read_open_example()
