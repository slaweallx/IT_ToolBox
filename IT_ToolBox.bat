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
echo 42. Bilgisayar Adını Değiştir
echo 43. IP Alt Ağını Göster
echo 44. Ağ Bağlantılarını Etkinleştir/Kapat
echo 45. Aktif Ağ Bağlantılarını Göster
echo 46. Hizmetleri Yönet (Başlat/Durdur/Yeniden Başlat)
echo 47. Olay Günlüklerini Görüntüle
echo 48. Kayıt Defterini Yedekle
echo 49. Kayıt Defterini Geri Yükle
echo 50. Sistem Performansını İzle
echo 51. Paylaşılan Klasörleri Listele
echo ============================================
set /p choice=Bir işlem numarası seçin (Çıkmak için X girin): 

REM Seçilen işlemi kontrol et ve ilgili komutu çalıştır
if "%choice%"=="1" (
    echo Bilgisayar Adı: %COMPUTERNAME%
    echo Aktif Kullanıcı: %USERNAME%
    pause
)

if "%choice%"=="2" (
    wmic bios get serialnumber | find /v "SerialNumber"
    if errorlevel 1 (
        echo Seri numarası alınamadı.
    )
    pause
)

if "%choice%"=="3" (
    wmic computersystem get manufacturer,model | find /v "Manufacturer"
    if errorlevel 1 (
        echo Bilgi alınamadı.
    )
    pause
)

if "%choice%"=="4" (
    systeminfo
    pause
)

if "%choice%"=="5" (
    slmgr /xpr
    pause
)

if "%choice%"=="6" (
    slmgr /dlv
    pause
)

if "%choice%"=="7" (
    start winver
    pause
)

if "%choice%"=="8" (
    wmic qfe get HotfixID,InstalledOn
    if errorlevel 1 (
        echo Güncelleme bilgisi alınamadı.
    )
    pause
)

if "%choice%"=="9" (
    start ms-windows-store://update
    pause
)

if "%choice%"=="10" (
    echo Kurulu programları güncellemek manuel yapılmalıdır.
    pause
)

if "%choice%"=="11" (
    sfc /scannow
    pause
)

if "%choice%"=="12" (
    cleanmgr
    pause
)

if "%choice%"=="13" (
    del /q/f/s %temp%\* 
    echo Geçici dosyalar temizlendi.
    pause
)

if "%choice%"=="14" (
    msinfo32
    pause
)

if "%choice%"=="15" (
    net user
    pause
)

if "%choice%"=="16" (
    netsh wlan show profile name=* key=clear
    pause
)

if "%choice%"=="17" (
    ipconfig
    pause
)

if "%choice%"=="18" (
    ipconfig /all
    pause
)

if "%choice%"=="19" (
    ipconfig /release
    pause
)

if "%choice%"=="20" (
    ipconfig /renew
    pause
)

if "%choice%"=="21" (
    ipconfig /flushdns
    pause
)

if "%choice%"=="22" (
    set /p ip=Pinglemek istediğiniz IP veya adresi girin: 
    ping %ip%
    pause
)

if "%choice%"=="23" (
    wmic printer get name,status
    pause
)

if "%choice%"=="24" (
    wmic printer list brief
    pause
)

if "%choice%"=="25" (
    net stop spooler
    net start spooler
    echo Yazıcı hizmeti yeniden başlatıldı.
    pause
)

if "%choice%"=="26" (
    net stop spooler
    del /q/f/s %systemroot%\System32\spool\PRINTERS\*
    net start spooler
    echo Yazıcı kuyruğu temizlendi.
    pause
)

if "%choice%"=="27" (
    echo Son format tarihi bilgisi manuel kontrol edilmelidir.
    pause
)

if "%choice%"=="28" (
    netsh advfirewall set allprofiles state on
    echo Güvenlik duvarı açıldı.
    pause
)

if "%choice%"=="29" (
    netsh advfirewall set allprofiles state off
    echo Güvenlik duvarı kapatıldı.
    pause
)

if "%choice%"=="30" (
    start ms-settings:recovery
    pause
)

if "%choice%"=="31" (
    bcdedit /set {default} safeboot minimal
    shutdown /r
    pause
)

if "%choice%"=="32" (
    wmic logicaldisk get size,freespace,caption
    pause
)

if "%choice%"=="33" (
    chkdsk
    pause
)

if "%choice%"=="34" (
    wmic diskdrive get status
    pause
)

if "%choice%"=="35" (
    wmic cpu get name,CurrentClockSpeed
    pause
)

if "%choice%"=="36" (
    echo RAM optimizasyonu için üçüncü parti yazılım kullanın.
    pause
)

if "%choice%"=="37" (
    wmic OS get FreePhysicalMemory
    pause
)

if "%choice%"=="38" (
    gpupdate /force
    pause
)

if "%choice%"=="39" (
    shutdown /s
    pause
)

if "%choice%"=="40" (
    shutdown /r
    pause
)

if "%choice%"=="41" (
    exit
)

REM === Yeni Eklenen Özellikler ===

if "%choice%"=="42" (
    set /p newname=Yeni bilgisayar adını girin: 
    wmic computersystem where name="%COMPUTERNAME%" call rename name="%newname%"
    if errorlevel 1 (
        echo Bilgisayar adı değiştirilemedi. Yönetici olarak çalıştırdığınızdan emin olun.
    ) else (
        echo Bilgisayar adı değiştirildi. Yeniden başlatmanız gerekebilir.
    )
    pause
)

if "%choice%"=="43" (
    echo IP Adresi ve Alt Ağ Maskesi:
    ipconfig | findstr /i "IPv4 Subnet"
    pause
)

if "%choice%"=="44" (
    echo 1. Ağ Bağlantısını Etkinleştir
    echo 2. Ağ Bağlantısını Devre Dışı Bırak
    set /p netchoice=Seçiminizi yapın (1 veya 2): 
    set /p adapter=Adaptör adını girin: 
    if "%netchoice%"=="1" (
        netsh interface set interface name="%adapter%" admin=ENABLED
        if errorlevel 1 (
            echo Ağ bağlantısı etkinleştirilemedi. Adaptör adını kontrol edin.
        ) else (
            echo "%adapter%" etkinleştirildi.
        )
    ) else if "%netchoice%"=="2" (
        netsh interface set interface name="%adapter%" admin=DISABLED
        if errorlevel 1 (
            echo Ağ bağlantısı devre dışı bırakılamadı. Adaptör adını kontrol edin.
        ) else (
            echo "%adapter%" devre dışı bırakıldı.
        )
    ) else (
        echo Geçersiz seçim.
    )
    pause
)

if "%choice%"=="45" (
    netstat -an
    pause
)

if "%choice%"=="46" (
    echo 1. Hizmeti Başlat
    echo 2. Hizmeti Durdur
    echo 3. Hizmeti Yeniden Başlat
    set /p servicechoice=Seçiminizi yapın (1, 2 veya 3): 
    set /p servicename=Hizmet adını girin: 
    if "%servicechoice%"=="1" (
        net start "%servicename%"
        if errorlevel 1 (
            echo Hizmet başlatılamadı. Hizmet adını kontrol edin.
        ) else (
            echo "%servicename%" hizmeti başlatıldı.
        )
    ) else if "%servicechoice%"=="2" (
        net stop "%servicename%"
        if errorlevel 1 (
            echo Hizmet durdurulamadı. Hizmet adını kontrol edin.
        ) else (
            echo "%servicename%" hizmeti durduruldu.
        )
    ) else if "%servicechoice%"=="3" (
        net stop "%servicename%"
        net start "%servicename%"
        if errorlevel 1 (
            echo Hizmet yeniden başlatılamadı. Hizmet adını kontrol edin.
        ) else (
            echo "%servicename%" hizmeti yeniden başlatıldı.
        )
    ) else (
        echo Geçersiz seçim.
    )
    pause
)

if "%choice%"=="47" (
    eventvwr
    pause
)

if "%choice%"=="48" (
    set /p regpath=Yedeklemek istediğiniz kayıt defteri yolunu girin (örn. HKEY_CURRENT_USER\Software): 
    set /p backupname=Yedek dosya adını girin (örn. Backup): 
    reg export "%regpath%" "%backupname%.reg" >nul 2>&1
    if errorlevel 1 (
        echo Kayıt defteri yedeklenemedi. Yolun doğru olduğundan emin olun.
    ) else (
        echo Kayıt defteri "%backupname%.reg" olarak yedeklendi.
    )
    pause
)

if "%choice%"=="49" (
    set /p backupfile=Yedek dosya yolunu girin (.reg dosyası): 
    reg import "%backupfile%" >nul 2>&1
    if errorlevel 1 (
        echo Kayıt defteri geri yüklenemedi. Dosya yolunu ve dosya adını kontrol edin.
    ) else (
        echo Kayıt defteri "%backupfile%" olarak geri yüklendi.
    )
    pause
)

if "%choice%"=="50" (
    perfmon
    pause
)

if "%choice%"=="51" (
    net share
    pause
)

REM Çıkış için kontrol
if /i "%choice%"=="X" (
    exit
)

goto menu
