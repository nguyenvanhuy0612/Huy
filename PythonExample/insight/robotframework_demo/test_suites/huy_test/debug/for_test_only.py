# importing csv module
import csv


# csv.writer(csvfile, dialect='excel', **fmtparams
def write_to_csv():
    import csv
    with open('csv/eggs.csv', 'w', newline='') as csvfile:
        spamwriter = csv.writer(csvfile, delimiter=' ',
                                quotechar='|', quoting=csv.QUOTE_MINIMAL)
        spamwriter.writerow(['Spam'] * 5 + ['Baked Beans'])
        spamwriter.writerow(['Spam', 'Lovely Spam', 'Wonderful Spam'])


def temp():
    print(['Spam'] * 5 + ['Baked Beans'])


def reading_to_a_csv_file_python():
    # csv file name
    filename = "csv/university_records_dict.csv"

    # initializing the titles and rows list
    fields = []
    rows = []

    # reading csv file
    with open(filename, 'r') as csvfile:
        # creating a csv reader object
        csvreader = csv.reader(csvfile)

        # extracting field names through first row
        fields = next(csvreader)

        # extracting each data row one by one
        for row in csvreader:
            rows.append(row)

            # get total number of rows
        print("Total no. of rows: %d" % (csvreader.line_num))


    # printing the field names
    print('Field names are:' + ', '.join(field for field in fields))

    #  printing first 5 rows
    print('\nFirst 5 rows are:\n')
    for row in rows[:5]:
        # parsing each column of a row
        for col in row:
            print("%10s" % col),
            print('\n')
        pass

    row1 = rows[0:2]
    print(row1)
    print(fields)


def writing_to_a_csv_file_python():
    # field names
    fields = ['Name', 'Branch', 'Year', 'CGPA']

    # data rows of csv file
    rows = [['Nikhil', 'COE', '2', '9.0'],
            ['Sanchit', 'COE', '2', '9.1'],
            ['Aditya', 'IT', '2', '9.3'],
            ['Sagar', 'SE', '1', '9.5'],
            ['Prateek', 'MCE', '3', '7.8'],
            ['Sahil', 'EP', '2', '9.6']]

    # name of csv file
    filename = "csv/university_records.csv"

    # writing to csv file
    with open(filename, 'w') as csvfile:
        # creating a csv writer object
        csvwriter = csv.writer(csvfile)

        # writing the fields
        csvwriter.writerow(fields)

        # writing the data rows
        csvwriter.writerows(rows)


def writing_a_dictionary_to_a_csv_file_python():
    # my data rows as dictionary objects
    mydict = [{'branch': 'COE', 'cgpa': '9.0', 'name': 'Nikhil', 'year': '2'},
              {'branch': 'COE', 'cgpa': '9.1', 'name': 'Sanchit', 'year': '2'},
              {'branch': 'IT', 'cgpa': '9.3', 'name': 'Aditya', 'year': '2'},
              {'branch': 'SE', 'cgpa': '9.5', 'name': 'Sagar', 'year': '1'},
              {'branch': 'MCE', 'cgpa': '7.8', 'name': 'Prateek', 'year': '3'},
              {'branch': 'EP', 'cgpa': '9.1', 'name': 'Sahil', 'year': '2'}]

    # field names
    fields = ['name', 'branch', 'year', 'cgpa']

    # name of csv file
    filename = "csv/university_records_dict.csv"

    # writing to csv file
    with open(filename, 'w') as csvfile:
        # creating a csv dict writer object
        writer = csv.DictWriter(csvfile, fieldnames=fields)

        # writing headers (field names)
        writer.writeheader()

        # writing data rows
        writer.writerows(mydict)


def loops_csv():
    mydict = [{'branch': 'COE', 'cgpa': '9.0', 'name': 'Nikhil', 'year': '2'},
              {'branch': 'COE', 'cgpa': '9.1', 'name': 'Sanchit', 'year': '2'},
              {'branch': 'IT', 'cgpa': '9.3', 'name': 'Aditya', 'year': '2'},
              {'branch': 'SE', 'cgpa': '9.5', 'name': 'Sagar', 'year': '1'},
              {'branch': 'MCE', 'cgpa': '7.8', 'name': 'Prateek', 'year': '3'},
              {'branch': 'EP', 'cgpa': '9.1', 'name': 'Sahil', 'year': '2'}]
    cur_data = {'branch': 'AAA', 'cgpa': '8.1', 'name': 'NNNNNN', 'year': '2'}
    print(cur_data, type(cur_data))
    mydict.append(cur_data.copy())
    filename = "csv/university_records_dict.csv"
    with open(filename, 'a', newline='') as csvfile:
        # creating a csv dict writer object
        writer = csv.DictWriter(csvfile, fieldnames=[*mydict[0]])

        # writing headers (field names)
        # writer.writeheader()

        # writing data rows
        writer.writerows(mydict)


loops_csv()