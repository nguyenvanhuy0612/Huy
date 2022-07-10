def example1():
    # Reading an excel file using Python
    import xlrd

    # Give the location of the file
    loc = ("WorkspaceCCaaS.xlsx")

    # To open Workbook
    wb = xlrd.open_workbook(loc)
    sheet = wb.sheet_by_index(0)

    # For row 0 and column 0
    print(sheet.cell_value(0, 0))


def excell_xlsx_file():
    # import openpyxl module
    import openpyxl

    # Give the location of the file
    path = "WorkspaceCCaaS.xlsx"

    # To open the workbook
    # workbook object is created
    wb_obj = openpyxl.load_workbook(path)

    # Get workbook active sheet object
    # from the active attribute
    sheet_obj = wb_obj.active

    # Cell objects also have a row, column,
    # and coordinate attributes that provide
    # location information for the cell.

    # Note: The first row or
    # column integer is 1, not 0.

    # Cell object is created by using
    # sheet object's cell() method.
    cell_obj = sheet_obj.cell(row=1, column=1)

    # Print value of cell object
    # using the value attribute
    print(cell_obj.value)

    max_col = sheet_obj.max_column

    # Loop will print all columns name
    for i in range(1, max_col + 1):
        cell_obj = sheet_obj.cell(row=3, column=i)
        print(cell_obj.value)


if __name__ == '__main__':
    excell_xlsx_file()
