import 'dart:async';
import 'dart:developer';

import 'package:autofill/src/features/autofill/services/search_services_implementaion.dart';
import 'package:autofill/src/features/autofill/views/search_details_view.dart';
import 'package:autofill/src/features/autofill/views/search_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomAutoFillView extends StatefulWidget {
  const CustomAutoFillView({super.key});

  @override
  State<CustomAutoFillView> createState() => _CustomAutoFillViewState();
}

class _CustomAutoFillViewState extends State<CustomAutoFillView> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  bool isFocused = false;
  late final Future? myFuture;
  final SearchServicesImplementation searchServices =
      SearchServicesImplementation();
  Timer? _timer;
  final int _typingDelay = 1000;
  FocusNode _FocusNode = FocusNode();
  void _startTimer() {
    _timer = Timer(Duration(milliseconds: _typingDelay), () {
      setState(() {
        isFocused = true;
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ChangeNotifierProvider<SearchViewModel>(
          create: (context) => SearchViewModel(),
          builder: (context, child) => Container(
              padding: const EdgeInsets.all(15.0),
              child:Column(children: [SearchAutocompleteTextField(
              // onTapOutside: (event) {
              //   FocusManager.instance.primaryFocus?.unfocus();
              //   setState(() {
              //     isFocused = false;
              //   });
              // },
              onSubmit: () {
                context.read<SearchViewModel>().addToHistory(
                    searchKeyWord: _searchTextEditingController.text);
          
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (BuildContext context) =>
                //           const SearchResultsView(),
                //     ));
              },
              hint: 'Search Category',
              fieldTextEditingController: _searchTextEditingController,
              onTap: () async {
                setState(() {
                  isFocused = true;
                });
                context.read<SearchViewModel>().initial();
                     
              },
              onChanged: (value) {
                if (_searchTextEditingController.text.isNotEmpty) {
                  _resetTimer();
                }
              },
            ),
            Opacity(
              opacity: isFocused ? 1.0 : 0.0,
              child: _searchTextEditingController.text.isEmpty
                  ? SizedBox(
                      height: 500.0,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: context
                            .watch<SearchViewModel>()
                            .getSearchHistory
                            .length,
                        itemBuilder: (context, index) {
                          final element = context
                              .read<SearchViewModel>()
                              .getSearchHistory[index];
                          return InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            onTap: () {
                              _searchTextEditingController.text = element;
                              setState(() {
                                isFocused = true;
                              });
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Icon(
                                            Icons.access_time_outlined,
                                            color: Colors.grey),
                                      ),
                                      Text(element),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<SearchViewModel>()
                                            .removeFrmHistory(
                                                searchKeyWord: element);
                                        setState(() {
                                          isFocused = true;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 15.0,
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 300.0,
                          width: 20.0,
                          child: FutureBuilder(
                              future: searchServices.getBlogOverviewList(
                                  categorySlug: _searchTextEditingController
                                          .text.isEmpty
                                      ? 'l'
                                      : _searchTextEditingController.text),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        '${snapshot.error} occurred',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    );
                                  } else if (snapshot.hasData) {
                                    return snapshot.data!.fold(
                                      (l) {
                                        return SizedBox(
                                          width: double.maxFinite,
                                          child: ListView.separated(
                                              separatorBuilder:
                                                  (context, index) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical:
                                                                    8.0),
                                                        child: Divider(
                                                          color: Colors
                                                              .grey[300],
                                                        ),
                                                      ),
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: 3,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SearchDetailsView(
                                                                slug:
                                                                    l[index].slug,
                                                              ))),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 50.0,
                                                        width: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                image: DecorationImage(
                                                                    fit: BoxFit.contain,
                                                                    image: NetworkImage(
                                                                      'http://192.168.99.20/${l[index].headerImg}',
                                                                    ))),
                                                      ),
                                                      const SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  l[index]
                                                                      .category
                                                                      .name,
                                                                ),
                                                                const Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                                  child: Text(
                                                                      '.'),
                                                                ),
                                                                Text(
                                                                  DateFormat(
                                                                          'MMM d, yyyy')
                                                                      .format(
                                                                          l[index].createdAt),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              l[index]
                                                                  .excerpt,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }),
                                        );
                                      },
                                      (r) {
                                        return Text(
                                          r.detail,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        );
                                      },
                                    );
                                  }
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: SizedBox(
                                        width: 30.0,
                                        child: CircularProgressIndicator()),
                                  );
                                }
                                return const Text('lol');
                              })),
                    ),
            )],),)
        ),
      ),
    );
  }
}

class SearchAutocompleteTextField extends StatelessWidget {
  const SearchAutocompleteTextField({
    super.key,
    required this.fieldTextEditingController,
    required this.hint,
    required this.onSubmit,
    this.inputValidator,
    this.onTapOutside,
    this.onChanged,
    this.onTap,
    this.onSuffixTap,
  });
  final TextEditingController fieldTextEditingController;
  final String hint;
  final String? Function(String? value)? inputValidator;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function() onSubmit;
  final void Function(String? value)? onChanged;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (_) {
        onSubmit();
      },
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      controller: fieldTextEditingController,
      onTapOutside: onTapOutside,
      onTap: onTap,
      validator: (value) => inputValidator!(value),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        prefix: const SizedBox(width: 10.0),
        suffixIcon: IconButton(
          icon:
              const Icon(Icons.search_outlined, size: 20, color: Colors.black),
          onPressed: () {
            onSubmit();
          },
        ),
        hintText: hint,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

class CustomLocationWidget extends StatelessWidget {
  const CustomLocationWidget(
      {super.key,
      required this.loctionType,
      required this.locationValue,
      required this.bRG,
      required this.height});
  final String locationValue;
  final String loctionType;
  final BorderRadiusGeometry bRG;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: bRG,
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                    color: Color.fromRGBO(202, 203, 206, 0.4), width: 1),
              )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 38),
              Expanded(
                child: SizedBox(
                  child: Text(
                    loctionType,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF636469),
                      fontSize: 16,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  locationValue,
                  style: const TextStyle(
                    color: Color(0xFF4A4B4F),
                    fontSize: 16,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.keyboard_arrow_right_outlined)
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 18.0),
        child: Stack(alignment: Alignment.topCenter, children: [
          AnimatedContainer(
            width: 2.0,
            height: height,
            decoration: const BoxDecoration(
              color: Color(0xFFF19541),
            ),
            duration: const Duration(seconds: 1),
            curve: Curves.easeOutCirc,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: const ShapeDecoration(
              color: Color(0xFFF19541),
              shape: OvalBorder(),
            ),
          ),
        ]),
      ),
    ]);
  }
}
