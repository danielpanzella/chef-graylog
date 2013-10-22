# Changelog

## 0.13.4 ( Patrick McJury)
Changes:
* set dep to mongodb to a specific verison 0.13.4
* remove ref from berksfile for mongodb and set default to master, which would have the preoper constrained version
* removed deps in berksfile from community. Left only the non standard dep location in berksfile and defer the rest to metadata.rb
* removed metadata.json