
# put current date as yyyy-mm-dd HH:MM:SS in $date
current_date=$(date '+%Y-%m-%d %H:%M:%S')

info="Activity on $(date '+%Y-%m-%d %H:%M:%S')"
os="$(uname -s)"

echo "Identifying Operating System: $os"

# Built for MacOs
case $os in

    Darwin)
        cd "`dirname $0`" || exit 1
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
