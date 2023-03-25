# UITextField

1. `text` 和 `placeholder` 向右移偏移10

```swift
class LoginTextField: UITextField {
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    var rect = super.editingRect(forBounds: bounds)
    rect.origin.x += 10
    rect.size.width -= 10
    return rect
  }
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    var rect = super.textRect(forBounds: bounds)
    rect.origin.x += 10
    rect.size.width -= 10
    return rect
  }
}
```

## UITextFieldDelegate

1. [textFieldShouldReturn(:) -> Bool 返回 true 和 false 的区别](https://stackoverflow.com/a/20435630)
   - 返回 `true`，点击 return 按钮会自动校准；否则不会。
