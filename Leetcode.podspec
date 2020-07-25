Pod::Spec.new do |spec|
  spec.name         = "Leetcode"
  spec.version      = "0.0.2"
  spec.summary      = "A small framework where you can find the solutions of some leetcode problems"
  spec.description  = <<-DESC
                    PhotoFeeds provides you with smooth loading of images from the server in a MVVM architecture. It uses a third party library to fetch images!
                   DESC
  spec.homepage     = "https://github.com/gulshan-arya/Leetcode-problems"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Gulshan Kumar" => "singh.aryan7575@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/gulshan-arya/Leetcode-problems.git", :tag => "#{spec.version}" }
  spec.source_files = "Leetcode/Leetcode-Programs/*.{swift}"
  spec.swift_version = "4.0"
  spec.swift_versions = ['3.2', '4.0', '4.2']
end