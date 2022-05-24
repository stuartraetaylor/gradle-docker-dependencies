#!/usr/bin/env bash

clean_images() {
    docker rmi first:latest second:latest 1> /dev/null 2>&1
}

echo
echo 'Test 1: explicitly build both images'
clean_images
./gradlew :first:dockertag :second:dockerTag

echo
echo  'Test 2: build second image using dependencies'
clean_images
./gradlew :second:dockerTag

