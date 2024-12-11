@echo off
chcp 65001 >nul
title IT TOOLBOX - CENK KARAKOL
:menu
cls
echo ============================================
echo          IT TOOLBOX Ver 1.0 - CENK KARAKOL
echo ============================================
echo 1.  Bilgisayar ve Aktif Kullanıcı Adını Göster
echo 2.  Bilgisayar Seri Numarasını Göster (Yönetici)
echo 3.  Bilgisayarın Marka ve Modelini Göster
echo 4.  Bilgisayar Donanımı Hakkında Bilgi Al (systeminfo)
echo 5.  Windows Lisans Durumunu Göster
echo 6.  Etkin Windows Lisansını Göster
echo 7.  Windows Sürüm Bilgisi
echo 8.  Windows Güncelleme Durumunu Göster
echo 9.  Windows Store Uygulamalarını Güncelle
echo 10. Kurulu Tüm Programları Güncelle
echo 11. Windows Sistem Dosyalarını Onar (Yönetici)
echo 12. Windows Disk Temizliği Yap
echo 13. Gereksiz Dosyaları Temizle (Yönetici)
echo 14. Sistem Bilgilerini Görüntüle
echo 15. Kullanıcı Hesaplarını Listele
echo 16. Bağlı Wi-Fi Şifresini Göster (Yönetici)
echo 17. IP Adresini Görüntüle
echo 18. IP Yapılandırmasını Tümünü Görüntüle
echo 19. IP Yapılandırmasını Serbest Bırak (release) (Yönetici)
echo 20. IP Yapılandırmasını Yenile (renew) (Yönetici)
echo 21. Ağ DNS Önbelleğini Temizle (flushdns) (Yönetici)
echo 22. Ping Testi Yap
echo 23. Yazıcı Durumunu Göster
echo 24. Yüklü Yazıcıları Listele
echo 25. Yazıcıyı Yeniden Başlat (Yönetici)
echo 26. Yazıcı Kuyruğunu Temizle (Yönetici)
echo 27. Son Format Tarihini Göster (manuel kontrol)
echo 28. Güvenlik Duvarını Aç (Yönetici)
echo 29. Güvenlik Duvarını Kapat (Yönetici)
echo 30. BIOS Ayarlarını Aç
echo 31. Güvenli Modda Aç (Yönetici)
echo 32. Depolama Alanı Durumunu Göster
echo 33. Sabit Diski Tara (chkdsk) (Yönetici)
echo 34. Disk Durumunu Kontrol Et
echo 35. CPU Bilgilerini Göster
echo 36. RAM Optimizasyonu Yap (manuel)
echo 37. Bellek (RAM) Kullanımını Göster
echo 38. Grup Politikalarını Güncelle (gpupdate /force)
echo 39. Bilgisayarı Kapat
echo 40. Bilgisayarı Yeniden Başlat
echo 41. Çıkış Yap
echo ============================================
set /p choice=Bir işlem numarası seçin (Çıkmak için X girin): 

if "%choice%"=="1" (echo Bilgisayar Adı: %COMPUTERNAME% && echo Aktif Kullanıcı: %USERNAME% && pause)
if "%choice%"=="2" (wmic bios get serialnumber | find /v "SerialNumber" || echo Seri numarası alınamadı. && pause)
if "%choice%"=="3" (wmic computersystem get manufacturer,model | find /v "Manufacturer" || echo Bilgi alınamadı. && pause)
if "%choice%"=="4" (systeminfo && pause)
if "%choice%"=="5" (slmgr /xpr && pause)
if "%choice%"=="6" (slmgr /dlv && pause)
if "%choice%"=="7" (start winver && pause)
if "%choice%"=="8" (wmic qfe get HotfixID,InstalledOn || echo Güncelleme bilgisi alınamadı. && pause)
if "%choice%"=="9" (start ms-windows-store://update && pause)
if "%choice%"=="10" (echo Kurulu programları güncellemek manuel yapılmalıdır && pause)
if "%choice%"=="11" (sfc /scannow && pause)
if "%choice%"=="12" (cleanmgr && pause)
if "%choice%"=="13" (del /q/f/s %temp%\* && pause)
if "%choice%"=="14" (msinfo32 && pause)
if "%choice%"=="15" (net user && pause)
if "%choice%"=="16" (netsh wlan show profile name=* key=clear && pause)
if "%choice%"=="17" (ipconfig && pause)
if "%choice%"=="18" (ipconfig /all && pause)
if "%choice%"=="19" (ipconfig /release && pause)
if "%choice%"=="20" (ipconfig /renew && pause)
if "%choice%"=="21" (ipconfig /flushdns && pause)
if "%choice%"=="22" (set /p ip=Pinglemek istediğiniz IP veya adresi girin: && ping %ip% && pause)
if "%choice%"=="23" (wmic printer get name,status && pause)
if "%choice%"=="24" (wmic printer list brief && pause)
if "%choice%"=="25" (net stop spooler && net start spooler && pause)
if "%choice%"=="26" (net stop spooler && del /q/f/s %systemroot%\System32\spool\PRINTERS\* && net start spooler && pause)
if "%choice%"=="27" (echo Son format tarihi bilgisi manuel kontrol edilmelidir && pause)
if "%choice%"=="28" (netsh advfirewall set allprofiles state on && pause)
if "%choice%"=="29" (netsh advfirewall set allprofiles state off && pause)
if "%choice%"=="30" (start ms-settings:recovery && pause)
if "%choice%"=="31" (bcdedit /set {default} safeboot minimal && shutdown /r && pause)
if "%choice%"=="32" (wmic logicaldisk get size,freespace,caption && pause)
if "%choice%"=="33" (chkdsk && pause)
if "%choice%"=="34" (wmic diskdrive get status && pause)
if "%choice%"=="35" (wmic cpu get name,CurrentClockSpeed && pause)
if "%choice%"=="36" (echo RAM optimizasyonu için üçüncü parti yazılım kullanın && pause)
if "%choice%"=="37" (wmic OS get FreePhysicalMemory && pause)
if "%choice%"=="38" (gpupdate /force && pause)
if "%choice%"=="39" (shutdown /s && pause)
if "%choice%"=="40" (shutdown /r && pause)
if "%choice%"=="41" (exit)
if /i "%choice%"=="X" (exit)
goto menu
