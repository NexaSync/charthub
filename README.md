<h2>ChartHub</h2>
Create stunning and interactive charts in your Flutter apps effortlessly with the Charthub package. Choose from three chart types - Line Chart, Bar Chart, and Pie Chart - and bring your data to life. Charthub makes charting simple and flexible, so you can focus on delivering meaningful insights to your users.

## Usage

To use this package, add <b>charthub</b> as a dependency in your pubspec.yaml file.

<BR>
<Table>
    <tr>
        <td><img src="https://ik.imagekit.io/gajendramenaria9/ChartHub/Simulator%20Screenshot%20-%20iPhone%2014%20Pro%20Max%20-%202023-10-21%20at%2011.22.55.png?updatedAt=1697867717171" alt="preview2"/></td>
<td><img src="https://ik.imagekit.io/gajendramenaria9/ChartHub/Simulator%20Screenshot%20-%20iPhone%2014%20Pro%20Max%20-%202023-10-21%20at%2011.21.47.png?updatedAt=1697867716879" alt="preview"/></td>
<td><img src="https://ik.imagekit.io/gajendramenaria9/ChartHub/Simulator%20Screenshot%20-%20iPhone%2014%20Pro%20Max%20-%202023-10-21%20at%2011.23.18.png?updatedAt=1697867716788" alt="preview"/></td>
    </tr>
</Table>

## Features

<ul>
  <li>Easy-to-Use: Quickly integrate beautiful charts into your app.</li>
  <li>Chart Types: Select from Line Chart, Bar Chart, or Pie Chart.</li>
  <li>Data Visualization: Turn your data into compelling visuals.</li>
  <li>Customization: Customize your charts to match your app's look and feel.</li>
  <li>Animations (Coming Soon): Enhance user engagement with chart animations.</li>
  <li>Future-Proof: As we continue to expand, you'll have access to even more powerful charting features.</li>
</ul>


## Getting started

Follow this steps to use this package

## Install

```html
generate_tree: ^1.0.7
```

## Import package

```dart
import 'generate_tree/generate_tree.dart';
```

first you will need a data list:

```dart
final List data = [
      {
        "checked": true,
        "children": [
          {
            "checked": true,
            "show": false,
            "children": [],
            "id": 11,
            "pid": 1,
            "commonID": 1,
            "title": "Child title 11"
          }
        ],
        "id": 1,
        "pid": 0,
        "commonID": 1,
        "show": false,
        "title": "Parent title 1"
      },
      {
        "checked": true,
        "show": false,
        "children": [],
        "id": 2,
        "commonID": 2,
        "pid": 0,
        "title": "Parent title 2"
      },
      {
        "checked": true,
        "children": [
          {
            "checked": true,
            "children": [],
            "id": 31,
            "commonID": 3,
            "pid": 3,
            "show": false,
            "title": "Parent title 3.1"
          },
          {
            "checked": true,
            "children": [
              {
                "checked": true,
                "children": [],
                "id": 311,
                "commonID": 3,
                "pid": 31,
                "show": false,
                "title": "Parent title 3.1.1"
              },
              {
                "checked": true,
                "children": [],
                "id": 312,
                "commonID": 3,
                "pid": 31,
                "show": false,
                "title": "Parent title 3.1.2"
              }
            ],
            "id": 32,
            "commonID": 3,
            "pid": 2,
            "show": false,
            "title": "Parent title 3.2"
          }
        ],
        "id": 3,
        "commonID": 3,
        "pid": 0,
        "show": false,
        "title": "Parent title 3"
      }
    ];
```

then pass the data to TreeNode.fromJson() to get the List<TreeNode>

```dart
final List<TreeNode> treeNodes =
        data.map((item) => TreeNode.fromJson(item)).toList();
```

Now pass this treeNodes to GenerateTree(data: treeNodes) to generate the tree

```dart
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Generate Tree'),
    ),
    body: GenerateTree(
      data: treeNodes,
      selectOneToAll: false,
      textColor: Colors.blue,
      onChecked: (node, checked, commonID) {
        print('isChecked : $checked');
        print('common Node ID : ${commonID}');
        print(
            'children node data : ${node.children.map((e) => '${e.title}')}');
      },
      checkBoxColor: Colors.blue,
      childrenPadding: EdgeInsets.only(left: 40, top: 0, right: 0, bottom: 0),
    ),
  );
}
```

## Developer

<H3>Gajendra Somawat</H3>
<p>Instagram: <a href="https://www.instagram.com/gajendra_menaria9">gajendra_menaria9</a></p>

## Additional Details

for more details visit example page or contact on <a href="https://www.instagram.com/gajendra_menaria9">Instagram</a>
