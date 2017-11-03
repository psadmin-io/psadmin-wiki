dir=$(pwd)
WIKI_BUILD="$(dirname "$dir")"

echo "### Building the Wiki Sidebar ###"
echo $WIKI_BUILD
rm $WIKI_BUILD/_data/*
for file in $(find $WIKI_BUILD/posts -type f -name '*.md') 
# $WIKI_BUILD/posts/
# do
#   echo $folder
#   for file in $folder
  do
    echo "Source File: ${file}"
    folder=$(basename $(dirname "$file"))
    name=$($(echo basename "$file") | cut -d'.' -f1)
    awk -F'[:\n]' 'BEGIN { RS = "---"} ; /title: /{ printf "%s: \"%s\"\n", $3, $7 }' $file | sed 's/^ //' | sed 's/: \" /: \"/' >> $WIKI_BUILD/_data/$folder.yml
    echo "Sidebar Registry: ${WIKI_BUILD}/_data/${folder}.yml"
    # echo ../_data/$folder.yaml
  # done
done