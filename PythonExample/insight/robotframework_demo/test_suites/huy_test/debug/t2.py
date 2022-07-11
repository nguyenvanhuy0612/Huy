'''mydict = [{'branch': 'COE', 'cgpa': '9.0', 'name': 'Nikhil', 'year': '2'},
          {'branch': 'COE', 'cgpa': '9.1', 'name': 'Sanchit', 'year': '2'},
          {'branch': 'IT', 'cgpa': '9.3', 'name': 'Aditya', 'year': '2'},
          {'branch': 'SE', 'cgpa': '9.5', 'name': 'Sagar', 'year': '1'},
          {'branch': 'MCE', 'cgpa': '7.8', 'name': 'Prateek', 'year': '3'},
          {'branch': 'EP', 'cgpa': '9.1', 'name': 'Sahil', 'year': '2'}]
print(mydict, type(mydict))
mydict1 = mydict[1]
mydict1_keys = list(mydict1.keys())
print(mydict1, type(mydict1))
print(mydict1_keys, type(mydict1_keys))
print([*mydict1])'''

'''from handling import *
from data import *

if not driver.current_url == url_power:
    driver.get(url_power)
page = 67
go_page(page)
collect_data_power()
write_dictionary_to_csv()
csv_data_list.clear()
page += 1'''

'''page = 10
while page < 20:
    print(page)
    page+=1
    if page == 19:
        print(str(page) + ' is break')
        break

print('Finish while')'''

from data import *


def abc():
    global implicitly_wait
    implicitly_wait += 10
    print(implicitly_wait)
