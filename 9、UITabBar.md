# UIView

## UITabBar

1. [调低 TabBar 显示层级](https://stackoverflow.com/a/61473356)

   ```swift
   tabBarController?.tabBar.layer.zPosition = -1
   if let items = tabBarController?.tabBar.items {
       items.forEach { $0.isEnabled = false }
   }
   ```