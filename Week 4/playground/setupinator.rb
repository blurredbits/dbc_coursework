#!/usr/bin/env ruby

SINATRA_SKELETON = ["config",
                    "public",
                    "public/images",
                    "public/javascripts",
                    "public/stylesheets",
                    "views",
                    "db",
                    "db/data",
                    "db/migrate",
                    "lib",
                    "spec"]


puts "Creating new directories in: #{Dir.getwd}"

SINATRA_SKELETON.each do |item|
  puts "Creating directory for #{item}: " + (Dir.mkdir(item) == 0 ? "Done" : "Error").to_s
end
