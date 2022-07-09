from bs4 import BeautifulSoup
import re

with open("gia.html", "br") as f:
    data = f.read()

soup = BeautifulSoup(data, features='html.parser')
# print(soup.prettify())

list_data = soup.find(id='list_sale_price')


def save_file(content, path):
    with open(path, "a+") as f:
        f.writelines(content + '\n')


groups = list_data.find_all(attrs={"class": "group-product"})

data_file = "datafile.tsv"
for group in groups:
    header = group.find(name='div', class_="group-name", recursive=False)
    #save_file(header.h3.string, "data.csv")
    print(str(header.string))
    save_file("\t" + str(header.string), data_file)
    rows = group.find_all(name='div', class_="table-row", recursive=False)
    for row in rows:
        rData1 = row.find(name='div', class_="tb-col-1", recursive=False).string
        rData2 = row.find(name='div', class_="tb-col-2", recursive=False).find('a').string
        rData3 = row.find(name='div', class_="tb-col-3", recursive=False).string
        rData4 = row.find(name='div', class_="tb-col-4", recursive=False).string
        rData1 = "" if rData1 is None else rData1
        rData2 = "" if rData2 is None else rData2
        rData3 = "" if rData3 is None else rData3
        rData4 = "" if rData4 is None else rData4
        rowData = rData1 + "\t"+ rData2 + "\t"+ rData3 + "\t"+ rData4
        print(rowData)
        save_file(rowData, data_file)
