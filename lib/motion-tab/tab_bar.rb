module MotionTab
  module TabBar
    def createTabBarControllerFromData(data)
      main_view = MainViewController.alloc.initWithNibName(nil, bundle: nil)
      settings_view = SettingsViewController.alloc.initWithNibName(nil, bundle: nil)
      
      mt_tab_controllers = []

      data.each do |tab|
        tab[:badgeNumber] = 0 unless tab[:badgeNumber]
        
        viewController = tab[:viewController].alloc.init
        viewController.tabBarItem = tabBarIcon(tab[:systemIcon], tab[:badgeNumber]) if tab[:systemIcon]
        
        if tab[:navigationController]
          controller = UINavigationController.alloc.initWithRootViewController(viewController)
        else
          controller = viewController
        end

        mt_tab_controllers << controller
      end

      tabBarController = UITabBarController.alloc.init
      tabBarController.viewControllers = mt_tab_controllers

      return tabBarController
    end

    def tabBarItem(icon, tag = 0)
      return UITabBarItem.alloc.initWithTabBarSystemItem(icon, tag: tag)
    end
  end
end