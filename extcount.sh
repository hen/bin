# Shows the number of files in a directory (and below) by their extensions

# Switch to work on stdin rather than needing a name, more versatile
find $1 -type f | sed 's/\/\./\//g' | sed 's/^\.\///' | sed 's/.*\.\([^\.\/]*\)$/\1/' | sed 's/^.*\/.*$/No Extension/' | reportcount.pl
