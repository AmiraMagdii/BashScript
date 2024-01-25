#!/bin/bash
extract_image_metadata() {
    for file in "$1"/*.jpg "$1"/*.png "$1"/*.gif; do
        echo "Metadata for $file:"
        exiftool "$file"
        echo ""
    done
}

analyze_text_files() {
    for file in "$1"/*.txt; do
        echo "Analyzing $file:"
        wordcount=$(wc -w < "$file")
        linecount=$(wc -l < "$file")
        charactercount=$(wc -m < "$file")
        echo "Word count: $wordcount"
        echo "Line count: $linecount"
        echo "Character count: $charactercount"
        echo ""
    done
}
analyze_pdf_files() {
    for file in "$1"/*.pdf; do
        echo "Analyzing $file:"
        pdf_info=$(pdfinfo "$file")
        num_pages=$(echo "$pdf_info" | grep "Pages:" | awk '{print $2}' )
        author=$(echo "$pdf_info" | grep "Author:" | awk '{print substr($0, index($0,$2))}')
        creation_date=$(echo "$pdf_info" | grep "CreationDate:" | awk '{print substr($0, index($0,$2))}')
        echo "Number of pages: $num_pages"
        echo "Author: $author"
        echo "Creation date: $creation_date"
        echo ""
    done
}

echo -n "Enter the directory path: "
read directory

if [ ! -d "$directory" ]; then
    echo "Directory doesn't exist!"
    exit 1
fi
extract_image_metadata "$directory"
analyze_text_files "$directory"
analyze_pdf_files "$directory"
