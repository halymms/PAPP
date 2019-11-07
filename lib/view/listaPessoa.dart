//import 'package:flutter/material.dart';
//
//import 'package:trabalho_app/view/register.dart';
//import 'package:trabalho_app/DAO/banco.dart';
//import 'package:trabalho_app/model/pessoa.dart';
//
//void main() => runApp(AppCRUD());
//
//class AppCRUD extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: ListagemPessoas(titulo: 'Listagem de pessoas'),
//    );
//  }
//}
//
//class ListagemPessoas extends StatefulWidget {
//  ListagemPessoas({Key key, this.titulo}) : super(key: key);
//  final String titulo;
//  @override
//  _ListagemPessoasState createState() => _ListagemPessoasState();
//}
//
//class _ListagemPessoasState extends State<ListagemPessoas> {
//
//  Banco _banco;
//  List<Pessoa> _listaDePessoas = new List();
//
//  @override
//  void initState() {
//    super.initState();
//    _abrirBanco();
//  }
//
//  void _abrirBanco() async {
//    _banco = await Banco.get();
//    _listaDePessoas = await _banco.listarPessoaTodos();
//    setState(() {});
//  }
//  void _incluidfuckingpessoa(Pessoa fodase) async{
//    _banco.incluirPessoa(fodase);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Lista"),
//      ),
//      body: ListView.builder(
//          itemCount: _listaDePessoas.length,
//          itemBuilder: (BuildContext ctx, int index){
//            Pessoa pessoa = _listaDePessoas.elementAt(index);
//            return ListTile(
//              title: Text(pessoa.nome),
//              subtitle: Text(pessoa.email),
//              onTap: (){
//                _editarPessoa(pessoaEditar: pessoa, index: index);
//              },
//              onLongPress: (){
//                showDialog(context: context,
//                    builder: (BuildContext context){
//                      return AlertDialog(
//                        title: Text('Exclusão'),
//                        content: Text('Confirmar exclusão?'),
//                        actions: <Widget>[
//                          FlatButton(
//                            child: Text('Cancelar'),
//                            onPressed: (){
//                              Navigator.of(context).pop();
//                            },
//                          ),
//                          FlatButton(
//                            child: Text('Confimar'),
//                            onPressed: (){
//                              _excluirPessoa(pessoa.id);
//                              Navigator.of(context).pop();
//                            },
//                          )
//
//                        ],
//                      );
//                    }
//                );
//              },
//            );
//          }
//      ),
//    );
//  }
//
//  void _excluirPessoa(int id) async{
//    _banco.excluir(id);
//    _listaDePessoas = await _banco.listar();
//    setState(() {});
//  }
//
//  void _editarPessoa({Pessoa pessoaEditar, int index}) async {
//
//    final pessoa = await showDialog<Pessoa>(
//      context: context,
//      barrierDismissible: false,
//      builder: (BuildContext context){
//        return RegisterPage(p: pessoaEditar,);
//      },
//    );
//
//    if (pessoa != null){
//      setState(() {
//        if (index == null){
//          _listaDePessoas.add(pessoa);
//          _banco.incluir(pessoa);
//        } else {
//          _listaDePessoas[index] = pessoa;
//          _banco.atualizar(pessoa);
//        }
//      });
//    }
//  }
//}
//
////import 'model/banco.dart';
////import 'model/pessoa.dart';
////
////void main() async {
////
////  var banco = Banco.get();
////
////  var exemplo = Pessoa(
////    nome: 'Flávio',
////    cpf: '666'
////  );
////
////  await banco.incluir(exemplo);
////
////  Pessoa pessoaPorId = await banco.getById(15);
////  print(pessoaPorId);
////
////  Pessoa pessoaPorCpf = await banco.getByCpf('3333');
////  print(pessoaPorCpf);
////
////  Pessoa pessoaPorNome = await banco.getByNome('Pedro');
////  print(pessoaPorNome);
////
//////  exemplo = Pessoa(
//////   id: 5,
//////   nome: 'Maria',
//////   cpf: '5657'
//////  );
//////
//////  await banco.atualizar(exemplo);
//////  await banco.excluir(4);
//////
////  List<Pessoa> listaDePessoas = await banco.listar();
////  print(listaDePessoas);
////}