import 'package:flutter/material.dart';
import 'package:teajai/models/project.dart';
import 'package:intl/intl.dart';
import 'package:teajai/pages/project/project_details_page.dart';
// ignore_for_file: prefer_const_constructors

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  List<Project> projects = [
    Project(
      title: 'อิ่มท้องน้องพิเศษ',
      description:
          'ชวนมอบมื้ออาหารกลางวันให้เด็กพิเศษ 240 คนในมูลนิธิบ้านครูบุญชูเพื่อเด็กพิเศษ ที่ต้องเผชิญค่าใช้จ่ายด้านอาหารกลางวันหลักแสนต่อเดือน เงินจำนวน 3,500 บาทสามารถเลี้ยงอาหารทุกคนได้ 1 มื้อ',
      target: 119350,
      duration: 60,
      donateCount: 2,
      receiveAmount: 5555,
      imageUrl: 'assets/images/01.jpg',
    ),
    Project(
      title: 'I’m ABLE “โอกาสจากพี่ ช่วยหนูได้เรียนร่วม”',
      description:
          'ระดมทุนการศึกษา 1 ปีให้กับเด็กนักเรียนพิการจำนวน 150 คนๆ ละ 4,000 บาท ให้กับเด็กนักเรียนพิการที่กำลังศึกษาอยู่ในระดับชั้นประถมศึกษาถึงมัธยมศึกษาในจังหวัดต่างๆของภาคตะวันออกเฉียงเหนือ ภาคตะวันตกและภาคใต้ที่มีความพิการทางร่างกายหรือพัฒนาการช้าแต่สามารถสื่อสารและเรียนหนังสือได้ เพื่อส่งเสริมเด็กนักเรียนพิการเหล่านั้นได้เรียนร่วมในโรงเรียนปกติกับนักเรียนทั่วไป เสริมสร้างพัฒนาการทางร่างกาย สติปัญญา ส่งเสริมการเรียนรู้การเข้าสังคมและช่วยเหลือตนเองในสถานการณ์ต่างๆโดยไม่รู้สึกว่าตนเองเป็นภาระของครูและเพื่อนๆในโรงเรียน',
      target: 825000,
      duration: 125,
      receiveAmount: 100000,
      donateCount: 3,
      imageUrl: 'assets/images/02.jpg',
    ),
    Project(
      title: 'อพาพญาแร้งที่สูญพันธุ์จากธรรมชาติกลับคืนป่าเมืองไทย',
      description:
          'เกือบ 30 ปี ที่พญาแร้งหายไปจากป่าเมืองไทย ในวันนี้พวกเราพยายามวางแผนเพาะพันธุ์พญาแร้งที่เหลืออยู่ในกรงเลี้ยงจำนวน 6 ตัว เพื่อหวังว่าสักวันในผืนป่าประเทศไทยจะมีพญาแร้งโผบินอีกครั้ง แต่โจทย์นี้ไม่ง่าย เพราะการจะทำให้สัตว์ที่สูญพันธุ์จากธรรมชาติกลับคืนมา ยากกว่าการทำให้มันหายไป',
      target: 299200,
      duration: 322,
      receiveAmount: 15679,
      donateCount: 8,
      imageUrl: 'assets/images/03.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เทใจ')),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index) {
          var pro = projects[index];

          var myTextstyle = TextStyle(fontSize: 12.0, color: Colors.black45);
          var formatter = NumberFormat('#,###,000');
          var target = formatter.format(pro.target);
          double progress = (pro.receiveAmount / pro.target) * 100;
          var percent = progress.round();

          return Card(
            child: InkWell(
              onTap: () {
                _handleClickProjectItem(projects[index]);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          pro.imageUrl,
                          width: 60.0,
                          height: 60.0,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          children: [
                            Text(
                              pro.title,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(pro.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black45)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('เป้าหมาย'),
                            Text(
                              '${target.toString()} บาท',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${progress.toStringAsFixed(0)} %',
                          style: myTextstyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: percent!,
                          child: Container(
                            height: 10.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 0.0),
                            color: Colors.orange,
                          ),
                        ),
                        Expanded(
                          flex: 100 - percent,
                          child: Container(
                            height: 10.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 0.0),
                            color: const Color(0xFFE8E8E8), //Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${pro.duration.toString()} วัน',
                          style: myTextstyle,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 12,
                            ),
                            Text(
                              ' ${pro.donateCount.toString()} ',
                              style: myTextstyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void _handleClickProjectItem(Project p) {
  print(p.receiveAmount.toString());

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProjectDetailsPage(project: p)),
  );
}
