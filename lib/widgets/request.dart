import 'dart:io';
import 'package:armarios_inteligentes/json/object_json.dart';
import 'package:armarios_inteligentes/widgets/tempoStamp.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class request {
  String _msg = "";

  Future timeStamp() async {
    final response =
        await http.get('http://armariosinteligentes.com/api/v3/timestamp');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      var jsonResponse = json.decode(response.body);
      tempoStamp tempo = new tempoStamp.fromJson(jsonResponse);
      String time = ('${tempo.timestamp}');
      return time;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Mypost(String endereco, String deviceId, String clientId, String clientSecret,
      var parametro1, var parametro2) async {
    var time = await timeStamp();
    String comando = "/dispositivo/" +
        deviceId +
        "/" +
        endereco +
        "?" +
        parametro1 +
        "=" +
        parametro2 +
        "&client_id=" +
        clientId +
        "&timestamp=" +
        time.toString();

    var key = utf8.encode(clientSecret);
    var bytes = utf8.encode(comando);
    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var assinatura = hmacSha256.convert(bytes).toString().toLowerCase();

    String url = "https://armariosinteligentes.com/api/v2" +
        comando +
        "&signature=" +
        assinatura;

    final response = await http.post(url);
    final responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      print(responseJson);
    } else {
      print(responseJson);
    }

    if (endereco == "abrirporta") {
      ObjetoJson portaUm = new ObjetoJson.fromJson(responseJson);
      _msg = ('${portaUm.mensagem}');
    }
    if (endereco == "abrirtodasasportas") {
      ObjetoJson portaUm = new ObjetoJson.fromJson(responseJson);
      _msg = ('${portaUm.mensagem}');
    }
    if (endereco == "padraodefabrica") {
      ObjetoJson portaUm = new ObjetoJson.fromJson(responseJson);
      _msg = ('${portaUm.mensagem}');
    }
    if (endereco == "reconfigurar") {
      ObjetoJson portaUm = new ObjetoJson.fromJson(responseJson);
      _msg = ('${portaUm.mensagem}');
    }
    if (endereco == "reiniciar") {
      ObjetoJson portaUm = new ObjetoJson.fromJson(responseJson);
      _msg = ('${portaUm.mensagem}');
    }
    if (endereco == "atualizar") {
      ObjetoJson portaUm = new ObjetoJson.fromJson(responseJson);
      _msg = ('${portaUm.mensagem}');
    }
  }

  Future recebMsg() async {
    var msg = await _msg;
    return msg;
  }

  Myget(String endereco, String deviceId, String clientId,
      String clientSecret) async {
    var time = await timeStamp();

    String comando = "/dispositivo/" +
        deviceId +
        "/" +
        endereco +
        "?client_id=" +
        clientId +
        "&timestamp=" +
        time.toString();

    var key = utf8.encode(clientSecret);
    var bytes = utf8.encode(comando);

    var hmacSha256 = new Hmac(sha256, key); // HMAC-SHA256
    var assinatura = hmacSha256.convert(bytes).toString();

    String url = "https://armariosinteligentes.com/api/v2" +
        comando +
        "&signature=" +
        assinatura;

    final response = await http.post(url);
    final responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      print(responseJson);
    } else {
      print(responseJson);
    }
  }

  nome() async {
    return Myget("nome", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  abrirportaUm() async {
    return Mypost(
        "abrirporta",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "numero",
        "1");
  }

  abrirportaDois() async {
    return Mypost(
        "abrirporta",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "numero",
        "2");
  }

  reiniciar() async {
    return Mypost(
        "reiniciar",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "",
        "");
  }

  padraoDeFabrica() async {
    return Mypost(
        "padraodefabrica",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "",
        "");
  }

  reconfigurar() async {
    return Mypost(
        "reconfigurar",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "",
        "");
  }

  atualizar() async {
    return Mypost(
        "atualizar",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "",
        "");
  }

  alterarIpsPermitidos() async {
    return Mypost(
        "alteraripspermitidos",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "endereco",
        "192.168.1.*");
  }

  situacaoPortaUm() async {
    return Mypost(
        "situacaoporta",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "numero",
        "1");
  }

  situacaoPortaDois() async {
    return Mypost(
        "situacaoporta",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "numero",
        "2");
  }

  alterarNumeracaoIncial() async {
    return Mypost(
        "alterarnumeracaoinicial",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "numeracaoinicial",
        "1");
  }

  abrirTodasAsPortas() async {
    return Mypost(
        "abrirtodasasportas",
        "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89",
        "7e2cc5ee9ee2021cb6752052fdfd8730",
        "",
        "");
  }

  ip() async {
    return Myget("ip", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  info() async {
    return Myget("info", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  id() async {
    return Myget("id", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  versao() async {
    return Myget("versao", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  mac() async {
    return Myget("mac", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  rssi() async {
    return Myget("rssi", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  numeroDePortas() async {
    return Myget("numerodeportas", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  numeracaoInicial() async {
    return Myget("numeracaoinicial", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  tipoDeDispositivo() async {
    return Myget("tipodispositivo", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  tamanhoDoCompartimentos() async {
    return Myget("tamanhoscompartimentos", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  compartimentos() async {
    return Myget("compartimentos", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  faces() async {
    return Myget("faces", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  modulos() async {
    return Myget("modulos", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  portas() async {
    return Myget("portas", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  portasAbertas() async {
    return Myget("portasabertas", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }

  wifi() async {
    return Myget("wifi", "9ECA47B41682B1317D053713582BA8AC",
        "396b8f007f73124631105c1c81c4bd89", "7e2cc5ee9ee2021cb6752052fdfd8730");
  }
}
