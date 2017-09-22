#!/usr/bin/env python

import argparse
import csv
import logging
import sys

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Count unique values in a column.")
    parser.add_argument("-o", "--output",
                        type=argparse.FileType("wb"),
                        default=sys.stdout,
                        help="Output file. Standard out will be used if not specified.")
    parser.add_argument("--indialect",
                        default="excel",
                        help="Dialect of the input file.")
    parser.add_argument("--outdialect",
                        default="excel",
                        help="Dialect of the output file.")
    parser.add_argument("--top",
                        default="excel",
                        help="Dialect of the output file.")
    parser.add_argument("target",
                        type=int,
                        help="Target column.")
    parser.add_argument("inputs",
                        type=argparse.FileType("rb"),
                        nargs='+',
                        default=sys.stdin,
                        help="CSV File from which to read.")

    args = parser.parse_args()

    counts = {}
    writer = csv.writer(args.output, dialect=args.outdialect)
    for input_file in args.inputs:
        reader = csv.reader(input_file, dialect=args.indialect)
        for row in reader:
            try:
                target_value = row[args.target]
            except IndexError:
                logging.warning("Skipping line. Target column doesn't exist on line {} of {}".format(reader.line_num,
                                                                                                     input_file))
                continue
            value = target_value.strip()
            if value in counts:
                counts[value] += 1
            else:
                counts[value] = 1

    sorted_counts = sorted([(k, v) for k, v in counts.iteritems()], key=lambda item: item[1])

    for i in sorted_counts:
        print '{} {}'.format(*i)
