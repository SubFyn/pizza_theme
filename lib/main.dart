import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)), borderSide: BorderSide.none,);
    const textStyle1 = TextStyle(fontSize: 16, color: Color(0xFFC4C4C4),);
    const textStyle2 = TextStyle(fontSize: 16, color: Color(0X99000000),);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: SingleChildScrollView(child:
            Column(
              children: [
                Container( alignment: Alignment.topRight,
                  child: SizedBox(width: 232, height: 123,
                    child: Image.asset("assets/pizza.png",),
                  ),
                ),
                const SizedBox(height: 33,),
                const Text('Калькулятор пиццы', style: TextStyle(fontSize: 30, color: Color(0xff000000), fontWeight: FontWeight.bold),),
                const SizedBox(height: 9,),
                const Text('Выберите параметры:', style: TextStyle(fontSize: 16, color: Color(0xff000000), fontWeight: FontWeight.bold)),
                const SizedBox(height: 33,),
                SizedBox(height: 34, child:
                  ToggleSwitch(
                    minWidth: 150.0,
                    minHeight: 34,
                    cornerRadius: 36.0,
                    activeBgColors: const [[Colors.blue], [Colors.blue]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: const ['Обычное тесто', 'Тонкое тесто'],
                    fontSize: 16,
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                    ),
                const SizedBox(height: 19,),
                Container( alignment:Alignment.centerLeft, child: const Text('Размер:',
                  style: TextStyle(fontSize: 18),),),
                const SizedBox(height: 5,),
                SizedBox(height: 34, child: Placeholder()),
                 const SizedBox(height: 26,),
                Container( alignment:Alignment.centerLeft, child: const Text('Соус:',
                  style: TextStyle(fontSize: 18, color: Color(0xFF263238)),),),
                Container( padding: const EdgeInsets.only(left:15),alignment:Alignment.centerLeft,
                    child: const Text('Стоимость:', style: TextStyle(fontSize: 18, color:Color(0xFF000000),), )),
                const SizedBox(height: 10,),
                const SizedBox(height: 34, child:
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFECEFF1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    border: InputBorder.none,
                  ),
                ),
                ),
                const SizedBox(height: 33,),
                SizedBox(height: 42, width: 154, child:
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ), ), ),
                  onPressed: () {},
                  child: const Text('Заказать', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color(0XFFFFFFFF),),),
                )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}