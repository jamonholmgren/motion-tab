module MotionTab
  class TabBar
    class << self
      def createTabBarControllerFromData(data)
        tabBarController = UITabBarController.alloc.init
        tabBarController.viewControllers = self.tabControllersFromData(data)

        return tabBarController
      end

      def tabBarIcon(icon, tag = 0)
        return UITabBarItem.alloc.initWithTabBarSystemItem(icon, tag: tag)
      end

      def tabBarIconCustom(title, imageName, tag = 0)
        iconImage = UIImage.imageNamed(imageName)
        return UITabBarItem.alloc.initWithTitle(title, image:iconImage, tag:tag)
      end

      def tabControllersFromData(data)
        mt_tab_controllers = []

        data.each do |tab|
          mt_tab_controllers << self.controllerFromTabData(tab)
        end

        return mt_tab_controllers
      end

      def controllerFromTabData(tab)
        tab[:badgeNumber] = 0 unless tab[:badgeNumber]
        tab[:tag] = 0 unless tab[:tag]
        
        viewController = tab[:viewController].alloc.init
        
        if tab[:navigationController]
          controller = UINavigationController.alloc.initWithRootViewController(viewController)
        else
          controller = viewController
        end

        controller.tabBarItem = self.tabBarItem(tab)
        controller.tabBarItem.title = controller.title unless tab[:title]

        return controller
      end

      def tabBarItem(tab)
        title = "Untitled"
        title = tab[:title] if tab[:title]

        tabBarItem = tabBarIcon(tab[:systemIcon], tab[:tag]) if tab[:systemIcon]
        tabBarItem = tabBarIconCustom(title, tab[:icon]) if tab[:icon]
        
        tabBarItem.badgeValue = tab[:badgeNumber].to_s unless tab[:badgeNumber].nil? || tab[:badgeNumber] <= 0
        
        return tabBarItem
      end
    end
  end
end