#!/usr/bin/env ruby
require_relative './lib/parameters_parser'
require_relative './lib/image_processor'

params = ParametersParser.new(ARGV).parse

processor = ImageProcessor.new(params)
processor.process
