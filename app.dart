import 'dart:io'; // ฟังก์ชั่นการทำงานเกี่ยวกับการอ่านและเขียนข้อมูลไปยัง input output
import 'dart:math'; // ฟังก์ชั่นการทำงานทางคณิตศาสตร์

/*
  สร้าง class ไพ่ยิปซี
  เพื่อเป็น template ในการสร้างไพ่ยิปซีแต่ละใบ
  กำหนดตัวแปร name และ description เป็น String เพื่อเก็บข้อความ
  สร้าง constructor กำหนดค่าให้กับตัวแปร name และ description เพื่อสร้างไพ่
*/
class TarotCard {
  String name;
  String description;
  int luckyNumber;

  TarotCard(this.name, this.description, this.luckyNumber);

  // คุณสมบัติ
  String getInfo({double? extraValue = 0.5}) {
    String extraInfo = (extraValue != null) ? 'ค่าพิเศษ: ${extraValue.toStringAsFixed(2)}\n' : '';
    return 'ชื่อไพ่: $name\n คำอธิบาย: $description\n เลขมงคล: $luckyNumber\n $extraInfo';
  }
}

// สร้างลิสต์ tarotDeck เพื่อเก็บไพ่ยิปซีทั้ง 20 ใบ โดยลิสต์นี้เป็นข้อมูลของคลาส TarotCard
void main() {
  // สร้าง array ของไพ่ยิปซี 20 ใบ
  List<TarotCard> tarotDeck = [
    // เพิ่มไพ่พร้อมกับคำอธิบายที่สอดคล้องกัน
    TarotCard(
      "The Fool",
      "หมายถึง การเริ่มต้นใหม่",
      0,
    ),
    TarotCard(
      "The Magician",
      "หมายถึง พลังงานและความสามารถ",
      1,
    ),
    TarotCard(
      "The High Priestess",
      "หมายถึง ความลึกลับและปัญญา",
      2,
    ),
    TarotCard(
      "The Empress",
      "หมายถึง ความมั่งคั่งและการเจริญเติบโต",
      3,
    ),
    TarotCard(
      "The Emperor",
      "หมายถึง การควบคุมและอำนาจ",
      5,
    ),
    TarotCard(
      "The Hierophant",
      "หมายถึง การเรียนรู้และความศรัทธา",
      6,
    ),
    TarotCard(
      "The Lovers",
      "หมายถึง ความรักและความสัมพันธ์",
      7,
    ),
    TarotCard(
      "The Chariot",
      "หมายถึง ความมุ่งมั่นและความสำเร็จ",
      8,
    ),
    TarotCard(
      "Strength",
      "หมายถึง ความกล้าหาญและความเข้มแข็ง",
      9,
    ),
    TarotCard(
      "The Hermit",
      "หมายถึง การค้นหาตนเอง",
      10,
    ),
    TarotCard(
      "Wheel of Fortune",
      "หมายถึง การเปลี่ยนแปลง",
      11,
    ),
    TarotCard(
      "Justice",
      "หมายถึง ความยุติธรรม",
      12,
    ),
    TarotCard(
      "The Hanged Man",
      "หมายถึง การเสียสละ",
      13,
    ),
    TarotCard(
      "Death",
      "หมายถึง การเปลี่ยนแปลงที่สิ้นสุด",
      14,
    ),
    TarotCard(
      "Temperance",
      "หมายถึง ความสมดุล",
      15,
    ),
    TarotCard(
      "The Devil",
      "หมายถึง การพยายามเอาชนะสิ่งเลวร้าย",
      17,
    ),
    TarotCard(
      "The Tower",
      "หมายถึง การเปลี่ยนแปลงที่รุนแรง",
      18,
    ),
    TarotCard(
      "The Star",
      "หมายถึง ความหวัง",
      19,
    ),
    TarotCard(
      "The Moon",
      "หมายถึง ความสับสนและสิ่งลึกลับ",
      20,
    ),
    TarotCard(
      "The Sun",
      "หมายถึง ความสุขและความสำเร็จ",
      21,
    ),
    TarotCard('ไพ่การตัดสิน',
        'สื่อถึงการเกิดใหม่, การเรียกร้องภายใน, และการล้างบาป.', 22),
    TarotCard('ไพ่โลก', 'สื่อถึงการบรรลุผล, การสำเร็จ, และการเดินทาง.', 23),
    TarotCard('ไพ่หอคอยกลับด้าน',
        'สื่อถึงการหลีกเลี่ยงภัยพิบัติ, การเลื่อนการเปลี่ยนแปลง.', 24),
    TarotCard('ไพ่ดวงดาวกลับด้าน',
        'สื่อถึงการขาดความเชื่อ, ความสิ้นหวัง, และความสงสัยในตนเอง.', 25),
    TarotCard('ไพ่ดวงอาทิตย์กลับด้าน',
        'สื่อถึงความซึมเศร้าชั่วคราว, ความสุขที่คลุมเครือ.', 26),
  ];

  // สุ่มตำแหน่งไพ่ไม่ให้ซ้ำกัน
  tarotDeck.shuffle(Random());

  while (true) {
    // แสดงคำแนะนำให้ผู้ใช้กรอกตัวเลข
    stdout.write("กรุณาเลือกตำแหน่งไพ่ (1-${tarotDeck.length}): ");
    String? input = stdin.readLineSync();
    int? index = int.tryParse(input ?? '');

    // ตรวจสอบว่า input ไม่ใช่ null และเป็นตัวเลข
    if (input != null && index == -1) {
      // แปลงข้อมูลที่ผู้ใช้กรอกให้เป็น int ถ้าแปลงสำเร็จให้เก็บไว้ในตัวแปร position
      // int? index = int.tryParse(input);
      print("ออกจากเกม");
      break;
    } else if (index == 0) {
      for (int i = 0; i < tarotDeck.length; i++) {
        TarotCard card = tarotDeck[i];
        print(card.getInfo());
        
        // print("ไพ่ที่ ${i + 1} : ${card.name}");
        // print("คำอธิบาย: ${card.description}");
        // print("เลขมงคล: ${card.luckyNumber}");
      }
    } else if (index != null && index >= 1 && index <= tarotDeck.length) {
      // เลือกไพ่จากลิสต์ tarotDeck ใช้ตำแหน่งที่ผู้ใช้กรอกหักลบด้วย 1 เพราะ index เริ่มต้นที่ 0
      TarotCard selectedCard = tarotDeck[index - 1];
      print("ไพ่ที่คุณเลือกคือ: ${selectedCard.name}");
      // print("คำอธิบาย: ${selectedCard.description}");
      // print("เลขมงคม: ${selectedCard.luckyNumber}");
      print(selectedCard.getInfo());
      break; // ออกจากลูปหลังจากแสดงข้อมูลไพ่แล้ว
    } else {
      // ถ้าข้อมูลที่ผู้ใช้กรอกไม่อยู่ในช่วง 1-20
      print("กรุณากรอกตำแหน่งที่อยู่ในช่วง 1-25");
    }
  }
}
