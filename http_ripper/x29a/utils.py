import math
import locale

class Pluggable(list):
    def __call__(self, f):
        self.append(f)
        return f

def byteformat(n, units=('B', 'KiB', 'MiB', 'GiB', 'TiB')):
    """Format a number of bytes"""
    i = min(n and int(math.log(n, 1024)) or 0, len(units)-1)
    n /= 1024.0**i
    return locale.format_string("%.2f %s", (n, units[i]))

