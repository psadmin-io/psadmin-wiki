WIKI_BUILD=$(pwd)

echo "### Building the Wiki Sidebar ###"
echo $WIKI_BUILD
rm -rf $WIKI_BUILD/_data/*
for file in $(find $WIKI_BUILD/posts -type f -name '*.md') 
# $WIKI_BUILD/posts/
# do
#   echo $folder
#   for file in $folder
  do
    echo "Source File: ${file}"
    folder=$(basename $(dirname "$file"))
    name=$($(echo basename "$file") | cut -d'.' -f1)
    if [ "$name" != "$folder" ]; then
      awk -F'[:\n]' 'BEGIN { RS = "---"} ; /title: /{ printf "%s: \"%s\"\n", $3, $7 }' $file | sed 's/^ //' | sed 's/: \" /: \"/' >> $WIKI_BUILD/_data/$folder.yml
      echo "Sidebar Registry: ${WIKI_BUILD}/_data/${folder}.yml"
    fi  
    # echo ../_data/$folder.yaml
  # done
done