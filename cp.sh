while getopts t:c: flag
do
    case "${flag}" in
        t) target=${OPTARG};;
        c) commit=${OPTARG};;
    esac
done
if [ -z "$target" ]; then
  echo "Missing target branch arg -t"
  exit 1
fi
if [ -z "$commit" ]; then
  echo "Missing commit arg -c"
  exit 1
fi

git checkout $target
git pull
git checkout -b "cherry-pick-$commit"
git cherry-pick $commit