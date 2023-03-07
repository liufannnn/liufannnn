# UIView

## UITextField

1. Text 和 Placeholder 向右移

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

### UITextFieldDelegate

1. [`func textFieldShouldReturn(_ textField: UITextField) -> Bool` 返回 `true` 和 `false` 的区别](https://stackoverflow.com/a/20435630)