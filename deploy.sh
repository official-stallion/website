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

# move files
mv template/dist/* .

mkdir assets

mv template/dist/assets/* ./assets

# remove all
rm -rf template
