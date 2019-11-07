import 'package:flutter/material.dart';
import 'package:trabalho_app/colors/colors.dart';
import 'package:trabalho_app/DAO/banco.dart';
import 'package:trabalho_app/model/pessoa.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();

  final Pessoa p;
  RegisterPage({this.p});
}

class _RegisterPageState extends State<RegisterPage> {

  final _banco = Banco.get();
  List<Pessoa> _listaDePessoas = new List();

  @override
  void initState() {
    super.initState();
    //_abrirBanco();
  }

  /*void _abrirBanco() async {
    _banco = await Banco.get();
    _listaDePessoas = await _banco.listar();
  }*/
  void _incluidfuckingpessoa(Pessoa fodase) async{
    _banco.incluirPessoa(fodase);
  }
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pwordController = TextEditingController();
  final _repwordController = TextEditingController();

  Pessoa _pessoa = Pessoa();



  @override
  void dispose() {
    super.dispose();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _pwordController.clear();
  }

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: corMarrom,
          title: Title(color: corBege, child: Text('PET APP')),
        ),
        body: ListView(

                padding: EdgeInsets.symmetric(horizontal: 25),
                children: <Widget>[
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Bem-vindo ao PetApp!',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome completo',
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                ),
              ),
              TextField(
                controller: _pwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                obscureText: true,
              ),
              TextField(
                controller: _repwordController,
                decoration: InputDecoration(
                  labelText: 'Repita sua senha',
                ),
                obscureText: true,
              ),
              ButtonBar(children: <Widget>[
                FlatButton(
                  child: Text('CANCELAR'),
                  onPressed: () {
                    _nameController.clear();
                    _emailController.clear();
                    _phoneController.clear();
                    _pwordController.clear();
                    _repwordController.clear();
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(

                  child: Text(
                    'CADASTRAR',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  elevation: 8.0,
                  shape: OutlineInputBorder(),
                  onPressed: () {
                    _pessoa.nome = _nameController.value.text;
                    _pessoa.email = _nameController.text;
                    _pessoa.telefone = _phoneController.text;
                    _pessoa.senha = _pwordController.text;
                    _incluidfuckingpessoa(_pessoa);
                    Navigator.of(context).pop(_pessoa);
                  },
                ),
              ]),
            ]));
  }

  void _editarPessoa({Pessoa pessoaEditar, int index}) async {

    final pessoa = await showDialog<Pessoa>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return RegisterPage(p: pessoaEditar);
      },
    );

    if (pessoa != null){
      setState(() {
        if (index == null){
          _listaDePessoas.add(pessoa);
          _banco.incluirPessoa(pessoa);
        } else {
          _listaDePessoas[index] = pessoa;
          _banco.atualizarPessoa(pessoa);
        }
      });
    }
  }

}




