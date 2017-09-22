#!/usr/bin/env python

from __future__ import print_function

from mmap import mmap, ACCESS_READ
import argparse
import csv
import datetime
import os
import sys
import xlrd


def warning(*objs):
    print("WARNING: ", *objs, file=sys.stderr)


def csv_name(xl_name, sheet_name):
    xl_name = os.path.splitext(os.path.basename(xl_name))[0]

    fn = "{}_{}".format(xl_name, sheet_name)
    fn = "".join([c for c in fn if c.isalnum() or c == '-' or c == '_']).rstrip()
    return "{}.csv".format(fn)


def xl_rows(sh, date_format):
    rn = 0
    while rn < sheet.nrows:
        values = sheet.row_values(rn)
        # Cell Types: 0=Empty, 1=Text, 2=Number, 3=Date, 4=Boolean, 5=Error, 6=Blank
        for idx, cell_type in enumerate(sh.row_types(rn)):
            if cell_type == 3:
                dt = datetime.datetime(*xlrd.xldate_as_tuple(values[idx], wb.datemode))
                values[idx] = dt.strftime(date_format)
            elif cell_type == 2 and int(values[idx]) == values[idx]:
                values[idx] = int(values[idx])
        rn += 1
        yield values


def write_sheet(sheet, output, dialect, date_format):
    writer = csv.writer(output, dialect=dialect)
    for row in xl_rows(sheet, date_format):
        writer.writerow(row)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert excel files to csv")
    parser.add_argument("-o", "--output",
                        help="Output file. Standard out will be used if not specified.")
    parser.add_argument("-d", "--dateformat",
                        default="%Y-%m-%d",
                        help="Format used for dates.")
    parser.add_argument("-s", "--sheet",
                        type=int,
                        default=0,
                        help="Sheet you would like to read from.")
    parser.add_argument("-a", "--all-sheets",
                        action="store_true",
                        help="Output all sheets. Will create a file for each sheet.")
    parser.add_argument("--outdialect",
                        default="excel",
                        help="Dialect of the output file.")
    parser.add_argument("input",
                        help="Excel file to convert.")

    args = parser.parse_args()

    if not os.path.exists(args.input):
        sys.exit("Input file not found!")

    if os.path.getsize(args.input) < 1:
        sys.exit("Input file is empty!")

    with open(args.input, "rb") as in_fh:
        wb = xlrd.open_workbook(file_contents=mmap(in_fh.fileno(), 0, access=ACCESS_READ))

        if args.all_sheets:
            for sheet in wb.sheets():
                with open(csv_name(args.input, sheet.name), "wt") as out_fh:
                    write_sheet(sheet, out_fh, args.outdialect, args.dateformat)
        else:
            if wb.nsheets > 1:
                warning("There is more than one sheet in this file!")

            sheet = wb.sheet_by_index(args.sheet)
            if args.output:
                with open(args.output, "rb") as out_fh:
                    write_sheet(sheet, out_fh, args.outdialect, args.dateformat)
            else:
                write_sheet(sheet, sys.stdout, args.outdialect, args.dateformat)
