import 'package:flutter/material.dart';

class Penyebab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("APA PENYEBAB STUNTING?"), backgroundColor: Colors.lightBlueAccent[100],),
      body: Container(width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image:
            AssetImage("img/bg2.jpg"),
            fit: BoxFit.fill
            )),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    '1. Kurangnya Gizi Ibu Pada Masa Kehamilan',
    <Entry>[
      Entry(
          'Stunting terjadi mulai dari pra-konsepsi ketika seorang remaja menjadi ibu yang kurang gizi dan anemia'),
      Entry('Menjadi parah ketika hamil dengan asupan gizi yang tidak sesuai kebutuhan.'),
    ],
  ),
  Entry(
    '2. Berat Badan Lahir Rendah (BBLR)',
    <Entry>[
      Entry('Ibu hamil yang kekurangan gizi, berpotensi melahirkan anak dengan berat badan lahir rendah < 2500 gram juga panjang badan < 48 cm.'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'Chapter C',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),
          Entry('Item C2.2'),
          Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
