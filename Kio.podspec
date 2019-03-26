Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "Kio"
  s.version      = "2.2.0"
  s.summary      = "A personal toolset I use in iOS Projects"

  s.homepage     = "https://github.com/hooliooo/Kio"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = { :type => "MIT", :file => "LICENSE.md" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author             = { "Julio Alorro" => "alorro3@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios, "9.3"
  s.platform     = :watchos, "2.0"

  #  When using multiple platforms
  s.ios.deployment_target = "9.3"
  # s.osx.deployment_target = "10.7"
  s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/hooliooo/Kio.git", :tag => s.version.to_s }

  s.watchos.exclude_files = "Source/UICollectionView Helpers/*.swift", "Source/Coordinators/*.swift",
                            "Source/Classes/KioView.swift", "Source/Classes/KioViewController.swift",
                            "Source/Classes/KioActivityIndicatorView.swift", "Source/Extensions/UIView+Kio.swift",
                            "Source/Extensions/UIViewController+Kio.swift", "Source/Protocols/AppNetworkActivityIndicatorInjected.swift"


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "Source/**/*.swift"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.frameworks = "UIKit", "Foundation", "CoreGraphics"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.requires_arc = true
  s.swift_version = '5.0'

end
