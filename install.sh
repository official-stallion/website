#!/usr/bin/env bash

rm -rf template

git clone https://github.com/official-stallion/template.git

cd template

npm i

npm run build

cd ..

mv template/dist/* ./*
