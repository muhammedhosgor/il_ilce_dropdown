# il_ilce_dropdown

**il_ilce_dropdown**, Türkiye'deki il ve ilçeleri kolayca seçebilmeniz için geliştirilmiş bir Flutter widget paketidir. Kullanıcılar önce il, ardından o ile bağlı ilçeyi seçebilir. Paket, JSON veri yapısı ile birlikte gelir ve herhangi bir internet bağlantısı gerektirmez.

---

## 🚀 Özellikler

- ✅ İl ve ilçe seçimlerini dropdown ile yapar.
- ✅ İl seçildiğinde, sadece o ile bağlı ilçeler gösterilir.
- ✅ Offline çalışır – veriler yerel JSON dosyasından yüklenir.
- ✅ Genişletilebilir yapı – kendi tasarımınıza entegre edilebilir.
- ✅ Türkçe veri seti – Türkiye'deki tüm il ve ilçeleri içerir.

---

## 📦 Kurulum

`pubspec.yaml` dosyanıza aşağıdaki satırları ekleyin:

```yaml
dependencies:
  il_ilce_dropdown: ^1.0.0 
  ```


## Örnek | Example

```
import 'package:flutter/material.dart';
import 'package:il_ilce_dropdown/city_district_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'İl İlçe Dropdown Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('İl İlçe Seçimi')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CityDistrictDropdown(
            onChanged: (il, ilce) {
              print("Seçilen İl: ${il.name}, İlçe: ${ilce.name}");
            },
            cityHint: Text("İl Seçiniz"),
            districtHint: Text("İlçe Seçiniz"),
          ),
        ),
      ),
    );
  }
}

```