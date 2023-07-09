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

rm -rf dist

mkdir dist

# move files
mv template/dist .

# remove tamplate
rm -rf template