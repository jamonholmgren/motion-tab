module MotionTab
  class TabBar
    class << self
      def createTabBarControllerFromData(data)
        mt_tab_controllers = []

        data.each do |tab|
          tab[:badgeNumber] = 0 unless tab[:badgeNumber]
          
          viewController = tab[:viewController].alloc.init
          viewController.tabBarItem = tabBarIcon(tab[:systemIcon], tab[:tag]) if tab[:systemIcon]
          viewController.tabBarItem.badgeValue = tab[:badgeNumber].to_i.to_s if tab[:badgeNumber] && tab[:badgeNumber].to_i > 0
          
          if tab[:navigationController]
            controller = UINavigationController.alloc.initWithRootViewController(viewController)
          else
            controller = viewController
          end

          if tab[:title]
            controller.tabBarItem.title = tab[:title]
          else
            controller.tabBarItem.title = viewController.title
          end

          mt_tab_controllers << controller
        end

        tabBarController = UITabBarController.alloc.init
        tabBarController.viewControllers = mt_tab_controllers

        return tabBarController
      end

      def tabBarIcon(icon, tag = 0)
        return UITabBarItem.alloc.initWithTabBarSystemItem(icon, tag: tag)
      end
    end
  end
end