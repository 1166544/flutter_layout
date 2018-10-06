import 'package:flutter/material.dart';
import './colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  // 添加文本输入控制器
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            
            // TODO: Add TextField widgets (101)
            // 添加登录内容
            // InputDecoration 意味着文本字段的背景被轻轻填充以帮助人们识别文本字段的点击或触摸目标区域
            // [Name]
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),

            // 空间隔距
            SizedBox(height: 12.0),
            
            // 密码框 obscureText: true值会自动替换用户使用项目符号键入的输入
            // [Password]
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),

            // TODO: Add button bar (101)
            // 添加登录按钮,使用ButtonBar达到横向排列效果
            ButtonBar(
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                // TODO: Add buttons (101)
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    // TODO: Clear the text fields (101)
                    // 添加命令以清除FlatButton onPressed:函数中的每个控制器
                    this._passwordController.clear();
                    this._usernameController.clear();
                  },
                ),

                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                RaisedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    // TODO: Show the next page (101) 
                    // 登录进入子页
                    if (this._passwordController.text != null && this._usernameController.text != null) {
                      Navigator.pop(context);
                    } else {
                      print('Please enter login info.');
                    }
                },)
              ]
            )


          ],
        ),
      ),
    );
  }
}

// TODO: Add AccentColorOverride (103)
/// 特殊的类重写的强调颜色的窗口小部件 PrimaryVariant
class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(accentColor: color),
    );
  }
}
