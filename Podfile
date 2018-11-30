# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

source 'https://github.com/CocoaPods/Specs.git'

# ignore all warnings from all pods

inhibit_all_warnings!

def shared_pods

    pod 'Masonry'
    pod 'AFNetworking'
    pod 'MJRefresh'
    pod 'RealReachability'
    pod 'YYImage'
    pod 'YYImage/WebP'
    pod 'YYWebImage'
    pod 'YYModel'
    pod 'DZNEmptyDataSet'
    pod 'JLRoutes'
    pod 'MBProgressHUD'
    pod 'IQKeyboardManager'
    pod 'ReactiveCocoa', :git => 'https://github.com/zhao0/ReactiveCocoa.git', :tag => '2.5.2'
    pod 'Weibo_SDK', :git => 'https://github.com/sinaweibosdk/weibo_ios_sdk.git'
    pod 'WechatOpenSDK'
    pod 'UMCCommon'
    pod 'UMCPush'
    pod 'UMCSecurityPlugins'
    pod 'UMCAnalytics'
    pod 'YPTabBarController','~> 2.4.6'
    pod 'GDPerformanceView', '~> 1.3.1'
    pod 'IGListKit'
    pod 'Texture'
    pod 'SuperPlayer'
    pod 'Ono'

    post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 8.0
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
                end
            end
        end
    end
end

target 'wooDemo' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for wooDemo
  shared_pods
  end

  target 'wooDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'wooDemoUITests' do
    inherit! :search_paths
    # Pods for testing
  end
