#!/bin/bash
id=`curl --silent "https://en.wikipedia.org/w/api.php?action=query&list=random&format=json&rnnamespace=0" | jq '.query.random[].id'`
echo "the id is $id"
title=`curl --silent "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&pageids=$id" | jq '.query.pages[].title' | sed "s/\"//g"`
extract=`curl --silent "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&pageids=$id" | jq '.query.pages[].extract'`
echo "The title is: $title"
echo "The extract is: $extract"
replace="XXXXX"
newExtract=`sed "s/$title/$replace/g" <<< "$extract"`
echo $newExtract
