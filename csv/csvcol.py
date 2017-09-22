#!/usr/bin/env python

import argparse
import csv
import sys


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Output csv with only specified columns from input csv file.")
    parser.add_argument("-o", "--output",
                        type=argparse.FileType("wb"),
                        default=sys.stdout,
                        help="Output file. Standard out will be used if not specified.")
    parser.add_argument("-i", "--input",
                        type=argparse.FileType("rb"),
                        default=sys.stdin,
                        help="Input file. Standard in will be used if not specified.")
    parser.add_argument("--indialect",
                        default="excel",
                        help="Dialect of the input file.")
    parser.add_argument("--outdialect",
                        default="excel",
                        help="Dialect of the output file.")
    parser.add_argument("columns",
                        type=str,
                        nargs='+',
                        help="Columns to output.")

    args = parser.parse_args()

    writer = csv.writer(args.output, dialect=args.outdialect)
    reader = csv.reader(args.input, dialect=args.indialect)
    for row in reader:
        new_row = []
        for x in args.columns:
            if x.startswith("x:"):
                new_row.append(x[2:])
            elif x.isdigit():
                new_row.append(row[int(x)])
            else:
                exit("Bad column specifier: {}".format(x))

        writer.writerow(new_row)
