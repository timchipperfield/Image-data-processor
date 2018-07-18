# Image-data-processor [Build Status](https://travis-ci.com/timchipperfield/Image-data-processor.svg?branch=master)
A command-line application for processing image gps data

## Overview

This is a command line application that reads images recursively from a supplied or default directory. It extracts EXIF GPS data and then writes the name of the image and the GPS coordiantes to either a CSV or HTML doc depending on parameters.

## Running Instructions
1. Clone repo to local repository
2. Run bundle install
3. Go to the root of the directory
4. On your terminal, enter: ./run_process_image.rb
5. Try the app using custom parameters ex) `./run_process_image.rb html ../documents`
  - optional: the hmtl parameter specifies the output the document as HTML (defaults to CSV)
  - optional: any other parameter passed will be treated as an image directory to search (relative to project path)

## To Run Tests
Type 'rspec' in the terminal.
