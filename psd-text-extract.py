#!/usr/bin/env python
# -*- coding:utf-8 -*-

from codecs import encode, decode

def get_next_occurence(text, buf, start):
    text = encode(text, "utf-16")[2:] # cut BOM
    index = buf.find(text, start)
    if index == -1:
        return b"", -1
    end = buf.find(b'\x00\x00', index)
    if end == -1:
        return b"", -1
    chunk = b'\x00' + buf[index:end + 2]
    return chunk.replace(b'\x5C', b''), end

def get_all_occurences(text, buf):
    start = 0
    items = []
    while start != -1:
        try:
            found, start = get_next_occurence(text, buf, start)
            items.append(decode(found, "utf-16be").replace('\r', '\n'))
        except UnicodeDecodeError as e:
            continue
            print(" - undecodable match skipped:", e)

    return items

if __name__ == '__main__':
    import sys
    if len(sys.argv) > 4 or len(sys.argv) < 3:
        print("Usage: psdtextextract.py file.psd pattern [display-all-matches]")
    with open(sys.argv[1], 'rb') as f:
        items = get_all_occurences(sys.argv[2], f.read())
        if "display-all-matches" not in sys.argv:
            print(items[0])
        else:
            for item in items:
                print(item)