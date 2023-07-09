#!/usr/bin/env bash


GIT_TEMPL="https://github.com/official-stallion/template.git"


# clone into directory
git clone "$GIT_TEMPL"


cd template

# install dependencies
npm i

# build project
npm run build

cd ..

rm -rf site

mkdir site

# move files
mv template/dist/* ./site

mv template/dist/assets ./site/assets

# remove all
rm -rf template