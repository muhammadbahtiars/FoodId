import 'package:flutter/material.dart';
import 'package:kulina/helper/api_controller.dart';
import 'package:kulina/widget/header_widget.dart';
import 'package:kulina/widget/input_widget.dart';
import 'package:kulina/widget/loading_widget.dart';
import 'package:kulina/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  static String tag = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool visible = false;
  TextEditingController searchInput = TextEditingController();
  static const double _appBarBottomBtnPosition = 0.0;
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  String location = 'Jakarta Selatan';

  String banner = '';
  List<String> category = [];

  void _startUp() async {
    setState(() {
      visible = true;
    });
    var assetPhoto = await ApiController.getAssets();
    banner = assetPhoto['data'][3]['media'];
    category.add(assetPhoto['data'][0]['media']);
    category.add(assetPhoto['data'][1]['media']);
    setState(() {
      visible = false;
    });
  }

  @override
  void initState() {
    _startUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: visible ? _buildProgressIndicator() : container(),
      ),
    );
  }

  Widget container() {
    return Column(
      children: [
        // header
        HeaderWidget(
          path: 'assets/logo.png',
          onPressed: () {},
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          color: const Color(0xFF2ecc71),
          child: Row(
            children: [
              const SizedBox(
                child: Icon(
                  Icons.place,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              TextWidgetReguler(
                textColor: Colors.white,
                text: 'Dikrim ke',
                fontSize: 12,
                textWidth: 60,
                textAlign: TextAlign.left,
                fontsWight: FontWeight.w300,
                paddingHorizontal: 5,
              ),
              Text(
                location,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                child: PopupMenuButton(
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 14,
                  ),
                  onSelected: (String choice) {
                    if (choice == 'Jakarta Selatan') {
                      setState(() {
                        location = 'Jakarta Selatan';
                      });
                    } else {
                      setState(() {
                        location = 'Yogyakarta';
                      });
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Jakarta Selatan',
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.trending_flat,
                            color: Colors.black,
                            size: 18,
                          ),
                          Text(
                            ' Jakarta Selatan',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'Yogyakarta',
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.trending_flat,
                            color: Colors.black,
                            size: 18,
                          ),
                          Text(
                            ' Yogyakarta',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SearchFormInput(
          onPressed: () {},
          searchInput: searchInput,
        ),
        // slider
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          width: MediaQuery.of(context).size.width * 1,
          child: ClipRRect(
            borderRadius: BorderRadius.all(const Radius.circular(10.0)),
            child: Image.network(
              banner,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        // category
        TextWidgetReguler(
          textColor: Colors.black,
          text: 'Special di FOOD.ID',
          fontSize: 16,
          textWidth: MediaQuery.of(context).size.width * 1,
          textAlign: TextAlign.left,
          fontsWight: FontWeight.w400,
          paddingHorizontal: 10,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 5,
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                  child: Image.network(
                    category[0],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 10,
                  left: 5,
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                  child: Image.network(
                    category[1],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
        // catalog
        const SizedBox(height: 10),
        TextWidgetReguler(
          textColor: Colors.black,
          text: 'Cari inspirasi belanja',
          fontSize: 16,
          textWidth: MediaQuery.of(context).size.width * 1,
          textAlign: TextAlign.left,
          fontsWight: FontWeight.w400,
          paddingHorizontal: 10,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 5,
                ),
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.width * 0.6,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
                        child: Image.network(
                          "https://img.freepik.com/free-vector/bio-healthy-food-square-flyer-design_23-2148702727.jpg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
                        child: Image.network(
                          "https://img.freepik.com/free-vector/bio-healthy-food-square-flyer-design_23-2148702727.jpg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 10,
                  left: 5,
                ),
                width: MediaQuery.of(context).size.width * 0.67,
                height: MediaQuery.of(context).size.width * 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                  child: Image.network(
                    "https://img.freepik.com/free-vector/bio-healthy-food-square-flyer-design_23-2148702727.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return LoadingWidget();
  }
}
