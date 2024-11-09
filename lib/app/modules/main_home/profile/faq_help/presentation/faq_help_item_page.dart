import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/faq_help/controllers/faq_help_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class FaqHelpItemPage extends StatelessWidget {
  const FaqHelpItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faqHelpController = Provider.of<FaqHelpController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(faqHelpController.selectedItem!.title ?? 'Ajuda e Informações'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: PaddedScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: faqHelpController.onSearch,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Qual é a sua dúvida?',
                prefixIcon: const Icon(Icons.search),
                // TODO: Implement the filter list
                // suffixIcon: IconButton(
                //   icon: const Icon(Icons.filter_list),
                //   onPressed: () {
                //     _buildFilterBottomSheet(context);
                //   },
                // ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 26.0),
            const Text(
              'Principais Dúvidas',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                children: [
                  if (faqHelpController.selectedItem!.answers.isNotEmpty)
                    for (var answerItem in faqHelpController.selectedItem!.answers)
                      Observer(
                        builder: (_) => Column(
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(answerItem.question),
                                initiallyExpanded: faqHelpController.isOpenList[0],
                                onExpansionChanged: (bool expanded) {
                                  faqHelpController.toggle(0);
                                },
                                tilePadding: EdgeInsets.zero,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(answerItem.answer),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      )
                  else
                    const SizedBox.shrink(),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                minimumSize: const Size(double.infinity, 40),
                textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mail_outline),
                  SizedBox(width: 8.0),
                  Text('CONVERSE COM A GENTE'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      IconData icon, String title, String subtitle, BuildContext context, bool greyMode, Function onTap) {
    return Column(
      children: [
        ListTile(
          minTileHeight: 0,
          minVerticalPadding: 12.0,
          leading: Icon(icon, color: greyMode ? Colors.black54 : Colors.black87),
          title: Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, color: greyMode ? Colors.black54 : Colors.black87)),
          subtitle: subtitle.isNotEmpty
              ? Text(
                  subtitle,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black54),
                )
              : null,
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: greyMode ? Colors.black54 : Colors.black87),
          onTap: () {
            onTap();
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(
            height: 0,
            thickness: 1,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}
