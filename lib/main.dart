import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'App Intro',
  home: new HomePage(),
));

Color bgColor = Color(0xFFF3F3F3);
Color textColor = Color(0xFF83838A);

List<String> imagePath = [
  "assets/images/intro1.png",
  "assets/images/intro2.png",
  "assets/images/intro3.png",
];
List<String> title = ["Wellcome", "Browse", "Ready , set .."];
List<String> description = [
  "Discover new sales & fitness updates everyday with ",
  "We connect you to your favourite online retailers and show you all the best deals in one place.",
  "Find the perfect fit for you."
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            CarouselSlider(
              autoPlay: false,
              enableInfiniteScroll: false,
              initialPage: 0,
              reverse: false,
              viewportFraction: 1.0,
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              height: MediaQuery.of(context).size.height - 30,
              items: [0, 1, 2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: AppItro(i));
                  },
                );
              }).toList(),
            ),
          ],
        ));
  }
}

class AppItro extends StatefulWidget {
  int index;
  AppItro(this.index);
  @override
  _AppItroState createState() => _AppItroState();
}

class _AppItroState extends State<AppItro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: 24,
                  top: 14,
                  child: new Text(
                    "Numero\u00B9",
                    style: TextStyle(fontFamily: "AvenirBold", fontSize: 16),
                  )),
              Positioned(
                right: 24,
                top: 14,
                child: RaisedButton(
                  child: new Text(
                    widget.index == 2 ? "DONE" : "SKIP",
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontFamily: "SultanNahia"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Choose_Language()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 130,
          child: Column(
            children: <Widget>[
              Image.asset(imagePath[widget.index],
                  width: MediaQuery.of(context).size.width),
              Center(
                  child: new Text(
                    title[widget.index],
                    style: TextStyle(fontFamily: "Caslon", fontSize: 30),
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Center(
                  child: new RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: description[widget.index],
                                style: new TextStyle(fontFamily: 'Avenir')),
                            new TextSpan(
                                text: widget.index == 0 ? 'Numero1.' : '',
                                style: new TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'AvenirBold'))
                          ])),
                ),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: 50,
          child: Stack(
            children: <Widget>[
              Dots(widget.index),
              Center(
                child: new Text("SCOLL RIGHT",
                    style: TextStyle(fontFamily: "Avenir", fontSize: 10)),
              ),
              Positioned(
                  right: 0,
                  top: widget.index != 2 ? 20 : 0,
                  child: widget.index != 2
                      ? Image.asset(
                    'assets/images/arrow.png',
                    width: 36,
                  )
                      : LetsGo())
            ],
          ),
        )
      ],
    );
  }
}

class Dots extends StatefulWidget {
  int index;
  Dots(this.index);
  @override
  _DotsState createState() => _DotsState();
}

class _DotsState extends State<Dots> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("deneme" + currentPage.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, int index) {
        return Container(
            margin: EdgeInsets.only(right: index != 2 ? 4 : 0),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == widget.index ? Colors.black : Colors.white,
                border: Border.all(color: Colors.black)));
      },
    );
  }
}

class LetsGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Choose_Language()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 100,
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 16,
                left: 12,
                child: Text(
                  "LET'S GO!",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

class Choose_Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Language'),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => English()));
                },
                child: new Text("English")
            ),
            new RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Myanmar_Unicode()));
              },
              child: new Text("မြန်မာ",
                style: TextStyle(
                  fontFamily: 'Pyidaungsu',
                ),),

            ),
            new RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Myanmar_Zawgyi()));
              },
              child: new Text("ျမန္မာ",
                style: TextStyle(
                  fontFamily: 'SmartZawgyi',
                ),),
            ),

          ],
        ),
      ),
    );
  }
}
class English extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Myanmar'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => English_Myanmar()));
            },
          ),
          new ListTile(
            title: Text('Japan'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => English_Japan()));
            },
          )

        ],
      ),
    );
  }
}

class Myanmar_Unicode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("မြန်မာ",
          style: TextStyle(
            fontFamily: 'Pyidaungsu',
          ),),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('မြန်မာ',
              style: TextStyle(
                fontFamily: 'Pyidaungsu',
              ),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Unicode_Myanmar()));
            },
          ),
          new ListTile(
            title: Text('ဂျပန်',
              style: TextStyle(
                fontFamily: 'Pyidaungsu',
              ),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Unicode_Japan()));
            },
          )

        ],
      ),
    );
  }
}

class Myanmar_Zawgyi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ျမန္မာ",
          style: TextStyle(
            fontFamily: 'SmartZawgyi',
          ),),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('ျမန္မာ',
              style: TextStyle(
                fontFamily: 'SmartZawgyi',
              ),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Zawgyi_Myanmar()));
            },
          ),
          new ListTile(
            title: Text('ဂ်ပန္',
              style: TextStyle(
                fontFamily: 'SmartZawgyi',
              ),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Zawgyi_Myanmar()));
            },
          )

        ],
      ),
    );
  }
}
class English_Myanmar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Myanmar Unicode"),
      ),
      body: ListView(
          children: <Widget>[
            Image.asset('assets/myanmar.jpg'),

            new MaterialButton(

              child: Text(
                'Myanmar (English pronunciation below; Burmese: မြန်မာ, [mjəmà])[nb 1] or Burma (see §Etymology), officially the Republic of the Union of Myanmar[nb 2], is a country in Southeast Asia. Myanmar is bordered by Bangladesh and India to its northwest, China to its northeast, Laos and Thailand to its east and southeast, and the Andaman Sea and the Bay of Bengal to its south and southwest. With a size of 676,578 square kilometres (261,228 square miles), Myanmar is the largest of the Mainland Southeast Asian states by area. As of 2017, the population is about 54 million.[4] Its capital city is Naypyidaw, and its largest city is Yangon (Rangoon).[1] Myanmar has been a member of the Association of Southeast Asian Nations (ASEAN) since 1997.\nEarly civilisations in Myanmar included the Tibeto-Burman-speaking Pyu city-states in Upper Burma and the Mon kingdoms in Lower Burma.[8] In the 9th century, the Bamar people entered the upper Irrawaddy valley and, following the establishment of the Pagan Kingdom in the 1050s, the Burmese language, culture and Theravada Buddhism slowly became dominant in the country. The Pagan Kingdom fell due to the Mongol invasions and several warring states emerged. In the 16th century, reunified by the Taungoo dynasty, the country was for a brief period the largest empire in the history of Mainland Southeast Asia.[9] The early 19th-century Konbaung dynasty ruled over an area that included modern Myanmar and briefly controlled Manipur and Assam as well. The British East India Company seized control of the administration of Myanmar after three Anglo-Burmese Wars in the 19th century and the country became a British colony. Myanmar was granted independence in 1948, as a democratic nation. Following a coup détat in 1962, it became a military dictatorship under the Burma Socialist Programme Party.For most of its independent years, the country has been engrossed in rampant ethnic strife and its myriad ethnic groups have been involved in one of the worlds longest-running ongoing civil wars. During this time, the United Nations and several other organisations have reported consistent and systematic human rights violations in the country.[10] In 2011, the military junta was officially dissolved following a 2010 general election, and a nominally civilian government was installed. This, along with the release of Aung San Suu Kyi and political prisoners, has improved the countrys human rights record and foreign relations, and has led to the easing of trade and other economic sanctions.[11] There is, however, continuing criticism of the governments treatment of ethnic minorities, its response to the ethnic insurgency, and religious clashes.[12] In the landmark 2015 election, Aung San Suu Kyis party won a majority in both houses. However, the Burmese military remains a powerful force in politics.',
                style: TextStyle(
                  fontSize: 20.0, // insert your font size here
                ),
              ),
            )

          ]),
    );

  }
}

class English_Japan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Japan"),
      ),
      body: ListView(
          children: <Widget>[
            Image.asset('assets/japan.jpg'),

            new MaterialButton(

              child: Text(
                'Japan (/dʒəˈpæn/; Japanese: 日本, Nippon [ɲippoꜜɴ] (About this soundlisten) or Nihon [ɲihoꜜɴ] (About this soundlisten))[a] is an island country in East Asia. It is bordered by the Sea of Japan to the west and the Pacific Ocean to the east, and extends from the Sea of Okhotsk in the northeast to the East China Sea in the southwest. Part of the Ring of Fire, Japan encompasses a stratovolcanic archipelago of 6,852 islands and covers 380,000 square kilometers (150,000 sq mi); the five largest islands, from north to south, are Hokkaido, Honshu, Shikoku, Kyushu, and Okinawa. Tokyo is the countrys capital and most populous city, while major regional centers include Osaka, Nagoya, and Fukuoka.\nJapan is the eleventh most populous country in the world, as well as one of the most densely populated and urbanized. About three-fourths of the countrys terrain is mountainous, concentrating its population of 126.2 million on narrow coastal plains. The largest urban area is the Greater Tokyo Area, which is also the most populous metropolitan area in the world and home to more than 37 million people.',
                style: TextStyle(
                  fontSize: 20.0, // insert your font size here
                ),
              ),
            )

          ]),
    );

  }
}

// ignore: camel_case_types
class Unicode_Myanmar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("မြန်မာ",
          style: TextStyle(
            fontFamily: 'Pyidaungsu',
          ),),
      ),
      body: ListView(
          children: <Widget>[
            Image.asset('assets/myanmar.jpg'),

            new MaterialButton(

              child: Text(
                'မြန်မာနိုင်ငံ (တရားဝင်အားဖြင့် ပြည်ထောင်စု သမ္မတ မြန်မာနိုင်ငံတော်)သည် အရှေ့တောင်အာရှတွင် ဧရိယာအားဖြင့် ဒုတိယ အကျယ်ဝန်းဆုံး နိုင်ငံဖြစ်သည်။[၈] ၁၉၄၈ ခုနှစ် ဇန်နဝါရီ ၄ ရက်နေ့တွင် ဂရိတ်ဗြိတိန်နိုင်ငံထံမှ (အင်္ဂလိပ်လို "Burma" အဖြစ်နှင့်) ပြည်ထောင်စု မြန်မာနိုင်ငံတော် အဖြစ် လွတ်လပ်ရေးကို ရရှိခဲ့သည်။ နောက်ပိုင်းတွင် ပြည်ထောင်စု ဆိုရှယ်လစ် သမ္မတမြန်မာနိုင်ငံတော်အဖြစ် ၁၉၇၄ ခုနှစ် ဇန်နဝါရီ ၄ ရက်တွင် လည်းကောင်း၊ ပြည်ထောင်စု မြန်မာနိုင်ငံတော် အဖြစ် ၁၉၈၈ခုနှစ် စက်တင်ဘာ ၂၃ ရက်တွင်လည်းကောင်း၊ ပြည်ထောင်စု မြန်မာနိုင်ငံတော်အဖြစ် ၁၉၈၉ ခုနှစ် ဇွန် ၁၈ ရက်တွင် လည်းကောင်း အမည်များပြောင်းလဲခဲ့သည်။ အာဏာရစစ်အစိုးရအား အသိအမှတ် မပြုသော အဖွဲ့အစည်းများက ဘားမား ("Burma") ဟုသာ အသိအမှတ်ပြု သုံးစွဲခဲ့သည်[ကိုးကားချက်လိုသည်]။ ၂၀၀၈ ဖွဲ့စည်းပုံအခြေခံဥပဒေအရ ၂၀၁၀ ခုနှစ် ဧပြီလ ၁ ရက် နေ့မှစ ၍ ပြည်ထောင်စု သမ္မတ မြန်မာနိုင်ငံတော် အဖြစ် ပြောင်းလဲခေါ်ဆိုခဲ့သည်။ နိုင်ငံတော်အလံကိုလည်း ယခင် နိုင်ငံတော် အေးချမ်းသာယာရေးနှင့် ဖွံ့ဖြိုးရေးကောင်စီအစိုးရလက်ထက် ၂၀⁠၀၈ ခုနှစ်တွင် ပြဋ္ဌာန်းခဲ့သော ဖွဲ့စည်းပုံအခြေခံဥပဒေ တွင် သတ်မှတ်ထားသည့် အလံဖြင့် အစားထိုး၍ ပြောင်းလဲ အသုံးပြုခဲ့သည်။ [၉]',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Pyidaungsu'// insert your font size here
                ),
              ),
            )

          ]),
    );

  }
}

class Unicode_Japan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ဂျပန်",
          style: TextStyle(
            fontFamily: 'Pyidaungsu',
          ),),
      ),
      body: ListView(
          children: <Widget>[
            Image.asset('assets/japan.jpg'),

            new MaterialButton(

              child: Text(
                'Jဂျပန် (日本 နိဟွန်း သို့မဟုတ် နိပွန်၊ တရားဝင်အမည် 日本国 နိပွန်ကိုကု သို့မဟုတ် နိဟွန်းကိုကု) သည် အရှေ့အာရှတွင်ရှိသော ကျွန်းနိုင်ငံတစ်နိုင်ငံဖြစ်သည်။ ပစိဖိတ် သမုဒ္ဒရာအတွင်း၌ တည်ရှိပြီး ဂျပန်ပင်လယ်၊ တရုတ်ပြည်သူ့သမ္မတနိုင်ငံ၊ မြောက်ကိုရီးယား၊ တောင်ကိုရီးယား နှင့် ရုရှား တို့၏ အရှေ့ဖက်တွင် ရှိပြီး မြောက်ဖက်ရှိ အိုဟွတ်ပင်လယ်မှတောင်ဘက် အရှေ့တရုတ်ပင်လယ်နှင့် ထိုင်ဝမ်တို့အထိ ဖြန့်ကျက်တည်ရှိသည်။ ဂျပန်၏ နာမည်ကို ဖော်ကျူးထားသော စာလုံးများမှာ "နေမှဆင်းသက်လာသောတိုင်းပြည်" ဟု အဓိပ္ပာယ်ရပြီး ထိုအတွက်ကြောင့် တခါတရံတွင် ဂျပန်အား "နေထွက်ရာတိုင်းပြည်" ဟု အဓိပ္ပာယ်ဖော်ဆို ခေါ်ဝေါ်ကြသည်။',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Pyidaungsu',// insert your font size here
                ),
              ),
            )

          ]),
    );

  }
}

class Zawgyi_Myanmar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Myanmar Zawgyi"),
      ),
      body: ListView(
          children: <Widget>[
            Image.asset('assets/myanmar.jpg'),

            new MaterialButton(

              child: Text(
                'ျမန္မာႏိုင္ငံ (တရားဝင္အားျဖင့္ ျပည္ေထာင္စု သမၼတ ျမန္မာႏိုင္ငံေတာ္)သည္ အေရွ႕ေတာင္အာရွတြင္ ဧရိယာအားျဖင့္ ဒုတိယ အက်ယ္ဝန္းဆုံး ႏိုင္ငံျဖစ္သည္။[၈] ၁၉၄၈ ခုႏွစ္ ဇန္နဝါရီ ၄ ရက္ေန႔တြင္ ဂရိတ္ၿဗိတိန္ႏိုင္ငံထံမွ (အဂၤလိပ္လို "Burma" အျဖစ္ႏွင့္) ျပည္ေထာင္စု ျမန္မာႏိုင္ငံေတာ္ အျဖစ္ လြတ္လပ္ေရးကို ရရွိခဲ့သည္။ ေနာက္ပိုင္းတြင္ ျပည္ေထာင္စု ဆိုရွယ္လစ္ သမၼတျမန္မာႏိုင္ငံေတာ္အျဖစ္ ၁၉၇၄ ခုႏွစ္ ဇန္နဝါရီ ၄ ရက္တြင္ လည္းေကာင္း၊ ျပည္ေထာင္စု ျမန္မာႏိုင္ငံေတာ္ အျဖစ္ ၁၉၈၈ခုႏွစ္ စက္တင္ဘာ ၂၃ ရက္တြင္လည္းေကာင္း၊ ျပည္ေထာင္စု ျမန္မာႏိုင္ငံေတာ္အျဖစ္ ၁၉၈၉ ခုႏွစ္ ဇြန္ ၁၈ ရက္တြင္ လည္းေကာင္း အမည္မ်ားေျပာင္းလဲခဲ့သည္။ အာဏာရစစ္အစိုးရအား အသိအမွတ္ မျပဳေသာ အဖြဲ႕အစည္းမ်ားက ဘားမား ("Burma") ဟုသာ အသိအမွတ္ျပဳ သုံးစြဲခဲ့သည္[ကိုးကားခ်က္လိုသည္]။ ၂၀၀၈ ဖြဲ႕စည္းပုံအေျခခံဥပေဒအရ ၂၀၁၀ ခုႏွစ္ ဧၿပီလ ၁ ရက္ ေန႔မွစ ၍ ျပည္ေထာင္စု သမၼတ ျမန္မာႏိုင္ငံေတာ္ အျဖစ္ ေျပာင္းလဲေခၚဆိုခဲ့သည္။ ႏိုင္ငံေတာ္အလံကိုလည္း ယခင္ ႏိုင္ငံေတာ္ ေအးခ်မ္းသာယာေရးႏွင့္ ဖြံ႕ၿဖိဳးေရးေကာင္စီအစိုးရလက္ထက္ ၂၀⁠၀၈ ခုႏွစ္တြင္ ျပ႒ာန္းခဲ့ေသာ ဖြဲ႕စည္းပုံအေျခခံဥပေဒ တြင္ သတ္မွတ္ထားသည့္ အလံျဖင့္ အစားထိုး၍ ေျပာင္းလဲ အသုံးျပဳခဲ့သည္။ [၉]',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'SmartZawgyi',// insert your font size here
                ),
              ),
            )

          ]),
    );

  }
}

class Zawgyi_Japan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ဂ်ပန္"),
      ),
      body: ListView(
          children: <Widget>[
            Image.asset('assets/japan.jpg'),

            new MaterialButton(

              child: Text(
                'Jဂ်ပန္ (日本 နိဟြန္း သို႔မဟုတ္ နိပြန္၊ တရားဝင္အမည္ 日本国 နိပြန္ကိုကု သို႔မဟုတ္ နိဟြန္းကိုကု) သည္ အေရွ႕အာရွတြင္ရွိေသာ ကြၽန္းႏိုင္ငံတစ္ႏိုင္ငံျဖစ္သည္။ ပစိဖိတ္ သမုဒၵရာအတြင္း၌ တည္ရွိၿပီး ဂ်ပန္ပင္လယ္၊ တ႐ုတ္ျပည္သူ႔သမၼတႏိုင္ငံ၊ ေျမာက္ကိုရီးယား၊ ေတာင္ကိုရီးယား ႏွင့္ ႐ုရွား တို႔၏ အေရွ႕ဖက္တြင္ ရွိၿပီး ေျမာက္ဖက္ရွိ အိုဟြတ္ပင္လယ္မွေတာင္ဘက္ အေရွ႕တ႐ုတ္ပင္လယ္ႏွင့္ ထိုင္ဝမ္တို႔အထိ ျဖန႔္က်က္တည္ရွိသည္။ ဂ်ပန္၏ နာမည္ကို ေဖာ္က်ဴးထားေသာ စာလုံးမ်ားမွာ "ေနမွဆင္းသက္လာေသာတိုင္းျပည္" ဟု အဓိပၸာယ္ရၿပီး ထိုအတြက္ေၾကာင့္ တခါတရံတြင္ ဂ်ပန္အား "ေနထြက္ရာတိုင္းျပည္" ဟု အဓိပၸာယ္ေဖာ္ဆို ေခၚေဝၚၾကသည္။',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'SmartZawgyi',// insert your font size here
                ),
              ),
            )

          ]),
    );

  }
}