


常见控件

SizedBox

-----------------


```agsl
class CustomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      // color: Colors.red,
      //decoration 为容器设置背景、边框、阴影、圆角等效果
      decoration: BoxDecoration(
        //可用 Border.all 统一设置所有边框，也可用 Border 上下左右分别设置
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        // border: Border(
        //   top: BorderSide(color: Colors.red, width: 2),
        //   bottom: BorderSide(color: Colors.blue, width: 3),
        // ),
        //可用 BorderRadius.circular 统一设置所有角弧度，也可用 BorderRadius.only 上下所有分别设置
        borderRadius: BorderRadius.circular(20),
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(10),
        //   bottomRight: Radius.circular(10),
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //设置阴影颜色，这里是灰色并且有 50% 的透明度
            spreadRadius: 5, // 控制阴影的扩散半径，值越大阴影扩散越大
            blurRadius: 7, // 控制阴影的模糊半径，值越大阴影越模糊
            offset: const Offset(0, 3), // 控制阴影的偏移量，这里是 x 方向不变，y 方向偏移 3 个单位
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('images/test1.jpg'),
          fit: BoxFit.cover,
          //给图片加过滤器
          colorFilter: ColorFilter.mode(
            Colors.red,
            BlendMode.darken , // 混合模式
          ),
        ),
        // gradient: const LinearGradient(
        //   colors: [Colors.red, Colors.blue],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
      ),
    );
  }
}
```



修饰组件的外观，通常应用于容器组件如 `Container`,它通过与 `BoxDecoration` 结合使用，能够为组件添加背景颜色、渐变、边框、阴影等效果


-------------------------


### <span id ="ScaleType">BoxFit（Flutter） vs ScaleType（Android）</span>


| 功能           | Flutter - `BoxFit`              | Android - `ScaleType`               | 说明                                                                                                                                                        |
|----------------|---------------------------------|-------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **拉伸适应**   | `BoxFit.fill`                   | `ScaleType.FIT_XY`                  | 拉伸图片以完全填满容器，不保持宽高比，可能会导致图片变形。                                                                                                      |
| **保持宽高比** | `BoxFit.contain`                | `ScaleType.FIT_CENTER`              | 图片缩放以适应容器的边界，保持宽高比，可能会在容器中留有空白区域。                                                                                             |
| **裁剪覆盖**   | `BoxFit.cover`                  | `ScaleType.CENTER_CROP`             | 图片会被缩放并裁剪，以便覆盖整个容器，保持宽高比，可能会裁剪图片的边缘部分。                                                                                  |
| **适应宽度**   | `BoxFit.fitWidth`               | `ScaleType.FIT_START` / `FIT_END`   | 图片的宽度拉伸至容器的宽度，高度按比例缩放，可能会裁剪高度。 `FIT_START` 从顶部对齐，`FIT_END` 从底部对齐。                                                     |
| **适应高度**   | `BoxFit.fitHeight`              | `ScaleType.FIT_START` / `FIT_END`   | 图片的高度拉伸至容器的高度，宽度按比例缩放，可能会裁剪宽度。                                                                                                   |
| **无缩放**     | `BoxFit.none`                   | `ScaleType.CENTER`                  | 图片按原始大小展示，不进行缩放，如果图片比容器大，会显示部分内容；如果图片比容器小，则在容器中居中。                                                             |
| **缩小适应**   | `BoxFit.scaleDown`              | `ScaleType.CENTER_INSIDE`           | 缩小图片以适应容器，保持宽高比；图片不会放大，如果图片比容器大则缩小，否则按原尺寸显示。                                                                         |




-------------

图片尺寸文字等适配