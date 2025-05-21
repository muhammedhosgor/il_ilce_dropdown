# Changelog

## [0.0.1] - 2025-05-21
- İlk yayın: il ve ilçe seçimleri için özelleştirilebilir dropdown widget'ları eklendi.

### Eklendi
- Türkiye'deki 81 il ve tüm ilçeleri içeren yerel JSON veri desteği.
- İl ve ilçe seçimlerini sağlayan özel `IlIlceDropdown` widget'ı.
- İl seçildiğinde yalnızca o ile bağlı ilçeleri gösteren dinamik yapı.
- Kullanıcı tarafından `onChanged` fonksiyonu ile seçilen verilerin alınması.
- JSON dosyalarının otomatik yüklenmesini sağlayan yapı.
- `Il` ve `Ilce` model sınıfları ile tip güvenliği.

### Diğer
- Paket dokümantasyonu (`README.md`) ve lisans dosyası eklendi.
