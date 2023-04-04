#!/usr/bin/env bash

cd app

npm run build

cd ..

rm -rf assets

mkdir assets

mv app/dist ./

mv dist/* .

mv dist/assets/* ./assets/*

rmdir dist