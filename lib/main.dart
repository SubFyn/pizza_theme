import 'package:flutter/material.dart';
import 'package:pizza/theme.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PizzaCalcScreen extends StatefulWidget {
  const PizzaCalcScreen({Key? key}) : super(key: key);
  @override
  _PizzaCalcScreenState createState() => _PizzaCalcScreenState();
}
enum Sauce {hot, sweetSour, cheese }
class _PizzaCalcScreenState extends State<PizzaCalcScreen> {
  bool _isSlim = true;
  double _pizzaSize = 20;
  int _cost = 300;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = true;

  int _calcCost() {
    if(_pizzaSize==20){
      _cost = 250;
    }
    else if(_pizzaSize==30){
      _cost = 350;
    }
    else{
      _cost = 400;
    }//стоимость от размера

    if(_isSlim == true) _cost+=80; //если тонкое
    if(_addCheese == true) _cost+=40; //доп сыр

    switch (_sauce){ //стоимость соусов
      case Sauce.hot:
        _cost+=20;
        break;
      case Sauce.sweetSour:
        _cost+=30;
        break;
      case Sauce.cheese:
        _cost+=40;
        break;
      case null:
        _cost+=0;
        break;
    }
    return _cost;
  }

  void _onSauceChanged (Sauce? value) {
    setState(() {
      _sauce = value;
    });
  }

  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            theme: newTheme(),
            home: Scaffold(
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
                      Text('Калькулятор пиццы', style: Theme.of(context).textTheme.headline2,),
                      const SizedBox(height: 9,),
                      Text('Выберите параметры:', style: Theme.of(context).textTheme.subtitle2,),
                      const SizedBox(height: 33,),
                      SizedBox(width:double.infinity, child:
                        Center(
                          child: SlidingSwitch(
                            width: 300,
                            height: 34,
                            textOff: "Обычное тесто",
                            textOn: 'Тонкое тесто',
                            colorOn: const Color(0xffFFFFFF),
                            colorOff: const Color(0xf0FFFFFF),
                            background: const Color(0xffECEFF1),
                            buttonColor: const Color(0xff0079D0),
                            inactiveColor: const Color.fromARGB(102, 0, 0, 0),
                            value: false,
                            onChanged: (bool value) {
                              _isSlim = value;
                              setState((){_calcCost();});
                          }, onTap: (){}, onSwipe: (){}, onDoubleTap: (){},
                          ),
                        ),
                      ),
                      const SizedBox(height: 19,),
                      Container( alignment:Alignment.centerLeft, child: const Text('Размер:'), padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),),
                      Container(decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(36)), color: Color(0xFFECEFF1),  ),
                        child:
                          SfSlider(
                              min: 20,
                              max: 40,
                              interval: 10,
                              showLabels: true,
                              enableTooltip: true,
                              showTicks: true,
                              showDividers: true,
                              stepSize: 10,
                              value: _pizzaSize,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _pizzaSize=value;
                                  _calcCost();
                                });
                              }),
                      ),

                      const SizedBox(height: 5,),
                      const SizedBox(height: 26,),
                      Container( alignment:Alignment.centerLeft, child: const Text('Соус:',),),
                      RadioListTile<Sauce>(
                          title:  Text('Острый'),
                          controlAffinity: ListTileControlAffinity.trailing,
                          toggleable: true,
                          value: Sauce.hot,
                          groupValue: _sauce,
                          onChanged: _onSauceChanged,
                          visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
                      ),
                      const Divider(height: 1, color: Colors.black12, thickness: 1,),
                      RadioListTile<Sauce>(
                        title:  Text('Кисло-сладкий'),
                        controlAffinity: ListTileControlAffinity.trailing,
                        toggleable: true,
                        value: Sauce.sweetSour,
                        groupValue: _sauce,
                        onChanged: _onSauceChanged,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
                      ),
                      const Divider(height: 1, color: Colors.black12, thickness: 1,),
                      RadioListTile<Sauce>(
                        title: const Text('Сырный'),
                        controlAffinity: ListTileControlAffinity.trailing,
                        toggleable: true,
                        value: Sauce.cheese,
                        groupValue: _sauce,
                        onChanged: _onSauceChanged,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
                      ),
                      const Divider(height: 1, color: Colors.black12, thickness: 1,),
                      const SizedBox(height: 18,),
                      SizedBox(
                        width: 291,
                        height: 56,
                        child: Card(
                          elevation: 0,
                          color: const Color(0xFFF0F0F0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 36,
                                height: 34,
                                child: Image.asset('assets/cheese.png'),
                              ),
                              const SizedBox(width: 6,),
                              const Text('Дополнительный сыр',),
                              Switch(value: _addCheese, onChanged: (bool value){
                                setState((){
                                  _addCheese = value;
                                  _calcCost();
                                });
                              } ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                          padding: const EdgeInsets.only(left:15, top:10, bottom: 10,),
                          alignment:Alignment.centerLeft,
                          child: const Text('Стоимость:')),
                      SizedBox(
                        width: 300,
                        child: Card(
                            elevation: 0,
                            color: const Color(0xFFECEFF1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36),
                            ),
                            child: Text("${_calcCost()} руб.",
                              textAlign: TextAlign.center,
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
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
        );
  }
}

void main() {
  runApp(const PizzaCalcScreen());
}