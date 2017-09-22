#!/usr/bin/env python

import argparse
import csv
import sys
from collections import OrderedDict

import simplejson as json


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert csv files to json.")
    parser.add_argument("-p", "--pretty",
                        action='store_true',
                        help="Output should be pretty printed.")
    parser.add_argument("--headers",
                        action='store_true',
                        help="Each list item should be a dictionary with the headers as keys.")
    parser.add_argument("--order",
                        default=None,
                        help="Order for dictionary keys.")
    parser.add_argument("-e", "--empty",
                        default=None,
                        help="Extra empty keys for dictionary. Implies -h or --headers.")
    parser.add_argument("--empty-value",
                        default="",
                        help="Extra empty keys for dictionary. Implies -h or --headers.")
    parser.add_argument("-o", "--output",
                        type=argparse.FileType("wb"),
                        default=sys.stdout,
                        help="Output file. Standard out will be used if not specified.")
    parser.add_argument("input",
                        nargs="*",
                        type=argparse.FileType("rb"),
                        default=[sys.stdin],
                        help="Excel file to convert.")

    args = parser.parse_args()

    if args.order:
        args.order = args.order.split(",")
    else:
        args.order = []

    if args.empty:
        args.empty = args.empty.split(",")
    else:
        args.empty = []

    if len(args.empty):
        args.headers = True

    records = []
    row_idx = 0
    for csv_file in args.input:
        reader = csv.reader(csv_file)
        headers = dict()
        for row in reader:
            if args.headers:
                if reader.line_num == 1:
                    headers = row
                else:
                    record = OrderedDict()
                    for k in args.order:
                        record[k] = ""

                    for i, v in enumerate(row):
                        record[headers[i]] = v

                    for empty in args.empty:
                        record[empty] = args.empty_value

                    records.append(record)
            else:
                records.append(row)

    json.dump(records, args.output, indent='    ')



