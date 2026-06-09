import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/TermsViewModel.dart';


class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() =>
      _TermsPageState();
}

class _TermsPageState
    extends State<TermsPage> {

  final TextEditingController
  searchController =
  TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {

      Provider.of<TermsViewModel>(
        context,
        listen: false,
      ).loadTerms();

    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<TermsViewModel>(
      builder: (context, vm, child) {

        if (vm.isLoading) {
          return const Center(
            child:
            CircularProgressIndicator(),
          );
        }

        return Column(

          children: [

            Padding(
              padding:
              const EdgeInsets.all(10),

              child: TextField(

                controller:
                searchController,

                onChanged: vm.search,

                decoration:
                const InputDecoration(
                  hintText:
                  "Search Term",
                  border:
                  OutlineInputBorder(),
                  prefixIcon:
                  Icon(Icons.search),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(

                itemCount:
                vm.filteredTerms.length,

                itemBuilder:
                    (context, index) {

                  final term =
                  vm.filteredTerms[index];

                  return Card(

                    margin:
                    const EdgeInsets.all(
                        8),

                    child:
                    ExpansionTile(

                      title:
                      Text(term.word),

                      children: [

                        Padding(

                          padding:
                          const EdgeInsets
                              .all(12),

                          child: Text(
                            term.definition,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}