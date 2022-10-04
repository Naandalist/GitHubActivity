
info="Activity on $(date)"
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

# Shipping
git add output.txt
git commit -m "$info :four_leaf_clover:"
git push origin main 

cd -
