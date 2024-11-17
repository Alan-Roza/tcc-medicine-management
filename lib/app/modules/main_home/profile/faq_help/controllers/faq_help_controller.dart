import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/faq_help/model/faq_help_model.dart';

part 'faq_help_controller.g.dart';

class FaqHelpController = _FaqHelpController with _$FaqHelpController;

abstract class _FaqHelpController with Store {
  @observable
  int currentPage = 0;
  @observable
  FaqHelpItem? selectedItem;

  @observable
  ObservableList<FaqHelpItem> filteredItems = ObservableList<FaqHelpItem>();

  @observable
  ObservableList<FaqHelpItem> faqHelpItems = ObservableList<FaqHelpItem>.of(
    [
      FaqHelpItem(
        icon: Icons.help_outline,
        title: 'Rede do gaveteiro',
        subtitle: 'Como conectar o Gaveteiro à rede de internet',
        greyMode: false,
        answers: [
          FaqHelpAnswer(
            question: 'Onde acessar a opção de conexão do gaveteiro?',
            answer: """Para iniciar a configuração do gaveteiro, abra o aplicativo e vá até o menu:
Perfil > Conexão > Adicionar Módulo.
Essa é a seção onde você poderá adicionar novos dispositivos ao sistema.""",
          ),
          FaqHelpAnswer(
            question: 'Como digitar o nome e a senha da rede corretamente?',
            answer: """Após inserir os dados da sua rede, o aplicativo solicitará que você se conecte à rede "gaveteiro_ap":

Acesse as configurações Wi-Fi do seu dispositivo móvel.
Localize a rede chamada "gaveteiro_ap" e selecione-a.
Aguarde até que o dispositivo indique que a conexão foi realizada.
Caso a rede não apareça, veja as orientações na seção "Solução de Problemas".""",
          ),
          FaqHelpAnswer(
            question: 'Conectando à rede "gaveteiro_ap"',
            answer: """Ao inserir o nome e a senha da rede Wi-Fi:

Certifique-se de que está utilizando letras maiúsculas e minúsculas corretamente.
Verifique se não há espaços extras antes ou depois do nome ou senha.
Redes ocultas precisam ser configuradas manualmente.""",
          ),
          FaqHelpAnswer(
            question: 'Enviando os dados e finalizando a configuração',
            answer: """Depois de conectar à rede "gaveteiro_ap", volte ao aplicativo e pressione o botão Confirmar.
O dispositivo enviará as informações para o gaveteiro e, se tudo estiver correto, exibirá uma mensagem de sucesso.
Se ocorrer algum erro, consulte a seção "Solução de Problemas" para verificar possíveis causas.""",
          ),
        ],
        onTap: () {
          // TODO: Implement onTap logic for Item 2
        },
      ),
      FaqHelpItem(
        icon: Icons.help_outline,
        title: 'Solução de problemas',
        subtitle: 'Erros comuns e como resolvê-los',
        greyMode: false,
        answers: [
          FaqHelpAnswer(
            question: 'O que fazer se a rede "gaveteiro_ap" não aparecer?',
            answer: """Se a rede "gaveteiro_ap" não for exibida:

Verifique se o gaveteiro está ligado. 
Reinicie o gaveteiro e tente novamente.
Certifique-se de que está próximo ao dispositivo para garantir um bom sinal.""",
          ),
          FaqHelpAnswer(
            question: 'Erro ao conectar ao Wi-Fi',
            answer: """Se houver um erro ao conectar o gaveteiro à sua rede Wi-Fi:

Verifique se o nome e a senha da rede foram digitados corretamente.
Certifique-se de que sua rede é compatível com dispositivos de 2.4GHz (o gaveteiro pode não suportar redes de 5GHz).
Tente reiniciar o roteador e refazer a configuração.""",
          ),
          FaqHelpAnswer(
            question: 'O que fazer se o botão "Confirmar" não funcionar?',
            answer: """Caso o botão "Confirmar" não responda:

Certifique-se de que você retornou ao aplicativo após conectar à rede "gaveteiro_ap".
Feche o aplicativo e abra novamente para tentar outra vez.
Verifique se o aplicativo está atualizado na loja de aplicativos.""",
          ),
        ],
        onTap: () {
          // TODO: Implement onTap logic for Item 2
        },
      ),
      
    ],
  );

  @observable
  ObservableList<bool> isOpenList = ObservableList.of([false, false]);

  @action
  void toggle(int index) {
    isOpenList[index] = !isOpenList[index];
  }

  @action
  void onSearch(String value) {
    filteredItems.clear();

    if (value.isEmpty) {
      filteredItems.addAll(faqHelpItems);
      return;
    }

    filteredItems
        .addAll(faqHelpItems.where((element) => element.title.toLowerCase().contains(value.toLowerCase())).toList());
  }

  @action
  void onSelectItem(FaqHelpItem helpItem) {
    selectedItem = helpItem;
  }
}
