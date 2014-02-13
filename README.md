Auto Layout 文档
================

Autosizing mask存在的问题
-------------------------
适当地设置Autosizing mask，可以使得当superview的size变化时，view也可以从一定程度上适应。之所以说是一定程度，是因为Autosizing mask只是一个定性的适应，view只知道需要resize了，但它并不知道要resize到什么程度，无法定量。
[Autolayout教程1] 的开篇有一个很好的例子来说明Autosizing mask的局限性。


什么是Auto Layout?
------------------
Auto Layout是由一系列的constraint构成的。constraint就是描述view在界面上的现实规则。
```
view1.attribute = view2.attribute * m + b
```
attribute可以是以下其中之一：left, right, top, bottom, leading, trailing, width, height, centerX, centerY, and baseline.
可以看iOS developer library文档：[iOS Developer Library]


Auto Layout的强大之处
---------------------
- 可以很好的适应屏幕大小的变化。不需要为横屏、竖屏或者iphone和ipad做单独设置。
- constraint的设置除了支持常量之外，还支持不等式，这就更灵活了。可以设置优先级，当不同的constraint之间存在冲突时，可以通过优先级来选择。
- intrinsic content size。比如UILabel可以根据text自动适应宽高。可以告别过去先根据text计算label的宽高，再设置frame的时代了。
- Auto layout在动画中也有用武之地。动画中视图变化较为频繁，view size改变时，其他view也很好的适应。比如类似于facebook paper的效果。

Auto Layout的使用
-----------------
#### 使用xib:
* [Autolayout教程1]
* [Autolayout教程2]

#### 使用代码：

在代码中设置constraint有三步：
 
 * [view setTranslatesAutoresizingMaskIntoConstraints:NO];  创建view时，会自动的带上AutoresizingMask。如果没有设置的话，在AutoLayout中，会将mask翻译成constraints。遗憾的是，这往往不是你要的，这些constraint很可能会破坏你设置的constraints.

 * set constraint: 
```
NSLayoutConstraint *myConstraint =[NSLayoutConstraint
                                     constraintWithItem:_button
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:superView
                                     attribute:NSLayoutAttributeCenterY
                                     multiplier:1.0
                                     constant:0];  
```
上面这个描述的就是：_button.CenterY = superView.CenterY 

 * add constraint:   [superView addConstraint:myConstraint];  需要将constraint加上。

可以看这个例子：[用代码实现AutoLayout]

看起来还是有点烦琐的。但是有一些第三方库做了封装，可以更方便的用代码来创建constraint。
比如FLKAutolayout，KeepLayout, UIView-AutoLayout等。

推荐[FLKAutolayout]。比如：
```
  [_label constrainLeadingSpaceToView:_button predicate:@“>=10”];
```
就可以设置_label和_button的左右间距>=10。

#### xib和programming的选择：
看个人习惯，我觉得用xib更方便一些。AutoLayout的核心在于设置constraint，而用xib相比于用代码可以得到更多的好处：

 - 可以清楚地看到constraint在视图上的变化
 - autolayout必须有充分的constraint去计算，当constraint不够计算，或者constraint过多导致无法计算时，xcode会有提示，并给出修改建议。
 - Resolve Auto Layout Issues.当有冲突的时候，可以看到显示线的颜色。并只需要update Frames或者update constraint就能解决大部分的问题。

用代码也有一些好处：

 - 实现起来比较简单，上手快。xib操作起来还是要先熟悉一会的，大部分程序员还是更习惯用代码吧。
 - 当constraint很复杂时，使用代码调试起来更方便。


Auto Layout在实际项目中的使用
----------------------------
可以参照这个[电影怪兽使用Autolayout的PR]
把电影怪兽的评论列表改成Auto Layout，在这里得到的明显好处是：确定好label之间的相对关系（constraint），使用intrinsic content size，就不需要再去计算label的宽度和高度再设置frame了。

一些demo
--------
本项目里有一个使用xib来做autolayout布局的例子，和一个使用代码的简单例子。
还可以参考[Autolayout布局TableViewCell]


[iOS Developer Library]:https://developer.apple.com/library/ios/documentation/userexperience/conceptual/AutolayoutPG/AutoLayoutConcepts/AutoLayoutConcepts.html#//apple_ref/doc/uid/TP40010853-CH14-SW1
[Autolayout教程1]:http://www.raywenderlich.com/50317/beginning-auto-layout-tutorial-in-ios-7-part-1
[Autolayout教程2]:http://www.raywenderlich.com/50317/beginning-auto-layout-tutorial-in-ios-7-part-2
[用代码实现AutoLayout]:http://www.techotopia.com/index.php/Implementing_iOS_6_Auto_Layout_Constraints_in_Code
[电影怪兽使用Autolayout的PR]:http://code.dapps.douban.com/Jaeger-iPhone/pull/191/
[Autolayout布局TableViewCell]:https://github.com/caoimghgin/TableViewCellWithAutoLayout
[FLKAutolayout]:https://github.com/dkduck/FLKAutoLayout
