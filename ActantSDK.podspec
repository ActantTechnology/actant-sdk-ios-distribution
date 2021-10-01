Pod::Spec.new do |s|
    s.name                    = "ActantSDK"
    s.version                 = "1.1.6"
    s.summary                 = "ActantSDK (iOS) #{s.version}"
    s.homepage                = "https://github.com/ActantTechnology/actant-sdk-ios-distribution"

    s.author                  = { "Actant Technology" => "dev@actanttech.com" }
    s.license                 = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform                = :ios
    s.ios.deployment_target   = '14.5'
    s.source                  = { :git => "https://github.com/ActantTechnology/actant-sdk-ios-distribution.git", :tag => "#{s.version}" }

    s.frameworks = 'UIKit', 'SceneKit', 'ARKit', 'CoreLocation', 'CoreMotion'
    s.dependency 'gRPC-Swift', '~> 1.4.2'
    s.dependency 'OpenCV2', '~> 4.3'

    s.ios.vendored_frameworks = 'ActantSDK.framework'
end
