class Animal{

  int id;
  String nome;
  int dono;
  int hero;
  String raca;
  String especie;
  String cor;
  String caracteristicas;
  BigInt localizacaoX;
  BigInt localizacaoY;





  Animal({this.id, this.nome, this.dono, this.raca, this.especie, this.cor, this.caracteristicas});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'nome' : nome,
      'especie' : especie,
      'raca' : raca,
      'cor' : cor ,
      'caracteristicas' : caracteristicas,
      'localizacaoX' : localizacaoX,
      'localizacaoY' : localizacaoY,
      'dono' : dono,
      'hero' : hero,
    };
  }

  @override
  String toString() {
    return 'Animal(id : $id, nome : $nome, raca : $raca, especie : $especie, cor : $cor, dono : $dono, caracteristicas : $caracteristicas)';
  }

}