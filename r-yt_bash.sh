#!/bin/bash



#############################################################
#-----------------------------------------------------------#
#							    #
#  		YOUTUBE DOWNLOADER V1.5-rev1		    #
#   PROGRAM INI DIBUAT PADA TANGGAL 8 JANUARI 2021	    #
#   Dibuat Oleh : CheemsXT© 				    #
#   Program Ini dibawah Lisensi GNU GPL v3		    #
#   							    #
#-----------------------------------------------------------#
#############################################################

W='\033[1;37m' #White / Putih
Y='\033[1;33m' #Yellow / Kuning
R='\033[1;31m' #Red / Merah
G='\033[1;32m' #Green / Hijau
B='\033[1;34m' #Blue (cyan) / biru :v

cwd=`pwd` #Direktori Saat ini 

vers="v1.5-rev1" # Versi 

invalid="[!] Pilihan Invalid " #Jika pilihan invalid

nodir="[!] Direktori $d Tidak ada" #Jika Direktori tidak ada atau bukan file

os=`echo $OSTYPE` #Untuk menentukan os, bisa memakai perintah cat juga

# Fungsi Keluar
out(){
	clear
	sleep 1.69420
	echo $Y "-----------------------------------------------------------"
	sleep 0.1
	echo $G " DIBUAT OLEH CheemsXT"
	sleep 0.1
	echo $Y "-----------------------------------------------------------"
	clear
	sleep 1.5
	exit
}
#Fungsi Menu, Download

main(){
	clear
	sleep 1.5
	while true 
	do
		clear 
		sleep 1.5
	echo $Y "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	sleep 0.1
	echo $Y
	figlet YT
	sleep 0.1
	echo $Y "Main Menu  | $vers"
	sleep 0.1
	echo $Y "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	sleep 1
	echo
	echo $W "1 - Download 		2 - Search Download "
	echo
	sleep 0.1
	echo $W "3 - Playlist Download	4 - Tentang"
	sleep 0.1
	echo
	echo $W "0 - Keluar "
	sleep 0.1
	echo $G 
	read -p " > " p
	case "$p" in
		1) download ;;
		2) sdownload;;
		3) pdownload;;
		4) about;;
		0) out;;
		*) echo $R $invalid 
			sleep 1.69420
			;;
	esac
done

}
inf(){
	clear
	sleep 2.69420
	echo $W "------------------------------"
	sleep 0.1
	echo $G "Youtube Donwloader $vers"
	sleep 0.1
	echo $W "------------------------------"
	echo
	echo $Y "Terimakasih Telah memilih ! "
	sleep 2.69420
	main
}
about(){
	clear 
	sleep 1.69420
	echo $W "******************************"
	sleep 0.1
	echo $Y " Youtube Downloader $vers"
	sleep 0.1
	echo $Y "      By CheemsXT"
	sleep 0.1
	echo $W "******************************"
	sleep 2.69420
	main 
}
download(){
	clear
	sleep 1.69420
	while true 
	do
		clear
		sleep 1.69420
	echo $Y "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	sleep 0.1
	echo $W
	figlet YT
	sleep 0.1
	echo $G "Download Menu | $vers"
	sleep 0.1
	echo $Y "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo
	sleep 1.69
	echo $G " 1 - Hanya Audio		2 - Audio + Video"
	echo
	sleep 0.1
	echo $G " 0 - Kembali"
	echo $B
	sleep 0.5
	read -p " > " dp
	case "$dp" in
		1) audio_only;;
		2) normal ;;
		0) main ;;
		*) echo $R $invalid
			sleep 2.69420
			;;
	esac
done
}
#Fungsi Download
smusik(){
	#Download Musik (Search)
	cd $d
	youtube-dl -x -f bestaudio --audio-format mp3 ytsearch:$s
	sleep 0.5
	echo $G "[✓] Selesai "
	sleep 1.69420	
	download
}
svideo(){
	#Download Video (Search) Format : mkv/MP4
	cd $d 
	youtube-dl -f best ytsearch:$s
	sleep 0.5
	echo $G "[✓] Selesai"
	sleep 1.69420
	download
}
ndownload(){
	#Download Video - Normal MP4/mkv
	cd $d 
	youtube-dl -f best $l
	sleep 0.5
	echo $G '[✓] Selesai '
	sleep 1.69420
	download
}
mp3_adownload(){
	#Download MP3 
	cd $d 
	youtube-dl -x -f bestaudio --audio-format mp3 $l
	sleep 0.5
	echo $G "[!] Selesai" 
	sleep 1.69420
	download
}
ogg_adownload(){
	#Download OGG(seperti mp3)
	cd $d
	youtube-dl -f bestaudio $l
	sleep 0.5
	echo $G "[✓] Selesai "
	sleep 1.69420
	download
}
music_pdownload(){
	#Download Playlist Format Musik MP3
	cd $d
	youtube-dl -x -f bestaudio --audio-format mp3 $l
	sleep 0.5
	echo $G "[✓] Selesai "
	sleep 1.69420
	download
}
vid_pdownload(){
	#Download Playlist Format Video MP4/mkv
	cd $d 
	youtube-dl -f best $l
	sleep 0.5
	echo $G "[✓] Selesai "
	sleep 1.69420
	download
}
#Funsi Menu Download
normal(){
	clear
	sleep 1.69420
	while true
	do
		clear
		sleep 1.69420
	echo $G "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	sleep 0.1
	echo $Y
	sleep 0.1
	figlet YT
	sleep 0.1
	echo $W "Video + Audio Download | $vers"
	sleep 0.1
	echo $G "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo $B
	sleep 1
	read -p "Link -> " l
	echo $W
	sleep 0.5
	read -p "Download ke -> " d
	sleep 1.5
	# Cek Direktori
	if [ -d $d ]; then
		ndownload
	else
		echo $R $nodir
		sleep 1.69420
	fi
done
}
audio_only(){
	clear
	sleep 1.69420
	while true
	do
		clear
		sleep 1.69420
	echo $G "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	sleep 0.1
	echo $W
	sleep 0.1
	figlet YT
	sleep 0.1
	echo $Y "Audio Download | $vers"
	sleep 0.1
	echo $G "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo $Y
	sleep 1
	read -p "Link -> " l
	echo $G
	sleep 0.5
	read -p "Download ke -> " d
	echo $W
	sleep 0.5
	read -p "Format (MP3/ogg)-> " f
	case $f in
		MP3 | mp3 ) 
			if [ -d $d ]; then
				mp3_adownload
			else
				echo $R $nodir
				sleep 1.69420
			fi
			;;
		ogg | OGG) 
			if [ -d $d ];then
				ogg_adownload
			else
				echo $R $nodir
				sleep 1.69420
			fi
			;;
		*) echo $R $invalid
			sleep 1.69420
			;;
	esac
done
}
sdownload(){
	clear
	sleep 1.69420
	while true
	do
		clear
		sleep 1.69420
	echo $W "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	sleep 0.1
	echo $Y
	sleep 0.1
	figlet YT
	sleep 0.1
	echo $B "Search Download | $vers"
	sleep 0.1
	echo $W "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo $G
	sleep 1
	read -p "Search -> " s
	echo $W
	sleep 0.5
	read -p "Download ke -> " d
	echo $G
	sleep 0.5
	read -p "Format (Musik/Video) -> " f
	case $f in
		Musik | musik) 
			if [ -d $d ]; then
				smusik
			else
				echo $R $nodir
				sleep 1.69420
			fi
			;;
		Video | video) 
			if [ -d $d ]; then
				svideo
			else
				echo $R $nodir
				sleep 1.69420
			fi
			;;
		*) echo $R $invalid 
			sleep 1.69420
			;;
	esac
done
}
pdownload(){
	clear
	sleep 1.79420
	while true
	do
		clear
		sleep 1.69420
	echo $W "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	sleep 0.1
	echo $B
	sleep 0.1
	figlet YT
	sleep 0.1
	echo $G "Playlist Download | $vers"
	sleep 0.1
	echo $W "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	echo $G
	sleep 1
	read -p "Link-> " l
	sleep 0.5
	echo $W
	read -p "Download ke-> " d
	sleep 0.5
	echo $G
	read -p "Format(Musik/Video)-> " f
	case $f in
		Musik | musik ) 
			if [ -d $d ]; then
				music_pdownload
			else
				echo $R $nodir
				sleep 1.69420
			fi
			;;
		video | vidio | Video | Vidio)
			if [ -d $d ]; then
				vid_pdownload
			else
				echo $R $nodir
				sleep 1.69420
			fi
			;;
		*) echo $R $invalid
			sleep 1.69420
			;;
	esac
done
}
pass_check(){
	# Jika Lolos Cek package
	clear
	sleep 1.69
	echo $Y "-----------------------------------------------------------"
	sleep 0.1
	echo $G " [✓] Tidak Perlu Setup."
	sleep 0.1
	echo $Y "-----------------------------------------------------------"
	echo
	sleep 2.69420
	inf
}
#Unduh Package
setup_dulu(){
	apt-get update
	sleep 0.5
	clear
	apt-get upgrade -y
	sleep 0.5
	clear
	apt-get install python python2 -y
	sleep 0.5
	clear
	apt-get install ffmpeg
	sleep 0.5
	clear
	pip install youtube-dl
	sleep 0.5
	clear
	inf
}
setup(){
	# Jika Tidak lolos Cek package
	clear
	sleep 1.69
	echo $Y "-----------------------------------------------------------"
	sleep 0.1
	echo $R " [!] Diperlukan setup."
	sleep 0.1
	echo $Y "-----------------------------------------------------------"
	echo 
	echo $Y "Menjalankan Setup......."
	sleep 1.69420
	setup_dulu
}
define_os(){
	# Menentukan OS untuk Cek package
	if [ $os==linux-android ]; then 
		bin=/data/data/com.termux/files/usr/bin
	elif [ $os==linux-gnu ]; then #jika blok if false
		bin=/usr/local/bin
	else 
		echo $R "OS tdk didukung atau tidak diketahui"
	fi
}
cek_package(){
	#Cek Package Agar script berjalan dengan lancar
	if [ -f $bin/python ];then
		if [ -f $bin/figlet ];then
			if [ -f $bin/ffmpeg ];then
				if [ -f $bin/youtube-dl ]; then
					pass_check
				else
					setup
				fi
			fi
		fi
	fi
	# Informasi :
	# Bahwa, Jika tidak mendownload salah satu, maka tetap jatuh kepada else, artinya tetap memerlukan setup.
}


# Eksekusi , Tentukan OS

define_os

# Eksekusi Kedua setelah menentukan os, cek package

cek_package

#
