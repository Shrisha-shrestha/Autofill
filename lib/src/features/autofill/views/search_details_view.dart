import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:remixicon/remixicon.dart';
import 'package:intl/intl.dart';

import '../models/blogdetail_model.dart';
import '../services/search_services_implementaion.dart';

class SearchDetailsView extends StatefulWidget {
  const SearchDetailsView({super.key, required this.slug});
  final String slug;
  @override
  State<SearchDetailsView> createState() => _SearchDetailsViewState();
}

class _SearchDetailsViewState extends State<SearchDetailsView> {
  final SearchServicesImplementation searchServices =
      SearchServicesImplementation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Blogs',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            leading: IconButton(
              icon: const Icon(Remix.arrow_left_s_line),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0.0),
        body: FutureBuilder(
            future: searchServices.getPost(widget.slug),
            builder:
                ((BuildContext ctx, AsyncSnapshot<APIResponseModel?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 16.0),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data!.category,
                                    style: TextStyle(
                                      fontFamily: 'Noto Sans Regular',
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      Remix.checkbox_blank_circle_fill,
                                      color: Colors.grey[600],
                                      size: 2.0,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('MMM d, yyyy')
                                        .format(snapshot.data!.createdAt),
                                    style: TextStyle(
                                      fontFamily: 'Noto Sans Regular',
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  snapshot.data!.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Noto Sans SemiBold',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {},
                                      icon: Remix.facebook_circle_fill),
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {},
                                      icon: Remix.twitter_fill),
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {},
                                      icon: Remix.whatsapp_fill),
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {},
                                      icon: Remix.mail_fill),
                                  MyIconButton(
                                      position: 'top',
                                      onPressed: () {},
                                      icon: Remix.share_line),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      Remix.checkbox_blank_circle_fill,
                                      color: Colors.grey[600],
                                      size: 2.0,
                                    ),
                                  ),
                                  Text(
                                    'Total Views: ${snapshot.data!.count}',
                                    style: TextStyle(
                                      fontFamily: 'Noto Sans Regular',
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Image.network(
                                  snapshot.data!.headerImg,
                                  height: 214.0,
                                  width: 428.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                "\"${snapshot.data!.excerpt}\"",
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontFamily: 'Noto Sans SemiBold',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Divider(
                                  color: Colors.grey[200],
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0),
                            child: Html(
                              style: {
                                "p": Style(
                                  textAlign: TextAlign.justify,
                                  fontFamily: 'Noto Sans Regular',
                                  fontWeight: FontWeight.w400,
                                  fontSize: FontSize(16.0),
                                ),
                                "strong": Style(
                                  textAlign: TextAlign.justify,
                                  fontFamily: 'Noto Sans SemiBold',
                                ),
                                'a': Style(
                                  color: Colors.blue[900],
                                  textDecoration: TextDecoration.none,
                                ),
                              },
                              data: snapshot.data!.body,
                              onLinkTap: null
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: (Colors.grey[200])!,
                              ),
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tags',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'Noto Sans SemiBold',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  height: 20.0,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: snapshot.data!.tags.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 4.0),
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                        0, 92, 204, 1)
                                                    .withOpacity(0.7),
                                                borderRadius:
                                                    BorderRadius.circular(4.0)),
                                            child: Text(
                                              snapshot.data!.tags[index],
                                              style: const TextStyle(
                                                  fontFamily:
                                                      'Noto Sans Regular',
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                              color: (Colors.grey[200])!,
                            ))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Share article',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'Noto Sans SemiBold',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {},
                                            icon: Remix.facebook_circle_fill),
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {},
                                            icon: Remix.twitter_fill),
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {},
                                            icon: Remix.whatsapp_fill),
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {},
                                            icon: Remix.mail_fill),
                                        MyIconButton(
                                            position: 'bottom',
                                            onPressed: () {},
                                            icon: Remix.share_line),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 6.0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                0, 92, 204, 1),
                                            borderRadius:
                                                BorderRadius.circular(4.0)),
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Remix.thumb_up_fill,
                                              size: 16.0,
                                              color: Colors.white,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 9.0),
                                              child: Text(
                                                'Like',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Noto Sans Regular',
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Text(
                                              '8',
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Noto Sans Regular',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Latest News',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: 'Noto Sans SemiBold',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  SizedBox(
                                    width: double.maxFinite,
                                    height: 335.0,
                                    child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0),
                                              child: Divider(
                                                color: Colors.grey[100],
                                              ),
                                            ),
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              Container(
                                                height: 80.0,
                                                width: 160.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    image:
                                                        const DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                              'http://192.168.99.20/media/header_img/9df13263-a450-4de7-8a7f-3db1756159d0.jpg',
                                                            ))),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'CAREER BLOGS',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Noto Sans Regular',
                                                            color: Colors
                                                                .grey[600],
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Icon(
                                                            Remix
                                                                .checkbox_blank_circle_fill,
                                                            color: Colors
                                                                .grey[600],
                                                            size: 2.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Jan 30, 2023',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Noto Sans Regular',
                                                            color: Colors
                                                                .grey[600],
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Text(
                                                      'Capacity Building Trainings to help you take your career to',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Noto Sans SemiBold',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('error');
                }
              }
              return Text('abcd');
            })));
  }
}

class MyIconButton extends StatefulWidget {
  const MyIconButton(
      {super.key, required this.icon, required this.position, this.onPressed});
  final IconData icon;
  final String position;
  final void Function()? onPressed;
  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: widget.position == 'top' ? 15.0 : 20.0,
        width: widget.position == 'top' ? 15.0 : 20.0,
        child: IconButton(
            onPressed: widget.onPressed,
            padding: const EdgeInsets.all(0.0),
            icon: Icon(
              widget.icon,
              color: Colors.grey[600],
              size: widget.position == 'top' ? 15.0 : 20.0,
            )),
      ),
    );
  }
}
