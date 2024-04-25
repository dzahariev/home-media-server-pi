#! /bin/bash

WATCH="/watch"
PROCESS="/process"
OUTPUT="/output"

echo "Starting to watch folder $WATCH"

inotifywait --recursive --monitor --quiet -e moved_to -e close_write --format '%f' "$WATCH" | while read -r INPUT_FILE
do
    echo "Detected $INPUT_FILE"
    if [[ "$INPUT_FILE" =~ \.(mp4|MP4|mpg|MPG|mov|MOV|avi|AVI|mkv|MKV)$ ]]; then
        echo "Moving $INPUT_FILE to $PROCESS"
        mv "$WATCH/$INPUT_FILE" "$PROCESS"
        OUTPUT_FILE="${INPUT_FILE%%.*}.mp4"

        tsp HandBrakeCLI --preset-import-file /app/Custom720P.json -Z "Custom720P" -i "$PROCESS/$INPUT_FILE" -o "$OUTPUT/$OUTPUT_FILE"
        echo "Processing completed - $OUTPUT/$OUTPUT_FILE"
    else
        echo "File $INPUT_FILE is ignored as it is not of type mp4|mpg|mov|avi|mkv."
    fi
done