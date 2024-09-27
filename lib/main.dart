import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("你好Flutter"),
          centerTitle: true,
        ),
        // body: const Center(child: CustomContainer(),)
        // body: Container(alignment: Alignment.topCenter, child: CustomContainer(),)
        // body: Column(
        //   children: [
        //     SvgPicture.asset(
        //       'images/svg/search.svg',
        //       width: 40, // 设置宽度
        //       height: 40, // 设置高度
        //     ),
        //    Icon(Icons.home,color: Colors.red,size: 40,),
        //     Icon(Icons.wechat,color: Colors.green,size: 40,),
        //     CustomImage(),
        //     CustomContainer(),
        //     CustomButton()
        //   ],
        // ),
        body: CustomListView() ,
      )));
}

class CustomListView extends StatelessWidget {

  List<Widget> _getData() {
    return List<Widget>.generate(40, (index) {
      return ListTile(
        leading: Icon(Icons.wechat, color: Colors.green, size: 40),
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(
          "测试1",
          style: TextStyle(),
        ),
        trailing: Icon(Icons.chevron_right_sharp),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(children: _getData(),);
  }
}

class CustomImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(color: Colors.transparent),
      child: ClipOval(
          //圆形
          child: Image.network(
        "https://img2.baidu.com/it/u=1896177736,2569657757&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500",
        fit: BoxFit.cover,
        // width: 100,
        // height: 100,
      )),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 40,
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: const Text(
        "按钮",
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            //字体大小
            fontWeight: FontWeight.w800,
            //字体加粗
            fontStyle: FontStyle.italic,
            //倾斜
            decoration: TextDecoration.lineThrough,
            //上中下划线
            decorationColor: Colors.red,
            decorationThickness: 2,
            //线的粗细
            decorationStyle: TextDecorationStyle.dashed //虚线
            ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // transform: Matrix4.translationValues(40,0,0),//位移
      // transform: Matrix4.rotationZ(1),//旋转
      // transform: Matrix4.rotationZ(1),
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
        // gradient: const LinearGradient(
        //   colors: [Colors.red, Colors.blue],
        //   transform: GradientRotation(
        //       45 * 3.1415927 / 180), // 45度旋转，Flutter 中旋转角度使用的是弧度
        // ),

        //径向渐变，从中间向外
        // gradient: const RadialGradient(
        //     radius: 0.85,
        //     // 设置渐变的半径
        //     center: Alignment.center,
        //     // 渐变的中心点
        //     colors: [Colors.red, Colors.blue],
        //     transform: GradientRotation(45 * 3.1415927 / 180)),

        image: const DecorationImage(
          image: AssetImage('images/test1.jpg'), //Image.asset
          fit: BoxFit.cover,
          //给图片加过滤器
          // colorFilter: ColorFilter.mode(
          //   Colors.red,
          //   BlendMode.darken, // 混合模式
          // ),
        ),
        // // gradient: const LinearGradient(
        // //   colors: [Colors.red, Colors.blue],
        // //   begin: Alignment.topLeft,
        // //   end: Alignment.bottomRight,
        // // ),
      ),
    );
  }
}
