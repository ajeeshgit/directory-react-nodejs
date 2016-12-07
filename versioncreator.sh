#Add version
mkdir -p apps/api/priv/static/
cat > apps/api/priv/static/version.json <<- EOM
{
  "metadata" : {
    "branch" : "$GIT_BRANCH",
    "commit" : "$GIT_COMMIT"
  },
  "version" : "5.6.0+$BUILD_NUMBER"
}
EOM
