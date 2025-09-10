# WP Engine Initialization

Moving From Pantheon
Pull code
Delete Remotes
Add Github origin
Push origin
Create Staging and Dev branches and push

git checkout -b staging
git push --set-upstream origin staging
git checkout -b dev
git push --set-upstream origin dev

Github Actions Workflow
Add folder to new projects and prepend . to github folder
Add secrets to repos under Settings > Secrets and Variables

re initlialize git 

rm -rf .git
git init
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:HaystackDigital/Repository-Name.git
git push -u origin main

set secret WPE_SSHG_KEY_PRIVATE with your private key
pbcopy < ~/.ssh/id_rsa

WP Engine
Set up site and establish prod env

if you need to generate a new ssh key for your device

https://wpengine.com/support/ssh-keys-for-shell-access/#sshconfig

UPDATE wp_options SET option_value = REPLACE(option_value, '//cilkerhenderson.com', '//clkrhenderson.wpenginepowered.com');

