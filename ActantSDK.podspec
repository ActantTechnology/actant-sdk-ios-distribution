Pod::Spec.new do |s|
    s.name         = "ActantSDK"
    s.version      = "1.0.1"
    s.summary      = "A brief description of ActantSDK project."
    s.description  = <<-DESC
    An extended description of ActantSDK project.
    DESC
    s.homepage     = "http://your.homepage/here"
    s.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2021
                   Permission is granted to...
                  LICENSE
                }
    s.author             = { "Vadim Shilov" => "vshdevelop@gmail.com" }
    s.source       = { :git => "https://github.com/ActantTechnology/actant-sdk-ios-distribution", :tag => "#{s.version}" }
    s.vendored_frameworks = "ActantSDK.xcframework"
    s.platform = :ios
    s.swift_version = "5.0"
    s.ios.deployment_target  = '14.5'

    s.frameworks = 'UIKit', 'SceneKit', 'ARKit'
    s.dependency 'gRPC-Swift', '~> 1.0.0'
    s.dependency 'OpenCV2', '~> 3.4'

    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.pod_target_xcconfig = { 'ONLY_ACTIVE_ARCH' => 'YES' }
end
