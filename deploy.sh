#!/usr/bin/env bash

git clone https://github.com/official-stallion/template.git

cd template

npm i

npm run build

cd ..

mv template/dist/* .

mkdir assets

mv template/dist/assets/* ./assets

rm -rf template