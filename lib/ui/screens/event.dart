import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testerapps/constants/apps_router.dart';
import 'package:testerapps/ui/routes/botton_navigator_route.dart';
import 'package:testerapps/ui/themes/color_thame.dart';
import 'package:testerapps/ui/widgets/cliper_header.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  
  
  static String EventTitle = "Kegiatan";

  // new Event
  static String NewEvent = "Bulan Bahasa";
  static String DateNewEvent = "20 - 08 - 2023";
  static String DescritinNewEvent = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";




  @override
  Widget build(BuildContext context) {
    return CostumeBottomNavigationBar(
      currentIndex: 3,
      appBar: AppBar(
         automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorTheme.primaryColor,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20,),
                Text(
                  EventTitle,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: ColorTheme.disabaccentColor,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorTheme.secondaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.notifications, color: ColorTheme.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, '/home');
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: CliperHeader(),
                    child: Container(height: 100, color: ColorTheme.primaryColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: TextField(
                      onChanged: (value) {
                        // Implement search functionality here
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Cari kegiatan',
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: const Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kegiatan Mendatang",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ColorTheme.textColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 6,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorTheme.textColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/kegiatan.png"),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NewEvent,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ColorTheme.textColor,
                                  ),
                                ),
                                Text(
                                  DateNewEvent,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  DescritinNewEvent,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorTheme.disablePrimary,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Implement navigation to detail page
                                    Navigator.pushNamed(context, AppsRouter.detailEvent);
                                  },
                                  
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(top: 5),
                                    width: MediaQuery.of(context).size.width / 2,
                                    height: 30,
                                    padding: const EdgeInsets.symmetric(horizontal: 10,),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: ColorTheme.primaryColor, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "Selengkapnya",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorTheme.textColor,
                                      ),
                                        textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Kegiatan Lalu",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ColorTheme.textColor,
                      ),),
        
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 2.3,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorTheme.textColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Image.asset("assets/images/event-img.png"),
                            const SizedBox(height: 10),
                            Text(
                              "Hari Pancasila",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: ColorTheme.textColor,
                              ),
                            ),
                            Text(
                              "20 - 08 - 2023",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorTheme.disablePrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Implement navigation to detail page
                                Navigator.pushNamed(context, '/kegiatan_detail');
                              },
                              
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width / 2,
                                height: 30,
                                padding: const EdgeInsets.symmetric(horizontal: 10,),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorTheme.primaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Selengkapnya",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorTheme.textColor,
                                  ),
                                    textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 2.3,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorTheme.textColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Image.asset("assets/images/event-img.png"),
                            const SizedBox(height: 10),
                            Text(
                              "Hari Pancasila",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: ColorTheme.textColor,
                              ),
                            ),
                            Text(
                              "20 - 08 - 2023",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorTheme.disablePrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Implement navigation to detail page
                                Navigator.pushNamed(context, '/detail_kegiatan');
                              },
                              
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width / 2,
                                height: 30,
                                padding: const EdgeInsets.symmetric(horizontal: 10,),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorTheme.primaryColor, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Selengkapnya",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorTheme.textColor,
                                  ),
                                    textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
