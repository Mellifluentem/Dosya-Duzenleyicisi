#!/usr/bin/bash
#ÇALIŞMIYOR ISE /USR I SİLİN ARCH UZERINDEN YAZDIGIM İÇİN ÇALIŞMADI
#directory kontrol
cd "$(dirname "$0")"
#makedirectory
mkdir -p metinler
mkdir -p resimler
#tarih ve ne kadar dosya atıldı sayacı
metin_sayac=0
resim_sayac=0
islem_tarihi=$(date +'%d-%m-%Y %H:%M')
#asıl loop ve aykırı türler
for dosya in ./*; do

    if [ -f "$dosya" ] && [[ "$dosya" != *"DosyaDüzenleyicisi.sh"* ]]; then

        uzanti="${dosya##*.}"

        case "$uzanti" in
            txt|doc)
                mv "$dosya" metinler/
                ((metin_sayac++))
                echo "$dosya: metinler dizinine taşındı"
                ;;
            jpg|png|jpeg)
                mv "$dosya" resimler/
                ((resim_sayac++))
                echo "$dosya: resimler dizinine taşındı"
                ;;
            *)

                echo "Atlanıyor: $(basename "$dosya") (Bilinmeyen tür)"
                ;;
        esac
    fi
done
#yazı kısıımı ve taşınanları listeleme
echo "İşlem Tamamlandı:"
echo "$metin_sayac metin dosyası taşındı."
echo "$resim_sayac resim dosyası taşındı."
echo "İşlem Tarihi: $islem_tarihi"

echo "metinler dizini:"
ls -l metinler

echo "resimler dizini:"
ls -l resimler
