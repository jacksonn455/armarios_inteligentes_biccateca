import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Política de privacidade'),
        centerTitle: true,
      ),
      body: ListView(
            padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Text("Política de privacidade Armários Inteligentes",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.lightBlue),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    "A garantia da confidencialidade dos dados pessoais do usuário é importante para nós.  Todas as suas informações pessoais recolhidas, serão usadas para tornar a utilização de nossas plataformas a mais produtiva e agradável possível.  Dados relativos a membros, assinantes, clientes ou visitantes que usem os aplicativos ou nosso site, serão tratadas em concordância com as leis atualmente vigentes.  A informação pessoal recolhida pode incluir o seu nome, e-mail, número de telefone e/ou celular, endereço, data de nascimento e/ou outros.  O uso do aplicativo Armários Inteligentes pressupõe a aceitação deste Acordo de privacidade. A equipe do Armários Inteligentes reserva-se ao direito de alterar este acordo sem aviso prévio. Deste modo, recomendamos que consulte a nossa política de privacidade com regularidade de forma a estar sempre atualizado.", textAlign: TextAlign.justify,
                    style:
                    TextStyle(fontSize: 15.0,),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                   "Ligações a Sites de terceiros",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.lightBlue),
                  ),
                  SizedBox(height: 20.0,),
                  Text("O Armários Inteligentes possui ligações para outros sites, os quais, a nosso ver, podem conter informações / ferramentas úteis para os nossos usuários. A nossa política de privacidade não é aplicada a sites de terceiros, pelo que, caso visite outro site a partir do nosso deverá ler a politica de privacidade do mesmo.  Não nos responsabilizamos pela política de privacidade ou conteúdo presente nesses mesmos sites.", textAlign: TextAlign.justify,
                    style:
                    TextStyle(fontSize: 15.0),
                  ),
                ]),
          );

  }
}
