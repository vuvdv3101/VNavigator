Pod::Spec.new do |s|

#1
s.platform = :ios
s.ios.deployment_target = '13.0'
s.name = "VNavigator"
s.summary = "Super easy navigation in SwiftUI"
s.requires_arc = true

#2
s.version = "0.1.0"

#3
s.license = { :type => "MIT", :file => "LICENSE" }

#4
s.author = { "Vu Vuong" => "vuvdv3101@gmail.com" }

s.homepage = "https://github.com/vuongdangvu/VNavigator"

s.source = { :git => "https://github.com/vuongdangvu/VNavigator.git",
             :tag => "#{s.version}" }
             
s.source_files = "VNavigator/**/*.{swift}"

s.swift_version = "5.0"

end


