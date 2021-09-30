Pod::Spec.new do |s|
    s.name                    = "ActantSDK"
    s.version                 = "1.1.5"
    s.summary                 = "ActantSDK (iOS) #{s.version}"
    s.homepage                = "https://github.com/ActantTechnology/actant-sdk-ios-distribution"

    s.author                  = { "Actant Technology" => "dev@actanttech.com" }
    s.license                 = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.swift_versions          = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5']
    s.platform                = :ios
    s.ios.deployment_target   = '14.5'
    s.source                  = { :git => "https://github.com/ActantTechnology/actant-sdk-ios-distribution.git", :tag => "#{s.version}" }

    s.frameworks = 'UIKit', 'SceneKit', 'ARKit', 'CoreLocation', 'CoreMotion'
    s.dependency 'gRPC-Swift', '~> 1.4.0'
    s.dependency 'OpenCV2', '~> 4.3.0'

    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.ios.vendored_frameworks = 'ActantSDK.framework'
end
