
import 'package:flutter/material.dart';
import 'package:flutter_contact_app/contact_details_view.dart';
import 'package:grouped_list/grouped_list.dart';
 
import 'contact_model.dart';
 
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
 
  final ScrollController _scrollController = ScrollController();
 
  final List<Map<String, String>> data = [
    {
      "name": "Fati Ibrahim",
      "phone": "1-565-567-8982",
      "email": "smartkhid@gmail.com",
      "country": "Ghana",
      "region": "Cape Coast"
    },
    {
      "name": "Mercy Blay",
      "phone": "434-689",
      "email": "tempor.diam@gmail.com",
      "country": "Ghana",
      "region": "Ashanti"
    },
    {
      "name": "Vennesa Inkoom",
      "phone": "1-679-743-4341",
      "email": "veve@google.com",
      "country": "Ghana",
      "region": "Greater Accra"
    },
    {
      "name": "Bruce Mars",
      "phone": "582-8897",
      "email": "brus@hotmail.com",
      "country": "Ghana",
      "region": "Western Region"
    },
    {
      "name": "Nuhuh Ramos",
      "phone": "674-5432",
      "email": "nuhu67@hotmail.com",
      "country": "Ghana",
      "region": "Eastern Region "
    },
    {
      "name": "Carlos Mensah",
      "phone": "589-113-7633",
      "email": "nail98@hotmail.com",
      "country": "Ghana",
      "region": "Northern Region"
    },
    {
      "name": "Rita Ansah",
      "phone": "871-3241",
      "email": "ritn@yahoo.com",
      "country": "Ghana",
      "region": "Central Region"
    },
    {
      "name": "William Hagan",
      "phone": "1-412-819-7163",
      "email": "hagan@yahoo.com",
      "country": "Ghana",
      "region": "Volta Region"
    },
    {
      "name": "Sheila Blay",
      "phone": "1-241-786-5206",
      "email": "blay67@google.com",
      "country": "Ghana",
      "region": "Upper East"
    },
    {
      "name": "Kalima Abdullah",
      "phone": "1-789-578-0868",
      "email": "liima@google.edu",
      "country": "Chana",
      "region": "Bono Region"
    }
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/person3.jpg'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'nuhu65@gmail.com',
                                name: 'Kalima Nuhu',
                                phone: '+233 24 54 36 757',
                                region: 'Greater Accra'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('images/person2.jpg'),
                    ),
                    title: const Text(
                      'Kamal Yakubu',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 24 54 36 757'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('images/limat.jpg'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
