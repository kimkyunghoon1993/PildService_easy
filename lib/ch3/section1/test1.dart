int no = 10;
int _no = 20;
void sayHello(){
  print('hello,$no');
}
void _sayHello(){
  print('hello,$no');
}

class User {
  int no = 10;

  String? name;
  String _address = 'seoul';

  void sayHello(){
    print('word, $no');
  }
}

class _User {
  int no = 10;

  void sayHello(){
    print('word, $no');
  }
}

main(){
  no = 10;
  _no = 20;

  sayHello();
  _sayHello();

  User user = User();
  _User user1 = _User();

  user.name = 'kkand';
  user._address = 'busan';


}

