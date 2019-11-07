class Pessoa{

  int id;
  String nome;
  String email;
  String telefone;
  String senha;


  Pessoa({this.id, this.nome, this.email, this.telefone, this.senha});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'nome' : nome,
      'email' : email,
      'telefone' : telefone,
      'senha' : senha,
    };
  }

  @override
  String toString() {
    return 'Pessoa(id: $id, nome: $nome, email: $email, telefone: $telefone, senha: $senha)';
  }

}