## UIView

1. 圆角

   ```swift
   self.layer.cornerRadius = 5
   self.layer.masksToBounds = true // 裁剪，部分UIView需要设置这个属性，会触发离屏渲染

   self.layer.shouldRasterize = true // 缓存，解决离屏渲染带来的性能问题，https://github.com/MrGCY/AnyCornerRadius
   self.layer.rasterizationScale = UIScreen.main.scale

   self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // 指定圆角位置
   ```