for file in ../posts/*/*.md
do
   awk -F'[:\n]' 'BEGIN { RS = "---"} ; /title: /{ printf "%s: \"%s\"\n", $3, $7 }' $file | sed 's/^ //' | sed 's/: \" /: \"/'
done