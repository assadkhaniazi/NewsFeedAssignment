# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

target 'Technology Assessment' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for This Project


pod 'RxSwift','~> 5.1.1'
pod 'RxCocoa','~> 5.1.1'
pod 'Alamofire','~> 5.0'
pod 'SDWebImage'
pod 'RealmSwift'


end
post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
