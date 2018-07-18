#!/usr/bin/env ruby
require_relative './lib/image_processor'

directory = ARGV[0]

processor = ImageProcessor.new(directory)
processor.process
