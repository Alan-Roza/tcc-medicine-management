import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_medicine_management/app/modules/main_home/profile/faq_help/controllers/faq_help_controller.dart';
import 'package:tcc_medicine_management/app/shared/widgets/padded_screen.dart';

class FaqHelpPage extends StatelessWidget {
  final faqHelpController = FaqHelpController();

  FaqHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajuda e Informações'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: PaddedScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'COMO PODEMOS TE AJUDAR HOJE, --USUÁRIO--?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 40,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A8FF),
                    border: Border.all(
                      color: const Color(0xFF00A8FF), // Set border color
                      width: 2, // Set border width
                    ),
                    borderRadius: BorderRadius.circular(10), // Add a border radius
                  ),
                )
              ],
            ),
            const SizedBox(height: 26.0),
            TextField(
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
                padding: const EdgeInsets.only(top: 0), // Add this line to remove the top padding
                children: [
                  // Menu options
                  for (var faqHelpItem in faqHelpController.faqHelpItems)
                  _buildMenuItem(
                    faqHelpItem.icon as IconData,
                    faqHelpItem.title,
                    faqHelpItem.subtitle ?? '',
                    context,
                    faqHelpItem.greyMode,
                    () => faqHelpItem.onTap,
                  ),
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
            const SizedBox(height: 15.0),
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
