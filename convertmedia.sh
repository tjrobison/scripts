#!/usr/bin/bash
args=("$@")
format=${args[0]}

if [ "$format" == "-h" ]
then
  echo '
    Uso:    convertvideo [output-format] [options] file1 file2 file3... filen'

  echo '      OPTIONS

          -o  specify one directory per one output
          -h  print this help message'
exit
fi

if [ "${args[1]}" == "-o" ]; then
    # outut directory is specified and must be named
    mkdir "${args[2]}"
    for (( i = 3; i <="$#" ; i++ )); do
        # convert video to specified format
        ffmpeg -i "${args[i]}" "${args[i]}"."${format}"
        # move the files converted files to specified directory
        mv "${args[i]}"."${format}" "${args[2]}"
    done

else
    # output converted files to same directory as source files
    for (( i = 1; i <="$#" ; i++ )); do
        # convert video to specified format
        ffmpeg -i "${args[i]}" "${args[i]}"."${format}"
    done
fi
