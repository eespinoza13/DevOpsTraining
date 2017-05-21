#  $1 = Git repos head; $2 - repo name

if [ "${1}" = "" -o "${2}" = "" ]
then 
	echo "usage: $0 <basedir> <reponame>"
	exit 1
fi

export RepoBase=$1
export RepoName=$2

echo "--------"
echo RepoBase=$RepoBase
echo Reponame=$RepoName
cd $RepoBase 			#go to a directory where we will create a repo
mkdir $RepoName		#make the repo and add three blank files to it.
cd $RepoName
echo "current Directory is `pwd`."
>stuff 
>stuffaswell
>even
ls -l				# list the files then exec commands to put something in the files.
ls -l >even; ls -la >stuff; ls >stuffaswell
ls -l


#files created. create the git repo
echo "-----------------------"
echo "create and commit files"
echo "-----------------------"

git init			# initialize the repo
ls -la
git add .
git status
git commit -m "first commit"		# commit the initial repo
git status
git log

# add and commit to develop branch
echo "-----------------------"
echo "create develop branch, make changes to it, and commit files"
echo "-----------------------"

git checkout -b develop			#  create the develop branch
git branch
ls
echo “hello good-looking” >>even
git status
git add .
git status
git commit -m "commit changes to develop stream"		# commit the develop repo
git status
git log


# add and commit to feature branch
echo "-----------------------"
echo "create feature branch, make changes to it, and commit files"
echo "-----------------------"

git checkout master

git checkout -b feature			#  create the feature branch
git branch
ls
echo “I\'ve seen all Good People!” >>even
git status
git add .
git status
git commit -m "commit changes to feature stream"		# commit the develop repo
git status
git log


echo "-----------------------"
echo "branches should be ready now.  Start the merge activities."
echo "-----------------------"

