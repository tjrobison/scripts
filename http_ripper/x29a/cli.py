import sys

def usage(commands):
    """Show this help message"""
    print __doc__
    print "\nUsage: %s [options] command [arguments...]" % sys.argv[0]
    print "\nCommands:"
    for cmd in commands:
        print (cmd.func_name + " " + " ".join(
                cmd.func_code.co_varnames[:cmd.func_code.co_argcount])).ljust(\
                        25) + (cmd.__doc__ or "")
    print "\nOptions:"
    print "-verbose"

def main(commands):
    verbose = False
    if "-verbose" in sys.argv:
        sys.argv.remove("-verbose")
        verbose = True
    if len(sys.argv) < 2:
        usage(commands)
        return 1
    for cmd in commands:
        if cmd.func_name == sys.argv[1]:
            try:
                cmd(*sys.argv[2:])
                return 0
            except Exception, e:
                if verbose:
                    import traceback
                    traceback.print_exc()
                else:
                    print e.message
                usage(commands)
                return 1
    print "Unknown command"
    usage(commands)
    return 1

