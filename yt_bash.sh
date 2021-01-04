#!/bin/bash



#************************************************************#
#************************************************************#
#Nama File: yt_bash.sh
#Dibuat : Minggu ,3 Jan 2021 10:46PM
#Oleh : Cheems.exe 
#Program Ini Dibawah lisensi GNU GPL v3
#Selesai : Senin ,4 Jan 2021 7:50PM
#************************************************************#
#************************************************************#
W='\033[1;37m'
Y='\033[1;33m'
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
os=`echo $OSTYPE`
cwd=`pwd`
yt_dl_link="https://yt-dl.org/downloads/latest/youtube-dl"
#
pass_download(){
	clear
	sleep 1.5
	echo $W --------------------------------------------------
	sleep 0.1
	echo
	echo $G [✓] Python,Wget Terinstall
	echo
	sleep 0.1
	echo $W --------------------------------------------------
	echo
	echo 
	echo $Y Mencheck youtube-dl.......
	sleep 1.5 
	if [ $yt_dl_status==True ]
	then
		echo $G [✓] Tidak Perlu Mendownload Youtube-dl
	else
		if [ $android==True ]
		then
			if [ $android_root_status==True ]
			then
				wget $yt_dl_link -O $bin_loc
				su -c chmod 777 $bin_loc/youtube-dl
			else
				wget $yt_dl_link -O $cwd
				chmod 777 $cwd/youtube-dl
			fi
		else
			if [ $linux==True ]
			then
				sudo wget $yt_dl_link -O $bin_loc
				sudo chmod 777 $bin_loc/youtube-dl
			fi
		fi
	fi
	sleep 1.5
	sleep 2
	clear
	inf
}
inf(){
	clear
	sleep 1
	sleep 1.5
        echo $W -------------------------------------------------
	sleep 0.1
	echo
	echo $G Youtube Downloader V1.0
	echo 
	sleep 0.1
	echo $W -------------------------------------------------
	sleep 0.1
	echo
	echo $G Terimakasih Telah Memilih Program ini!
	sleep 0.1
	echo
	echo $Y -Cheems.exe
	sleep 1.92
	main
}
bckdwn(){
	dwn
}
bauonly(){
	auonly
}
auonly(){
	clear
	sleep 1.59
	echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y
	figlet YT
	sleep 0.1
	echo $Y Audio Download
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo
	sleep 0.1
	echo 
	echo $W
	sleep 0.5
	read -p "Link > " ly
	sleep 0.1
	echo $Y
	read -p "Download ke > " to
	echo $W
	sleep 1
	read -p "Format (MP3/ogg) > " fr
	case $fr in
		MP3 | mp3 )
			if [ $android==True ]
			then
				if [ $android_root_status==True ]
				then
					if [ -d $to ]
					then
						cd $to
						youtube-dl -x -f bestaudio --audio-format mp3 $ly
						sleep 1
						echo $G [•] Selsai !
						sleep 1.95
						clear
						sleep 1
						dwn
					else
						echo $R [!] Destinasi $to Bukan direktori/tidak ada
					fi
				else
					if [ $android_root_status==False ]
					then
						if [ -d $to ]
						then
							./youtube-dl -x -f bestaudio --audio-format mp3 $ly
						else
							echo $R [!] Destinasi $to Bukan direktori/tidak ada
						fi
					fi
				fi
			else
				if [ $linux==True ]
				then
					if [ -d $to ]
					then
						youtube-dl -x -f bestaudio --audio-format mp3 $ly
					else
						echo $R [!] Destinasi $to Bukan direktroi/tidak ada
					fi
				fi
			fi
			;;
		ogg | OGG ) 
			if [ $android==True ]
			then
				if [ $android_root_status==True ]
				then
					if [ -d $to ]
					then
						cd $to
						youtube-dl -x -f bestaudio $ly
						sleep 1
						echo $G [•] Selesai !
						sleep 1.95
						clear
						sleep 1
						dwn
					else
						echo $R [!] Destinasi $to Bukan Direktroi/Atau Tidak ada 
					fi
				else
					if [ $android_root_status==False ]
					then
						if [ -d $to ]
						then
							./youtube-dl -x -f bestaudio $ly
							xz=`ls | grep '.ogg'`
							mv $xz $ly
							sleep 1
							echo $G [✓] Selesai
							clear
							sleep 1
							dwn
						else
							echo $R [!] Destinasi $to bukan direktori, atau tidak ada 
						fi
					fi
				fi
			else
				if [ $linux==True ]
				then
					if [ -d $to ]
					then
						cd $to
						youtube-dl -x -f bestaudio $ly
					else
						echo $R [!] Destinasi $to Bukan Direktori/Tidak ada 
					fi
				fi
			fi
			;;
		*) echo $R [!] Pilihan Invalid 
			sleep 1.58
			bauonly;;
	esac
}
vonly(){
	clear
	sleep 1.5 
	echo $B ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $W
	figlet YT
	sleep 0.1
	echo $W Download Video + Audio
	sleep 0.1
	echo $B ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo
	sleep 0.1
	echo $B
	read -p "Link > " lk
	sleep 0.5
	echo $B
	read -p "Download Ke > " to
	sleep 1
	echo
	echo $W Pilih Kualitas :
	sleep 0.1
	echo $R 1. Jelek
	echo
	sleep 0.1
	echo $G 2. Bamgus :v 
	sleep 0.5
	echo $B
	read -p "> " cq
	case $cq in
		1) 
		if [ $android==True ]
		then
			if [ $android_root_status==True ]
			then
				if [ -d $to ]
				then
					cd $to
					youtube-dl -f worst $lk
					sleep 1
					echo $G [•] Selesai !
					sleep 1
					dwn
				else
					echo $R [!] Destinasi $to Bukan direktori, Atau tidak ada
				fi
			else
				if [ $android_root_status==False ]
				then
					if [ -d $to ]
					then
						./youtube-dl -f worst $lk
						sleep 0.5
						xv=`ls | grep '.mkv'`
						xf=`ls | grep '.mp4'`
						if [ -f $xv ]
						then
							cp -i $xv $to
							rm -rf $xv
							echo $G [•] Selesai !
							sleep 2
							dwn 
						elif [ -f $xf ]
						then
							cp -i $xv $to
							rm -rf $xf
							echo $G [•] Selesai !
							sleep 2
							dwn
						else 
							echo $R [!] Format File tidak didukung, atau tidak diketahui
							sleep 2
							dwn
						fi
					else
						echo $R [!] Destinasi $to tidak ada, atau bukan direktori
						sleep 2
						dwn
					fi
				fi
			fi
		else
			if [ $linux==True ]
			then
				if [ -d $to ]
				then
					youtube-dl -f worst $lk
					sleep 0.5
					clear
					sleep 1
					echo $G [•] Selesai !
					sleep 1
					dwn
				else
					echo $R [!] Destinasi $to tidak ada, atau bukan direktori
				fi
			fi
		fi;;
	2)
		if [ $android==True ]
		then
			if [ $android_root_status==True ]
			then
				if [ -d $to ]
				then
					cd $to
					youtube-dl -f best $lk
					sleep 1
					clear
					echo $G [•] Sukses ! 
					sleep 1
					dwn
				else
					echo $R [!] Destinasi $to tidak ada,atau bukan direktori
				fi
			else
				if [ $android_root_status==False ]
				then
					if [ -d $to ]
					then
						./youtube-dl -f best $lk
						xv=`ls | grep '.mkv'`
						vx=`ls | grep '.mp4'`
						if [ -f $xv ]
						then
							cp -i $xv $to
							rm -rf $xv
							echo $G [•] Selesai !
							sleep 1.5
							dwn
						elif [ -f $vx ]
						then
							cp -i $vx $to
							rm -rf $vx
							echo $G [•] Selesai !
							sleep 1.5
							dwn
						else
							echo $R [!] Format File Tidak didukung, atau file tidak ada
						fi
					else
						echo $R [!] Destinasi $to tidak ada atau, bukan direktori
					fi
				fi
			fi
		fi
		;;
	*) echo $R [!] Pilihan Invalid 
		sleep 1.95
		dwn;;



esac
}
dwn(){
	clear
	sleep 1.5
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y
	figlet YT
	sleep 0.1
	echo $Y Download Menu 
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo 
	sleep 0.1
	echo $W "1 > Hanya Audio 		2 > Video + Audio "
	echo
	sleep 0.1
	echo
	echo $W "99 > Kembali"
	echo 
	echo $G
	read -p "> " auorv
	case $auorv in
		1) auonly;;
		2) vonly;;
		99)vbmeta;;
		*) echo $R [!] Pilihan Invalid 
			sleep 2
			bckdwp;;
	esac
	
}
bckdwp(){
	dwp
}

dwp(){
	clear
	sleep 2
	echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $W
	figlet YT
	sleep 0.1
	echo $W Playlist-Download
	sleep 0.1
	echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo
	echo $Y 
	read -p "Link Playlist : " lp
	echo $W
	sleep 0.1
	read -p "Download Ke : " to
	echo 
	sleep 1
	echo 
	if [ $linux==True ]
	then
		if [ -d $to ]
		then
			cd $to
			youtube-dl -f best $lp
		else
			echo $R [!] Destinasi $to Bukan direktori/tidak ada
		fi
	else
		if [ $android==True ] 
		then
			if [ -d $to ]
			then
				if [ $android_root_status==True ]
				then
					cd $to
					youtube-dl -f best $lp
					sleep 1
					echo $R  [•] Selesai !
					dwn
				else
					if [ $android_root_status==False ]
					then
						./youtube-dl -f best $lp
						xv=`ls | grep '.mkv'`
						xp=`ls | grep '.mp4'`
						if [ -f $xv ]
						then
							cp -i $xv $to
							rm -rf $xv
						elif [ -f $xp ]
						then
							cp -i $xp $to
							rm -rf $xp
						else
							echo [!] Format File Tidak Dikenal, atau tidak didukung
						fi
					fi
				fi
			else
				echo $R [!] Destinasi $to Bukan direktori/tidai ada 
				sleep 1
				bckdwp
			fi
		fi
	fi
}
ten(){
	clear
	sleep 1.5
	echo $G " -------------------------------"
	echo $G " Program Youtube Downloader v1.0"
	echo $G " -------------------------------"
	sleep 0.1
	echo $W " Program Ini Dibuat Oleh Cheems.exe"
	sleep 0.5
	echo $W " Program Ini Dibawah Lisensi GNU GPL v3"
	echo 
	echo
	echo $G " Kontrributor : "
	echo $W "  -https://github.com/M24-XT"
	echo $W "  -"
	echo 
	sleep 3
	vbmeta
}
vbmeta(){
	main
}
out(){
	clear
	sleep 1.5
	echo $G ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $W Dibuat Oleh Cheems.exe
	sleep 0.1
	echo $G ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 1
	clear
	sleep 1
	exit 
	return 0 
}
bsdw(){
	sdw
}
sdw(){
	clear
	sleep 1.5
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y
	figlet YT
	echo $Y Search Download
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 1
	echo
	echo $W
	read -p "Judul Video : " vt
	sleep 0.1
	echo
	read -p "Download Ke : " to
	echo
	if [ $android==True ]
	then
		if [ $android_root_status==True ]
		then
			if [ -d $to ]
			then
				cd $to
				youtube-dl -f best ytsearch:$vt
			else
				echo $R [!] Destinasi $to Bukan direktori/tidak ada 
			fi
		else
			if [ $android_root_status==False ]
			then
				if [ -d $to ]
				then
					./youtube-dl -f best ytsearch:$vt
					xn=`ls | grep '.mp4'`
					xv=`ls | grep '.mkv'`
					if [ -e $xn ]
					then
						cp -i $xn $to
					elif [ -e $xv ]
					then
						cp -i $xv $to
					else
						echo $R [!] Tidak Dapat memindahkan ke destinasi $to, format file tidak diketahui
					fi
				else
					echo $R [!] Destinasi $to Bukan Direkyori/tidak ada 
				fi
			fi
		fi
	else
		if [ $linux==True ]
		then
			if [ -d $to ]
			then
				youtube-dl -f best ytsearch:$vt
				xn=`ls | grep '.mp4'`
				xv=`ls | grep '.mkv'`
				if [ -f $xn ]
				then
					cp -i $xn $to
					rm -rf $xn
					echo $G [•] Selesai ! 
					sleep 1
					dwn
				elif [ -f $xv ]
				then
					cp -i $xn $to
					rm -rf $xn
					echo $G [•] Selesai !
					sleep 1
					dwn
				else
					echo $R [!] Format File tidak dikenal,tidak dapat memindahkan
					sleep 2
					dwn
				fi
			else
				echo $R [!] Destinasi $to tidak ada , atau bukan direktori
			fi
		fi
	fi
	
}
inf(){
	clear
	sleep 1.6
	echo $G ----------------------------
	sleep 0.1
	echo $W Youtube Downloader v1.3-bash
	sleep 0.1
	echo $G ----------------------------
	sleep 1
	echo 
	sleep 0.1
	echo $W Terimakasih Telah memilih program ini !
	echo
	sleep 1.52
	main 
}
main(){
	clear
	sleep 1.5
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y
	figlet YT 
	sleep 0.1
	echo $Y Downloader V1.3-bash
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo
	echo $G "1 > Download		2 > Download (Playlist)"
	echo
	echo
	sleep 0.1
	echo $G "3 > Tentang		4 > Search Download"
	echo
	echo
	echo $G "00 > Keluar"
	echo
	echo $G
	read -p "> " pil
	case $pil in
		1) dwn ;;
		2) dwp ;;
		3) ten ;;
		4) sdw ;;
		00) out ;;
		*) echo $R [!] Pilihan Invalid 
			sleep 1.5
			vbmeta
			;;
	esac
}
	
setup_download(){
	clear
	sleep 1.5
	echo $W --------------------------------------------------
        sleep 0.1
        echo
        echo $R [!] Python,Wget Belum Terinstall 
        echo
        sleep 0.1
        echo $W --------------------------------------------------
	echo
	echo
	echo $Y [•] Menjalankan Setup........
	sleep 2
	apt-get update -y
	apt-get upgrade -y
	apt-get install python
	apt-get install wget
	if [ $yt_dl_status==True ]
	then
		echo $G [✓] Tidak Perlu Download Youtube-dl
		sleep 2
		inf
	else
		if [ $android==True ]
		then
			if [ $android_root_status==True ]
			then
				wget $yt_dl_link -O $bin_loc
				su -c chmod 777 $bin_loc/youtube-dl
			else
				wget $yt_dl_link -O $cwd
				chmod 777 $cwd/youtube-dl
			fi
		else
			if [ $linux==True ]
			then
				sudo wget $yt_dl_link -O $bin_loc
				sudo chmod 777 $bin_loc/youtube-dl
			fi
		fi
	fi
				
	sleep 1.5
	clear
	sleep 0.5
	echo $G [✓] Selesai
	sleep 1
	inf
}

	
if [ $os===linux-android ]
then
	bin_loc=/data/data/com.termux/files/usr/bin
	py_stp_lib_loc=/data/data/com.termux/files/usr/lib/python3.9/site-packages/
	android=True
	if [ -f $bin_loc/python ] 
	then
		if [ -f $bin_loc/wget ]
		then
			if [ -f $bin_loc/figlet ]
			then
				pass_download
			else
				setup_download
			fi
		fi
	fi
elif [ $os==linux-gnu ]
then
	bin_loc=/usr/local/bin
	android=False
	linux=True
	py_stp_lib_loc=/usr/local/lib/python3.9/site-packages/
	if [ -f $bin_loc/python ]
	then
		if [ -f $bin_loc/wget ]
		then
			if [ -f $bin_loc/figlet ]
			then
				pass_download
			else
				setup_download
			fi
		fi
	fi
else
	echo $R OS Tidak Diketahui, Atau Belum didukung
fi
if [ $android==True ]
then
	if [ -f /sbin/su ]
	then
		android_root_status=True
	else
		android_root_status=False
	fi
fi
#cek youtube_dl
fimd_yt_cwd=`find $cwd -iname youtube-dl`                                     fimd_yt_bin=`find $bin_loc -iname youtube-dl`
fimd_yt_lib=`find $py_stp_lib_loc -type d -name youtube_dl`
if [ -f $fimd_yt_cwd ]
then
	if [ -d $fimd_yt_lib ]
	then
		yt_dl_status=True
	else
		yt_dl_status=False
	fi
elif [ -f $fimd_yt_bin ]
then
	if [ -d $fimd_yt_lib ]
	then
		yt_dl_status=True
	else
		yt_dl_status=False
	fi
fi
