#  Learning SwiftUI

### Experimenting with custom Shape modifiers

#### Adding a modifier that strokes and fills a shape

Links:

- [Stroking and filling a SwiftUI shape at the same time](https://www.swiftbysundell.com/articles/stroking-and-filling-a-swiftui-shape-at-the-same-time/) by Sundell
- [Stroke and fill a Shape in SwiftUI](https://swiftuirecipes.com/blog/stroke-and-fill-a-shape-in-swiftui) by swiftuirecipes

```
extension Shape {
    func stroke<StrokeStyle, FillStyle>(
        _ strokeStyle: StrokeStyle,
        lineWidth: CGFloat = 1,
        fill fillStyle: FillStyle
    ) -> some View where StrokeStyle: ShapeStyle, FillStyle: ShapeStyle {
        stroke(strokeStyle, lineWidth: lineWidth)
            .background(fill(fillStyle))
    }
}
```

```
            Circle()
                .stroke(Color.red, lineWidth: 7, fill: Color.green)
                .frame(width: 60, height: 60)
```

#### Moved custom shapes and modifiers into the package [rfSwiftUI](https://github.com/rudifa/rfSwiftUI)

#### github actions
At this stage the github actions `build_and_test` and `build_jazzy_docs` fail, because 
```
package at 'https://github.com/rudifa/rfSwiftUI' @ 21b670e...
```
``` 
is using Swift tools version 5.5.0 but the installed version is 5.3.0
```