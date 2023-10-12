put current date as yyyy-mm-dd HH:MM:SS in $date
current_date=$(date '+%Y-%m-%d %H:%M:%S')

info="Activity on $current_date"
os="$(uname -s)"

echo "Identifying Operating System: $os"

# Built for MacOs
case $os in

    Darwin)
        cd "`dirname $0`" || exit 1

         # Create a new folder named "rendered in $month $year" inside the folder "generated"
        month=$(echo $current_date | cut -d '-' -f 2)
        year=$(echo $current_date | cut -d '-' -f 1)
        folder_name="rendered in $month $year"
        mkdir -p "generated/$folder_name"
        cd "generated/$folder_name"

        ;;

    *)
        echo "Operating System is unsupported!"
        ;;
esac

echo "$info" >> rendered.txt
echo "$info"
echo


git add rendered.txt
git commit -m "$info :four_leaf_clover:"
git push -u origin main

cd -