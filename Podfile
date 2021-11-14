# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def install_pods
    use_frameworks!
    inhibit_all_warnings!
  
    pod 'Firebase/Core'
    pod 'Firebase/Analytics'
    # pod 'Firebase/RemoteConfig'
    pod 'Google-Mobile-Ads-SDK'
  end
  
  target 'RikakoLocal' do
    install_pods
    
    target 'RikakoTests' do
      inherit! :search_paths
    end
  
    target 'RikakoUITests' do
      inherit! :search_paths
    end
  end
  
  target 'RikakoStaging' do
    install_pods
  end

  target 'fp-production' do
    install_pods
  end
  
  target 'RikakoProduction' do
    install_pods
  end
  