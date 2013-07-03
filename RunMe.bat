@echo off
SETLOCAL
REM  The Universal Kindle Fire First Aide is Protected by Copyright.
REM  Please Do NOT Distribute The Tool Without Authorization. Do NOT
REM   Make Copies Of This Tool Nor Use This Tool In A Manner It Was
REM   Not Designed. Do Not Attempt To Change This File In Any Way
REM             You May Contact Us Through Email
REM         support@canonicaldev.com - Thank You For The
REM     Support! Phone is 707-774-5923 In The United States
REM       This Is Revision 100 Dated 06/30/2013
mode con:cols=90 lines=56
SET path=%~dp0;%path%

color 2
:menu
cd %~dp0
cls
ECHO **********************************
ECHO * PLEASE PLUG THE USB CABLE INTO *
ECHO * THE KINDLE, THEN PLUG INTO A   *
ECHO *   USB SLOT ON YOUR COMPUTER.   *
ECHO *ALTHOUGH WE TAKE EXTENSIVE STEPS*
ECHO *TO PERFECT THIS SOFTWARE, PLEASE*
ECHO *  NOTE THERE IS A RISK INVOLVED *
ECHO * WHEN DEPLOYING SOFTWARE TO THE *
ECHO * KINDLE. IF YOU DO NOT AGREE TO *
ECHO * THIS RISK, PLEASE EXIT THIS    *
ECHO *      SOFTWARE IMMEDIATELY.     *
ECHO * DO NOT POST AN ANGRY EMAIL IF  *
ECHO *     SOMETHING GOES WRONG       *
ECHO *    !!!!PLEASE USE THIS!!!!     *
ECHO *!!UTILITY WITH EXTREME CAUTION!!*
ECHO **********************************
ECHO.
set /p unr=DO YOU UNDERSTAND THIS RISK (y/n) ?
IF %unr% == n GOTO exit
CLS
echo.
color 2
echo.

ECHO --------------------------------------------------------------------
ECHO              Kindle Fire First Aide Version 4.1.88-Beta
ECHO      For The Kindle Fire HD 7, 8.9 And The Kindle Fire 2nd Gen
ECHO            Please Choose The Device We Are Working With
ECHO --------------------------------------------------------------------

ECHO 1.  Device Diagnostics (Safe)                         (ADB Fastboot)
ECHO 2.  Kindle Fire 2nd Gen
ECHO 3.  Kindle Fire HD 7"
ECHO 4.  Kindle Fire HD 8.9"
ECHO 5.  Rooting/UnRooting
ECHO 6.  Backups
ECHO 7.  Extras
ECHO 8.  Drivers
ECHO 9.  Device Diagnostics (Root Required)
ECHO 10. [DISABLED] CAUTION: INSTALL 2ND BOOTLOADER (TWRP)
ECHO 0.  Exit
ECHO --------------------------------------------------------------------

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO exit
IF /I '%INPUT%'=='1' GOTO diagmenu
IF /I '%INPUT%'=='2' GOTO kf2ndmenu
IF /I '%INPUT%'=='3' GOTO kfhd7menu
IF /I '%INPUT%'=='4' GOTO kfhd89menu
IF /I '%INPUT%'=='5' GOTO rootmenu
IF /I '%INPUT%'=='6' GOTO backupmenu
IF /I '%INPUT%'=='7' GOTO extrasmenu
IF /I '%INPUT%'=='8' GOTO driversmenu
IF /I '%INPUT%'=='9' GOTO diag2menu
IF /I '%INPUT%'=='10' GOTO bootloadermenu
REM IF /I '%INPUT%'=='10' (
REM echo.
REM ECHO *****************************************************
REM ECHO *Option Temporarily disabled till stability improved*
REM ECHO *****************************************************
REM echo.
REM CALL:sleep 5
REM GOTO menu
REM )


:diagmenu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *            Diagnostics Listing                   *
ECHO ****************************************************

ECHO 1.  Ready to Test ADB Communication                            (ADB)
ECHO 2.  Reboot The Kindle Into Fastboot Mode (Preferred Method)    (ADB)
ECHO 3.  Reboot The Kindle Into Fastboot Mode (Alternative Method)  (ADB)
ECHO 4.  Display the Fastboot Status                           (Fastboot)
ECHO 5.  Reboot The Kindle Into Normal Boot Mode               (Fastboot)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO menu
IF /I '%INPUT%'=='1' GOTO TESTADB
IF /I '%INPUT%'=='2' GOTO FASTBOOTPREFERRED
IF /I '%INPUT%'=='3' GOTO FASTBOOTALT
IF /I '%INPUT%'=='4' GOTO FASTBOOTSTATUS
IF /I '%INPUT%'=='5' GOTO FASTBOOTREBOOT

:kf2ndmenu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *           Kindle Fire 2nd Gen Listing            *
ECHO ****************************************************

ECHO 1.  Completely Restore the Kindle Fire 2nd Gen  10.2.3    (Fastboot)
ECHO 2.  Completely Restore the Kindle Fire 2nd Gen  10.2.1    (Fastboot)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO menu
IF /I '%INPUT%'=='1' GOTO RESTOREKF2-10-2-3
IF /I '%INPUT%'=='2' GOTO RESTOREKF2-10-2-1

:kfhd7menu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *             Kindle Fire HD 7" Listing            *
ECHO ****************************************************

ECHO 1.  Completely Restore the KFHD 7    7.2.3                (Fastboot)
ECHO 2.  Completely Restore the KFHD 7    7.2.1                (Fastboot)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO menu
IF /I '%INPUT%'=='1' GOTO RESTOREKFHD7-7-2-3
IF /I '%INPUT%'=='2' GOTO RESTOREKFHD7-7-2-1

:kfhd89menu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *           Kindle Fire HD 8.9" Listing            *
ECHO ****************************************************

ECHO 1.  Completely Restore the KFHD 8.9  8.2.1                (Fastboot)
ECHO 2.  Completely Restore the KFHD 8.9  8.2.3                (Fastboot)
ECHO 3.  Completely Restore the KFHD 8.9  8.2.4                (Fastboot)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO menu
IF /I '%INPUT%'=='1' GOTO RESTOREKFHD8-8-2-1
IF /I '%INPUT%'=='2' GOTO RESTOREKFHD8-8-2-3
IF /I '%INPUT%'=='3' GOTO RESTOREKFHD8-8-2-4

:rootmenu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *              Root/UnRoot Listing                 *
ECHO ****************************************************

ECHO 1.  Root The Kindle Fire - Method 1 (Older Kindle)             (ADB)
ECHO 2.  Root The Kindle Fire - Method 2 (Preferred)                (ADB)
ECHO 3.  UnRoot The Kindle - Do This Before Sending Back To Amazon  (ADB)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO menu
IF /I '%INPUT%'=='1' GOTO ROOT-OLD
IF /I '%INPUT%'=='2' GOTO ROOT-PREFERRED
IF /I '%INPUT%'=='3' GOTO UNROOT


:backupmenu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *                 Backup Listing                   *
ECHO ****************************************************

ECHO 1.  Backup The Entire Kindle To The KindleBackup Folder        (ADB)
ECHO 2.  Backup Three Kindle Images To The Backup Folder            (ADB)
ECHO 3.  Erase the Kindle Cache and User Data                  (Fastboot)
ECHO 4.  Restore The Kindle From The KindleBackup Folder       (Fastboot)
ECHO 5.  Restore The Kindle From The Backup Folder             (Fastboot)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO menu
IF /I '%INPUT%'=='1' GOTO BACKUP-FULL
IF /I '%INPUT%'=='2' GOTO BACKUP-3
IF /I '%INPUT%'=='3' GOTO ERASEKINDLE
IF /I '%INPUT%'=='4' GOTO RESTORE-FULL
IF /I '%INPUT%'=='5' GOTO RESTORE-3

:extrasmenu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *                 Extras Listing                   *
ECHO ****************************************************

ECHO 1.  Disable Amazon OTA Updates                                 (ADB)
ECHO 2.  Enable Amazon OTA Updates                                  (ADB)
ECHO 3.  Disable Amazon Ad Services                                 (ADB)
ECHO.
ECHO 4.  Install Google Play Store (Android Market) v3.10.10        (ADB)
ECHO 5.  Make Google Play Your Default Market                       (ADB)
ECHO 6.  Install Google Apps - ICS or Jelly Bean                    (ADB)
ECHO.
ECHO 7.  Install Sony xLoud and ClearAudio+ Audio Upgrade           (ADB)
ECHO 8.  Install Sony Bravia Engine 2 Video Upgrade                 (ADB)
ECHO 9.  Install Pimp My Beats� Audio Upgrade                       (ADB)
ECHO 10. Install Lock Screen and Disable The Original Lock Screen   (ADB)
ECHO.
ECHO 11. Install ADW Launcher v1.3.3.8 Stable Version               (ADB)
ECHO 12. Install Holo Launcher HD v2.0.2 Stable Version             (ADB)
ECHO.
ECHO 13. Install Boat Browser Flash Player And Instagram            (ADB)
ECHO 14. Install VPN And SIP/VoIP Client Software                   (ADB)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO menu
IF /I '%INPUT%'=='1' GOTO OTA-DISABLE
IF /I '%INPUT%'=='2' GOTO OTA-ENABLE
IF /I '%INPUT%'=='3' GOTO ADS-DISABLE
IF /I '%INPUT%'=='4' GOTO INSTALL-PLAYSTORE
IF /I '%INPUT%'=='5' GOTO DEFAULT-PLAYSTORE
IF /I '%INPUT%'=='6' GOTO INSTALL-GAPPS
IF /I '%INPUT%'=='7' GOTO INSTALL-SONYAUDIO
IF /I '%INPUT%'=='8' GOTO INSTALL-SONYVIDEO
IF /I '%INPUT%'=='9' GOTO INSTALL-BEATS
IF /I '%INPUT%'=='10' GOTO INSTALL-LOCK
IF /I '%INPUT%'=='11' GOTO INSTALL-ADW
IF /I '%INPUT%'=='12' GOTO INSTALL-HOLO
IF /I '%INPUT%'=='13' GOTO INSTALL-BOAT
IF /I '%INPUT%'=='14' GOTO INSTALL-VPN

:driversmenu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *                  Drivers Listing                 *
ECHO ****************************************************

ECHO 1. Install Amazon ADB Driver (Preferred)                    (DRIVER)
ECHO 2. Install Universal ADB Driver (Alternative)               (DRIVER)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO menu
IF /I '%INPUT%'=='1' GOTO DRIVER-PREFERRED
IF /I '%INPUT%'=='2' GOTO DRIVER-ALT

:diag2menu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *        Diagnostics Listing (Root Required)       *
ECHO ****************************************************

ECHO 1.  Fix The Android System Permissions And Anomalies           (ADB)
ECHO.
ECHO 2.  Fix Sluggish Kindle With Flashing Screen                   (ADB)
ECHO.
ECHO 3.  Upgrade Superuser To The Latest Stable Version             (ADB)
ECHO 4.  Upgrade Busybox (Symbolic) To The Latest Stable Version    (ADB)
ECHO.
ECHO 5.  Install ChainFire 3D (Improves 3D Performance)             (ADB)
ECHO.
ECHO 6.  Fix Broken Installation - Use Under Guidance               (ADB)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='0' GOTO menu
IF /I '%INPUT%'=='1' GOTO FIX-PERMISSIONS
IF /I '%INPUT%'=='2' GOTO FIX-FLASHING
IF /I '%INPUT%'=='3' GOTO UPGRADE-SU
IF /I '%INPUT%'=='4' GOTO UPGRADE-BUSYBOX
IF /I '%INPUT%'=='5' GOTO INSTALL-CHAINFIRE
IF /I '%INPUT%'=='6' GOTO FIX-INSTALLATION

:bootloadermenu
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO *            TWRP Bootloader Listing               *
ECHO ****************************************************

ECHO 1.  Kindle Fire 2nd-bootloader + TWRP 2.4.4.0 for KFHD 7       (ADB)
ECHO 2.  Kindle Fire 2nd-bootloader + TWRP 2.4.4.0 for KF2          (ADB)
ECHO 3.  Kindle Fire 2nd-bootloader + TWRP 2.4.4.0 for KFHD 8.9     (ADB)
ECHO 0.  [Back to Menu]

SET INPUT=
SET /P INPUT=Select an option:
IF /I '%INPUT%'=='1' GOTO TWRPKFHD7
IF /I '%INPUT%'=='0' GOTO menu

:RESTOREKF2-10-2-3
echo.
cls
echo.
COLOR 2
echo.
ECHO ********************************************************
ECHO *This Option Will Use Fastboot To Flash Software To The*
ECHO *Kindle Fire 2. This Option Will Flash Software Version*
ECHO *  10.2.3 To The Following Three Partitions Boot,      *
ECHO *   Recovey And System Then, We Will Wrap Up The       *
ECHO * Process By Clearing The User Data And Davlik Cache.  *
ECHO ********************************************************
echo.
echo.
PAUSE
echo.
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Restore The Kindle Fire 2 To 10.2.3?" RESTOREKF2-10-2-3.0 RESTOREKF2-10-2-3.5

:RESTOREKF2-10-2-3.0
echo.
cls
echo.
COLOR 2
echo.
ECHO ***********************************************
ECHO *You Have A Kindle Fire 2 7  Plugged In To USB*
ECHO * Using Either The Original USB Cable Or The  *
ECHO *    Factory USB Cable Correct ???????        *
ECHO ***********************************************
echo.
PAUSE
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Sure You Want To Proceed? This Operation Wipes The User Data!" RESTOREKF2-10-2-3.1 RESTOREKF2-10-2-3.5

:RESTOREKF2-10-2-3.1
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Into Fastboot?" RESTOREKF2-10-2-3.2 RESTOREKF2-10-2-3.4

:RESTOREKF2-10-2-3.2
echo.
cls
echo.
echo.
COLOR 2
ECHO *****************************************
ECHO *   Please Power On The Kindle Fire 2   *
ECHO *Then Plug The Mini USB In To The Kindle*
ECHO *  And The Other End To The Computer    *
ECHO *****************************************
echo.
PAUSE
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Fire 2 7 Must Be Power On To The Desktop." RESTOREKF2-10-2-3.3 RESTOREKF2-10-2-3.2

:RESTOREKF2-10-2-3.3
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ***********************************************************
ECHO *  The Kindle Fire 2 Will Now Reboot In Fastboot Mode!    *
ECHO *    This Process Will Fail If You Do Not Have Root       *
ECHO *Installed On The Kindle Or If The Bootloader Is Damaged  *
ECHO * Be Sure To Pay Attention To The Kindle For A Superuser  *
ECHO *   Popup, Please Click Grant Or Allow, Otherwise This    *
ECHO *               Process Will Fail!                        *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************
ECHO *We have Enabled Fastboot on the Kindle Fire, *
ECHO *Please Verify The Kindle Is In Fastboot Mode *
ECHO *In Some Rare Cases The Kindle Fire Bootloader*
ECHO *Is Damaged And Requires A Factory USB Cable  *
ECHO *To Boot The Kindle Fire 2 Into Fastboot Mode *
ECHO ***********************************************
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == y GOTO RESTOREKF2-10-2-1.4
echo.
ECHO ******************************************************
ECHO *Sorry, It Appears You Need A Factory USB Cable Since*
ECHO *  The Device Is Not Responding To Our Command To    *
ECHO * Boot Into Fastboot Mode. Send A PM To Prokennexusa *
ECHO *           To Order A Factory USB Cable             *
ECHO ******************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
echo.
CALL:menu

:RESTOREKF2-10-2-3.4
echo.
cls
echo.
color 2
echo.
mkdir kf2\10.2.3 2>nul
cd kf2\10.2.3
REM del \KFFirstAide\boot.img
REM del \KFFirstAide\recovery.img
REM del \KFFirstAide\system.img
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
color 2
echo.
ECHO ************************************************
ECHO *Please wait while I Download The 3 Images.....*
ECHO ************************************************
echo.
echo.
ECHO *****************************************************
ECHO *Get A Cup Of Coffee, This May Take A While.........*
ECHO *****************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kf2-10.2.3/images/boot-prod.img
..\..\wget -Oboot-prod.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/xkeg3c5lqkmjx907qdwf.md5
..\..\md5 "boot-prod.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Oboot-prod.img -q --no-check-certificate https://xerocomm.box.com/shared/static/m42lrkiark6v5k1fyvw6.img
)
..\..\md5 "boot-prod.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO ************************************************************
ECHO *I have fetched the boot.img - 2 more to download..........*
ECHO ************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kf2-10.2.3/images/recovery-prod.img
..\..\wget -Orecovery-prod.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/1l7ux3evvwbdna90gl2o.md5
..\..\md5 "recovery-prod.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Orecovery-prod.img -q --no-check-certificate https://xerocomm.box.com/shared/static/cl2p2hfi3m0fonvgmzxb.img
)
..\..\md5 "recovery-prod.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)


echo.
ECHO **********************************************************************
ECHO *I have fetched the recovery.img - 1 more to download................*
ECHO **********************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kf2-10.2.3/images/system.img
..\..\wget -Osystem.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/8n4czj1dnbtnpamlgygv.md5
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Osystem.img -q --no-check-certificate https://xerocomm.box.com/shared/static/bmpiqcz2bybf7q38ox86.img
)
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)


echo.
ECHO *******************************************************************************************
ECHO *We Have Downloaded The Recovery - We Are Ready To Flash The 3 Images.....................*
ECHO *******************************************************************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
fastboot -i 0x1949 flash boot boot-prod.img
fastboot -i 0x1949 flash recovery recovery-prod.img
fastboot -i 0x1949 flash system system.img
fastboot -i 0x1949 -w
fastboot -i 0x1949 reboot
echo.
echo.
COLOR 2
echo.
ECHO ******************************************
ECHO *Success!!! The Kindle Fire 2 7  Has Been*
ECHO *  Restored To Software Version 10.2.3   *
ECHO ******************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
COLOR 4
echo.
ECHO ******************************************************************
ECHO * Please Unplug the Kindle Fire 2 From USB and Reboot The Kindle *
ECHO *  By Holding The Power Button Down For 20 Seconds Then Release  *
ECHO * For 5 Seconds And Depress The Power Button Again For 2 Seconds *
ECHO *Do Not Forget To Disable OTA Before Connecting To It To Wireless*
ECHO ******************************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cd %~dp0
echo.
cls
echo.
CALL:menu

:RESTOREKF2-10-2-3.5
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ********************************************
ECHO *The Operation To Restore The Kindle Fire 2*
ECHO *    Was Canceled By The User!            *
ECHO ********************************************
echo.
PAUSE
echo.
adb kill-server
echo.
cd %~dp0
echo.
cls
echo.
CALL:menu

:RESTOREKF2-10-2-1
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ********************************************************
ECHO *This Option Will Use Fastboot To Flash Software To The*
ECHO *Kindle Fire 2. This Option Will Flash Software Version*
ECHO *  10.2.1 To The Following Three Partitions Boot,      *
ECHO *   Recovey And System Then, We Will Wrap Up The       *
ECHO * Process By Clearing The User Data And Davlik Cache.  *
ECHO ********************************************************
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Restore The Kindle Fire HD 2 7 To 10.2.1?" RESTOREKF2-10-2-1.0 RESTOREKF2-10-2-1.5

:RESTOREKF2-10-2-1.0
echo.
cls
echo.
color 2
echo.
ECHO **************************************************
ECHO * You Have A Kindle Fire 2 7  Plugged In To USB  *
ECHO *Using The Orginal Or Factory USB Cable, Correct?*
ECHO * The Rollback Feature Is Experimental On The    *
ECHO *Kindle Fire 2, If This Fails Go Back To 10.2.3  *
ECHO **************************************************
echo.
echo.
PAUSE
echo.
COLOR 4
echo.
CALL:yesno "Are You Sure You Want To Proceed? This Operation Wipes The User Data!" RESTOREKF2-10-2-1.1 RESTOREKF2-10-2-1.6

:RESTOREKF2-10-2-1.1
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Into Fastboot?" RESTOREKF2-10-2-1.2 RESTOREKF2-10-2-1.4

:RESTOREKF2-10-2-1.2
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************
ECHO *  Please Power On The Kindle Fire 2     *
ECHO *Then Plug The Mini USB In To The Kindle *
ECHO *  And The Other End To The Computer     *
ECHO ******************************************
echo.
PAUSE
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Must Be Powered On To The Desktop" RESTOREKF2-10-2-1.3 RESTOREKF2-10-2-1.2

:RESTOREKF2-10-2-1.3
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ***********************************************************
ECHO *  The Kindle Fire 2 Will Now Reboot In Fastboot Mode!    *
ECHO *    This Process Will Fail If You Do Not Have Root       *
ECHO *Installed On The Kindle Or If The Bootloader Is Damaged  *
ECHO * Be Sure To Pay Attention To The Kindle For A Superuser  *
ECHO *   Popup, Please Click Grant Or Allow, Otherwise This    *
ECHO *               Process Will Fail!                        *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************
ECHO *We have Enabled Fastboot on the Kindle Fire, *
ECHO *Please Verify The Kindle Is In Fastboot Mode *
ECHO *In Some Rare Cases The Kindle Fire Bootloader*
ECHO *Is Damaged And Requires A Factory USB Cable  *
ECHO *To Boot The Kindle Fire 2 Into Fastboot Mode *
ECHO ***********************************************
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == y GOTO RESTOREKF2-10-2-1.4
echo.
ECHO ******************************************************
ECHO *Sorry, It Appears You Need A Factory USB Cable Since*
ECHO *  The Device Is Not Responding To Our Command To    *
ECHO * Boot Into Fastboot Mode. Send A PM To Prokennexusa *
ECHO *           To Order A Factory USB Cable             *
ECHO ******************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
echo.
CALL:menu


:RESTOREKF2-10-2-1.4
echo.
cls
COLOR 2
mkdir kf2\10.2.1 2> nul
cd kf2\10.2.1
REM del \KFFirstAide\boot.img
REM del \KFFirstAide\recovery.img
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *Please wait while I Download The 3 Images.....*
ECHO ************************************************
echo.
echo.
ECHO *****************************************************
ECHO *Get A Cup Of Coffee, This May Take A While.........*
ECHO *****************************************************
echo.
echo.
REM wget http://dl.dropbox.com/u/54456659/kf2-10.2.1/images/boot.img
..\..\wget -Oboot.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/x29y7921b88f4zil4dth.md5
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Oboot.img -q --no-check-certificate https://xerocomm.box.com/shared/static/k4og9o8vsapaum7f2q2m.img
)
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO ************************************************************
ECHO *I have fetched the boot.img - 2 more to download..........*
ECHO ************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kf2-10.2.1/images/recovery.img
..\..\wget -Orecovery.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/rzqwcb17gzuh6atb2wlv.md5
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Orecovery.img -q --no-check-certificate https://xerocomm.box.com/shared/static/dliu3qly5ufub5xtu70k.img
)
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO ************************************************************
ECHO *I have fetched the boot.img - 1 more to download..........*
ECHO ************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kf2-10.2.3/images/system.img
..\..\wget -Osystem.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/0akukxof686nxibeyokq.md5
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Osystem.img -q --no-check-certificate https://xerocomm.box.com/shared/static/plo5zcn0opigtsj07dvy.img
)
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
echo.
ECHO *******************************************************************************************
ECHO *We Have Downloaded The Recovery - We Are Ready To Flash The 3 Images.....................*
ECHO *******************************************************************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
fastboot flash -i 0x1949 boot boot.img
fastboot flash -i 0x1949 recovery recovery.img
fastboot flash -i 0x1949 system system.img
set /p unr=Would You Like To Wipe Data And Cache (y/n) ?
IF %unr% == n GOTO RESTOREKF2-10-2-1.5
fastboot -i 0x1949 -w
echo.
CALL:RESTOREKF2-10-2-1.5

:RESTOREKF2-10-2-1.5
echo.
fastboot -i 0x1949 reboot
echo.
color 2
echo.
ECHO **************************************
ECHO *  Success!!! The Kindle Fire 2 7    *
ECHO *Restored To Software Version 10.2.1 *
ECHO **************************************
PAUSE
echo.
cls
echo.
echo.
echo.
color 4
echo.
ECHO ******************************************************************
ECHO * Please Unplug the Kindle Fire 2 From USB and Reboot The Kindle *
ECHO *  By Holding The Power Button Down For 20 Seconds Then Release  *
ECHO * For 5 Seconds And Depress The Power Button Again For 2 Seconds *
ECHO *Do Not Forget To Disable OTA Before Connecting To It To Wireless*
ECHO ******************************************************************
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:RESTOREKF2-10-2-1.6
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************
ECHO *The Operation Was Canceled By The User.*
ECHO ******************************************
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
echo.
CALL:menu

:RESTOREKFHD7-7-2-3
echo.
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO *This Option Will Use Fastboot To Flash Software To The *
ECHO *Kindle Fire HD. This Option Will Flash Software Version*
ECHO *   7.2.3 To The Following Three Partitions Boot        *
ECHO *   Recovey And System Then, We Will Wrap Up The        *
ECHO * Process By Clearing The User Data And Davlik Cache.   *
ECHO *********************************************************
echo.
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Restore The Kindle Fire HD 7 To 7.2.3?" RESTOREKFHD7-7-2-3.0 RESTOREKFHD7-7-2-3.5

:RESTOREKFHD7-7-2-3.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *You Have A Kindle Fire HD 7  Plugged In To USB*
ECHO * Using Either The Original USB Cable Or The   *
ECHO *    Factory USB Cable Correct ???????         *
ECHO ************************************************
echo.
echo.
PAUSE
echo.
COLOR 4
echo.
CALL:yesno "Are You Sure You Want To Proceed? This Operation Wipes The User Data!" RESTOREKFHD7-7-2-3.1 RESTOREKFHD7-7-2-3.6

:RESTOREKFHD7-7-2-3.1
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Into Fastboot?" RESTOREKFHD7-7-2-3.2 RESTOREKFHD7-7-2-3.4

:RESTOREKFHD7-7-2-3.2
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************
ECHO * Please Power On The Kindle Fire HD 7"  *
ECHO *Then Plug The Mini USB In To The Kindle *
ECHO *  And The Other End To The Computer     *
ECHO ******************************************
echo.
PAUSE
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Must Be Powered On To The Desktop!" RESTOREKFHD7-7-2-3.3 RESTOREKFHD7-7-2-3.2

:RESTOREKFHD7-7-2-3.3
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ***********************************************************
ECHO *The Kindle Fire HD 7  Will Now Reboot In Fastboot Mode!  *
ECHO *    This Process Will Fail If You Do Not Have Root       *
ECHO *Installed On The Kindle Or If The Bootloader Is Damaged  *
ECHO * Be Sure To Pay Attention To The Kindle For A Superuser  *
ECHO *   Popup, Please Click Grant Or Allow, Otherwise This    *
ECHO *               Process Will Fail!                        *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *We have Enabled Fastboot on the Kindle Fire,  *
ECHO *Please Verify The Kindle Is In Fastboot Mode  *
ECHO *In Some Rare Cases The Kindle Fire Bootloader *
ECHO * Is Damaged And Requires A Factory USB Cable  *
ECHO *To Boot The Kindle Fire HD Into Fastboot Mode *
ECHO ************************************************
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == y GOTO RESTOREKFHD7-7-2-3.4
echo.
ECHO ******************************************************
ECHO *Sorry, It Appears You Need A Factory USB Cable Since*
ECHO *  The Device Is Not Responding To Our Command To    *
ECHO * Boot Into Fastboot Mode. Send A PM To Prokennexusa *
ECHO *           To Order A Factory USB Cable             *
ECHO ******************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:RESTOREKFHD7-7-2-3.4
echo.
cls
COLOR 2
echo.
mkdir kfhd7\7.2.3 2>nul
cd kfhd7\7.2.3
REM del \KFFirstAide\boot.img
REM del \KFFirstAide\recovery.img
REM del \KFFirstAide\system.img
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *Please wait while I Download The 3 Images.....*
ECHO ************************************************
echo.
echo.
ECHO *****************************************************
ECHO *Get A Cup Of Coffee, This May Take A While.........*
ECHO *****************************************************
echo.
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd-7.2.3/images/boot.img
..\..\wget -Oboot.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/rpblz2qwz3hspcses519.md5
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Oboot.img -q --no-check-certificate https://xerocomm.box.com/shared/static/c3jjumxkvix0qbokyi00.img
)
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **************************************************************
ECHO *I Have Fetched The boot.img - 2 More To Download............*
ECHO **************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd-7.2.3/images/recovery.img
..\..\wget -Orecovery.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/1hz0jfhu2t8igpxp0r69.md5
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Orecovery.img -q --no-check-certificate https://xerocomm.box.com/shared/static/mjgyerqq1touyr80f9bz.img
)
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **********************************************************************
ECHO *I Have Fetched The recovery.img - 1 More To Download................*
ECHO **********************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd-7.2.3/images/system.img
..\..\wget -Osystem.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/ni8f8qgzlyhxfz4046v4.md5
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Osystem.img -q --no-check-certificate https://xerocomm.box.com/shared/static/ass27y5w3r7rvxv3zeze.img
)
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
echo.
echo.
ECHO *******************************************************************************************
ECHO *We Have Downloaded The Recovery - We Are Ready To Flash The 3 Images.....................*
ECHO *******************************************************************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
fastboot -i 0x1949 flash boot boot.img
fastboot -i 0x1949 flash recovery recovery.img
fastboot -i 0x1949 flash system system.img
set /p unr=Would You Like To Wipe Data And Cache (y/n) ?
IF %unr% == n GOTO RESTOREKFHD7-7-2-3.5
fastboot -i 0x1949 -w
echo.
echo.
CALL:RESTOREKFHD7-7-2-3.5

:RESTOREKFHD7-7-2-3.5
echo.
fastboot -i 0x1949 reboot
echo.
color 2
echo.
ECHO ************************************
ECHO * Success!!! The Kindle Fire HD 7" *
ECHO *Restored To Software Version 7.2.3*
ECHO ************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
color 4
echo.
ECHO ******************************************************************
ECHO *Please Unplug the Kindle Fire HD From USB and Reboot The Kindle *
ECHO *  By Holding The Power Button Down For 20 Seconds Then Release  *
ECHO * For 5 Seconds And Depress The Power Button Again For 2 Seconds *
ECHO *Do Not Forget To Disable OTA Before Connecting To It To Wireless*
ECHO ******************************************************************
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:RESTOREKFHD7-7-2-3.6
echo.
cls
echo.
echo.
color 2
echo.
ECHO *******************************************
ECHO *The Operation To Flash The Kindle Fire HD*
ECHO *     7" Was Canceled By The User.       *
ECHO *******************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:RESTOREKFHD7-7-2-1
echo.
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO *This Option Will Use Fastboot To Flash Software To The *
ECHO *Kindle Fire HD. This Option Will Flash Software Version*
ECHO *   7.2.1 To The Following Three Partitions Boot        *
ECHO *   Recovey And System Then, We Will Wrap Up The        *
ECHO * Process By Clearing The User Data And Davlik Cache.   *
ECHO *********************************************************
echo.
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Restore The Kindle Fire HD 7 To 7.2.1?" RESTOREKFHD7-7-2-1.0 RESTOREKFHD7-7-2-1.5

:RESTOREKFHD7-7-2-1.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *You Have A Kindle Fire HD 7  Plugged In To USB*
ECHO * Using Either The Original USB Cable Or The   *
ECHO *    Factory USB Cable Correct ???????         *
ECHO ************************************************
echo.
echo.
PAUSE
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Sure You Want To Proceed? This Operation Wipes The User Data!" RESTOREKFHD7-7-2-1.1 RESTOREKFHD7-7-2-1.6

:RESTOREKFHD7-7-2-1.1
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Into Fastboot?" RESTOREKFHD7-7-2-1.2 RESTOREKFHD7-7-2-1.4

:RESTOREKFHD7-7-2-1.2
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************
ECHO * Please Power On The Kindle Fire HD 7   *
ECHO *Then Plug The Mini USB In To The Kindle *
ECHO *  And The Other End To The Computer     *
ECHO ******************************************
echo.
PAUSE
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Must Be Powered On To The Desktop." RESTOREKFHD7-7-2-1.3 RESTOREKFHD7-7-2-1.2

:RESTOREKFHD7-7-2-1.3
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ***********************************************************
ECHO *The Kindle Fire HD 7  Will Now Reboot In Fastboot Mode!  *
ECHO *    This Process Will Fail If You Do Not Have Root       *
ECHO *Installed On The Kindle Or If The Bootloader Is Damaged  *
ECHO * Be Sure To Pay Attention To The Kindle For A Superuser  *
ECHO *   Popup, Please Click Grant Or Allow, Otherwise This    *
ECHO *               Process Will Fail!                        *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *We have Enabled Fastboot on the Kindle Fire,  *
ECHO *Please Verify The Kindle Is In Fastboot Mode  *
ECHO *In Some Rare Cases The Kindle Fire Bootloader *
ECHO * Is Damaged And Requires A Factory USB Cable  *
ECHO *To Boot The Kindle Fire HD Into Fastboot Mode *
ECHO ************************************************
echo.
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == y GOTO RESTOREKFHD7-7-2-1.4
echo.
ECHO ******************************************************
ECHO *Sorry, It Appears You Need A Factory USB Cable Since*
ECHO *  The Device Is Not Responding To Our Command To    *
ECHO * Boot Into Fastboot Mode. Send A PM To Prokennexusa *
ECHO *           To Order A Factory USB Cable             *
ECHO ******************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu



:RESTOREKFHD7-7-2-1.4
echo.
cls
color 2
mkdir kfhd7\7.2.1 2>nul
cd kfhd7\7.2.1
REM del \KFFirstAide\boot.img
REM del \KFFirstAide\recovery.img
REM del \KFFirstAide\system.img
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
COLOR 2
ECHO ************************************************
ECHO *Please wait while I Download The 3 Images.....*
ECHO ************************************************
echo.
echo.
ECHO *****************************************************
ECHO *Get A Cup Of Coffee, This May Take A While.........*
ECHO *****************************************************
echo.
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd7.2.1/images/boot.img
..\..\wget -Oboot.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/byzch7hiacafjuj3g2yv.md5
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Oboot.img -q --no-check-certificate https://xerocomm.box.com/shared/static/ym54ji1p6tvgwquvk6ib.img
)
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **************************************************************
ECHO *I Have Fetched The boot.img - 2 More To Download............*
ECHO **************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd7.2.1/images/recovery.img
..\..\wget -Orecovery.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/k10h9543qvu6ymhs73n7.md5
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Orecovery.img -q --no-check-certificate https://xerocomm.box.com/shared/static/ff4qgyus0erbicp3nxkb.img
)
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **********************************************************************
ECHO *I Have Fetched The recovery.img - 1 More To Download................*
ECHO **********************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd7.2.1/images/system.img
..\..\wget -Osystem.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/nklsrctwvtgjlos4ded0.md5
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Osystem.img -q --no-check-certificate https://xerocomm.box.com/shared/static/9evm4cwf81ziig2vw3fg.img
)
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
cls
echo.
echo.
echo.
fastboot -i 0x1949 flash boot boot.img
fastboot -i 0x1949 flash recovery recovery.img
fastboot -i 0x1949 flash system system.img
fastboot -i 0x1949 -w
set /p unr=Would You Like To Wipe Data And Cache (y/n) ?
IF %unr% == n GOTO RESTOREKFHD7-7-2-1.5
fastboot -i 0x1949 -w
echo.
echo.
CALL:RESTOREKFHD7-7-2-1.5

:RESTOREKFHD7-7-2-1.5
echo.
fastboot -i 0x1949 reboot
echo.
echo.
COLOR 2
echo.
ECHO *************************************
ECHO *  Success!!! The Kindle Fire HD 7  *
ECHO * Restored To Software Version 7.2.1*
ECHO *************************************
echo.
PAUSE
cls
echo.
echo.
echo.
COLOR 4
ECHO ******************************************************************
ECHO *Please Unplug the Kindle Fire HD From USB and Reboot The Kindle *
ECHO *  By Holding The Power Button Down For 20 Seconds Then Release  *
ECHO * For 5 Seconds And Depress The Power Button Again For 2 Seconds *
ECHO *Do Not Forget To Disable OTA Before Connecting To It To Wireless*
ECHO ******************************************************************
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
echo.
CALL:menu

:RESTOREKFHD7-7-2-1.6
echo.
cls
echo.
echo.
color 2
echo.
ECHO *******************************************
ECHO *The Operation To Flash The Kindle Fire HD*
ECHO *      7  Was Canceled By The User.       *
ECHO *******************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
echo.
CALL:menu

:RESTOREKFHD8-8-2-1
echo.
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO *This Option Will Use Fastboot To Flash Software To The *
ECHO *Kindle Fire HD. This Option Will Flash Software Version*
ECHO *   8.2.1 To The Following Three Partitions Boot        *
ECHO *   Recovey And System Then, We Will Wrap Up The        *
ECHO * Process By Clearing The User Data And Davlik Cache.   *
ECHO *********************************************************
echo.
echo.
PAUSE
echo.
echo.
COLOR 2
echo.
CALL:yesno "Are You Sure You Want To Proceed? This Operation Wipes The User Data!" RESTOREKFHD8-8-2-1.0 RESTOREKFHD8-8-2-1.5

:RESTOREKFHD8-8-2-1.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO **************************************************
ECHO *You Have A Kindle Fire HD 8.9  Plugged In To USB*
ECHO *  Using Either The Original USB Cable Or The    *
ECHO *      Factory USB Cable Correct ???????         *
ECHO **************************************************
echo.
echo.
PAUSE
echo.
COLOR 4
echo.
CALL:yesno "Are You Sure? This Operation Can Not Be Reversed!" RESTOREKFHD8-8-2-1.1 RESTOREKFHD8-8-2-1.6

:RESTOREKFHD8-8-2-1.1
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Into Fastboot?" RESTOREKFHD8-8-2-1.2 RESTOREKFHD8-8-2-1.4

:RESTOREKFHD8-8-2-1.2
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************
ECHO *Please Power On The Kindle Fire HD 8.9" *
ECHO *Then Plug The Mini USB In To The Kindle *
ECHO *  And The Other End To The Computer     *
ECHO ******************************************
echo.
PAUSE
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Must Be Powered On To The Desktop" RESTOREKFHD8-8-2-1.3 RESTOREKFHD8-8-2-1.2

:RESTOREKFHD8-8-2-1.3
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ***********************************************************
ECHO *The Kindle Fire HD 8.9  Will Now Reboot In Fastboot Mode!*
ECHO *     This Process Will Fail If You Do Not Have Root      *
ECHO * Installed On The Kindle Or If The Bootloader Is Damaged *
ECHO * Be Sure To Pay Attention To The Kindle For A Superuser  *
ECHO *   Popup, Please Click Grant Or Allow, Otherwise This    *
ECHO *               Process Will Fail!                        *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-devices
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *We have Enabled Fastboot on the Kindle Fire,  *
ECHO *Please Verify The Kindle Is In Fastboot Mode  *
ECHO *In Some Rare Cases The Kindle Fire Bootloader *
ECHO * Is Damaged And Requires A Factory USB Cable  *
ECHO *To Boot The Kindle Fire HD Into Fastboot Mode *
ECHO ************************************************
echo.
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == y GOTO RESTOREKFHD8-8-2-1.4
echo.
ECHO ******************************************************
ECHO *Sorry, It Appears You Need A Factory USB Cable Since*
ECHO *  The Device Is Not Responding To Our Command To    *
ECHO * Boot Into Fastboot Mode. Send A PM To Prokennexusa *
ECHO *           To Order A Factory USB Cable             *
ECHO ******************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
echo.
CALL:menu


:RESTOREKFHD8-8-2-1.4
echo.
cls
color 2
mkdir kfhd8\8.2.1 2>nul
cd kfhd8\8.2.1
REM del \KFFirstAide\boot.img
REM del \KFFirstAide\recovery.img
REM del \KFFirstAide\system.img
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
color 2
echo.
ECHO ************************************************
ECHO *Please wait while I Download The 3 Images.....*
ECHO ************************************************
echo.
echo.
ECHO *****************************************************
ECHO *Get A Cup Of Coffee, This May Take A While.........*
ECHO *****************************************************
echo.
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd8.2.1/images/boot.img
..\..\wget -Oboot.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/bb92ikckqmmlvo05ncaz.md5
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Oboot.img -q --no-check-certificate https://xerocomm.box.com/shared/static/65mrumnvv5oeyewaqdz4.img
)
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **************************************************************
ECHO *I Have Fetched The boot.img - 2 More To Download............*
ECHO **************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd8.2.1/images/recovery.img
..\..\wget -Orecovery.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/zz7rtb8wmmnn7b8w2wmx.md5
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Orecovery.img -q --no-check-certificate https://xerocomm.box.com/shared/static/y9psvmwwm9cfzz4qewb5.img
)
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **********************************************************************
ECHO *I Have Fetched The recovery.img - 1 More To Download................*
ECHO **********************************************************************
echo.
REM  wget http://dl.dropbox.com/u/54456659/kfhd8.2.1/images/system.img
..\..\wget -Osystem.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/l9ard14o7aqc741zy6g6.md5
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Osystem.img -q --no-check-certificate https://xerocomm.box.com/shared/static/q0jcuhvlks8fzw1n9dzx.img
)
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO ****************************************************************************************
ECHO *I Have Fetched The system.img - I Am Ready To Flash The 3 Images......................*
ECHO ****************************************************************************************
echo.
PAUSE
cls
echo.
echo.
echo.
fastboot -i 0x1949 flash boot boot.img
fastboot -i 0x1949 flash recovery recovery.img
fastboot -i 0x1949 flash system system.img
fastboot -i 0x1949 -w
set /p unr=Would You Like To Wipe Data And Cache (y/n) ?
IF %unr% == n GOTO RESTOREKFHD8-8-2-1.5
fastboot -i 0x1949 -w
echo.
echo.
CALL:RESTOREKFHD8-8-2-1.5

:RESTOREKFHD8-8-2-1.5
echo.
fastboot -i 0x1949 reboot
echo.
COLOR 2
echo.
ECHO ************************************
ECHO *Success!!! The Kindle Fire HD 8.9 *
ECHO *Restored To Software Version 8.2.1*
ECHO ************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
color 4
echo.
ECHO ******************************************************************
ECHO *Please Unplug the Kindle Fire HD From USB and Reboot The Kindle *
ECHO *  By Holding The Power Button Down For 20 Seconds Then Release  *
ECHO * For 5 Seconds And Depress The Power Button Again For 2 Seconds *
ECHO *Do Not Forget To Disable OTA Before Connecting To It To Wireless*
ECHO ******************************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
CALL:menu

:RESTOREKFHD8-8-2-1.6
echo.
cls
echo.
echo.
color 2
echo.
ECHO *****************************************
ECHO *The Operation To Flash The Kindle Fire *
ECHO *  HD 8.9  Was Canceled By The User.    *
ECHO *****************************************
echo.
echo.

PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:RESTOREKFHD8-8-2-3
echo.
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO *This Option Will Use Fastboot To Flash Software To The *
ECHO *Kindle Fire HD. This Option Will Flash Software Version*
ECHO *   8.2.3 To The Following Three Partitions Boot        *
ECHO *   Recovey And System Then, We Will Wrap Up The        *
ECHO * Process By Clearing The User Data And Davlik Cache.   *
ECHO *********************************************************
echo.
echo.
PAUSE
echo.
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Restore The Kindle Fire HD 8.9 To 8.2.3?" RESTOREKFHD8-8-2-3.0 RESTOREKFHD8-8-2-3.5

:RESTOREKFHD8-8-2-3.0
echo.
cls
echo.
echo.
color 2
echo.
ECHO **************************************************
ECHO *You Have A Kindle Fire HD 8.9  Plugged In To USB*
ECHO *  Using Either The Original USB Cable Or The    *
ECHO *      Factory USB Cable Correct ???????         *
ECHO **************************************************
echo.
echo.
PAUSE
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Sure You Want To Proceed? This Operation Wipes The User Data!" RESTOREKFHD8-8-2-3.1 RESTOREKFHD8-8-2-3.6

:RESTOREKFHD8-8-2-3.1
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Into Fastboot?" RESTOREKFHD8-8-2-3.2 RESTOREKFHD8-8-2-3.4

:RESTOREKFHD8-8-2-3.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************
ECHO *Please Power On The Kindle Fire HD 8.9" *
ECHO *Then Plug The Mini USB In To The Kindle *
ECHO *  And The Other End To The Computer     *
ECHO ******************************************
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Must Be Powered On To The Desktop." RESTOREKFHD8-8-2-3.3 RESTOREKFHD8-8-2-3.2

:RESTOREKFHD8-8-2-3.3
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ***********************************************************
ECHO *The Kindle Fire HD 8.9  Will Now Reboot In Fastboot Mode!*
ECHO *     This Process Will Fail If You Do Not Have Root      *
ECHO * Installed On The Kindle Or If The Bootloader Is Damaged.*
ECHO * Be Sure To Pay Attention To The Kindle For A Superuser  *
ECHO *   Popup, Please Click Grant Or Allow, Otherwise This    *
ECHO *               Process Will Fail!                        *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *We have Enabled Fastboot on the Kindle Fire,  *
ECHO *Please Verify The Kindle Is In Fastboot Mode  *
ECHO *In Some Rare Cases The Kindle Fire Bootloader *
ECHO * Is Damaged And Requires A Factory USB Cable  *
ECHO *To Boot The Kindle Fire HD Into Fastboot Mode *
ECHO ************************************************
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == y GOTO RESTOREKFHD8-8-2-3.4
echo.
ECHO ******************************************************
ECHO *Sorry, It Appears You Need A Factory USB Cable Since*
ECHO *  The Device Is Not Responding To Our Command To    *
ECHO * Boot Into Fastboot Mode. Send A PM To Prokennexusa *
ECHO *           To Order A Factory USB Cable             *
ECHO ******************************************************
echo.
PAUSE
echo.
echo.
adb kill-server
echo.
cls
echo.
CALL:menu


:RESTOREKFHD8-8-2-3.4
echo.
cls
COLOR 2
echo.
mkdir kfhd8\8.2.3 2>nul
cd kfhd8\8.2.3
REM del \KFFirstAide\boot-prod.img
REM del \KFFirstAide\recovery-prod.img
REM del \KFFirstAide\system.img
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *Please wait while I Download The 3 Images.....*
ECHO ************************************************
echo.
echo.
ECHO *****************************************************
ECHO *Get A Cup Of Coffee, This May Take A While.........*
ECHO *****************************************************
echo.
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd-8.2.3/Images/boot-prod.img
..\..\wget -Oboot.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/3uh7cmx6k3458m9yhf98.md5
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Oboot.img -q --no-check-certificate https://xerocomm.box.com/shared/static/tvwkjm2v7v3xhc8j57bh.img
)
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **************************************************************
ECHO *I Have Fetched The boot.img - 2 More To Download............*
ECHO **************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd-8.2.3/Images/recovery-prod.img
..\..\wget -Orecovery.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/4dmmakeeyajqnek1p5fe.md5
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Orecovery.img -q --no-check-certificate https://xerocomm.box.com/shared/static/ilf2orwytfvh6740g8a3.img
)
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **********************************************************************
ECHO *I Have Fetched The recovery.img - 1 More To Download................*
ECHO **********************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd-8.2.3/Images/system.img
..\..\wget -Osystem.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/g5aicwjflgj5ek62vrif.md5
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Osystem.img -q --no-check-certificate https://xerocomm.box.com/shared/static/d5l9kgkksdeg7sjs0e1v.img
)
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO ****************************************************************************************
ECHO *I Have Fetched The system.img - I Am Ready To Flash The 3 Images......................*
ECHO ****************************************************************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
fastboot -i 0x1949 flash boot boot.img
fastboot -i 0x1949 flash recovery recovery.img
fastboot -i 0x1949 flash system system.img
set /p unr=Would You Like To Wipe Data And Cache (y/n) ?
IF %unr% == n GOTO RESTOREKFHD8-8-2-3.5
fastboot -i 0x1949 -w
echo.
echo.
CALL:RESTOREKFHD8-8-2-3.5

:RESTOREKFHD8-8-2-3.5
echo.
fastboot -i 0x1949 reboot
echo.
echo.
COLOR 2
echo.
ECHO ************************************
ECHO *Success!!! The Kindle Fire HD 8.9 *
ECHO *Restored To Software Version 8.2.3*
ECHO ************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
color 4
echo.
ECHO ******************************************************************
ECHO *Please Unplug the Kindle Fire HD From USB and Reboot The Kindle *
ECHO *  By Holding The Power Button Down For 20 Seconds Then Release  *
ECHO * For 5 Seconds And Depress The Power Button Again For 2 Seconds *
ECHO *Do Not Forget To Disable OTA Before Connecting To It To Wireless*
ECHO ******************************************************************
echo.
echo.
PAUSE
echo.
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:RESTOREKFHD8-8-2-3.6
echo.
cls
echo.
echo.
color 2
ECHO ***********************************************
echo *  The Operation To Flash The Kindle Fire HD  *
ECHO *     8.9  Was Canceled By The User.          *
ECHO ***********************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
echo.
CALL:menu

:RESTOREKFHD8-8-2-4
echo.
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO *This Option Will Use Fastboot To Flash Software To The *
ECHO *Kindle Fire HD. This Option Will Flash Software Version*
ECHO *   8.2.4 To The Following Three Partitions Boot        *
ECHO *   Recovey And System Then, We Will Wrap Up The        *
ECHO * Process By Clearing The User Data And Davlik Cache.   *
ECHO *********************************************************
echo.
echo.
echo.
PAUSE
echo.
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Restore The Kindle Fire HD 8.9 To 8.2.4?" RESTOREKFHD8-8-2-4.0 RESTOREKFHD8-8-2-4.5

:RESTOREKFHD8-8-2-4.0
echo.
cls
echo.
echo.
color 2
echo.
ECHO **************************************************
ECHO *You Have A Kindle Fire HD 8.9  Plugged In To USB*
ECHO *  Using Either The Original USB Cable Or The    *
ECHO *      Factory USB Cable Correct ???????         *
ECHO **************************************************
echo.
echo.
PAUSE
echo.
COLOR 4
echo.
CALL:yesno "Are You Sure You Want To Proceed? This Operation Wipes The User Data!" RESTOREKFHD8-8-2-4.1 RESTOREKFHD8-8-2-4.6

:RESTOREKFHD8-8-2-4.1
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Into Fastboot?" RESTOREKFHD8-8-2-4.2 RESTOREKFHD8-8-2-4.4

:RESTOREKFHD8-8-2-4.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************
ECHO *Please Power On The Kindle Fire HD 8.9  *
ECHO *Then Plug The Mini USB In To The Kindle *
ECHO *  And The Other End To The Computer     *
ECHO ******************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Must Be Powered On To The Desktop." RESTOREKFHD8-8-2-4.3 RESTOREKFHD8-8-2-4.2

:RESTOREKFHD8-8-2-4.3
echo.
cls
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *The Kindle Fire HD 8.9  Will Now Reboot In Fastboot Mode!*
ECHO *     This Process Will Fail If You Do Not Have Root      *
ECHO * Installed On The Kindle Or If The Bootloader Is Damaged.*
ECHO * Be Sure To Pay Attention To The Kindle For A Superuser  *
ECHO *   Popup, Please Click Grant Or Allow, Otherwise This    *
ECHO *               Process Will Fail!                        *
ECHO ***********************************************************
echo.
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *We have Enabled Fastboot on the Kindle Fire,  *
ECHO *Please Verify The Kindle Is In Fastboot Mode  *
ECHO *In Some Rare Cases The Kindle Fire Bootloader *
ECHO * Is Damaged And Requires A Factory USB Cable  *
ECHO *To Boot The Kindle Fire HD Into Fastboot Mode *
ECHO ************************************************
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == y GOTO RESTOREKFHD8-8-2-4.4
echo.
ECHO ******************************************************
ECHO *Sorry, It Appears You Need A Factory USB Cable Since*
ECHO *  The Device Is Not Responding To Our Command To    *
ECHO * Boot Into Fastboot Mode. Send A PM To Prokennexusa *
ECHO *           To Order A Factory USB Cable             *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu


:RESTOREKFHD8-8-2-4.4
echo.
cls
COLOR 2
mkdir kfhd8\8.2.4 2>nul
cd kfhd8\8.2.4
REM del \KFFirstAide\boot.img
REM del \KFFirstAide\recovery.img
REM del \KFFirstAide\system.img
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
color 2
echo.
ECHO ************************************************
ECHO *Please wait while I Download The 3 Images.....*
ECHO ************************************************
echo.
echo.
ECHO *****************************************************
ECHO *Get A Cup Of Coffee, This May Take A While.........*
ECHO *****************************************************
echo.
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd8.2.4/images/boot.img
..\..\wget -Oboot.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/y6xcfsv1f1e65sxdc38r.md5
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Oboot.img -q --no-check-certificate https://xerocomm.box.com/shared/static/zmg9j58j3yk861tdocpk.img
)
..\..\md5 "boot.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **************************************************************
ECHO *I Have Fetched The boot.img - 2 More To Download............*
ECHO **************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd8.2.4/images/recovery.img
..\..\wget -Orecovery.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/hu1htatd7l9900wdx2k0.md5
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Orecovery.img -q --no-check-certificate https://xerocomm.box.com/shared/static/2qbeqszsctld0uze3l67.img
)
..\..\md5 "recovery.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO **********************************************************************
ECHO *I Have Fetched The recovery.img - 1 More To Download................*
ECHO **********************************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd8.2.4/images/system.img
..\..\wget -Osystem.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/hrrou5qs3ymxqfai4g5d.md5
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Osystem.img -q --no-check-certificate https://xerocomm.box.com/shared/static/wfffho9ulyblljrs8ogw.img
)
..\..\md5 "system.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)

echo.
ECHO ****************************************************************************************
ECHO *I Have Fetched The system.img - I Am Ready To Flash The 3 Images......................*
ECHO ****************************************************************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
echo.
fastboot -i 0x1949 flash boot boot.img
fastboot -i 0x1949 flash recovery recovery.img
fastboot -i 0x1949 flash system system.img
set /p unr=Would You Like To Wipe Data And Cache (y/n) ?
IF %unr% == n GOTO RESTOREKFHD8-8-2-4.5
fastboot -i 0x1949 -w
echo.
echo.
CALL:RESTOREKFHD8-8-2-4.5

:RESTOREKFHD8-8-2-4.5
echo.
fastboot -i 0x1949 reboot
echo.
echo.
COLOR 2
echo.
ECHO ************************************
ECHO *Success!!! The Kindle Fire HD 8.9 *
ECHO *Restored To Software Version 8.2.4*
ECHO ************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
COLOR 4
echo.
ECHO ******************************************************************
ECHO *Please Unplug the Kindle Fire HD From USB and Reboot The Kindle *
ECHO *  By Holding The Power Button Down For 20 Seconds Then Release  *
ECHO * For 5 Seconds And Depress The Power Button Again For 2 Seconds *
ECHO *Do Not Forget To Disable OTA Before Connecting To It To Wireless*
ECHO ******************************************************************
echo.
echo.
cls
echo.
echo.
echo.
PAUSE
COLOR 2
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:RESTOREKFHD8-8-2-4.6
echo.
cls
echo.
echo.
color 2
ECHO ************************************************
ECHO *The Operation To Flash The Kindle Fire HD 8.9 *
ECHO *          Was Canceled By The User.           *
ECHO ************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:ERASEKINDLE
echo.
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO *This Option Will Use A Fastboot To Command To Globally *
ECHO * Wipe The Kindle Fire Two Partitions - One Is The User *
ECHO * Data Partition Where All Your Information Is Stored   *
ECHO * Examples: Custom Launcher Information, Email Username *
ECHO *   And Password, Browser Bookmarks, Music, Videos      *
ECHO *And All Your Documants. Two Is The Android System Cache*
ECHO *  Where The System Temporarily Stores It's Own Data.   *
ECHO * It Is Good Practice To Wipe This Information When New *
ECHO * Software Is Flashed To The Kindle. It Is Also Good    *
ECHO * Practice To Wipe This Information After Installing    *
ECHO *      New Boot, Recovery And System Software.          *
ECHO *********************************************************
echo.
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Wipe The User Data And Cache On The Kindle Fire?" ERASEKINDLE.0 ERASEKINDLE.5

:ERASEKINDLE.0
echo.
cls
echo.
echo.
color 4
echo.
ECHO **************************************************
ECHO *   You Have A Kindle Fire Plugged In To USB     *
ECHO *  Using Either The Original USB Cable Or The    *
ECHO *      Factory USB Cable Correct ???????         *
ECHO **************************************************
echo.
echo.
PAUSE
echo.
COLOR 4
echo.
CALL:yesno "Are You Sure You Want To Proceed? This Operation Wipes The User Data!" ERASEKINDLE.1 ERASEKINDLE.5

:ERASEKINDLE.1
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Into Fastboot?" ERASEKINDLE.2 ERASEKINDLE.4

:ERASEKINDLE.2
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************
ECHO *Please Power On The Kindle Fire HD Or 2.*
ECHO *Then Plug The Mini USB In To The Kindle *
ECHO *  And The Other End To The Computer     *
ECHO ******************************************
echo.
PAUSE
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Must Be Powered On To The Desktop." ERASEKINDLE.3 ERASEKINDLE.2

:ERASEKINDLE.3
echo.
cls
echo.
COLOR 2
ECHO *************************************************
ECHO *The Kindle HD Will Now Reboot In Fastboot Mode!*
ECHO *This Process Will Fail If You Do Not Have Root *
ECHO * Installed On The Kindle. Please Pay Attention *
ECHO *To The Kindle For A Superuser Popup, Be Sure To*
ECHO * Grant Or Allow Otherwise This Operation Will  *
ECHO *                    Fail!                      *
ECHO *************************************************
echo.
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *We have Enabled Fastboot on the Kindle Fire,  *
ECHO *Please Verify The Kindle Is In Fastboot Mode  *
ECHO *In Some Rare Cases The Kindle Fire Bootloader *
ECHO * Is Damaged And Requires A Factory USB Cable  *
ECHO *To Boot The Kindle Fire HD Into Fastboot Mode *
ECHO ************************************************
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == y GOTO ERASEKINDLE.4
echo.
ECHO ******************************************************
ECHO *Sorry, It Appears You Need A Factory USB Cable Since*
ECHO *  The Device Is Not Responding To Our Command To    *
ECHO * Boot Into Fastboot Mode. Send A PM To Prokennexusa *
ECHO *           To Order A Factory USB Cable             *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:ERASEKINDLE.4
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
fastboot -i 0x1949 -w
fastboot -i 0x1949 reboot
echo.
echo.
COLOR 2
echo.
ECHO *****************************************
ECHO *The Operation to Wipe the Kindle Davlik*
ECHO *  Cache and User Data was A Success!   *
ECHO *****************************************
echo.
echo.
PAUSE
echo.
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:ERASEKINDLE.5
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *************************************
ECHO *The Operation To Wipe Kindle Dalvik*
ECHO * Cache And User Data Was Canceled! *
ECHO *************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:FASTBOOTSTATUS
echo.
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO * This Option Will Use A Fastboot To Command To Simply  *
ECHO *  Query The Kindle To Display It's System Informtion   *
ECHO *  This Simple Non-Destructive Command Is A Good Way To *
ECHO * Determin If Fastboot Is Enabled And If The Kindle Is  *
ECHO * Responding To Simple Commands. If The Kindle Responds *
ECHO *   To This Command It Is Safe To Proceed With Other    *
ECHO *                 Fastboot Commands.                    *
ECHO *********************************************************
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Is The Kindle Powered On And Plugged Into USB?" FASTBOOTSTATUS.0 FASTBOOTSTATUS.1

:FASTBOOTSTATUS.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *************************************************
ECHO * OK Here We Go, We Are Beginning The Process!  *
ECHO *  If This Test Hangs On <waiting for device>   *
ECHO *The Kindle Is Not Responding To Simple Fastboot*
ECHO * Commands. Check The Device Manager For Yellow *
ECHO *  Traingles. If You See One Or Two Traingles   *
ECHO * Post The Screen Shot In Our Thread. You May   *
ECHO *      A Damaged Recovery Partition.            *
ECHO *************************************************
echo.
fastboot -i 0x1949 getvar product
fastboot -i 0x1949 devices
echo.
echo.
echo.
COLOR 2
echo.
ECHO ****************************************
ECHO *If You See Output Above This Note Then*
ECHO *  It Looks Like Fastboot is Enabled.  *
ECHO *You May Safely Proceed With A Restore!*
ECHO ****************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:FASTBOOTSTATUS.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *************************************
ECHO *The Operation To Display The System*
ECHO * Information Was Canceled By The   *
ECHO *             User!                 *
ECHO *************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:FASTBOOTREBOOT
echo.
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO * This Option Will Use A Fastboot To Command To Simply  *
ECHO *  Query The Kindle To Display It's System Informtion   *
ECHO *  This Simple Non-Destructive Command Is A Good Way To *
ECHO * Determin If Fastboot Is Enabled And If The Kindle Is  *
ECHO * Responding To Simple Commands. If The Kindle Responds *
ECHO *   To This Command It Is Safe To Proceed With Other    *
ECHO * Fastboot Commands. If This Command Fails Your Kindle  *
ECHO *  Fire Bootloader May Be Damaged And May Require A     *
ECHO * Factory USB Cable To Boot The Kindle Into Fastboot.   *
ECHO *********************************************************
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Reboot The Kindle Out Of Fastboot?" FASTBOOTREBOOT.0 FASTBOOTREBOOT.1

:FASTBOOTREBOOT.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
fastboot -i 0x1949 reboot
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO * The Command Has Executed Properly. The Kindle*
ECHO *  Is Now Rebooting, If The Kindle Is Still In *
ECHO *  Fastboot, Hold The Power Button Down For 1  *
ECHO *   Full Minute, The Release And Depress The   *
ECHO *   Power Button, The Kindle Should Now Exit   *
ECHO *              Fastboot Mode                   *
ECHO ************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:FASTBOOTREBOOT.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *************************************
ECHO *The Operation To Reboot The Kindle *
ECHO *Using Fastboot Was Canceled By The *
ECHO *              User!                *
ECHO *************************************
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:testadb
echo.
cls
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *  This option will issue an ADB query to the Kindle      *
ECHO *     so it will display its system information.          *
ECHO *    This non-destructive command is a good way to        *
ECHO *  determine if ADB is ENABLED and if the Kindle is       *
ECHO * responding to simple commands. If the Kindle responds   *
ECHO * to this command it is safe to proceed with other ADB    *
ECHO * commands. If this command fails, you should look under  *
ECHO *      Settings, Security, and make sure ADB is ON.       *
ECHO * Please ensure you have the Kindle plugged into the USB  *
ECHO *   with a NORMAL micro-usb cable, NOT a Factory Cable.   *
ECHO *  If ADB hangs and does not respond, go to the Kindle,   *
ECHO * then navigate to Settings, Security, and Toggle ADB OFF *
ECHO * and back ON. If this doesn't correct it please inspect  *
ECHO * Windows Device Manager for Yellow Triangles. Then post  *
ECHO * an image of it in our thread on XDA. We will solve this.*
ECHO ***********************************************************
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Test ADB On The Kindle Fire?" testadb.1 menu

:testadb.1
echo.
cd %~dp0
cls
echo.
echo.
COLOR 2
echo.
cls
setlocal
del device.txt >nul 2>&1
adb kill-server
adb wait-for-device
echo.
adb devices>device.txt
FINDSTR /b /l "D026 D025 D059 BOC9 B0CA B0CB B0CC" device.txt>nul && (
ECHO *******************************************
ECHO *Kindle Device has been SUCCESSFULLY found*
FINDSTR /b /l "D026" device.txt>nul && ECHO *        IDENTIFIED AS KF2ND 8GB          * && SET DEVICE=KF2
FINDSTR /b /l "D025" device.txt>nul && ECHO *        IDENTIFIED AS KFHD7 16GB         * && SET DEVICE=KFHD7
FINDSTR /b /l "D059" device.txt>nul && ECHO *        IDENTIFIED AS KFHD7 32GB         * && SET DEVICE=KFHD7
FINDSTR /b /l "B0C9" device.txt>nul && ECHO *        IDENTIFIED AS KFHD8.9 16GB       * && SET DEVICE=KFHD8
FINDSTR /b /l "B0CA" device.txt>nul && ECHO *        IDENTIFIED AS KFHD8.9 32GB       * && SET DEVICE=KFHD8
FINDSTR /b /l "B0CB" device.txt>nul && ECHO *        IDENTIFIED AS KFHD8.9 4G 32GB    * && SET DEVICE=KFHD8
FINDSTR /b /l "B0CC" device.txt>nul && ECHO *        IDENTIFIED AS KFHD8.9 4G 64GB    * && SET DEVICE=KFHD8
ECHO *******************************************
) || (
ECHO *******************************************
ECHO *             NO DEVICE FOUND!            *
ECHO *         Please ensure ADB is ON         *
ECHO *    and proper drivers are installed.    *
ECHO *******************************************
)
del device.txt
PAUSE
echo.
cls
echo.
adb kill-server
echo.
CALL:menu

:DRIVER-PREFERRED
echo.
cd %~dp0
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO *This Option Will Install The Amazon Original Universal *
ECHO * ADB Driver. This Driver Also Installs The Kindle Fire *
ECHO *Fastboot Mode Driver. Please DO NOT Install This Driver*
ECHO * On Top Of An Already Functional Driver. Please Remove *
ECHO *All Kindle Fire Drivers Prior To Installing This Driver*
ECHO * It Is Very Important To Unplug The Kindle Fire From   *
ECHO *     USB Prior To Installing This ADB Driver.          *
ECHO *********************************************************
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Install The Amazon ADB And Fastboot Driver?" DRIVER-PREFERRED.0 DRIVER-PREFERRED.1

:DRIVER-PREFERRED.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO * Please Make Sure The Kindle Is Disconnected  *
ECHO *   From USB During The Driver Installation.   *
ECHO ************************************************
echo.
set /p unr=You DO NOT Have A Functional ADB Driver, Correct (y/n) ?
IF %unr% == y GOTO DRIVER-PREFERRED.1
echo.
ECHO ****************************************
ECHO *The Kindle ADB Driver Will Now Launch *
ECHO *Please Make Sure You Are Running This *
ECHO *Software As An Administrator Otherwise*
ECHO *     This Process May Fail!           *
ECHO ****************************************
echo.
echo.
echo.
KindleADB.exe
echo.
echo.
echo.
COLOR 2
echo.
ECHO ******************************************
ECHO *The Driver Install Was A Success! Please*
ECHO *  Plug The Kindle Into USB Using The    *
ECHO * Original USB Cable That Was Included   *
ECHO * With The Kindle. This Is The Same USB  *
ECHO *  Cable You Use To Charge The Kindle    *
ECHO ******************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:DRIVER-PREFERRED.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************
ECHO *The Operation To Install The Amazon Universal*
ECHO *   ADB Driver Was Canceled By The User!      *
ECHO ***********************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:BACKUP-FULL
echo.
cd %~dp0
cls
echo.
COLOR 2
echo.
ECHO *****************************************************************
ECHO *This Option Will First Backup All Eleven Kindle Fire Partitions*
ECHO *   To A Folder New Folder Named KindleBackup On The SD Card,   *
ECHO *Then The Option Pulls All Eleven Images To Your Computer Named *
ECHO * KindleBackup. This Option May Take Over One Hour To Complete, *
ECHO *When Done Please Verify You Have Eleven Images In Both Folders.*
ECHO *Since This Option Proceeds To Backup The Entire Kindle, This Is*
ECHO *     The Best Backup To Recover A Kindle Fire Disaster.        *
ECHO *****************************************************************
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Perform A Full Backup Using Option 13?" BACKUP-FULL.0 BACKUP-FULL.1

:BACKUP-FULL.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
PAUSE
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO ************************************
ECHO *We Are Now Starting The ADB Server*
ECHO ************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *****************************************************
ECHO *We Are Now Executing The Backup, This Process Will *
ECHO *Backup The Entire Kindle.This Will Take Some Time, *
ECHO *Please Be Patient And Do Not Stop The Process. Data*
ECHO *Corruption May Occur If The Process Is Interrupted.*
ECHO *  Please Check The Kindle For A Superuser Popup,   *
ECHO * Be Sure To Click Allow Or Grant, Otherwise This   *
ECHO * Process Will Fail Without Proper Authorization.   *
ECHO *****************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto BACKUP-FULL.2
adb shell su -c "rm -R /data/local/kindlebackup"
ECHO Please Ignore Any Errors Above This Line
mkdir KindleBackup 2>nul
cd KindleBackup

adb shell su -c "mkdir /data/local/kindlebackup"
adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup"

ECHO I Am Backing Up Partition 1 (xloader)
ECHO ***
adb shell su -c "dd if=/dev/block/mmcblk0p1 of=/data/local/kindlebackup/xloader.img"

ECHO I Am Backing Up Partition 2 (bootloader)
ECHO ******
adb shell su -c "dd if=/dev/block/mmcblk0p2 of=/data/local/kindlebackup/bootloader.img"

ECHO I Am Backing Up Partition 3 (idme)
ECHO *********
adb shell su -c "dd if=/dev/block/mmcblk0p3 of=/data/local/kindlebackup/idme.img"

ECHO I Am Backing Up Partition 4 (crypto)
ECHO ************
adb shell su -c "dd if=/dev/block/mmcblk0p4 of=/data/local/kindlebackup/crypto.img"

ECHO I Am Backing Up Partition 5 (misc)
ECHO ***************
adb shell su -c "dd if=/dev/block/mmcblk0p5 of=/data/local/kindlebackup/misc.img"

ECHO I Am Backing Up Partition 6 (dkernel)
ECHO ******************
adb shell su -c "dd if=/dev/block/mmcblk0p6 of=/data/local/kindlebackup/dkernel.img"

ECHO I Am Backing Up Partition 7 (dfs)
ECHO *********************
adb shell su -c "dd if=/dev/block/mmcblk0p7 of=/data/local/kindlebackup/dfs.img"

ECHO I Am Backing Up Partition 8 (efs)
ECHO ************************
adb shell su -c "dd if=/dev/block/mmcblk0p8 of=/data/local/kindlebackup/efs.img"

ECHO I Am Backing Up Partition 9 (recovery)
ECHO ***************************
adb shell su -c "dd if=/dev/block/mmcblk0p9 of=/data/local/kindlebackup/recovery.img"

ECHO I Am Backing Up Partition 10 (boot)
ECHO ******************************
adb shell su -c "dd if=/dev/block/mmcblk0p10 of=/data/local/kindlebackup/boot.img"

ECHO I Am Backing Up Partition 11 (system)
ECHO *********************************
adb shell su -c "dd if=/dev/block/mmcblk0p11 of=/data/local/kindlebackup/system.img"

ECHO We Are Now Modify Ownership/Permissions Of All Archives
ECHO ************************************
adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/xloader.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/xloader.img"

adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/bootloader.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/bootloader.img"

adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/idme.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/idme.img"

adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/crypto.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/crypto.img"

adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/misc.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/misc.img"

adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/dkernel.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/dkernel.img"

adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/dfs.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/dfs.img"
adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/efs.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/efs.img"

adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/recovery.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/recovery.img"

adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/boot.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/boot.img"

adb shell su -c "busybox chown media_rw.media_rw /data/local/kindlebackup/system.img"
adb shell su -c "busybox chmod 777 /data/local/kindlebackup/system.img"

echo.
echo.
ECHO ***************************************************************
ECHO *OK, The Backup Has Completed We Are Now Pulling A Copy Of The*
ECHO *Backup To Your Computer In A Folder Named KindleBackup. This *
ECHO * Will Take Some Time To Complete, Depending On The Speed Of  *
ECHO *             Your USB Subsystem............                  *
ECHO ***************************************************************
echo.
echo.
mkdir KindleBackup 2>nul
cd KindleBackup
adb pull /data/local/kindlebackup/xloader.img
adb pull /data/local/kindlebackup/bootloader.img
adb pull /data/local/kindlebackup/idme.img
adb pull /data/local/kindlebackup/crypto.img
adb pull /data/local/kindlebackup/misc.img
adb pull /data/local/kindlebackup/dkernel.img
adb pull /data/local/kindlebackup/dfs.img
adb pull /data/local/kindlebackup/efs.img
adb pull /data/local/kindlebackup/recovery.img
adb pull /data/local/kindlebackup/boot.img
adb pull /data/local/kindlebackup/system.img
echo.
echo.
COLOR 2
echo.
echo.
ECHO ***********************************************
ECHO *Backup complete! Please Copy The KindleBackup*
ECHO * Folder Inside The KFFirstAide To Your A DVD *
ECHO * Or To A Dropbox Cloud Drive. Please Do This *
ECHO * Before You Have A Problem With The Kindle!  *
ECHO ***********************************************
echo.
echo.
PAUSE
adb kill-server
echo.
cls
echo.
CALL:menu

:BACKUP-FULL.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************
ECHO *  The Operation To Backup The Entire Kindle  *
ECHO *         Was Canceled By The User!           *
ECHO ***********************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:BACKUP-FULL.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
CALL:BACKUP-FULL.0

:OTA-DISABLE
echo.
cls
echo.
COLOR 2
echo.
ECHO ***************************************************************
ECHO *  This Option Will Effectivly Disable All The Known Amazon   *
ECHO *Services Uses To Deploy New Software Via Over The Air Updates*
ECHO *Since This Option Agressivly Stops All The OTA Services, We  *
ECHO *   Offer An Enable OTA Just In Case We Accidently Disable    *
ECHO *     An Amazon Service You Like To Use On THe Kindle.        *
ECHO *If You Find An Amazon Service Not Functioning After Applying *
ECHO * This Update, Please Use Option 19 To Selectivly Enable OTA  *
ECHO ***************************************************************
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Disable The Amazon OTA Updates?" OTA-DISABLE.0 OTA-DISABLE.1

:OTA-DISABLE.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
PAUSE
echo.
ECHO *************************************************
ECHO * OK Here We Go, We Are Beginning The Process!  *
ECHO * Please Pay Close Attention To The Kindle For  *
ECHO *A Superuser Popup Request Be Sure To Click On  *
ECHO *Allow Or Grant Otherwise This Process Will Fail*
ECHO *************************************************
echo.
ECHO *****************************************************
ECHO *We Are Now Preparing The Kindle, Please Wait.......*
ECHO *****************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO ****************************************************
ECHO *We Are Now Disabling OTA, Please Wait.............*
ECHO *Please Check The Kindle, There May Be A Superuser *
ECHO *Popup That Requires Your Attention. Please Be Sure*
ECHO *  To Click Allow Or Grant Otherwise This Process  *
ECHO *        Will Fail Without Proper Approval.        *
ECHO ****************************************************
echo.
echo.
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto OTA-DISABLE.2
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAUpdateMessageHandler'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.InventoryUploadService'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.UpdatesLookupService'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAService'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.AppStateMonitorService'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.CheckForOTAUpdatesService'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.ViewUpdateActivity'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAStatusActivity'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.ResetOTAMessageHandler'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.InventoryUploadService$InventoryUploadReceiver'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.UpdatesLookupService$MountStatusChangedReceiver'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAService$OTAWakeupReceiver'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAService$OTADedupeReceiver'"
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAService$OTAInstallNowReceiver'"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb reboot
adb wait-for-device
echo.
echo.
echo.
echo.
echo.
echo.
COLOR 2
ECHO ******************************************
ECHO *We Have Successfully Disabled The Amazon*
ECHO *     Over The Air Software Updates      *
ECHO ******************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:OTA-DISABLE.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************
ECHO * The Operation To Disable Amazon OTA Updates *
ECHO *         Was Canceled By The User!           *
ECHO ***********************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:OTA-DISABLE.2
echo.
cd root
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install -r Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:OTA-DISABLE.0

:FASTBOOTPREFERRED
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO **************************************************************
ECHO *   Thank You For Selecting Option 15. This Is Is Known As   *
ECHO *              Method Two To Wake Up Fastboot!               *
ECHO * This Option Requires Root To Execute Properly. Please Make *
ECHO *   Sure The Kindle Has Root Prior To Running This Option.   *
ECHO *  If You Have Verified You Have Root Then This Option Will  *
ECHO *Send A Supereuser Request To The Kindle Using ADB Commanding*
ECHO * The Kindle To Reboot The Bootloader, This Will Effectively *
ECHO * Boot The Kindle Into Fastboot Without A Factory USB Cable. *
ECHO **************************************************************
echo.
PAUSE
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Would You Like To Enable Fastboot Using Method One?" FASTBOOTPREFERRED.1 FASTBOOTPREFERRED.2

:FASTBOOTPREFERRED.1
echo.
cls
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable.  *
ECHO ***********************************************************
echo.
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO **************************************************
ECHO *The Kindle HD Will Now Reboot In Fastboot Mode! *
ECHO *This Process Will Fail If You Do Not Have Root  *
ECHO * Installed On The Kindle. Please Look At The    *
ECHO *Kindle, There May Be A Superuser Popup Requiring*
ECHO * You Attention. Be Sure To Click Allow Or Grant *
ECHO *     Otherwise This Command Will Fail!          *
ECHO **************************************************
echo.
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************
ECHO *We have Enabled Fastboot on the Kindle Fire, *
ECHO *Please Verify The Kindle Is In Fastboot Mode *
ECHO *In Some Rare Cases The Kindle Fire Bootloader*
ECHO * Is Damaged And Requires A Factory USB Cable *
ECHO *   To Boot (Kindle Fire HD 7 and 2 Only)     *
ECHO ***********************************************
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:FASTBOOTPREFERRED.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *************************************************
ECHO * The Operation To Boot The Kindle Into Fastboot*
ECHO *          Was Canceled By The User!           *
ECHO *************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:FASTBOOTALT
echo.
cls
echo.
COLOR 2
echo.
ECHO **********************************************
ECHO *  Thank You For Selecting Option 16. This   *
ECHO * Is Known As Method Two To Wake Up Fastboot *
ECHO *This Option Is Usually Only Effective On The*
ECHO *Kindle Fire HD 8.9 ! This Option Begins With*
ECHO *The Kindle Fire In A Power Down State. Then *
ECHO *As The Kindle Powers Up, It Sees A Fastboot *
ECHO * Command Waiting And Boots Into Fastboot.   *
ECHO * This Proves The Kindle Fire HD 8.9  Has A  *
ECHO *   Smart Bootloader. This Option Is Not     *
ECHO *Effective On The Kindle Fire 2 Or The Kindle*
ECHO *   Fire HD 7  Which Both Use A Passive      *
ECHO *              Bootloader.                   *
ECHO **********************************************
echo.
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Enable Fastboot Using Method Two?" FASTBOOTALT.0 FASTBOOTALT.2

:FASTBOOTALT.0
echo.
echo.
ECHO **************************************
ECHO *Please Power Down The Kindle Fire HD*
ECHO * Or 2 And Unplug The Kindle From USB*
ECHO **************************************
echo.
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Must Be Powered Off And Accessible." FASTBOOTALT.1 FASTBOOTALT.0

:FASTBOOTALT.1
echo.
cls
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO **************************************************
ECHO *OK, Now Plug The Mini USB Cable In To The Kindle*
ECHO *  And Plug The USB Cable Into The Computer.     *
ECHO **************************************************
echo.
ECHO *****************************************************
ECHO *OK, Now Power Up The Kindle Fire. If The Bootloader*
ECHO *Notices A Fastboot Command Waiting, It Should Wake *
ECHO *   Up The Kindle Fire Fastboot Recovery Mode.      *
ECHO * If This Fails, You May Have A Problem With The    *
ECHO *Recovery Partition On The Kindle Fire. Please Post *
ECHO *A Screen Shot Of Your Device Manager In Our Thread.*
ECHO * If This Hangs On <waiting for device> You Have A  *
ECHO * Driver Or Recovery Partition Problem. Press CTRL C*
ECHO *  To Terminate A Hanging Fastboot Process. Then    *
ECHO *      Relaunch Kindle Fire First Aide.             *
ECHO *****************************************************
echo.
echo.
fastboot -i 0x1949 getvar product
if exist %1 echo %1 goto :enabled
:enabled
echo.
echo.
echo.
COLOR 2
echo.
ECHO *****************************************************
ECHO *We Have Attempted To Enable USB Through A Passive  *
ECHO *Mode, If This Fails Use Preferred To Boot In To    *
ECHO *Fastboot. In Some Rare Cases, The Kindle Bootloader*
ECHO *Is Damaged And Will Not Boot Without A Factory USB *
ECHO *     Cable (Kindle Fire HD 7 and 2 Only).          *
ECHO *****************************************************
echo.
PAUSE
echo.
CALL:menu

:FASTBOOTALT.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *************************************************
ECHO * The Operation To Boot The Kindle Into Fastboot*
ECHO *          Was Canceled By The User!            *
ECHO *************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:BACKUP-3
echo.
cls
echo.
COLOR 2
echo.
ECHO *********************************************************************
ECHO *  This Option Will First Backup Three Main Kindle Fire Partitions  *
ECHO *     To A Folder New Folder Named Backup On The SD Card,           *
ECHO *Then The Option Pulls Three Main Images To Your Computer Named     *
ECHO *   Backup. This Option May Take Over 30 Minutes To Complete,       *
ECHO *When Done Please Verify You Have Three Main Images In Both Folders.*
ECHO *Since This Option Proceeds To Backup Part Of Kindle, This Is       *
ECHO *            The Best Backup To Perform Weekly.                     *
ECHO *********************************************************************
echo.
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Backup The Kindle Fire Using Option 17 Backup?" BACKUP-3.0 BACKUP-3.1


:BACKUP-3.0
echo.
cls
echo.
echo.
COLOR 2
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
PAUSE
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
echo.
ECHO ***************************************
ECHO * We Are Now Waking Up The ADB Server *
ECHO *If You Have The Android SDK Installed*
ECHO *This Backup Oprtation Will Fail..... *
ECHO ***************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *********************************************
ECHO *We Are Now Executing The Local Backup, This*
ECHO *Will Take A While, Please Wait.............*
ECHO * Please Pay Close Attention To The Kindle  *
ECHO * For A Superuser Popup, Be Sure To Click   *
ECHO *Allow Or Grant Otherwise This Process Will *
ECHO *                 Fail!                     *
ECHO *********************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto BACKUP-3.2
echo.
adb shell su -c "rm -R /data/local/backup"
ECHO Please Ignore Any Errors Above This Line
adb shell su -c "mkdir /data/local/backup"
adb shell su -c "busybox chown media_rw.media_rw /data/local/backup"
adb shell su -c "busybox chmod 777 /data/local/backup"
echo.
mkdir Backup 2>nul
cd Backup
echo.
ECHO I Am Backing Up Partition 9 (recovery)
ECHO ***************************
adb shell su -c "dd if=/dev/block/mmcblk0p9 of=/data/local/backup/stock-recovery.img"
ECHO I Am Backing Up Partition 10 (boot)
ECHO ******************************
adb shell su -c "dd if=/dev/block/mmcblk0p10 of=/data/local/backup/stock-boot.img"
ECHO I Am Backing Up Partition 11 (system)
ECHO *********************************
adb shell su -c "dd if=/dev/block/mmcblk0p11 of=/data/local/backup/stock-system.img"
ECHO *********************************
ECHO We Are Now Modify Ownership/Permissions Of All Archives
ECHO *********************************
adb shell su -c "busybox chmod 777 /data/local/backup/stock-recovery.img"
adb shell su -c "busybox chown media_rw.media_rw /data/local/backup/stock-recovery.img"
adb shell su -c "busybox chmod 777 /data/local/backup/stock-boot.img"
adb shell su -c "busybox chown media_rw.media_rw /data/local/backup/stock-boot.img"
adb shell su -c "busybox chown media_rw.media_rw /data/local/backup/stock-system.img"
adb shell su -c "busybox chmod 777 /data/local/backup/stock-system.img"
echo.
echo.
ECHO ***************************************************************
ECHO *OK, The Backup Has Completed We Are Now Pulling A Copy Of The*
ECHO *Backup To Your Computer In A Folder Named KindleBackup. This *
ECHO * Will Take Some Time To Complete, Depending On The Speed Of  *
ECHO *             Your USB Subsystem............                  *
ECHO ***************************************************************
echo.
echo.
adb pull /data/local/backup/stock-boot.img
adb pull /data/local/backup/stock-recovery.img
adb pull /data/local/backup/stock-system.img
echo.
echo.
ECHO ***********************************************
ECHO *OK, We Are Done With The Process, We Are Now *
ECHO *Rebooting The Kindle So The Backup Is Removed*
ECHO *             From Memory.                    *
ECHO ***********************************************
adb reboot
adb wait-for-device
echo.
ECHO ***********************************************
ECHO * We Are Now Performing A Cleanup Of The Temp *
ECHO *  Directory. If you See The Following Error  *
ECHO *    The Directory Is Empty. The Error        *
ECHO * rm failed for *, No such file or directory  *
ECHO *    Is Expected And Can Be Ignored.          *
ECHO ***********************************************
echo.
echo.
COLOR 2
echo.
ECHO *************************************************
ECHO *The Backup Process Has Completed. Please Make A*
ECHO *Copy Of The Backup From The Backup Folder to CD*
ECHO *************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:BACKUP-3.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *************************************************
ECHO * The Operation To Backup The Kindle To A Folder*
ECHO *    Named Backup Was Canceled By The User!     *
ECHO *************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:BACKUP-3.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:BACKUP-3.0

:INSTALL-PLAYSTORE
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *********************************************************************
ECHO *In This Option We Will Install Google Play Store Production Version*
ECHO *   3.10.10 - Be Sure To Pay Close Attention To The Interactive     *
ECHO * Installation. There Are Steps That Requires You To Interact With  *
ECHO * The Kindle Otherwise The Installation Will Fail. If Google Play   *
ECHO * Store Fails, Be Sure To Reinstall Google Play Store. This Solves  *
ECHO *                Most Google Play Store Issues.                     *
ECHO *********************************************************************
echo.
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Install Google play Store Version 3.10.10?" INSTALL-PLAYSTORE.0 INSTALL-PLAYSTORE.1

:INSTALL-PLAYSTORE.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO ******************************************************
ECHO *We Are Now Preparing The Kindle, Please Wait........*
ECHO ******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO *We Are Now Installing Google Play Store, Please Wait.*
ECHO * During The Install The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into *
ECHO *             USB, Are You Ready?                     *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *                  Phase One                          *
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *   A Google Play Store Install. Please Pay Close     *
ECHO * Attention To The Kindle For A Superuser Popup. Be   *
ECHO *    Sure To Allow Or Grant The Superuser Request     *
ECHO * Otherwise The Google Play Store Install Will Fail.  *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-PLAYSTORE.2
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
mkdir Disabled 2>nul
cd Disabled
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb pull /system/app/MarketIntentProxy.apk
adb shell su -c "rm /system/app/MarketIntentProxy.apk"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ********************************************************
ECHO *We Are Now Installing Five Google Play Store Services.*
ECHO ********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
cd %~dp0GooglePlay
adb push AccountAndSyncSettings.apk /system/app/.
adb push GoogleServicesFramework.apk /system/app/.
adb push GoogleLoginService.apk /system/app/.
adb push NetworkLocation.apk /system/app/.
adb push Vending.apk /system/app/.
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **************************************************************
ECHO *We Are Now Setting Up The Services And Checking Permissions.*
ECHO **************************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "busybox chmod 0644 /system/app/AccountAndSyncSettings.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleServicesFramework.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleLoginService.apk"
adb shell su -c "busybox chmod 0644 /system/app/NetworkLocation.apk"
adb shell su -c "busybox chmod 0644 /system/app/Vending.apk"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "rm /data/local.prop"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO * Please Go To The Kindle Apps On The Device. Launch  *
ECHO *  The Old Android Store Accept The License And Add   *
ECHO * Your Google Account To The Android Store Then Close *
ECHO *The Application. Please Let Me Know When You Are Done*
ECHO *******************************************************
echo.
PAUSE
echo.
ECHO ********************************************************
ECHO *We Are Now Upgrading The Android Store To Google Play *
ECHO *Store. Here We Go, We Are Preparing The Kindle For The*
ECHO * Upgrade And Performing A Reboot. The Upgrade Is A 3  *
ECHO *                   Step Process.                      *
ECHO ********************************************************
echo.
ECHO *******************************************************
ECHO *                  Phase Two                          *
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *         The Google Play Store Upgrade.              *
ECHO *******************************************************
echo.
ECHO ***********************************************
ECHO * We Are Now Performing A Cleanup Of The Temp *
ECHO *  Directory. If you See The Following Error  *
ECHO *    The Directory Is Empty. The Error        *
ECHO * rm failed for *, No such file or directory  *
ECHO *    Is Expected And Can Be Ignored.          *
ECHO ***********************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *After The Reboot, This Is Normal, This Is The First Step.*
ECHO ***********************************************************
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb install -r Gplay3.8.17.apk
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ************************************************
ECHO *We Have Applied The Google Play 3.8.17 Upgrade*
ECHO *           Rebooting The Kindle.              *
ECHO ************************************************
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb install -r Phonesky.apk
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
ECHO ***************************************************
ECHO * We Have Applied The Google Play 3.10.10 Upgrade.*
ECHO *  We Are Rebooting The Kindle And Restoring The  *
ECHO *                   Appearance.                   *
ECHO ***************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
COLOR 2
echo.
ECHO ***************************************************
ECHO *  The Install Was A Success! Please Open Google  *
ECHO *  Play Store In The Kindle Apps, Press Continue  *
ECHO *The Store May Close, This Is Normal. Open Google *
ECHO *Play Store, Wait 2 Minutes For Everything To Sync*
ECHO * Then Close Google Play Store. Wait 1 Minute And *
ECHO * Open Google Play Store Again, Then Wait Another *
ECHO * 2 Minutes, Then Close Google Play Store Again   *
ECHO * Waiting Another Minute. That Is It, Google Play *
ECHO *  Store Is Installed And Upgraded To 3.10.10     *
ECHO ***************************************************
echo.
ECHO
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-PLAYSTORE.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *************************************************
ECHO * The Operation To Install Google Play Store    *
ECHO *  Version 3.10.10 Was Canceled By The User!    *
ECHO *************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:INSTALL-PLAYSTORE.2
echo.
cls
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install -r Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
cd %~dp0
CALL:INSTALL-PLAYSTORE.0

:OTA-ENABLE
echo.
cls
echo.
COLOR 2
echo.
ECHO ******************************************************************
ECHO *  This Option Will Selectively Enable All The Known Amazon      *
ECHO * Services Uses To Deploy New Software Via Over The Air Updates  *
ECHO *  This Option Is Interactive Allowing You To Enable Selective   *
ECHO * OTA Services One By One Until You Obtain The Preferred Outcome *
ECHO *Be Sure To Test The Intended Function As You Enable Each Service*
ECHO ******************************************************************
echo.
echo.
PAUSE
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Selectively Enable OTA Updates?" OTA-ENABLE.0 OTA-ENABLE.15

:OTA-ENABLE.0
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
PAUSE
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *****************************************************
ECHO *We Are Now Preparing The Kindle, Please Wait.......*
ECHO *****************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *****************************************************
ECHO *We Are Now Enabling OTA, Please Wait...............*
ECHO *  Please Pay Close Attention To The Kindle For A   *
ECHO *Superuser Popup. When You See The Popup Be Sure To *
ECHO * Allow Or Grant Each Superuser Request, Otherwise  *
ECHO *          This Process Will Fail!                  *
ECHO *****************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto OTA-ENABLE.16
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO We Are Now Enabling OTAUpdateMessageHandler.
adb shell su -c "pm enable 'com.amazon.dcp/.ota.OTAUpdateMessageHandler'"
echo.
set /p unr=Would You Like To Disable OTAUpdateMessageHandler(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.1
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAUpdateMessageHandler'"
echo.
CALL:OTA-ENABLE.1

:OTA-ENABLE.1
echo.
ECHO We Are Now Enabling InventoryUploadService..
adb shell su -c "pm enable 'com.amazon.dcp/.ota.InventoryUploadService'"
echo.
set /p unr=Would You Like To Disable InventoryUploadService(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.2
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.InventoryUploadService'"
echo.
CALL:OTA-ENABLE.2

:OTA-ENABLE.2
echo.
ECHO We Are Now Enabling UpdatesLookupService...
adb shell su -c "pm enable 'com.amazon.dcp/.ota.UpdatesLookupService'"
echo.
set /p unr=Would You Like To Disable UpdatesLookupService(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.3
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.UpdatesLookupService'"
echo.
CALL:OTA-ENABLE.3


:OTA-ENABLE.3
echo.
ECHO We Are Now Enabling OTAService....
adb shell su -c "pm enable 'com.amazon.dcp/.ota.OTAService'"
echo.
set /p unr=Would You Like To Disable OTAService(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.4
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAService'"
echo.
CALL:OTA-ENABLE.4

:OTA-ENABLE.4
echo.
ECHO We Are Now Enabling AppStateMonitorService.....
adb shell su -c "pm enable 'com.amazon.dcp/.ota.AppStateMonitorService'"
echo.
set /p unr=Would You Like To Disable AppStateMonitorService(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.5
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.AppStateMonitorService'"
echo.
CALL:OTA-ENABLE.5

:OTA-ENABLE.5
echo.
ECHO We Are Now Enabling CheckForOTAUpdatesService.......
adb shell su -c "pm enable 'com.amazon.dcp/.ota.CheckForOTAUpdatesService'"
echo.
set /p unr=Would You Like To Disable CheckForOTAUpdatesService(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.6
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.CheckForOTAUpdatesService'"
echo.
CALL:OTA-ENABLE.6

:OTA-ENABLE.6
echo.
ECHO We Are Now Enabling ViewUpdateActivity.......
adb shell su -c "pm enable 'com.amazon.dcp/.ota.ViewUpdateActivity'"
echo.
set /p unr=Would You Like To Disable ViewUpdateActivity(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.7
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.ViewUpdateActivity'"
echo.
CALL:OTA-ENABLE.7

:OTA-ENABLE.7
echo.
ECHO We Are Now Enabling OTAStatusActivity........
adb shell su -c "pm enable 'com.amazon.dcp/.ota.OTAStatusActivity'"
echo.
set /p unr=Would You Like To Disable OTAStatusActivity(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.8
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAStatusActivity'"
echo.
CALL:OTA-ENABLE.8

:OTA-ENABLE.8
echo.
ECHO We Are Now Enabling ResetOTAMessageHandler.........
adb shell su -c "pm enable 'com.amazon.dcp/.ota.ResetOTAMessageHandler'"
echo.
set /p unr=Would You Like To Disable ResetOTAMessageHandler(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.9
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.ResetOTAMessageHandler'"
echo.
CALL:OTA-ENABLE.9

:OTA-ENABLE.9
echo.
ECHO We Are Now Enabling InventoryUploadReceiver..........
adb shell su -c "pm enable 'com.amazon.dcp/.ota.InventoryUploadService$InventoryUploadReceiver'"
echo.
set /p unr=Would You Like To Disable InventoryUploadReceiver(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.10
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.InventoryUploadService$InventoryUploadReceiver'"
echo.
CALL:OTA-ENABLE.10

:OTA-ENABLE.10
echo.
ECHO We Are Now Enabling MountStatusChangedReceiver...........
adb shell su -c "pm enable 'com.amazon.dcp/.ota.UpdatesLookupService$MountStatusChangedReceiver'"
echo.
set /p unr=Would You Like To Disable MountStatusChangedReceiver(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.11
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.UpdatesLookupService$MountStatusChangedReceiver'"
echo.
CALL:OTA-ENABLE.11

:OTA-ENABLE.11
echo.
ECHO We Are Now Enabling OTAWakeupReceiver.............
adb shell su -c "pm enable 'com.amazon.dcp/.ota.OTAService$OTAWakeupReceiver'"
echo.
set /p unr=Would You Like To Disable OTAWakeupReceiver(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.12
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAService$OTAWakeupReceiver'"
echo.
CALL:OTA-ENABLE.12

:OTA-ENABLE.12
echo.
ECHO We Are Now Enabling OTADedupeReceiver..............
adb shell su -c "pm enable 'com.amazon.dcp/.ota.OTAService$OTADedupeReceiver'"
echo.
set /p unr=Would You Like To Disable OTADedupeReceiver(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.13
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAService$OTADedupeReceiver'"
echo.
CALL:OTA-ENABLE.13

:OTA-ENABLE.13
echo.
ECHO We Are Now Enabling OTAInstallNowReceiver...............
adb shell su -c "pm enable 'com.amazon.dcp/.ota.OTAService$OTAInstallNowReceiver'"
echo.
set /p unr=Would You Like To Disable OTAInstallNowReceiver(y/n) ?
IF %unr% == n GOTO OTA-ENABLE.14
echo.
adb shell su -c "pm disable 'com.amazon.dcp/.ota.OTAService$OTAInstallNowReceiver'"
echo.
CALL:OTA-ENABLE.14

:OTA-ENABLE.14
echo.
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
ECHO ***********************************************************
ECHO *We Are Done! We Will Now Reboot The Kindle, Are You Ready*
ECHO *         For Me To Reboot The Kindle?                    *
ECHO ***********************************************************
echo.
PAUSE
echo.
adb kill-server
adb wait-for-device
adb reboot
echo.
echo.
ECHO *******************************************************
ECHO *OK, We Are Rebooting The Kindle And Will Wrap Up This*
ECHO *                     Process!                        *
ECHO *******************************************************
echo.
COLOR 2
echo.
adb kill-server
adb wait-for-device
echo.
ECHO ***************************************************
ECHO *The OTA Enable Process Has Completed.............*
ECHO ***************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:OTA-ENABLE.15
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *************************************************
ECHO * The Operation To Selectively Enable OTA Was   *
ECHO *          Canceled By The User!                *
ECHO *************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:OTA-ENABLE.16
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install -r Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:OTA-ENABLE.0

:ROOT-OLD
echo.
cls
echo.
echo.
ECHO *********************************************************
ECHO *This Option We Will Attempt To Root The Kindle Using A *
ECHO *  Well Known Android Ice Cream Sandwich Exploit Found  *
ECHO * On The Transformer Prime With ICS by Sparkym3, So Full*
ECHO * Credit For The Exploit Goes To Sparkym3. This Exploit *
ECHO *  Was Highly Effective On Software Versions x.2.1 So   *
ECHO *  If You Are Running Kindle Fire Software x.2.1 This   *
ECHO * Method Will Work. If You Are Using Software x.2.3 Or  *
ECHO * Higher, This Method Will Fail, Please Use Option 21   *
ECHO *  To Root Kindle Fire With Software x.2.3 Or Higher.   *
ECHO *********************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
PAUSE
echo.
cls
echo.
ECHO ******************************************************
ECHO *We Are Now Beginning The Root Process, Please Wait. *
ECHO *During The Upgrade The Kindle Will Look Unusual, Do *
ECHO *Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into*
ECHO *              USB, Are You Ready?                   *
ECHO ******************************************************
echo.
ECHO ******************************************************
ECHO * If The Kindle Hangs At This Point, There May Be A  *
ECHO *  Driver Problem Or Kindle ADB Is Not Turned On.    *
ECHO ******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *********************************************
ECHO *Here We Go, We Are Now Preparing The Kindle*
ECHO *********************************************
echo.
adb shell "mv /data/local/tmp /data/local/tmp.bak"
adb shell "ln -s /data/ /data/local/tmp"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb wait-for-device
echo.
ECHO *********************************
ECHO *We Are Trying The First Exploit*
ECHO * If You See An Error We Will   *
ECHO * Be Able To Solve The Problem  *
ECHO *********************************
echo.
adb shell "rm /data/local.prop"
adb shell "echo ro.kernel.qemu=1 > /data/local.prop"
echo.
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *         After The Reboot, This Is Normal.               *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
PAUSE <CON
echo.
echo.
cd root
REM del \KFFirstAide\dropbox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
REM wget http://dl.dropbox.com/u/54456659/busybox/busybox
REM wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell "busybox mount -o remount,rw ext4 /system"
adb shell "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb push su /data/local/tmp/.
adb push Superuser.apk /data/local/tmp/.
adb shell "busybox chmod 755 /data/local/tmp/busybox"
adb shell "busybox chown 0:0 /data/local/tmp/busybox"
adb shell "/data/local/tmp/busybox mount -o remount,rw /system"
adb shell "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell "busybox chown root.shell /system/xbin/busybox"
adb shell "busybox chmod 04755 /system/xbin/busybox"
adb shell "/system/xbin/busybox --install -s /system/xbin"
adb shell "/system/xbin/busybox mv /data/local/tmp/su /system/xbin/su"
adb shell "/system/xbin/busybox mv /data/local/tmp/Superuser.apk /system/app/Superuser.apk"
adb shell "busybox chown 0.0 /system/xbin/su"
adb shell "busybox chmod 06755 /system/xbin/su"
adb shell "busybox chmod 655 /system/app/Superuser.apk"
adb shell "busybox chmod 755 /system/xbin/busybox"
adb shell "rm /system/bin/su"
adb shell "ln -s /system/xbin/su /system/bin/su"
adb install -r Busybox_Installer_4.1.apk
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell "/system/xbin/busybox mount -o remount,ro /system"
echo.
ECHO ***************************************************
ECHO *OK, We Are Done With The Binary, Now We Are Going*
ECHO *              To Reboot The Kindle.              *
ECHO ***************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
ECHO *******************************************************
ECHO *Looks Good! Root Permissions Are Successfully Granted*
ECHO *To The SU Binary. We will Now Install Superuser......*
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************
ECHO *  OK, We Are Now Installing Root Checker *
ECHO * Basic. After The Kindle Reboot You Will *
ECHO * Be Able To Find Root Checker Basic Under*
ECHO * The Kindle Apps. Please Use This Program*
ECHO *             To Test Root.               *
ECHO *******************************************
echo.
adb install -r suchecker.apk
echo.
ECHO *******************************************************
ECHO *The Kindle Now Has Root. After The Reboot Please Goto*
ECHO *  Kindle Apps On The Device And Launch Superuser To  *
ECHO *              Initialize The Service.                *
ECHO *******************************************************
echo.
ECHO ***********************************************
ECHO * We Are Now Performing A Cleanup Of The Temp *
ECHO *  Directory. If you See The Following Error  *
ECHO *    The Directory Is Empty. The Error        *
ECHO * rm failed for *, No such file or directory  *
ECHO *    Is Expected And Can Be Ignored.          *
ECHO ***********************************************
echo.
adb shell "busybox mount -o remount,rw /system"
adb shell su -c "/system/xbin/busybox mount -o remount,rw /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell "busybox mount -o remount,ro /system"
echo.
ECHO ****************************************************
ECHO *Now We Are Going To Test Root, Sometimes This Test*
ECHO *  May Hang A Little, Plese Give It A Couple Of    *
ECHO *  Minutes. If There Is No Response Go Into More + *
ECHO *    Security And Toogle ADB Off Then Back On.     *
ECHO ****************************************************
echo.
type isroot | adb shell | find "#"
if %errorlevel% == 1 goto ROOT-OLD.1
echo.
ECHO *******************************************************
ECHO *Success!!! You Have Root, This Test Is Very Accurate *
ECHO *Please Do Not Focus On The Errors During This Process*
ECHO *  Since There Will Be Errors. We Are Exploiting The  *
ECHO *        Kindle Fire, Errors Are Expected!            *
ECHO *******************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:ROOT-OLD.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ****************************************************************
ECHO *You Made It Passed Step 2, We Were Able To Exploit The Kindle!*
ECHO *  Although Root Failed. Please Run Option 18 Again, Sometimes *
ECHO * The Process Need To Be Repeated Several Time Before You Will *
ECHO * Successfully Root The Kindle. If This Method Fails More Than *
ECHO * 5 Times Try Preferred Which Uses A Different Method To Root  *
ECHO *                         The Kindle.                          *
ECHO ****************************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:ROOT-PREFERRED
echo.
cls
echo.
ECHO ***********************************************************
ECHO *Thank You For Selecting Preferred To Root The Kindle This*
ECHO *Method Is Highy Effective To Root The Kindle, You May Use*
ECHO *This Option To Root Other Android Devices Since It Works *
ECHO * On Most Androids. This Method Is Non-Destructive So If  *
ECHO * You Try This Method On An Android Other Than The Kindle *
ECHO * No Harm Will Result. The Binaries Used Are Universal To *
ECHO *             All Android Devices!                        *
ECHO ***********************************************************
echo.
echo.
COLOR 2
echo.
CALL:yesno "Are You Sure You Would Like To Root The Kindle Fire Using Preferred Method?" ROOT-PREFERRED.0 ROOT-PREFERRED.4

:ROOT-PREFERRED.0
echo.
cd root
cls
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
ECHO ******************************************************
ECHO *We Are Now Beginning The Root Process, Please Wait. *
ECHO *During The Upgrade The Kindle Will Look Unusual, Do *
ECHO *Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into*
ECHO *              USB, Are You Ready?                   *
ECHO ******************************************************
echo.
ECHO ****************************************************
ECHO *                Phase One                         *
ECHO *   We Are Now Setting Up A Fake Restore.....      *
ECHO ****************************************************
echo.
echo.
ECHO ***************************************************
ECHO *Attention, This Is An Important Step! Please Look*
ECHO * At Your Kindle's Display. Please Click On The   *
ECHO *Restore Button. If The Kindle Asks For A Password*
ECHO * Use Your Amazon Account Password, Although This *
ECHO *           Usually Not Required.                 *
ECHO ***************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb restore fakebackup.ab
echo.
ECHO ******************************************************
ECHO *                  Phase Two                         *
ECHO *   Let's Proceed And Begin The Second Exploit       *
ECHO * If This Hangs Go To The Kindle More+ Security And  *
ECHO * Turn Enable ADB Off And Back On, Then Wait A Few   *
ECHO *      Minutes For ADB To Be Detected Again.         *
ECHO ******************************************************
echo.
adb shell "while ! ln -s /data/local.prop /data/data/com.android.settings/a/file99; do :; done" > NUL
echo.
ECHO ******************************************************
ECHO * The Exploit Was Successful! We Are Going To Reboot *
ECHO *           Your Kindle In 10 Seconds..........      *
ECHO *  ATTENTION: If The Kindle Does Not Reboot, Please  *
ECHO *  Leave The Kindle Plugged Into USB. On The Kindle  *
ECHO *Please Navigate To More + Security And Turn ADB OFF *
ECHO * Then Back ON, Wait. The Kindle Should Now Reboot!  *
ECHO ******************************************************
echo.
ping -n 10 127.0.0.1 > NUL
echo.
adb wait-for-device
adb reboot
echo.
ECHO ******************************************************
ECHO *  We Are Waiting For The Device To Show Up In ADB   *
ECHO ******************************************************
echo.
ping -n 10 127.0.0.1 > NUL
echo.
adb kill-server
adb wait-for-device
echo.
ECHO ****************************************************
ECHO *     We Are Pushing Busybox To The Kindle         *
ECHO ****************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/busybox/busybox
adb shell "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
echo.
ECHO ****************************************************
ECHO *   We Are Pushing The SU Binary To The Kindle     *
ECHO ****************************************************
echo.
adb push su /data/local/tmp/.
echo.
ECHO ****************************************************
ECHO *     We Are Pushing Superuser To The Kindle       *
ECHO ****************************************************
echo.
adb push Superuser.apk /data/local/tmp/.
echo.
ECHO ****************************************************
ECHO *    We Are Now Setting The Busybox Permissions    *
ECHO ****************************************************
echo.
adb shell "chmod 755 /data/local/tmp/busybox"
echo.
ECHO ***************************************************
ECHO *We Are Now Setting The Permissions And Installing*
ECHO *                Busybox                          *
ECHO ***************************************************
echo.
REM del \KFFirstAide\Busybox_Installer_4.1.apk
REM wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb shell "/data/local/tmp/busybox mount -o remount,rw /system"
adb shell "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell "chown root.shell /system/xbin/busybox"
adb shell "busybox chmod 04755 /system/xbin/busybox"
adb shell "/system/xbin/busybox --install -s /system/xbin"
adb shell "rm -r /data/local/tmp/busybox"
adb shell "/system/xbin/busybox mount -o remount,rw /system"
adb shell "/system/xbin/busybox mv /data/local/tmp/su /system/xbin/su"
adb shell "/system/xbin/busybox mv /data/local/tmp/Superuser.apk /system/app/Superuser.apk"
adb shell "chown 0.0 /system/xbin/su"
adb shell "chmod 06755 /system/xbin/su"
adb shell "chmod 655 /system/app/Superuser.apk"
adb shell "rm /system/bin/su"
adb shell "ln -s /system/xbin/su /system/bin/su"
adb install -r Busybox_Installer_4.1.apk
adb shell "/system/xbin/busybox mount -o remount,ro /system"
echo.
ECHO *********************************************
ECHO * We Are Done! So Far Everything Looks Good *
ECHO *    Next We Will Reboot The Kindle.        *
ECHO *********************************************
echo.
adb reboot
echo.
CALL:ROOT-PREFERRED.2

:ROOT-PREFERRED.1
echo.
cls
echo.
COLOR 2
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *********************************************
ECHO * Success! The First Exploit Worked! Let's  *
ECHO *             Wrap This Up....              *
ECHO *********************************************
echo.
echo.
ECHO ****************************************************
ECHO *     We Are Pushing Busybox To The Kindle         *
ECHO ****************************************************
echo.
REM del \KFFirstAide\busybox
REM wget http://dl.dropbox.com/u/54456659/busybox/busybox
adb shell "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
echo.
ECHO ****************************************************
ECHO *   We Are Pushing The SU Binary To The Kindle     *
ECHO ****************************************************
echo.
adb push su /data/local/tmp/.
echo.
ECHO ****************************************************
ECHO *     We Are Pushing Superuser To The Kindle       *
ECHO ****************************************************
echo.
adb push Superuser.apk /data/local/tmp/.
echo.
ECHO ****************************************************
ECHO *    We Are Now Setting The Busybox Permissions    *
ECHO ****************************************************
echo.
adb shell "chmod 755 /data/local/tmp/busybox"
adb shell "busybox mount -o remount,rw ext4 /system"
adb shell "mount -o rw,remount /dev/block/mmcblk0p1 /system"
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell "/data/local/tmp/busybox mount -o remount,rw /system"
adb shell "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell "chown root.shell /system/xbin/busybox"
adb shell "chmod 04755 /system/xbin/busybox"
adb shell "/system/xbin/busybox --install -s /system/xbin"
adb shell "/system/xbin/busybox mount -o remount,rw ext4 /system"
adb shell "/system/xbin/busybox mv /data/local/tmp/su /system/xbin/su"
adb shell "/system/xbin/busybox mv /data/local/tmp/Superuser.apk /system/app/Superuser.apk"
adb shell "chown 0.0 /system/xbin/su"
adb shell "chmod 06755 /system/xbin/su"
adb shell "chmod 655 /system/app/Superuser.apk"
adb shell "rm /system/bin/su"
adb shell "ln -s /system/xbin/su /system/bin/su"
adb install -r Busybox_Installer_4.1.apk
adb shell "/system/xbin/busybox mount -o remount,ro ext4 /system"
adb shell "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
echo.
CALL:ROOT-PREFERRED.2

:ROOT-PREFERRED.2
echo.
cls
echo.
echo.
COLOR 2
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************
ECHO *  OK, We Are Now Installing Root Checker *
ECHO * Basic. After The Kindle Reboot You Will *
ECHO * Be Able To Find Root Checker Basic Under*
ECHO * The Kindle Apps. Please Use This Program*
ECHO *             To Test Root.               *
ECHO *******************************************
echo.
adb install -r suchecker.apk
echo.
ECHO *******************************************************
ECHO *The Kindle Now Has Root! After The Reboot Please Goto*
ECHO *  Kindle Apps On The Device And Launch Superuser To  *
ECHO *  Initialize The Service. Let Me Know When You Have  *
ECHO *         Launched SuperSU or Superuser!              *
ECHO *******************************************************
echo.
ECHO *******************************************************
ECHO *  Please Pay Attention To The Kindle For A SuperSU   *
ECHO *   Popup or Request, Be Sure To Click On Grant Or    *
ECHO *     Allow Otherwise The Next Step Will Fail.        *
ECHO *******************************************************
echo.
PAUSE
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
echo.
ECHO *************************************************
ECHO *Finally, If You Loose The Navigation Bars After*
ECHO *Rooting The Kindle, There Is A Easy Fix. Please*
ECHO *Drop To Command And Enter The Following Command*
ECHO *     adb shell su -c rm /data/local.prop       *
ECHO * If You Have To Execute This Command Pay Close *
ECHO *   Attention To The Kindle For A SuperSU Or    *
ECHO * Superuser Popup Or Request, Be Sure To Click  *
ECHO *  Allow Or Grant. This Will Solve The Missing  *
ECHO *              Navigation Bars!                 *
ECHO *************************************************
echo.
ECHO *****************************************************
ECHO *   We Are Now Testing Superuser...Please Wait      *
ECHO *       This Test May Tak A Few Minutes..........   *
ECHO *****************************************************
echo.
type isroot | adb shell | find "#"
if %errorlevel% == 1 goto ROOT-PREFERRED.3
echo.
ECHO **********************************************
ECHO *Looks Good! The Root Permission Test Passed!*
ECHO **********************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:ROOT-PREFERRED.3
echo.
cls
echo.
COLOR 2
echo.
ECHO ****************************************************************
ECHO *     Root Failed. Please Run Preferred Again, Sometimes       *
ECHO * The Process Need To Be Repeated Several Time Before You Will *
ECHO * Successfully Root The Kindle. If This Method Fails More Than *
ECHO * 5 Times Try Option OLD Which Uses A Different Method To Root *
ECHO *                         The Kindle.                          *
ECHO ****************************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
ECHO ***********************************************
ECHO * We Are Now Performing A Cleanup Of The Temp *
ECHO *  Directory. If you See The Following Error  *
ECHO *    The Directory Is Empty. The Error        *
ECHO * rm failed for *, No such file or directory  *
ECHO *    Is Expected And Can Be Ignored.          *
ECHO ***********************************************
echo.
echo.
ECHO *************************************************
ECHO *Finally, If You Loose The Navigation Bars After*
ECHO *Rooting The Kindle, There Is A Easy Fix. Please*
ECHO *Drop To Command And Enter The Following Command*
ECHO *     adb shell su -c rm /data/local.prop       *
ECHO * If You Have To Execute This Command Pay Close *
ECHO *   Attention To The Kindle For A SuperSU Or    *
ECHO * Superuser Popup Or Request, Be Sure To Click  *
ECHO *  Allow Or Grant. This Will Solve The Missing  *
ECHO *              Navigation Bars!                 *
ECHO *************************************************
echo.
adb shell "busybox mount -o remount,rw ext4 /system"
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell "busybox mount -o remount,rw ext4 /system"
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb shell "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:ROOT-PREFERRED.4
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO *Thank You For Selecting Preferred To Root The Kindle*
ECHO *The Operation To Root The Kindle Fire Was Canceled  *
ECHO *                  By The User!                      *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu


:UNROOT
echo.
cls
echo.
ECHO ************************************************************
ECHO *Thank You For Selecting UNROOT. This Option will Remove*
ECHO * The Android Superuser Service And Remove The SU Binary   *
ECHO *  You Will Want To Use This Option Prior To Sending The   *
ECHO *  Tablet Back To Amazon. You May Use This Option On Any   *
ECHO *   Device That Has Root Installed. This Option Is Also    *
ECHO * Effective When Trying To Solve A Problem After Root Has  *
ECHO * Been Installed. Several End Users Will Use This Option   *
ECHO * To Reduce Access While The Tablet Is Loaned To Another   *
ECHO *        Kindle User, Like Your Kids Or A Friend.          *
ECHO ************************************************************
echo.
echo.
COLOR 2
echo.
CALL:yesno "Are You Sure You Would Like To Remove Root From The Kindle Fire?" UNROOT.0 UNROOT.1

:UNROOT.0
cd root
echo.
cls
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO * We Are Now Going To Remove Root Binary, Please Wait *
ECHO * During The Install The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into *
ECHO *             USB, Are You Ready?                     *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *              An Automated Install.                  *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto UNROOT.2
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
echo.
adb kill-server
adb start-server
adb wait-for-device
echo.
ECHO ***********************************************
ECHO * We Are Now Performing A Cleanup Of The Temp *
ECHO *  Directory. If you See The Following Error  *
ECHO *    The Directory Is Empty. The Error        *
ECHO * rm failed for *, No such file or directory  *
ECHO *    Is Expected And Can Be Ignored.          *
ECHO ***********************************************
echo.
ECHO ***********************************************
ECHO * We Are Now Performing A Cleanup Of The Temp *
ECHO *  Directory. If you See The Following Error  *
ECHO *    The Directory Is Empty. The Error        *
ECHO * rm failed for *, No such file or directory  *
ECHO *    Is Expected And Can Be Ignored.          *
ECHO ***********************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
mkdir root\backup 2>nul
cd root\backup
adb pull /system/xbin/su
adb pull /system/app/Superuser.apk
adb shell su -c "rm /system/xbin/su"
adb shell su -c "rm /system/app/Superuser.apk"
adb shell "busybox mount -o remount,ro /system"
echo.
echo.
ECHO ***********************************************
ECHO *Success! We Have Removed Root On Your Kindle.*
ECHO *The Kindle Fire Is Back To The Original State*
ECHO ***********************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:UNROOT.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO *    Thank You For Selecting UNROOT To Remove Root   *
ECHO *  The Operation To Remove Root The Kindle Fire Was  *
ECHO *            Canceled By The User!                   *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:UNROOT.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO * And We Will Install The Original Busybox That Was  *
ECHO *           Included With The Kindle.                *
ECHO ******************************************************
echo.
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
REM wget http://dl.dropbox.com/u/54456659/busybox/busybox
REM wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install -r Busybox_Installer_4.1.apk

echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:UNROOT.0

:INSTALL-GAPPS
echo.
cls
echo.
ECHO *******************************************************
ECHO * Thank You For Selecting Option 23. This Option Will *
ECHO *  Install The Google Applications Including Google   *
ECHO * TTS (Speech Recognition) With Android Voice Xtreme  *
ECHO * Free If You Use The Voice Attendant Feature Please  *
ECHO *Upgrade Android Voice Xtreme Paid Version. The Google*
ECHO * Apps That Will Be Installed Is Chrome Bookmark Sync *
ECHO *Service, Front Camera Support, Gmail, Google Backup, *
ECHO *Google Voice Search, Google Street View, Google Voice*
ECHO *    Google Currents, Chrome, Earth, Maps, YouTube    *
ECHO *  Universal Terminal Emulator And ES File Explorer.  *
ECHO *******************************************************
echo.
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Install Google Apps With AVIC Alice Speech Recognition?" INSTALL-GAPPS.0 INSTALL-GAPPS.2

:INSTALL-GAPPS.0
echo.
cls
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO * We Are Now Installing Google ICS Apps, Please Wait  *
ECHO * During The Install The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into *
ECHO *             USB, Are You Ready?                     *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *              An Automated Install.                  *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-GAPPS.3
echo.
set /p unr=Would You Like To Install Google Apps For Ice Cream Sandwich(y/n) ?
IF %unr% == n GOTO INSTALL-GAPPS.1
echo.
ECHO **********************************************************
ECHO *  We Are Installing Google Apps for Ice Cream Sandwich  *
ECHO * Release Date 04/29/2012 (The Latest Available from Goo)*
ECHO **********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
ECHO ********************************************************
ECHO *   We Are Now Installing The Google Apps & Services   *
ECHO ********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /system/addon.d"
adb push AppsICS\system\addon.d\70-gapps.sh /system/addon.d/.
adb push AppsICS\system\tts\lang_pico\de-DE_gl0_sg.bin /system/tts/lang_pico/.
adb push AppsICS\system\tts\lang_pico\de-DE_ta.bin /system/tts/lang_pico/.
adb push AppsICS\system\tts\lang_pico\es-ES_ta.bin /system/tts/lang_pico/.
adb push AppsICS\system\tts\lang_pico\es-ES_zl0_sg.bin /system/tts/lang_pico/.
adb push AppsICS\system\tts\lang_pico\fr-FR_nk0_sg.bin /system/tts/lang_pico/.
adb push AppsICS\system\tts\lang_pico\fr-FR_ta.bin /system/tts/lang_pico/.
adb push AppsICS\system\tts\lang_pico\it-IT_cm0_sg.bin /system/tts/lang_pico/.
adb push AppsICS\system\tts\lang_pico\it-IT_ta.bin /system/tts/lang_pico/.
adb push GooglePlay\AccountAndSyncSettings.apk /system/app/.
adb push AppsICS\system\app\ChromeBookmarksSyncAdapter.apk /system/app/.
adb push GApps\FaceLock.apk /system/app/.
adb push AppsICS\system\app\GalleryGoogle.apk /system/app/.
adb push AppsICS\system\app\GenieWidget.apk /system/app/.
adb push AppsICS\system\app\GoogleBackupTransport.apk /system/app/.
adb push AppsICS\system\app\GoogleCalendarSyncAdapter.apk /system/app/.
adb push AppsICS\system\app\GoogleContactsSyncAdapter.apk /system/app/.
adb push AppsICS\system\app\GoogleFeedback.apk /system/app/.
adb push AppsICS\system\app\GoogleLoginService.apk /system/app/.
adb push AppsICS\system\app\GooglePartnerSetup.apk /system/app/.
adb push AppsICS\system\app\GoogleQuickSearchBox.apk /system/app/.
adb push AppsICS\system\app\GoogleServicesFramework.apk /system/app/.
adb push GApps\GoogleStreetView.apk /system/app/.
adb push AppsICS\system\app\GoogleTTS.apk /system/app/.
adb push GApps\Google_Voice_0.4.2.72.apk /system/app/.
adb push AppsICS\system\app\MarketUpdater.apk /system/app/.
adb push AppsICS\system\app\MediaUploader.apk /system/app/.
adb push AppsICS\system\app\NetworkLocation.apk /system/app/.
adb push AppsICS\system\app\OneTimeInitializer.apk /system/app/.
adb push AppsICS\system\app\Phonesky.apk /system/app/.
adb push AppsICS\system\app\SetupWizard.apk /system/app/.
adb push AppsICS\system\app\Talk.apk /system/app/.
adb push GApps\UniversalSearch.apk /system/app/.
adb push AppsICS\system\app\VoiceSearch.apk /system/app/.
adb push AppsICS\system\etc\g.prop /system/app/etc/.
adb push AppsICS\system\etc\permissions\com.google.android.maps.xml /system/app/etc/permissions/.
adb push AppsICS\system\etc\permissions\com.google.android.media.effects.xml /system/app/etc/permissions/.
adb push AppsICS\system\etc\permissions\com.google.widevine.software.drm.xml /system/app/etc/permissions/.
adb push AppsICS\system\etc\permissions\features.xml /system/app/etc/permissions/.
adb push AppsICS\system\etc\framework\com.google.android.maps.jar /system/app/etc/framework/.
adb push AppsICS\system\etc\framework\com.google.android.media.effects.jar /system/app/etc/framework/.
adb push AppsICS\system\etc\framework\com.google.widevine.software.drm.jar /system/app/etc/framework/.
adb push AppsICS\system\lib\libfilterpack_facedetect.so /system/lib/.
adb push AppsICS\system\lib\libflint_engine_jni_api.so /system/lib/.
adb push AppsICS\system\lib\libfrsdk.so /system/lib/.
adb push AppsICS\system\lib\libgcomm_jni.so /system/lib/.
adb push AppsICS\system\lib\libpicowrapper.so /system/lib/.
adb push AppsICS\system\lib\libspeexwrapper.so /system/lib/.
adb push AppsICS\system\lib\libvideochat_jni.so /system/lib/.
adb push AppsICS\system\lib\libvideochat_stabilize.so /system/lib/.
adb push AppsICS\system\lib\libvoicesearch.so /system/lib/.
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **************************************************************
ECHO *We Are Now Setting Up The Services And Checking Permissions.*
ECHO **************************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "busybox chmod 0755 /system/addon.d/70-gapps.sh"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/de-DE_gl0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/de-DE_ta.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/es-ES_ta.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/es-ES_zl0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/fr-FR_nk0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/fr-FR_ta.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/de-DE_gl0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/it-IT_cm0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/it-IT_ta.bin"
adb shell su -c "busybox chmod 0644 /system/app/AccountAndSyncSettings.apk"
adb shell su -c "busybox chmod 0644 /system/app/ChromeBookmarksSyncAdapter.apk"
adb shell su -c "busybox chmod 0644 /system/app/FaceLock.apk"
adb shell su -c "busybox chmod 0644 /system/app/GalleryGoogle.apk"
adb shell su -c "busybox chmod 0644 /system/app/GenieWidget.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleBackupTransport.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleCalendarSyncAdapter.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleContactsSyncAdapter.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleFeedback.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleLoginService.apk"
adb shell su -c "busybox chmod 0644 /system/app/GooglePartnerSetup.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleServicesFramework.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleQuickSearchBox.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleStreetView.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleTTS.apk"
adb shell su -c "busybox chmod 0644 /system/app/Google_Voice_0.4.2.72.apk"
adb shell su -c "busybox chmod 0644 /system/app/MarketUpdater.apk"
adb shell su -c "busybox chmod 0644 /system/app/MediaUploader.apk"
adb shell su -c "busybox chmod 0644 /system/app/NetworkLocation.apk"
adb shell su -c "busybox chmod 0644 /system/app/OneTimeInitializer.apk"
adb shell su -c "busybox chmod 0644 /system/app/SetupWizard.apk"
adb shell su -c "busybox chmod 0644 /system/app/Talk.apk"
adb shell su -c "busybox chmod 0644 /system/app/UniversalSearch.apk"
adb shell su -c "busybox chmod 0644 /system/app/VoiceSearch.apk"
adb shell su -c "busybox chmod 0644 /system/lib/libfacelock_jni.so"
adb shell su -c "busybox chmod 0644 /system/lib/libfilterpack_facedetect.so"
adb shell su -c "busybox chmod 0644 /system/lib/libflint_engine_jni_api.so"
adb shell su -c "busybox chmod 0644 /system/lib/libfrsdk.so"
adb shell su -c "busybox chmod 0644 /system/lib/libgcomm_jni.so"
adb shell su -c "busybox chmod 0644 /system/lib/libpicowrapper.so"
adb shell su -c "busybox chmod 0644 /system/lib/libspeexwrapper.so"
adb shell su -c "busybox chmod 0644 /system/lib/libvideochat_jni.so"
adb shell su -c "busybox chmod 0644 /system/lib/libvideochat_stabilize.so"
adb shell su -c "busybox chmod 0644 /system/lib/libvoicesearch.so"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
ECHO **************************************************************
ECHO *  We Are Now Installing The Last Few Google App Packages.   *
ECHO **************************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb install -r GApps\GoogleCurrents.apk
adb install -r GApps\Chrome_18.0.1025308.apk
adb install -r GApps\Earth_7.0.2.8421.apk
adb install -r GApps\ES_File_Explorer_1.6.2.5.apk
adb install -r GApps\Gmail_4.2.1.apk
adb install -r GApps\GoogleMaps.apk
adb install -r GApps\yourapp24.android.tools.alice_lite-1.apk
adb install -r GApps\YouTube_4.2.16.apk
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO * The Google Apps Have Been Installed Successfully *
ECHO * Please Test All The New Apps. If Any Fail To Open*
ECHO * Or Display An Error, Please Post A Message In The*
ECHO *   Kindle Fire First Aide Thread. Thank You For   *
ECHO *              Using Our Software.                 *
ECHO ****************************************************
echo.
cd \KFFirstAide
echo.
PAUSE
echo.
adb kill-server
echo.
GOTO menu

:INSTALL-GAPPS.1
echo.
cls
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO * We Are Now Installing Google ICS Apps, Please Wait  *
ECHO * During The Install The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into *
ECHO *             USB, Are You Ready?                     *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *              An Automated Install.                  *
ECHO *******************************************************
echo.
set /p unr=Would You Like To Install Google Apps For Jelly Bean(y/n) ?
IF %unr% == n GOTO INSTALL-GAPPS.2
echo.
ECHO **********************************************************
ECHO *     We Are Installing Google Apps for Jelly Bean       *
ECHO * Release Date 03/01/2013 (The Latest Available from Goo)*
ECHO **********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
ECHO ********************************************************
ECHO *   We Are Now Installing The Google Apps & Services   *
ECHO ********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /system/addon.d"
adb shell su -c "mkdir /system/usr/srec/en-US"
adb push AppsJB\system\addon.d\70-gapps.sh /system/addon.d/.
adb push AppsJB\system\tts\lang_pico\de-DE_gl0_sg.bin /system/tts/lang_pico/.
adb push AppsJB\system\tts\lang_pico\de-DE_ta.bin /system/tts/lang_pico/.
adb push AppsJB\system\tts\lang_pico\es-ES_ta.bin /system/tts/lang_pico/.
adb push AppsJB\system\tts\lang_pico\es-ES_zl0_sg.bin /system/tts/lang_pico/.
adb push AppsJB\system\tts\lang_pico\fr-FR_nk0_sg.bin /system/tts/lang_pico/.
adb push AppsJB\system\tts\lang_pico\fr-FR_ta.bin /system/tts/lang_pico/.
adb push AppsJB\system\tts\lang_pico\it-IT_cm0_sg.bin /system/tts/lang_pico/.
adb push AppsJB\system\tts\lang_pico\it-IT_ta.bin /system/tts/lang_pico/.
adb push GooglePlay\AccountAndSyncSettings.apk /system/app/.
adb push AppsJB\system\app\ChromeBookmarksSyncAdapter.apk /system/app/.
adb push GApps\FaceLock.apk /system/app/.
adb push AppsJB\system\app\ConfigUpdater.apk /system/app/.
adb push AppsJB\system\app\GenieWidget.apk /system/app/.
adb push AppsJB\system\app\GmsCore.apk /system/app/.
adb push AppsJB\system\app\GoogleBackupTransport.apk /system/app/.
adb push AppsJB\system\app\GoogleCalendarSyncAdapter.apk /system/app/.
adb push AppsJB\system\app\GoogleContactsSyncAdapter.apk /system/app/.
adb push AppsJB\system\app\GoogleFeedback.apk /system/app/.
adb push AppsJB\system\app\GoogleLoginService.apk /system/app/.
adb push AppsJB\system\app\GooglePartnerSetup.apk /system/app/.
adb push AppsJB\system\app\GoogleServicesFramework.apk /system/app/.
adb push GApps\GoogleStreetView.apk /system/app/.
adb push AppsJB\system\app\GoogleTTS.apk /system/app/.
adb push AppsJB\system\app\LatinImeDictionaryPack.apk /system/app/.
adb push GApps\Google_Voice_0.4.2.72.apk /system/app/.
adb push AppsJB\system\app\MediaUploader.apk /system/app/.
adb push AppsJB\system\app\NetworkLocation.apk /system/app/.
adb push AppsJB\system\app\OneTimeInitializer.apk /system/app/.
adb push AppsJB\system\app\Phonesky.apk /system/app/.
adb push AppsJB\system\app\QuickSearchBox.apk /system/app/.
adb push AppsJB\system\app\SetupWizard.apk /system/app/.
adb push AppsJB\system\app\Talk.apk /system/app/.
adb push AppsJB\system\app\Talkback.apk/system/app/.
adb push AppsJB\system\app\VoiceSearchStub.apk /system/app/.
adb push AppsJB\system\etc\g.prop /system/app/etc/.
adb push AppsJB\system\etc\permissions\com.google.android.maps.xml /system/app/etc/permissions/.
adb push AppsJB\system\etc\permissions\com.google.android.media.effects.xml /system/app/etc/permissions/.
adb push AppsJB\system\etc\permissions\com.google.widevine.software.drm.xml /system/app/etc/permissions/.
adb push AppsJB\system\etc\permissions\features.xml /system/app/etc/permissions/.
adb push AppsJB\system\etc\preferred-apps\google.xml /system/app/etc/preferred-apps/.
adb push AppsJB\system\etc\framework\com.google.android.maps.jar /system/app/etc/framework/.
adb push AppsJB\system\etc\framework\com.google.android.media.effects.jar /system/app/etc/framework/.
adb push AppsJB\system\etc\framework\com.google.widevine.software.drm.jar /system/app/etc/framework/.
adb push AppsJB\system\lib\libfilterpack_facedetect.so /system/lib/.
adb push AppsJB\system\lib\libflint_engine_jni_api.so /system/lib/.
adb push AppsJB\system\lib\libfrsdk.so /system/lib/.
adb push AppsJB\system\lib\libgcomm_jni.so /system/lib/.
adb push AppsJB\system\lib\libpicowrapper.so /system/lib/.
adb push AppsJB\system\lib\libspeexwrapper.so /system/lib/.
adb push AppsJB\system\lib\libvideochat_jni.so /system/lib/.
adb push AppsJB\system\lib\libvideochat_stabilize.so /system/lib/.
adb push AppsJB\system\lib\libvoicesearch.so /system/lib/.
adb push AppsJB\system\usr\srec\en-US\acoustic_model /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\c_fst /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\clg /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\compile_grammar.config /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\contacts.abnf /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\dict /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\dictation.config /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\embed_phone_nn_model /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\dictation.config /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\embed_phone_nn_state_sym /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\endpointer_dictation.config /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\endpointer_voicesearch.config /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\ep_acoustic_model /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\g2p_fst /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\google_hotword.config /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\google_hotword_clg /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\google_hotword_logistic /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\grammar.config /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\google_hotword_logistic /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\hmmsyms /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\hotword_symbols /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\lintrans_model /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\metadata /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\normalizer /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\norm_fst /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\offensive_word_normalizer /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\phonelist /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\rescoring_lm /system/usr/srec/en-us/.
adb push AppsJB\system\usr\srec\en-US\symbols /system/usr/srec/en-us/.
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **************************************************************
ECHO *We Are Now Setting Up The Services And Checking Permissions.*
ECHO **************************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "busybox chmod 0755 /system/addon.d/70-gapps.sh"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/de-DE_gl0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/de-DE_ta.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/es-ES_ta.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/es-ES_zl0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/fr-FR_nk0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/fr-FR_ta.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/de-DE_gl0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/it-IT_cm0_sg.bin"
adb shell su -c "busybox chmod 0644 /system/tts/lang_pico/it-IT_ta.bin"
adb shell su -c "busybox chmod 0644 /system/app/AccountAndSyncSettings.apk"
adb shell su -c "busybox chmod 0644 /system/app/ChromeBookmarksSyncAdapter.apk"
adb shell su -c "busybox chmod 0644 /system/app/FaceLock.apk"
adb shell su -c "busybox chmod 0644 /system/app/GalleryGoogle.apk"
adb shell su -c "busybox chmod 0644 /system/app/GenieWidget.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleBackupTransport.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleCalendarSyncAdapter.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleContactsSyncAdapter.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleFeedback.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleLoginService.apk"
adb shell su -c "busybox chmod 0644 /system/app/GooglePartnerSetup.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleServicesFramework.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleQuickSearchBox.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleStreetView.apk"
adb shell su -c "busybox chmod 0644 /system/app/GoogleTTS.apk"
adb shell su -c "busybox chmod 0644 /system/app/Google_Voice_0.4.2.72.apk"
adb shell su -c "busybox chmod 0644 /system/app/MarketUpdater.apk"
adb shell su -c "busybox chmod 0644 /system/app/MediaUploader.apk"
adb shell su -c "busybox chmod 0644 /system/app/NetworkLocation.apk"
adb shell su -c "busybox chmod 0644 /system/app/OneTimeInitializer.apk"
adb shell su -c "busybox chmod 0644 /system/app/SetupWizard.apk"
adb shell su -c "busybox chmod 0644 /system/app/Talk.apk"
adb shell su -c "busybox chmod 0644 /system/app/UniversalSearch.apk"
adb shell su -c "busybox chmod 0644 /system/app/VoiceSearch.apk"
adb shell su -c "busybox chmod 0644 /system/lib/libfacelock_jni.so"
adb shell su -c "busybox chmod 0644 /system/lib/libfilterpack_facedetect.so"
adb shell su -c "busybox chmod 0644 /system/lib/libflint_engine_jni_api.so"
adb shell su -c "busybox chmod 0644 /system/lib/libfrsdk.so"
adb shell su -c "busybox chmod 0644 /system/lib/libgcomm_jni.so"
adb shell su -c "busybox chmod 0644 /system/lib/libpicowrapper.so"
adb shell su -c "busybox chmod 0644 /system/lib/libspeexwrapper.so"
adb shell su -c "busybox chmod 0644 /system/lib/libvideochat_jni.so"
adb shell su -c "busybox chmod 0644 /system/lib/libvideochat_stabilize.so"
adb shell su -c "busybox chmod 0644 /system/lib/libvoicesearch.so"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
ECHO **************************************************************
ECHO *  We Are Now Installing The Last Few Google App Packages.   *
ECHO **************************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb install -r GApps\GoogleCurrents.apk
adb install -r GApps\Chrome_18.0.1025308.apk
adb install -r GApps\Earth_7.0.2.8421.apk
adb install -r GApps\ES_File_Explorer_1.6.2.5.apk
adb install -r GApps\Gmail_4.2.1.apk
adb install -r GApps\GoogleMaps.apk
adb install -r GApps\yourapp24.android.tools.alice_lite-1.apk
adb install -r GApps\YouTube_4.2.16.apk
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
COLOR 2
echo.
ECHO ****************************************************
ECHO * The Google Apps Have Been Installed Successfully *
ECHO * Please Test All The New Apps. If Any Fail To Open*
ECHO * Or Display An Error, Please Post A Message In The*
ECHO *   Kindle Fire First Aide Thread. Thank You For   *
ECHO *              Using Our Software.                 *
ECHO ****************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
GOTO menu


:INSTALL-GAPPS.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO *Thank You For Selecting Option 23 To Install Google *
ECHO * Apps. The Operation To Install Google Apps On The  *
ECHO *      Kindle Fire Was Canceled By The User!         *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-GAPPS.3
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install -r Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
cd %~dp0
CALL:INSTALL-GAPPS.0

:DRIVER-ALT
echo.
cls
echo.
ECHO ******************************************************
ECHO *Thank You For Selecting Option 24. This Option Will *
ECHO *Install The Alternate ADB Driver From Amazon. Please*
ECHO *  DO NOT Install This Driver On Top Of An Already   *
ECHO *  Working ADB Driver, Otherwise ADB Will Cease To   *
ECHO *          To Functions On The PC!                   *
ECHO ******************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *  Please Make Sure The Kindle Is Disconnected From USB   *
ECHO *          Prior To Installing This Package.              *
ECHO ***********************************************************
echo.
echo.
COLOR 2
echo.
CALL:yesno "Would You Like To Install Alternate ADB Driver From Amazon?" DRIVER-ALT.0 DRIVER-ALT.1

:DRIVER-ALT.0
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO ****************************************
ECHO *     The Alternate ADB Driver         *
ECHO *   Installation Will Now Begin        *
ECHO ****************************************
echo.
ECHO ****************************************
ECHO *    Be Sure To Accept The Driver      *
ECHO *  License Agreement And Perform The   *
ECHO *         Default Install.             *
ECHO ****************************************
echo.
ECHO ****************************************
ECHO *    This Package Will Install On      *
ECHO * MS-Windows 95 / 98 / ME / NT / 2000  *
ECHO *  / XP / 2003 / Vista/ and Windows 8  *
ECHO ****************************************
echo.
echo.
KindleADB.exe
echo.
echo.
echo.
COLOR 2
ECHO ****************************************
ECHO *     The Alternate ADB Driver         *
ECHO *    Installation Was A Success!       *
ECHO ****************************************
echo.
echo.
set /p unr=Do You Need To Restore The Kindle Fire From A Full Backup (y/n) ?
IF %unr% == y GOTO RESTORE-FULL.4
echo.
echo.
CALL:menu

:DRIVER-ALT.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO *******************************************************
ECHO *        Thank You For Selecting Option 24            *
ECHO *  The Operation To Install The Alternate ADB Driver  *
ECHO *    On The Computer Was Canceled By The User!        *
ECHO *******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:RESTORE-FULL
echo.
cls
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *  Thank You For Selecting Full Restore. This  *
ECHO *  Will Restore The Kindle From The Option 13  *
ECHO * Backup. This Option Is Considered A Complete *
ECHO *  Kindle Fire Restore. This Will Restore All  *
ECHO * Eleven Kindle Fire Partitions That Includes  *
ECHO *  Xloader Partition, Bootloader Partition,    *
ECHO *  Idme Partition, Crypto Partition, Misc      *
ECHO * Partition, Dkernel Partition, Dfs Partition, *
ECHO *  Efs Partition, Recovery Partition, Boot     *
ECHO * Partition And System Partition. This Option  *
ECHO *  Will Give You Full Control Of The Recovery  *
ECHO *  Allowing You To Perform A Full Or Partial   *
ECHO *        Restore On The Kindle Fire.           *
ECHO ************************************************
echo.
echo.
CALL:yesno "Would You Like To Restore The Kindle Fire From An Option 25 Backup?" RESTORE-FULL.0 RESTORE-FULL.17

:RESTORE-FULL.0
ECHO ************************************************
ECHO * Do You Have A Kindle Fire HD or 2  Plugged   *
ECHO *               In To USB?                     *
ECHO * This Process Will Completely Wipe The Kindle *
ECHO * And Restore It From Your KindleBackup Folder *
ECHO * Please Check The Folder Make Sure All Images *
ECHO * Are Extracted Using 7-Zip (If They Have A GZ *
ECHO * Extension). The Extension On These Files Must*
ECHO *Be IMG Not GZ. Please Let Me Know When You Are*
ECHO *      Ready To Begin The Restore.             *
ECHO ************************************************
echo.
PAUSE
echo.
COLOR 4
echo.
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Fire Into Fastboot?" RESTORE-FULL.1 RESTORE-FULL.3

:RESTORE-FULL.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************
ECHO *Please Power On The Kindle Fire HD Or 2.*
ECHO *Then Plug The Mini USB In To The Kindle *
ECHO *  And The Other End To The Computer     *
ECHO ******************************************
echo.
PAUSE
echo.
cls
echo.
echo.
COLOR 4
echo.
CALL:yesno "Are You Ready? The Kindle Must Be On!" RESTORE-FULL.2 RESTORE-FULL.1

:RESTORE-FULL.2
echo.
cls
echo.
COLOR 2
ECHO *************************************************
ECHO *The Kindle HD Will Now Reboot In Fastboot Mode!*
ECHO *This Process Will Fail If You Do Not Have Root *
ECHO *           Installed On The Kindle.            *
ECHO *************************************************
echo.
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************
ECHO *We have Enabled Fastboot on the Kindle Fire, *
ECHO *Please Verify The Kindle Is In Fastboot Mode *
ECHO *In Some Rare Cases The Kindle Fire Bootloader*
ECHO * Is Damaged And Requires A Factory USB Cable *
ECHO *   To Boot (Kindle Fire HD 7 and 2 Only)     *
ECHO ***********************************************
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == y GOTO RESTORE-FULL.3
echo.
CALL:menu

:RESTORE-FULL.3
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
PAUSE
echo.
ECHO ******************************************************
ECHO *  This Operation Requires The Microsoft Visual C++  *
ECHO *  Run-Time Components To Be Installed On You PC     *
ECHO ******************************************************
echo.
echo.
set /p unr=Do You Have Any Yellow Triangles In The Windows Device Manager (y/n) ?
IF %unr% == y GOTO DRIVER-ALT
echo.
COLOR 2
echo.
ECHO *****************************************************
ECHO *Get A Cup Of Coffee, This May Take A While.........*
ECHO *****************************************************
echo.
echo.
set /p unr=Do You Need Us To G-Unzip The Images (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.5
echo.
ECHO ***********************************************************
ECHO *Please wait while I Inspect and Unzip The 11 Images..... *
ECHO *You Will See Errors Here If The Images Are Not Compressed*
ECHO *       You May Ignore These Eleven Errors.               *
ECHO ***********************************************************
echo.
cd KindleBackup
gunzip.exe -d xloader.img.gz
gunzip.exe -d bootloader.img.gz
gunzip.exe -d idme.img.gz
gunzip.exe -d crypto.img.gz
gunzip.exe -d misc.img.gz
gunzip.exe -d dkernel.img.gz
gunzip.exe -d dfs.img.gz
gunzip.exe -d efs.img.gz
gunzip.exe -d recovery.img.gz
gunzip.exe -d boot.img.gz
gunzip.exe -d system.img.gz
echo.
ECHO ********************************************************************************************
ECHO *We Have Inspected The Recovery - We Are Ready To Flash The 11 Images......................*
ECHO ********************************************************************************************
echo.
CALL:yesno "Are You Ready To Begin The Selective Restore?" RESTORE-FULL.5 RESTORE-FULL.1

:RESTORE-FULL.5
echo.
cls
echo.
echo.
set /p unr=Would You Like To Restore The Xloader Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.6
fastboot flash -i 0x1949 xloader xloader.img
CALL:RESTORE-FULL.6

:RESTORE-FULL.6
echo.
echo.
echo.
set /p unr=Would You Like To Restore The Bootloader Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.7
fastboot flash -i 0x1949 bootloader bootloader.img
CALL:RESTORE-FULL.7

:RESTORE-FULL.7
echo.
echo.
echo.
set /p unr=Would You Like To Restore The Idme Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.8
fastboot flash -i 0x1949 idme idme.img
CALL:RESTORE-FULL.8

:RESTORE-FULL.8
echo.
echo.
echo.
set /p unr=Would You Like To Restore The Crypto Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.9
fastboot flash -i 0x1949 crypto crypto.img
CALL:RESTORE-FULL.9

:RESTORE-FULL.9
echo.
echo.
echo.
set /p unr=Would You Like To Restore The Misc Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.10
fastboot flash -i 0x1949 misc misc.img
CALL:RESTORE-FULL.10

:RESTORE-FULL.10
echo.
echo.
echo.
set /p unr=Would You Like To Restore The Dkernel Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.11
fastboot flash -i 0x1949 dkernel dkernel.img
CALL:RESTORE-FULL.11

:RESTORE-FULL.11
echo.
echo.
echo.
set /p unr=Would You Like To Restore The Dfs Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.12
fastboot flash -i 0x1949 dfs dfs.img
CALL:RESTORE-FULL.12

:RESTORE-FULL.12
echo.
echo.
echo.
set /p unr=Would You Like To Restore The Efs Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.13
fastboot flash -i 0x1949 efs efs.img
CALL:RESTORE-FULL.13

:RESTORE-FULL.13
echo.
echo.
echo.
set /p unr=Would You Like To Restore The Recovery Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.14
fastboot flash -i 0x1949 recovery recovery.img
CALL:RESTORE-FULL.14

:RESTORE-FULL.13
echo.
echo.
echo.
set /p unr=Would You Like To Restore The Boot Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.14
fastboot flash -i 0x1949 boot boot.img
CALL:RESTORE-FULL.14

:RESTORE-FULL.14
echo.
echo.
echo.
set /p unr=Would You Like To Restore The System Partition (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.15
fastboot flash -i 0x1949 system system.img
CALL:RESTORE-FULL.15


:RESTORE-FULL.15
echo.
echo.
ECHO *****************************************************************
ECHO * OK, We Are Done Restoring The Kindle, Now We Will Do A Little *
ECHO *   House Cleaning By Wiping The Davlik Cache And User Data     *
ECHO *           Please Let Us Know When You Are Ready!              *
ECHO *****************************************************************
echo.
echo.
set /p unr=Would You Like To Wipe The User Data And Cache (y/n) ?
IF %unr% == n GOTO RESTORE-FULL.16
echo.
echo.
fastboot -i 0x1949 -w
fastboot -i 0x1949 reboot
echo.
echo.
color 2
echo.
CALL:RESTORE-FULL.16

:RESTORE-FULL.16
echo.
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO **************************************
ECHO * Success!!! The Kindle Fire HD or 2 *
ECHO *    Has Benn Restored Using The     *
ECHO *    KindleBackup Folder Images      *
ECHO **************************************
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
color 4
echo.
ECHO ******************************************************************
ECHO *  Please Unplug the Kindle Fire From USB and Reboot The Kindle  *
ECHO *  By Holding The Power Button Down For 20 Seconds Then Release  *
ECHO * For 5 Seconds And Depress The Power Button Again For 2 Seconds *
ECHO *Do Not Forget To Disable OTA Before Connecting To It To Wireless*
ECHO ******************************************************************
echo.
echo.
PAUSE
echo.
CALL:menu

:RESTORE-FULL.17
echo.
cls
echo.
echo.
color 2
ECHO ***********************************************
echo *  The Operation To Restore The Kindle Fire   *
ECHO *        Was Canceled By The User.            *
ECHO ***********************************************
echo.
echo.
PAUSE
echo.
CALL:menu

:RESTORE-3
echo.
cls
echo.
COLOR 2
echo.
ECHO ************************************************
ECHO *Thank You For Selecting Option 26. This Option*
ECHO *  Is Used To Restore The Kindle Fire From An  *
ECHO *Option 17 Backup. This Will Selectivly Restore*
ECHO *The Kindle Fire Boot Image, Recovery Image And*
ECHO *             The System Image.                *
ECHO ************************************************
echo.
echo.
CALL:yesno "Would You Like To Restore The Kindle Fire From A 3 File Backup?" RESTORE-3.0 RESTORE-3.7


:RESTORE-3.0
echo.
cls
echo.
COLOR 2
echo.
echo.
ECHO ****************************************************
ECHO *Do You Need Us To Reboot The Kindle Into Fastboot?*
ECHO ****************************************************
echo.
echo.
CALL:yesno "Would You Like Us To Reboot The Kindle Into Fastboot?" RESTORE-3.2 RESTORE-3.4

:RESTORE-3.1
echo.
cls
echo.
COLOR 2
ECHO *************************************************
ECHO *The Kindle HD Will Now Reboot In Fastboot Mode!*
ECHO *This Process Will Fail If You Do Not Have Root *
ECHO *           Installed On The Kindle.            *
ECHO *************************************************
echo.
echo.
adb kill-server
adb wait-for-device
echo.
ECHO ***********************************************
ECHO * We Are Sending The Command To The Kindle To *
ECHO *  Reboot Into Fastboot. This Operation Will  *
ECHO *Fail If You Do Not Have Root Installed On The*
ECHO *  Kindle Fire. Please Pay Attention To The   *
ECHO *  Kindle For A Superuser Popup Request, Be   *
ECHO * Sure To Click Allow Or Grant Otherwise This *
ECHO *            Command Will Fail.               *
ECHO ***********************************************
echo.
echo.
adb shell su -c "reboot bootloader"
echo.
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************
ECHO *We have Enabled Fastboot on the Kindle Fire, *
ECHO *Please Verify The Kindle Is In Fastboot Mode *
ECHO *In Some Rare Cases The Kindle Fire Bootloader*
ECHO * Is Damaged And Requires A Factory USB Cable *
ECHO *   To Boot (Kindle Fire HD 7 and 2 Only)     *
ECHO ***********************************************
echo.
set /p unr=Is The Kindle In Fastboot Mode (y/n) ?
IF %unr% == n GOTO RESTORE-3.1
echo.
CALL:RESTORE-3.2

:RESTORE-3.2
cd Backup
echo.
cls
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
ECHO ***********************************************
ECHO *Please wait while I Inspect The 3 Images.....*
ECHO ***********************************************
echo.
ECHO *******************************************************************************************
ECHO *We Have Inspected The Recovery - We Are Ready To Flash The 3 Images......................*
ECHO *******************************************************************************************
echo.
set /p unr=Woul You Like To Restore The Recovery Partition (y/n) ?
IF %unr% == n GOTO RESTORE-3.3
fastboot flash -i 0x1949 recovery stock-recovery.img
echo.
CALL:RESTORE-3.3

:RESTORE-3.3
echo.
set /p unr=Woul You Like To Restore The Boot Partition (y/n) ?
IF %unr% == n GOTO RESTORE-3.4
fastboot flash -i 0x1949 boot stock-boot.img
echo.
CALL:RESTORE-3.4

:RESTORE-3.4
echo.
set /p unr=Woul You Like To Restore The System Partition (y/n) ?
IF %unr% == n GOTO RESTORE-3.5
fastboot flash -i 0x1949 system stock-system.img
echo.
CALL:RESTORE-3.5

:RESTORE-3.5
echo.
echo.
ECHO *****************************************************************
ECHO * OK, We Are Done Restoring The Kindle, Now We Will Do A Little *
ECHO *   House Cleaning By Wiping The Davlik Cache And User Data     *
ECHO *****************************************************************
echo.
echo.
set /p unr=Would You Like To Wipe The User Data And Cache (y/n) ?
IF %unr% == n GOTO RESTORE-3.6
echo.
echo.
fastboot -i 0x1949 -w
fastboot -i 0x1949 reboot
echo.
CALL:RESTORE-3.6

:RESTORE-3.6
echo.
echo.
COLOR 2
echo.
ECHO **************************************
ECHO * Success!!! The Kindle Fire HD or 2 *
ECHO *    Has Been Restored Using The     *
ECHO *         Backup Images.             *
ECHO **************************************
echo.
echo.
PAUSE
echo.
cls
echo.
echo.
echo.
COLOR 4
echo.
ECHO ******************************************************************
ECHO *  Please Unplug the Kindle Fire From USB and Reboot The Kindle  *
ECHO *  By Holding The Power Button Down For 20 Seconds Then Release  *
ECHO * For 5 Seconds And Depress The Power Button Again For 2 Seconds *
ECHO *Do Not Forget To Disable OTA Before Connecting To It To Wireless*
ECHO ******************************************************************
echo.
echo.
PAUSE
echo.
CALL:menu

:RESTORE-3.7
echo.
cls
echo.
echo.
color 2
ECHO ***********************************************
echo *  The Option 26 To Restore The Kindle Fire   *
ECHO *        Was Canceled By The User.            *
ECHO ***********************************************
echo.
echo.
pause
echo.
CALL:menu


:INSTALL-SONYAUDIO
echo.
cls
echo.
ECHO **************************************************************
ECHO *Thank You For Selecting Option 27. This Option Will Install *
ECHO *The Sony xLoud And ClearAudio+ Applications. The Sony Xloud *
ECHO *Service xLOUD Enhances And Improves The Volume In The Loud  *
ECHO *Speaker. This Only Works With The Loud Speaker And Not The  *
ECHO *  Headphones. ClearAudio+ Mode, Developed With Sony's Own   *
ECHO *Signal Processing Technologies, Allows Users To effortlessly*
ECHO *Enjoy Audio Quality That May Have Been Stripped Away By MP3 *
ECHO * Music Compression. ClearAudio+ Mode Incorporates A Variety *
ECHO *Of Sony's Sound Technologies, But With One Simple Operation,*
ECHO *  Users Can Easily Enjoy Sony Recommended Sound In Ultimate *
ECHO * Clarity And Presence, Across The Entire Spectrum Of Sound. *
ECHO **************************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Install Sony xLoud And ClearAudio+ Applications On The Kindle Fire?" INSTALL-SONYAUDIO.0 INSTALL-SONYAUDIO.1

:INSTALL-SONYAUDIO.0
echo.
cd %~dp0
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO ******************************************************
ECHO *We Are Now Preparing The Kindle, Please Wait........*
ECHO *  Please Pay Close Attention To The Kindle For A    *
ECHO *Superuser Popup Request, Be Sure To Click Allow Or  *
ECHO *   Grant Otherwise The Installation Will Fail.      *
ECHO ******************************************************
echo.
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO * We Are Now Installing Sony xLoud & ClearAudio+ Apps *
ECHO * During The Install The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into *
ECHO *             USB, Are You Ready?                     *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *   An System Install Without Permission Errors       *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-SONYAUDIO.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
echo.
ECHO *************************************************************
ECHO *   We Are Now Installing The Sony xLoud Libs & Services    *
ECHO *************************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push xsystem\app\AudioEffectService.apk /system/app/.
adb push xsystem\com.sonyericsson.audioeffectif.xml /system/etc/permissions/.
adb push xsystem\framework\semc_audioeffectif.jar /system/framework/.
adb push xsystem\lib\libacdbloader.so /system/lib/.
adb push xsystem\lib\libacdbmapper.so /system/lib/.
adb push xsystem\lib\libaudcal.so /system/lib/.
adb push xsystem\lib\libaudioparsers.so /system/lib/.
adb push xsystem\lib\libmm-audio-resampler.so /system/lib/.
adb push xsystem\lib\libsurround_proc.so /system/lib/.
adb push xsystem\lib\libvptwrapper.so /system/lib/.
adb push xsystem\lib\libvt_jni.so /system/lib/.
adb push xsystem\lib\soundfx\libclearaudiowrapper.so /system/lib/soundfx/.
adb push xsystem\lib\soundfx\libfnrwrapper.so /system/lib/soundfx/.
adb push xsystem\lib\soundfx\libhearingprotection.so /system/lib/soundfx/.
adb push xsystem\lib\soundfx\libposteffectwrapper.so /system/lib/soundfx/.
adb push xsystem\lib\soundfx\libpreeffectwrapper.so /system/lib/soundfx/.
adb push xsystem\lib\soundfx\libsoundaurawrapper.so /system/lib/soundfx/.
adb push xsystem\lib\soundfx\libvptwrapper.so /system/lib/soundfx/.
adb push xsystem\lib\soundfx\libxloudwrapper.so /system/lib/soundfx/.
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO *******************************************************
ECHO *We Are Now Inserting Lines Into The Kindle build.prop*
ECHO *******************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push xsystem\x_add_to_buildprop.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/x_add_to_buildprop.sh"
adb shell su -c "busybox chmod 777 /data/local/tmp/x_add_to_buildprop.sh"
adb shell su -c "sh ./data/local/tmp/x_add_to_buildprop.sh"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO *****************************************************
ECHO *Now We Will Do A Little Housecleaning And Check The*
ECHO *  Entire Android System Permissions And Fix Any    *
ECHO *  Problems Found. This Script Is Complex, It Will  *
ECHO * Take Over 15 Minutes To Execute. If I Find Lot's  *
ECHO * Of Problems With The Permissions, It May Take One *
ECHO * Hour Or More. Relax And Enjoy While I Do The Hard *
ECHO *                    Work.                          *
ECHO *****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push fix_permissions.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox chmod 0755 /data/local/tmp/fix_permissions.sh"
adb shell su -c "sh ./data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
COLOR 2
echo.
ECHO *****************************************************
ECHO *   Sony xLoud & ClearAudio+ Have Been Installed    *
ECHO * This App Is All Services. You Will Not Find Apps  *
ECHO *Installed, If You Have Questions Post Them In The  *
ECHO *   Kindle Fire First Aide Thread. Thank You For    *
ECHO *              Using Our Software.                  *
ECHO *****************************************************
echo.
PAUSE
echo.
cls
echo.
adb kill-server
echo.
echo.
CALL:menu

:INSTALL-SONYAUDIO.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ***************************************************
echo *The Option 27 To Install Sony xLoud & ClearAudio+*
ECHO *  To The Kindle Fire Was Canceled By The User.   *
ECHO ***************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-SONYAUDIO.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:INSTALL-SONYAUDIO.0


:INSTALL-SONYVIDEO
echo.
cls
echo.
ECHO *************************************************************
ECHO *Thank You For Selecting Option 28. This Option Will Install*
ECHO *The Sony BRAVIA Engine 2 Is An Evolution Of Mobile BRAVIA� *
ECHO *  Engine Delivering An Ever Better Viewing Experience By   *
ECHO *Adding A New Real-time Contrast Optimisation And Improving *
ECHO *   Sharpness Enhancement On Top Of High Quality Colour     *
ECHO *           Management And Noise Reduction.                 *
ECHO *************************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Install Sony BRAVIA Engine 2 On The Kindle Fire?" INSTALL-SONYVIDEO.0 INSTALL-SONYVIDEO.1

:INSTALL-SONYVIDEO.0
echo.
cd %~dp0
cls
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO *   We Are Now Installing Sony BRAVIA Engine 2 Apps   *
ECHO * During The Install The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into *
ECHO *             USB, Are You Ready?                     *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *              An Automated Install.                  *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-SONYVIDEO.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
echo.
ECHO *******************************************************
ECHO *We Are Now Setting Up The Services And Setting Files.*
ECHO *******************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push bsystem\app\SwiqiSettingsService.apk /system/app/.
adb push bsystem\etc\be2_album /system/etc/.
adb push bsystem\etc\be_movie /system/etc/.
adb push bsystem\etc\be_movie_setting /system/etc/.
adb push bsystem\etc\permissions\com.sonyericsson.uxp.xml /system/etc/permissions/.
adb push bsystem\etc\permissions\com.sonyericsson.uxpres.xml /system/etc/permissions/.
adb push bsystem\framework\com.sonyericsson.uxp.jar /system/framework/.
adb push bsystem\framework\com.sonyericsson.uxpres.jar /system/framework/.
adb push bsystem\lib\libmbe.so /system/lib/.
adb push bsystem\lib\libmbe_paramselector.so /system/lib/.
adb push bsystem\lib\libswiqisettinghelper.so /system/lib/.
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO *****************************************************
ECHO *Now We Will Do A Little Housecleaning And Check The*
ECHO *  Entire Android System Permissions And Fix Any    *
ECHO *  Problems Found. This Script Is Complex, It Will  *
ECHO * Take Over 15 Minutes To Execute. If I Find Lot's  *
ECHO * Of Problems With The Permissions, It May Take One *
ECHO * Hour Or More. Relax And Enjoy While I Do The Hard *
ECHO *                    Work.                          *
ECHO *****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push fix_permissions.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox chmod 0755 /data/local/tmp/fix_permissions.sh"
adb shell su -c "sh ./data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO *******************************************************
ECHO *We Are Now Inserting Lines Into The Kindle build.prop*
ECHO *******************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push bsystem\badd_to_buildprop.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/badd_to_buildprop.sh"
adb shell su -c "busybox chmod 777 /data/local/tmp/badd_to_buildprop.sh"
adb shell su -c "sh ./data/local/tmp/badd_to_buildprop.sh"
adb shell su -c "mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
COLOR 2
echo.
ECHO *****************************************************
ECHO *     Sony BRAVIA Engine 2 Has Been Installed       *
ECHO * This App Is All Services. You Will Not Find Apps  *
ECHO *Installed, If You Have Questions Post Them In The  *
ECHO *   Kindle Fire First Aide Thread. Thank You For    *
ECHO *              Using Our Software.                  *
ECHO *****************************************************
echo.
echo.
PAUSE
echo.
echo.
adb kill-server
echo.
GOTO menu

:INSTALL-SONYVIDEO.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ***************************************************
echo *  The Option 28 To Install Sony BRAVIA Engine 2  *
ECHO *  To The Kindle Fire Was Canceled By The User.   *
ECHO ***************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-SONYVIDEO.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:INSTALL-SONYVIDEO.0


:INSTALL-BEATS
echo.
cls
echo.
ECHO **************************************************************
ECHO *Thank You For Selecting Option 29. This Option Will Install *
ECHO *Pimp My Beats© On The Kindle Fire. Pimp My Beats© Is A High *
ECHO *End DSP Processor That Will Imrove the Sound Through Very   *
ECHO * Complex Algorithms. The Traditional MP3 Is Compressed And  *
ECHO *Until We Were Given The Options To Improve The Sound Through*
ECHO *These Audio Engines We Had To Accept The Low Fi MP3's As Is!*
ECHO * Then Pimp My Beats© Was Released, Working To Make The MP3  *
ECHO *Compete With The SACD. This Is Engine Is Worth Hundreds Of $*
ECHO *Yet The Developer Offers It To US For Free! Install This On *
ECHO *The Kindle And Then Plug The Kindle Into Your Home Audio And*
ECHO *                Let The Music God's Sing!                   *
ECHO **************************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Install Pimp My Beats© On The Kindle Fire?" INSTALL-BEATS.0 INSTALL-BEATS.1

:INSTALL-BEATS.0
echo.
cd %~dp0
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO *      We Are Now Installing Pimp My Beats© App,      *
ECHO * During The Install The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into *
ECHO *             USB, Are You Ready?                     *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *   An System Install Without Permission Errors       *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-BEATS.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
ECHO *********************************************************
ECHO *We Are Now Setting Up The Beats© Services And Binaries.*
ECHO *********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /system/usr/share/alsa"
adb shell su -c "mkdir /system/etc/soundimage"
adb push psystem\app\AudioEffectService.apk /system/app/.
adb push psystem\app\DolbyMobile.apk /system/app/.
adb push psystem\app\PimpMyBeats.apk /system/app/.
adb push psystem\bin\alsa_amixer /system/bin/.
adb push psystem\bin\alsa_aplay /system/bin/.
adb push psystem\bin\alsa_ctl /system/bin/.
adb push psystem\bin\basimage_ibeats.bin /system/bin/.
adb push psystem\bin\basimage_ibeats_solo.bin /system/bin/.
adb push psystem\bin\basimage_ibeats_solo_x.bin /system/bin/.
adb push psystem\bin\basimage_ibeats_x.bin /system/bin/.
adb push psystem\bin\beatsbass /system/bin/.
adb push psystem\bin\beatsnormal /system/bin/.
adb push psystem\bin\dynimage_ibeats.bin /system/bin/.
adb push psystem\bin\dynimage_ibeats_solo.bin /system/bin/.
adb push psystem\bin\dynimage_ibeats_solo_x.bin /system/bin/.
adb push psystem\bin\dynimage_ibeats_x.bin /system/bin/.
adb push psystem\bin\mm-audio-alsa-test /system/bin/.
adb push psystem\bin\peqimage_ibeats.bin /system/bin/.
adb push psystem\bin\peqimage_ibeats_solo.bin /system/bin/.
adb push psystem\bin\peqimage_ibeats_solo_x.bin /system/bin/.
adb push psystem\bin\peqimage_ibeats_x.bin /system/bin/.
adb push psystem\bin\sound /system/bin/.
adb push psystem\bin\sound8960 /system/bin/.
adb push psystem\bin\spkamp /system/bin/.
adb push psystem\etc\AudioBTID.csv /system/etc/.
adb push psystem\etc\audio_effects.conf /system/etc/.
adb push psystem\etc\AudioFilterPlatform.csv /system/etc/.
adb push psystem\etc\AudioFilterProduct.csv /system/etc/.
adb push psystem\etc\AudioPara4.csv /system/etc/.
adb push psystem\etc\AutoVolumeControl.txt /system/etc/.
adb push psystem\etc\basimage_gec.bin /system/etc/.
adb push psystem\etc\basimage_gec_bt.bin /system/etc/.
adb push psystem\etc\basimage_ibeats.bin /system/etc/.
adb push psystem\etc\basimage_ibeats_pro.bin /system/etc/.
adb push psystem\etc\basimage_ibeats_solo.bin /system/etc/.
adb push psystem\etc\basimage_ibeats_studio.bin /system/etc/.
adb push psystem\etc\dynimage_gec.bin /system/etc/.
adb push psystem\etc\dynimage_gec_bt.bin /system/etc/.
adb push psystem\etc\dynimage_ibeats.bin /system/etc/.
adb push psystem\etc\dynimage_ibeats_pro.bin /system/etc/.
adb push psystem\etc\dynimage_ibeats_solo.bin /system/etc/.
adb push psystem\etc\dynimage_ibeats_studio.bin /system/etc/.
adb push psystem\etc\peqimage_gec.bin /system/etc/.
adb push psystem\etc\peqimage_gec_bt.bin /system/etc/.
adb push psystem\etc\peqimage_ibeats.bin /system/etc/.
adb push psystem\etc\peqimage_ibeats_pro.bin /system/etc/.
adb push psystem\etc\peqimage_ibeats_solo.bin /system/etc/.
adb push psystem\etc\soundbooster.txt /system/etc/.
adb push psystem\etc\audio\aeqcoe.txt /system/etc/audio/.
adb push psystem\etc\audio\eqfilter.txt /system/etc/audio/.
adb push psystem\etc\audio\lmfilter.txt /system/etc/audio/.
adb push psystem\etc\audio\situation.txt /system/etc/audio/.
adb push psystem\etc\audio\soundbooster.txt /system/etc/audio/.
adb push psystem\etc\audio\stream_earpiece.txt /system/etc/audio/.
adb push psystem\etc\audio\stream_headset.txt /system/etc/audio/.
adb push psystem\etc\audio\stream_speaker.txt /system/etc/audio/.
adb push psystem\etc\permissions\com.srs.fusion.fx.xml /system/etc/permissions/.
adb push psystem\etc\soundimage\Sound_Beats.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_MFG.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Original.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Original_Rec_MFG.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Original_Recording.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Original_SPK.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Phone_Original_HP.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Phone_Original_HP_LE.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Phone_Original_HP_WB.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Phone_Original_HP_WB_LE.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Phone_Original_REC.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Phone_Original_REC_NEL.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Phone_Original_REC_WB.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Phone_Original_SPK.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Phone_Original_SPK_WB.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Rec_Landscape.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Recording.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_Rec_Portrait.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_SRS_A_HP.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_SRS_A_SPK.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_SRS_V_HP.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\Sound_SRS_V_SPK.txt /system/etc/soundimage/.
adb push psystem\etc\soundimage\srs_bypass.cfg /system/etc/soundimage/.
adb push psystem\etc\soundimage\srsfx_trumedia_51.cfg /system/etc/soundimage/.
adb push psystem\etc\soundimage\srsfx_trumedia_movie.cfg /system/etc/soundimage/.
adb push psystem\etc\soundimage\srsfx_trumedia_music.cfg /system/etc/soundimage/.
adb push psystem\etc\soundimage\srsfx_trumedia_music_wide.cfg /system/etc/soundimage/.
adb push psystem\etc\soundimage\srsfx_trumedia_voice.cfg /system/etc/soundimage/.
adb push psystem\etc\soundimage\srs_geq10.cfg /system/etc/.
adb push psystem\etc\soundimage\srs_global.cfg /system/etc/.
adb push psystem\framework\b1.jar /system/framework/.
adb push psystem\framework\com.htc.framework.jar /system/framework/.
adb push psystem\framework\com.srs.fusion.fx.jar /system/framework/.
adb push psystem\lib\libacdbmapper.so /system/lib/l.
adb push psystem\lib\libalsa-intf.so /system/lib/.
adb push psystem\lib\libalsa-intf_mfg.so /system/lib/.
adb push psystem\lib\libasound.so /system/lib/.
adb push psystem\lib\libaudcal.so /system/lib/.
adb push psystem\lib\libaudioalsa.so /system/lib/.
adb push psystem\lib\libaudioeq.so /system/lib/.
adb push psystem\lib\libaudio_init.so /system/lib/.
adb push psystem\lib\libbeatsbass.so /system/lib/.
adb push psystem\lib\libbeatscorehtc.so /system/lib/.
adb push psystem\lib\libbundlewrapper.so /system/lib/.
adb push psystem\lib\libDolby-dsp.so /system/lib/.
adb push psystem\lib\libSR_AudioIn.so /system/lib/.
adb push psystem\lib\libsrscorehtc.so /system/lib/.
adb push psystem\lib\libsrsfx.so /system/lib/.
adb push psystem\lib\libsrsprocessing.so /system/lib/.
adb push psystem\lib\libvisualizer.so /system/lib/.
adb push psystem\lib\libvoAudioFR.so /system/lib/.
adb push psystem\lib\soundfx\libaudiopreprocessing.so /system/lib/soundfx/.
adb push psystem\lib\soundfx\libbeatsbass.so /system/lib/soundfx/.
adb push psystem\lib\soundfx\libbundlewrapper.so /system/lib/soundfx/.
adb push psystem\lib\soundfx\libcyanogen-dsp.so /system/lib/soundfx/.
adb push psystem\lib\soundfx\libreverbwrapper.so /system/lib/soundfx/.
adb push psystem\lib\soundfx\libsrscore.so /system/lib/soundfx/.
adb push psystem\lib\soundfx\libsrsfx.so /system/lib/soundfx/.
adb push psystem\lib\soundfx\libsrstb.so /system/lib/soundfx/.
adb push psystem\lib\soundfx\libvisualizer.so /system/lib/soundfx/.
adb push psystem\lib\soundfx\libxloudwrapper.so /system/lib/soundfx/.
adb push psystem\usr\share\alsa\alsa.conf /system/usr/share/alsa/.
adb push psystem\usr\share\alsa\cards\aliases.conf /system/usr/share/alsa/cards/.
adb push psystem\usr\share\alsa\pcm\center_lfe.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\default.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\dmix.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\dpl.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\dsnoop.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\front.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\iec958.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\modem.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\rear.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\side.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\surround40.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\surround41.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\surround50.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\surround51.conf /system/usr/share/alsa/pcm/.
adb push psystem\usr\share\alsa\pcm\surround71.conf /system/usr/share/alsa/pcm/.
adb push psystem\xbin\alsa_amixer /system/xbin/.
adb push psystem\xbin\alsa_aplay /system/xbin/.
adb push psystem\xbin\alsa_ctl /system/xbin/.
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO *************************************************************
ECHO *We Are Now Setting Up The Beats© Permissions and Ownership.*
ECHO *************************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "busybox chmod 0644 /system/app/AudioEffectService.apk"
adb shell su -c "busybox chmod 0644 /system/app/DolbyMobile.apk"
adb shell su -c "busybox chmod 0644 /system/app/PimpMyBeats.apk"
adb shell su -c "busybox chown 0:2000 /system/bin/alsa_amixer"
adb shell su -c "busybox chmod 0755 /system/bin/alsa_amixer"
adb shell su -c "busybox chown 0:2000 /system/bin/alsa_aplay"
adb shell su -c "busybox chmod 0755 /system/bin/alsa_aplay"
adb shell su -c "busybox chown 0:2000 /system/bin/alsa_ctl"
adb shell su -c "busybox chmod 0755 /system/bin/alsa_ctl"
adb shell su -c "busybox chown 0:2000 /system/bin/basimage_ibeats_solo.bin"
adb shell su -c "busybox chmod 0755 /system/bin/basimage_ibeats_solo.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/basimage_ibeats_solo_x.bin"
adb shell su -c "busybox chmod 0755 /system/bin/basimage_ibeats_solo_x.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/basimage_ibeats_x.bin"
adb shell su -c "busybox chmod 0755 /system/bin/basimage_ibeats_x.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/beatsbass"
adb shell su -c "busybox chmod 0755 /system/bin/beatsbass"
adb shell su -c "busybox chown 0:2000 /system/bin/beatsnormal"
adb shell su -c "busybox chmod 0755 /system/bin/beatsnormal"
adb shell su -c "busybox chown 0:2000 /system/bin/dynimage_ibeats.bin"
adb shell su -c "busybox chmod 0755 /system/bin/dynimage_ibeats.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/dynimage_ibeats_solo.bin"
adb shell su -c "busybox chmod 0755 /system/bin/dynimage_ibeats_solo.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/dynimage_ibeats_solo_x.bin"
adb shell su -c "busybox chmod 0755 /system/bin/dynimage_ibeats_solo_x.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/dynimage_ibeats_x.bin"
adb shell su -c "busybox chmod 0755 /system/bin/dynimage_ibeats_x.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/mm-audio-alsa-test"
adb shell su -c "busybox chmod 0755 /system/bin/mm-audio-alsa-test"
adb shell su -c "busybox chown 0:2000 /system/bin/peqimage_ibeats.bin"
adb shell su -c "busybox chmod 0755 /system/bin/peqimage_ibeats.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/peqimage_ibeats_solo.bin"
adb shell su -c "busybox chmod 0755 /system/bin/peqimage_ibeats_solo.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/peqimage_ibeats_solo_x.bin"
adb shell su -c "busybox chmod 0755 /system/bin/peqimage_ibeats_solo_x.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/peqimage_ibeats_x.bin"
adb shell su -c "busybox chmod 0755 /system/bin/peqimage_ibeats_x.bin"
adb shell su -c "busybox chown 0:2000 /system/bin/sound"
adb shell su -c "busybox chmod 0755 /system/bin/sound"
adb shell su -c "busybox chown 0:2000 /system/bin/sound8960"
adb shell su -c "busybox chmod 0755 /system/bin/sound8960"
adb shell su -c "busybox chown 0:2000 /system/bin/spkamp"
adb shell su -c "busybox chmod 0755 /system/bin/spkamp"
adb shell su -c "busybox chmod 0644 /system/etc/AudioBTID.csv"
adb shell su -c "busybox chmod 0644 /system/etc/audio_effects.conf"
adb shell su -c "busybox chmod 0644 /system/etc/AudioFilterPlatform.csv"
adb shell su -c "busybox chmod 0644 /system/etc/AudioFilterProduct.csv"
adb shell su -c "busybox chmod 0644 /system/etc/AudioPara4.csv"
adb shell su -c "busybox chmod 0644 /system/etc/AutoVolumeControl.txt"
adb shell su -c "busybox chown 0:2000 /system/etc/basimage_gec.bin"
adb shell su -c "busybox chmod 0755 /system/etc/basimage_gec.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/basimage_gec_bt.bin"
adb shell su -c "busybox chmod 0755 /system/etc/basimage_gec_bt.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/basimage_ibeats.bin"
adb shell su -c "busybox chmod 0755 /system/etc/basimage_ibeats.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/basimage_ibeats_pro.bin"
adb shell su -c "busybox chmod 0755 /system/etc/basimage_ibeats_pro.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/basimage_ibeats_solo.bin"
adb shell su -c "busybox chmod 0755 /system/etc/basimage_ibeats_solo.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/basimage_ibeats_studio.bin"
adb shell su -c "busybox chmod 0755 /system/etc/basimage_ibeats_studio.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/dynimage_gec.bin"
adb shell su -c "busybox chmod 0755 /system/etc/dynimage_gec.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/dynimage_gec_bt.bin"
adb shell su -c "busybox chmod 0755 /system/etc/dynimage_gec_bt.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/dynimage_ibeats.bin"
adb shell su -c "busybox chmod 0755 /system/etc/dynimage_ibeats.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/dynimage_ibeats_pro.bin"
adb shell su -c "busybox chmod 0755 /system/etc/dynimage_ibeats_pro.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/dynimage_ibeats_solo.bin"
adb shell su -c "busybox chmod 0755 /system/etc/dynimage_ibeats_solo.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/dynimage_ibeats_studio.bin"
adb shell su -c "busybox chmod 0755 /system/etc/dynimage_ibeats_studio.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/peqimage_gec.bin"
adb shell su -c "busybox chmod 0755 /system/etc/peqimage_gec.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/peqimage_gec_bt.bin"
adb shell su -c "busybox chmod 0755 /system/etc/peqimage_gec_bt.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/peqimage_ibeats.bin"
adb shell su -c "busybox chmod 0755 /system/etc/peqimage_ibeats.bin"
adb shell su -c "busybox chown 0:2000  /system/etc/peqimage_ibeats_pro.bin"
adb shell su -c "busybox chmod 0755  /system/etc/peqimage_ibeats_pro.bin"
adb shell su -c "busybox chown 0:2000 /system/etc/peqimage_ibeats_solo.bin"
adb shell su -c "busybox chmod 0755 /system/etc/peqimage_ibeats_solo.bin"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/alsa.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/alsa.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/cards/aliases.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/cards/aliases.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/center_lfe.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/center_lfe.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/default.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/default.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/dmix.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/dmix.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/dpl.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/dpl.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/dsnoop.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/dsnoop.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/front.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/front.conf"
adb shell su -c "busybox chown  0:0 /system/usr/share/alsa/pcm/iec958.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/iec958.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/modem.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/modem.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/rear.conf
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/rear.conf"
adb shell su -c "busybox chown  0:0 /system/usr/share/alsa/pcm/side.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/side.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/surround40.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/surround40.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/surround41.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/surround41.conf"
adb shell su -c "busybox chown  0:0 /system/usr/share/alsa/pcm/surround50.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/surround51.conf"
adb shell su -c "busybox chown 0:0 /system/usr/share/alsa/pcm/surround51.conf"
adb shell su -c "chomd 0755 /system/usr/share/alsa/pcm/surround71.conf"
adb shell su -c "busybox chown  0:0 /system/usr/share/alsa/pcm/surround71.conf"
adb shell su -c "busybox chown -R 0:0 /system/usr/share/alsa"
adb shell su -c "busybox chmod -R 0755 /system/usr/share/alsa"
adb shell su -c "chomd 0755 /system/xbin/alsa_amixer"
adb shell su -c "busybox chown 0:2000 /system/xbin/alsa_amixer"
adb shell su -c "chomd 0755 /system/xbin/alsa_aplay"
adb shell su -c "busybox chown 0:2000 /system/xbin/alsa_aplay"
adb shell su -c "chomd 0755 /system/xbin/alsa_ctl"
adb shell su -c "busybox chown 0:2000 /system/xbin/alsa_ctl"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO *******************************************************
ECHO *We Are Now Inserting Lines Into The Kindle build.prop*
ECHO *******************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push psystem\p_add_to_buildprop.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/p_add_to_buildprop.sh"
adb shell su -c "busybox chmod 777 /data/local/tmp/p_add_to_buildprop.sh"
adb shell su -c "sh ./data/local/tmp/p_add_to_buildprop.sh"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO *****************************************************
ECHO *Now We Will Do A Little Housecleaning And Check The*
ECHO *  Entire Android System Permissions And Fix Any    *
ECHO *  Problems Found. This Script Is Complex, It Will  *
ECHO * Take Over 15 Minutes To Execute. If I Find Lot's  *
ECHO * Of Problems With The Permissions, It May Take One *
ECHO * Hour Or More. Relax And Enjoy While I Do The Hard *
ECHO *                    Work.                          *
ECHO *****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push fix_permissions.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox chmod 0755 /data/local/tmp/fix_permissions.sh"
adb shell su -c "sh ./data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *   We Are Now Restoring The Kindle Appearance.    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
COLOR 2
echo.
ECHO *****************************************************
ECHO *         Pimp My Beats© Has Been Installed         *
ECHO *Installed, If You Have Questions Post Them In The  *
ECHO *   Kindle Fire First Aide Thread. Thank You For    *
ECHO *              Using Our Software.                  *
ECHO *****************************************************
echo.
echo.
PAUSE
echo.
echo.
adb kill-server
echo.
GOTO menu

:INSTALL-BEATS.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ***************************************************
echo *     The Option 29 To Install Pimp My Beats©     *
ECHO *  To The Kindle Fire Was Canceled By The User.   *
ECHO ***************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-BEATS.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:INSTALL-BEATS.0

:INSTALL-LOCK
echo.
cls
echo.
COLOR 2
echo.
ECHO ***************************************************************
ECHO *Thank You For Selecting Option 30. This Option Will Install  *
ECHO *No Lock As A System Serice. The No Lock App Is A Simple App  *
ECHO * Designed To Specifically Disable The Stock Kindle Fire Lock *
ECHO *Screen Service. The We Install Magic Locker That Will Replace*
ECHO *The Kindle Fire Locker App. The Reason We Choose Magic Locker*
ECHO *Is Due To It's Large Theme Selection. Also, Magic Locker Will*
ECHO * Coexist And Work With Other Lock Screen Programs Like Holo  *
ECHO *Locker And Go Locker Allowing The Theme Selection To Be Quite*
ECHO *                      Extensive!                             *
ECHO ***************************************************************
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Install No Lock And Magic Locker?" INSTALL-LOCK.0 INSTALL-LOCK.1

:INSTALL-LOCK.0
echo.
cd %~dp0
cls
echo.
COLOR 2
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *   An System Install Without Permission Errors       *
ECHO *******************************************************
echo.
ECHO *******************************************************
ECHO * We Are Now Installing The 'No Lock' And Magic Locker*
ECHO * During The Install The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *                   Install Begins.                   *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *   An System Install Without Permission Errors       *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-LOCK.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
echo.
ECHO **********************************************************
ECHO *We Are Now Setting Up The No Lock Services And Binaries *
ECHO * And Disabling The Amazon Ad Services. We Always Backup *
ECHO * The Amazon Services Just In Case You Would Like The Ads*
ECHO *                Back On The Kindle.                     *
ECHO **********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
cd Disabled
adb pull /system/app/dtcp_apk.apk
adb shell su -c "rm /system/app/dtcp_apk.apk"
cd %~dp0
adb push lsystem\app\org.jraf.android.nolock-1.apk /system/app/.
adb push lsystem\app\mobi.lockscreen.magiclocker-1.apk /system/app/.
adb shell su -c "busybox chmod 0644 /system/app/org.jraf.android.nolock-1.apk"
adb shell su -c "busybox chmod 0644 /system/app/mobi.lockscreen.magiclocker-1.apk"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
ECHO ******************************************************
ECHO *DO NOT Open No Lock. Pull down the Upper Status Bar,*
ECHO *Select More+, Select Sounds & Display and change the*
ECHO *  Screen Timeout to: Never. Let Me Know When Have   *
ECHO *             Made This Change.                      *
ECHO ******************************************************
echo.
PAUSE
cls
echo.
echo.
ECHO ****************************************************
ECHO * Thank You For Making The Change, Otherwise This  *
ECHO * Will Not Work As Designed. We Are Doing A Little *
ECHO * House Cleaning Then We Will Reboot, Please Wait. *
ECHO ****************************************************
echo.
ECHO *****************************************************
ECHO * When The Kindle Reboots, Please Unlock The Screen *
ECHO *   Then Check The Box Use by default for this      *
ECHO *   action - Choose MagicLocker[Set as default]     *
ECHO *****************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
ECHO ******************************************************************
ECHO *    Then Click On The Home Button (Picture Of The House) and    *
ECHO *        Check The Box Use by default for this action.           *
ECHO *         Finally Select MagicLocker[Set as default]             *
ECHO ******************************************************************
echo.
ECHO ***********************************************************************
ECHO * You Should Now See The Magic Locker Menu. Please Select The Option  *
ECHO * Preferred Home Launcher. You Will See A Popup, Please Select Your   *
ECHO * Primary Launcher. We Use Apex Launcher, If You Are Using The Stock  *
ECHO *   Kindle Launcher, Select Home, Otherwise Select Your Primary       *
ECHO *Launcher. Remember These Steps Magic Locker Will Not Work As Designed*
ECHO ***********************************************************************
echo.
PAUSE
echo.
cls
echo.
ECHO **************************************************************
ECHO *OK, Now Let's Install A Theme Into Magic Locker. First Open *
ECHO *Magic Locker Settings, Then Select Themes At The Top Of The *
ECHO * Interface. Next Select Get Themes, Choose Android Market,  *
ECHO *  Google Play Store Will Launch. For This Example We Will   *
ECHO *  Select Sense 3.0 - Choose Install Then Accept & Download  *
ECHO * The Magic Locker Theme Will Install. When Done You Will See*
ECHO * A Icon Named Sense 3 On The Desktop, Click On The Icon And *
ECHO * Choose Install This Theme. You Will See A Pop Up - 1 Theme *
ECHO * Was Installed. When Done, Customize The Theme To Fit Your  *
ECHO *Preferences. Finally, Go Back To Your Desktop And Remove The*
ECHO *Sense 3.0 Icon From Your Desktop. That Is It, You Now Have A*
ECHO *    Fully Customizable Lock Screen That Really Works!       *
ECHO **************************************************************
echo.
ECHO *********************************************************************
ECHO *You May Now Go Back To More+ Sound & Display And Set Your Preferred*
ECHO *                       Screen Timeout.                             *
ECHO *********************************************************************
echo.
echo.
PAUSE
echo.
echo.
cls
echo.
adb kill-server
echo.
GOTO menu

:INSTALL-LOCK.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ***************************************************
echo *The Option 30 To Install No Lock And Magic Locker*
ECHO *  To The Kindle Fire Was Canceled By The User.   *
ECHO ***************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-LOCK.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:INSTALL-LOCK.0

:FIX-PERMISSIONS
echo.
cls
echo.
ECHO *************************************************************
ECHO *Thank You For Selecting Option 31. This Option Will Deploy *
ECHO * A Smart Script Written By Prokennexusa. This Script Will  *
ECHO *Inspect And Fix (If Needed) All Android Permission Mistakes*
ECHO *  And Anomalies. The Script Uses Busybox To Speed Up The   *
ECHO * Process. We Recommend You Run This Script Every 90 to 120 *
ECHO *   Days Or After Every Six Applications Installed.         *
ECHO *************************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Fix The Android Permissions And Anomalies?" FIX-PERMISSIONS.0 FIX-PERMISSIONS.1

:FIX-PERMISSIONS.0
echo.
cd %~dp0
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO *   We Are Now Installing The Fix Permissions App,    *
ECHO * During The Install The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into *
ECHO *             USB, Are You Ready?                     *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *   An System Install Without Permission Errors       *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto FIX-PERMISSIONS.2
echo.
set /p unr=Do you have the stock Launcher (y/n) ?
IF %unr% == n GOTO FIX-PERMISSIONS.1
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb start-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
ECHO *************************************
ECHO *We Are Now Restoring The Appearance*
ECHO *************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
echo.
ECHO *****************************************************
ECHO *Now We Will Do A Little Housecleaning And Check The*
ECHO *  Entire Android System Permissions And Fix Any    *
ECHO *  Problems Found. This Script Is Complex, It Will  *
ECHO * Take Over 15 Minutes To Execute. If I Find Lot's  *
ECHO * Of Problems With The Permissions, It May Take One *
ECHO * Hour Or More. Relax And Enjoy While I Do The Hard *
ECHO *                    Work.                          *
ECHO *****************************************************
echo.
adb shell su -c "mkdir /data/local/tmp"
adb push fix_permissions.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox busybox chmod 0755 /data/local/tmp/fix_permissions.sh"
adb shell su -c "sh ./data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *     We Are Done With Fixing The Permissions      *
ECHO ****************************************************
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
COLOR 2
echo.
ECHO *****************************************************
ECHO *    We Have Sucessfully Fixed The Permissions      *
ECHO *      If You Have Questions Post Them In The       *
ECHO *   Kindle Fire First Aide Thread. Thank You For    *
ECHO *              Using Our Software.                  *
ECHO *****************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
GOTO menu

:FIX-PERMISSIONS.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *The Option 31 To Fixed The Permissions And Anomalies*
ECHO *    On The Kindle Fire Was Canceled By The User.    *
ECHO ******************************************************
echo.
ECHO ***********************************************************
ECHO *If You Were Just Kicked Out, You Have The Stock Launcher *
ECHO *Although This Solves Most Issues, We Have Seen Unexpected*
ECHO * Results With The Stock Launcher. You May Still Run This *
ECHO * Utility By Answering NO To The Question Regarding Stock *
ECHO *  Launcher. Be Warned, Unexpected results Have Occured   *
ECHO *             With The Stock Launcher!                    *
ECHO ***********************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:FIX-PERMISSIONS.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:FIX-PERMISSIONS.0

:ADS-DISABLE
echo.
cls
echo.
ECHO *************************************************************
ECHO *Thank You For Selecting Option 32. This Option Will Remove *
ECHO *And Disable The Amazon Ad Services By First Backing Up Then*
ECHO *We Remove dtcp_apk.apk - At Any Point You May Restore This *
ECHO *Service By Moving The Backup File Back To /system/app Using*
ECHO *      Either ES File Explorer Or Root Explorer.            *
ECHO *************************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Disable The Amazon Ad Services?" ADS-DISABLE.0 ADS-DISABLE.1

:ADS-DISABLE.0
echo.
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************************
ECHO *    We Are Now Disabling The Amazon Ad Services,     *
ECHO * During The Process The Kindle Will Look Unusual, Do *
ECHO * Not Worry Or Interrupt The Install Process Once The *
ECHO *Install Starts. Make Sure The Kindle Is Plugged Into *
ECHO *             USB, Are You Ready?                     *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *   An System Install Without Permission Errors       *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto ADS-DISABLE.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb start-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Expected.            *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb start-server
adb wait-for-device
echo.
cls
echo.
ECHO **********************************************************
ECHO *                     We Are Now                         *
ECHO *   Disabling The Amazon Ad Services. We Always Backup   *
ECHO *   The Amazon Services Just In Case You Would Like To   *
ECHO *        Return The Kindle To Stock Condition.           *
ECHO **********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
mkdir Disabled 2>nul
cd Disabled
adb pull /system/app/dtcp_apk.apk
adb shell su -c "rm /system/app/dtcp_apk.apk"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *   We Are Done Disabling The Amazon Ad Services   *
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
COLOR 2
echo.
ECHO *****************************************************
ECHO *We Have Sucessfully Disabed The Amazon Ad Services *
ECHO *      If You Have Questions Post Them In The       *
ECHO *   Kindle Fire First Aide Thread. Thank You For    *
ECHO *              Using Our Software.                  *
ECHO *****************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
echo.
CALL:menu

:ADS-DISABLE.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *   The Option 32 To Disabed The Amazon Ad Services  *
ECHO *    On The Kindle Fire Was Canceled By The User.    *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:ADS-DISABLE.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown  0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown  root.shell /system/xbin/busybox"
adb shell su -c "busybox busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
cd %~dp0
CALL:ADS-DISABLE.0

:DEFAULT-PLAYSTORE
echo.
COLOR 2
echo.
cls
echo.
ECHO *************************************************************
ECHO *Thank You For Selecting Option 33. This Option Will Disable*
ECHO * The System App MarketIntentProxy.apk Which Amazon Uses To *
ECHO *Intercept All Google Play Store Requests And Send All The  *
ECHO *Requests To The Amazon Store. We Do Backup The Application *
ECHO *So You May Restore The Kindle To Original Factory Condition*
ECHO *When We Are Done Google Play Store Will Become Your Default*
ECHO *  Market Although You May Still Use The Amazon Store They  *
ECHO *                 Coexist Well Together.                    *
ECHO *************************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Make Google Play Store Your Default Market?" DEFAULT-PLAYSTORE.0 DEFAULT-PLAYSTORE.1

:DEFAULT-PLAYSTORE.0
echo.
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
echo.
ECHO *******************************************************
ECHO *     We Are Now Preparing The Kindle To Accept       *
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto DEFAULT-PLAYSTORE.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *   We Are Rebooting The Kindle Again. This Time The May  *
ECHO *     Look Unusual After The Reboot, This Is Expected.    *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
echo.
ECHO ***********************************************************
ECHO *                     We Are Now                          *
ECHO *Setting Google Play Your Default Market. We Always Backup*
ECHO *    The Amazon Services Just In Case You Would Like To   *
ECHO *             Return The Kindle To Stock.                 *
ECHO ***********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
mkdir Disabled 2>nul
cd Disabled
adb pull /system/app/MarketIntentProxy.apk
adb shell su -c "rm /system/app/MarketIntentProxy.apk"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
COLOR 2
echo.
ECHO *****************************************************
ECHO *  We Have Sucessfully Set Google Play Your Default *
ECHO *    Market If You Have Questions Post Them In The  *
ECHO *   Kindle Fire First Aide Thread. Thank You For    *
ECHO *              Using Our Software.                  *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
echo.
cls
echo.
CALL:menu

:DEFAULT-PLAYSTORE.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *   The Option 33 To Set Google Play Your Default    *
ECHO *Market On The Kindle Fire Was Canceled By The User. *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:DEFAULT-PLAYSTORE.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
cd %~dp0
CALL:DEFAULT-PLAYSTORE.0

:INSTALL-ADW
echo.
cls
echo.
ECHO *************************************************************
ECHO *Thank You For Selecting Option 34. This Option Will Install*
ECHO *ADW Launcher 1.3.3.8 Stable Version, Live Wallpaper Picker,*
ECHO *Wallbase HD And Widget Picker Services. These Services Are *
ECHO * Intended To Replace The Original Launcher Although They   *
ECHO *  Coexist Well With The Original Kindle Fire Launcher.     *
ECHO *************************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Install ADW Launcher v1.3.3.8 Stable Version?" INSTALL-ADW.0 INSTALL-ADW.1

:INSTALL-ADW.0
echo.
cd %~dp0
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO ********************************************************
ECHO *     We Are Now Preparing The Kindle To Accept        *
ECHO *An System Install Without Permission Errors. Please   *
ECHO * Pay Attention To The Kindle For A Superuser Popup    *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise *
ECHO *             The Install Will Fail.                   *
ECHO ********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO ***********************************************************
ECHO *We Are Now Installing ADW Launcher 1.3.3.8 Stable Version*
ECHO *  During The Install The Kindle Will Look Unusual, Do    *
ECHO *  Not Worry Or Interrupt The Install Process Once The    *
ECHO *                  Install Begins.                        *
ECHO ***********************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *    An System Install Without Permission Errors      *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-ADW.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
set /p unr=Do You Want To Install ADW Launcher (y/n) ?
IF %unr% == n GOTO INSTALL-ADW.1
echo.
ECHO **********************************************************
ECHO * We Are Now Setting Up The ADW Launcher System Service  *
ECHO **********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push adw\app\org.adw.launcher-1.apk /system/app/.
adb shell su -c "busybox chmod 0644 /system/app/com.anddoes.launcher-1.apk"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
CALL:INSTALL-ADW.1

:INSTALL-ADW.1
echo.
set /p unr=Do You Want To Install Widget Picker And Live Wallpaper Services (y/n) ?
IF %unr% == n GOTO INSTALL-ADW.3
echo.
ECHO **********************************************************
ECHO *           We Are Now We Are Installing                 *
ECHO *   Widget Picker Service and Live Wallpaper Service.    *
ECHO **********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push apex\app\AppWidgetPicker-1.2.3.apk /system/app/.
adb push apex\app\LiveWallpapersPicker.apk /system/app/.
adb shell su -c "busybox chmod 0644 /system/app/AppWidgetPicker-1.2.3.apk"
adb shell su -c "busybox chmod 0644 /system/app/LiveWallpapersPicker.apk"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
cls
echo.
echo.
ECHO ***********************************************
ECHO *  During The Reboot You Will See  Kindle Is  *
ECHO *Upgrading...Please Wait  Then The Lock Screen*
ECHO * Will Appear. Please Unlock The Kindle, Next *
ECHO * You Will Be Presented With A Menu To Select *
ECHO *   The Default Launcher. If You Are Using    *
ECHO *   Magic Locker, Be Sure To Choose Magic     *
ECHO * Locker As Your Default Launcher. If You Are *
ECHO *  Not Using Magic LockerOtherwise Choose ADW *
ECHO *     Launcher As Your Default Launcher       *
ECHO ***********************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
ECHO ***************************************************
ECHO *The ADW Launcher Has Successfully Been Installed *
ECHO * ADW Launcher Will Coexist With The Kindle Fire  *
ECHO *  Launcher. To Return To The Original Launcher   *
ECHO *  Go Into The ADW Launcher App Container Where   *
ECHO * You Will Find All Your Installed Applications   *
ECHO * Locate The Icon Named Home, Click On Home And   *
ECHO *You Will Launch The Kindle Fire Original Laucher *
ECHO ***************************************************
echo.
echo.
PAUSE
echo.
echo.
cls
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-ADW.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:INSTALL-ADW.0

:INSTALL-ADW.3
echo.
cls
echo.
echo.
COLOR 2
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ******************************************************
echo *   The Option 34 To Install ADW Launcher v1.3.3.8   *
ECHO *    On The Kindle Fire Was Canceled By The User.    *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-HOLO
echo.
cd %~dp0
cls
echo.
ECHO ****************************************************************
ECHO * Thank You For Selecting Option 35. This Option Will Install  *
ECHO *Holo Launcher HD v2.0.2 Stable Version, Live Wallpaper Picker,*
ECHO *  Wallbase HD And Widget Picker Services. These Services Are  *
ECHO *   Intended To Replace The Original Launcher Although They    *
ECHO *     Coexist Well With The Original Kindle Fire Launcher.     *
ECHO ****************************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Install Holo Launcher HD v2.0.2 Stable Version?" INSTALL-HOLO.0 INSTALL-HOLO.1

:INSTALL-HOLO.0
echo.
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *     We Are Now Preparing The Kindle To Accept       *
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
adb kill-server
adb wait-for-device
echo.
ECHO **************************************************************
ECHO *We Are Now Installing Holo Launcher HD v2.0.2 Stable Version*
ECHO *   During The Install The Kindle Will Look Unusual, Do      *
ECHO *   Not Worry Or Interrupt The Install Process Once The      *
ECHO *                   Install Begins.                          *
ECHO **************************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-HOLO.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
set /p unr=Do You Want To Install Holo Launcher (y/n) ?
IF %unr% == n GOTO INSTALL-ADW.1
echo.
ECHO *********************************************************
ECHO *We Are Now Setting Up The Holo Launcher System Services*
ECHO *********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push holo\app\com.mobint.hololauncher.hd-1.apk /system/app/.
adb push holo\app\com.mobint.locker-1.apk /system/app/.
adb shell su -c "busybox chmod 0644 /system/app/com.mobint.hololauncher.hd-1.apk"
adb shell su -c "busybox chmod 0644 /system/app/com.mobint.locker-1.apk"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
CALL:INSTALL-HOLO.1


:INSTALL-HOLO.1
echo.
set /p unr=Do You Want To Install Widget Picker And Live Wallpaper Services (y/n) ?
IF %unr% == n GOTO INSTALL-HOLO.3
echo.
echo **********************************************************
ECHO *  We Are Now Setting Up The Widget Picker Service and   *
ECHO *               Live Wallpaper Service.                  *
ECHO **********************************************************
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push holo\app\AppWidgetPicker-1.2.3.apk /system/app/.
adb push holo\app\LiveWallpapersPicker.apk /system/app/.
adb shell su -c "busybox chmod 0644 /system/app/AppWidgetPicker-1.2.3.apk"
adb shell su -c "busybox chmod 0644 /system/app/LiveWallpapersPicker.apk"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
ECHO ***********************************************
ECHO *  During The Reboot You Will See  Kindle Is  *
ECHO *Upgrading...Please Wait  Then The Lock Screen*
ECHO * Will Appear. Please Unlock The Kindle, Next *
ECHO * You Will Be Presented With A Menu To Select *
ECHO *   The Default Launcher. If You Are Using    *
ECHO *   Magic Locker, Be Sure To Choose Magic     *
ECHO * Locker As Your Default Launcher. If You Are *
ECHO * Not Using Magic LockerOtherwise Choose Holo *
ECHO *     Launcher As Your Default Launcher       *
ECHO ***********************************************
echo.
PAUSE
cls
echo.
ECHO ***************************************************
ECHO *The Holo Launcher Has Successfully Been Installed*
ECHO * Holo Launcher Will Coexist With The Kindle Fire *
ECHO *  Launcher. To Return To The Original Launcher   *
ECHO * Go Into The Holo Launcher App Container Where   *
ECHO * You Will Find All Your Installed Applications   *
ECHO * Locate The Icon Named Home, Click On Home And   *
ECHO *You Will Launch The Kindle Fire Original Laucher *
ECHO ***************************************************
echo.
echo.
PAUSE
echo.
echo.
cls
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-HOLO.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:INSTALL-HOLO.0

:INSTALL-HOLO.3
echo.
cls
echo.
echo.
COLOR 2
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ******************************************************
echo * The Option 34 To Install Holo Launcher HD v2.0.2   *
ECHO *    On The Kindle Fire Was Canceled By The User.    *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-BOAT
echo.
cls
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting Option 36. This Option Will   *
ECHO * Install Boat Browser, Instagram and Adobe Flash Player  *
ECHO * These Applications Are Intended To Replace The Original *
ECHO *Silk Browser Although They Coexist Well With The Original*
ECHO *              Kindle Fire Silk Browser.                  *
ECHO ***********************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would Like To Install Boat Browser, Instagram and Adobe Flash Player?" INSTALL-BOAT.0 INSTALL-BOAT.1

:INSTALL-BOAT.0
echo.
cd %~dp0
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *     We Are Now Preparing The Kindle To Accept       *
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
echo.
echo.
adb kill-server
adb wait-for-device
echo.
ECHO **************************************************************
ECHO *  We Are Now Installing Boat Browser And Instagram Stable   *
ECHO *   During The Install The Kindle Will Look Unusual, Do      *
ECHO *   Not Worry Or Interrupt The Install Process Once The      *
ECHO *                   Install Begins.                          *
ECHO **************************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *    An System Install Without Permission Errors      *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-BOAT.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
echo.
ECHO **********************************************************
ECHO * We Are Now Setting Up The Boat Browser, Instagram And  *
ECHO *  Flash Player. If You Already Installed Flash Player   *
ECHO *   You May See An Error, You May Ignore The Error.      *
ECHO **********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push boat\app\com.boatbrowser.free-1.apk /system/app/.
adb install -r insta\app\Instagram_3.4.4.apk
adb install -r boat\app\Adobe_Flash_Player_11.1.115.16_4.0+.apk
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************************************
ECHO *  We Are Now Setting Up The Proper Permissions For All  *
ECHO *                      Services                          *
ECHO **********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "busybox chmod 0644 /system/app/com.boatbrowser.free-1.apk"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
ECHO ***************************************************
ECHO *The Boat Browser And Instagram Has Been Installed*
ECHO * Boat Browser Will Coexist With The Kindle Fire  *
ECHO *  Silk Browser. To Return To The Silk Browser    *
ECHO *   Go Into The Launcher App Container Where      *
ECHO * You Will Find All Your Installed Applications   *
ECHO * Locate The Icon Named Silk, Click On Silk And   *
ECHO *You Will Launch The Kindle Fire Original Browser *
ECHO ***************************************************
echo.
echo.
PAUSE
echo.
echo.
cls
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-BOAT.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo * The Option 36 To Install Boat Browser, Instagram   *
ECHO *   On The Kindle Fire Was Canceled By The User.     *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-BOAT.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:INSTALL-BOAT.0

:INSTALL-VPN
echo.
cls
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting Option 37. This Option Will   *
ECHO *Install Several VPN Clients And SIP/VoIP Client Software *
ECHO *  These Applications Are Intended To Work With A Office  *
ECHO *  That Uses SIP. This Will Also Work With Several SIP    *
ECHO * Providers. We Selected These Speific Clients Due Solid  *
ECHO *          Support And Interoperability.                  *
ECHO ***********************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Install VPN Clients And SIP/VoIP Client Software?" INSTALL-VPN.0 INSTALL-VPN.1

:INSTALL-VPN.0
echo.
cd %~dp0
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *     We Are Now Preparing The Kindle To Accept       *
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
echo.
echo.
adb kill-server
adb wait-for-device
echo.
ECHO **************************************************************
ECHO * We Are Now Installing VPN And SIP/VoIP Client Software     *
ECHO *   During The Install The Kindle Will Look Unusual, Do      *
ECHO *   Not Worry Or Interrupt The Install Process Once The      *
ECHO *                   Install Begins.                          *
ECHO **************************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *    An System Install Without Permission Errors      *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-VPN.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
echo.
ECHO ***********************************************************
ECHO *We Are Now Setting Up The VPN Clients And SIP/VoIP Client*
ECHO *   Software. If You Already Installed Flash Player       *
ECHO *   You May See An Error, You May Ignore The Error.       *
ECHO ***********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb install -r vpn\app\com.csipsimple-1.apk
adb install -r vpn\app\com.gmail.mjm4456.vpncillatrial-1.apk
adb install -r vpn\app\com.xnsystems.xnmvpntrial-1.apk
adb install -r vpn\app\de.ncp.vpn.basic.trial-1.apk
adb install -r vpn\app\dellmont.SipGo-1.apk
adb install -r vpn\app\org.strongswan.android-1.apk
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
ECHO ***************************************************
ECHO * The VPN And SIP/VoIP Client Software Has Been   *
ECHO *        Installed On The Kindle Fire.            *
ECHO ***************************************************
echo.
echo.
PAUSE
echo.
echo.
cls
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-VPN.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo * The Option 37 To Install VPN And SIP/VoIP Client   *
ECHO *    On The Kindle Fire Was Canceled By The User.    *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-VPN.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:INSTALL-VPN.0

:FIX-INSTALLATION
echo.
cls
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting Option 38. This Option Will   *
ECHO * Fix A Broken Audio Installation. Please Use This Option *
ECHO *  Under Direct Guidance And Direction Since This Option  *
ECHO * Will Reset Your Build.Prop File. You May Use This When  *
ECHO *             Mods Break Your Kindle.                     *
ECHO ***********************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Attempt To Fix A Broken Installation?" FIX-INSTALLATION.0 FIX-INSTALLATION.3

:FIX-INSTALLATION.0
echo.
cd %~dp0
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *     We Are Now Preparing The Kindle To Accept       *
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *    An System Install Without Permission Errors      *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto FIX-INSTALLATION.2
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
echo.
set /p unr=Do You Have A Kindle Fire 2 (y/n) ?
IF %unr% == n GOTO FIX-INSTALLATION.1
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting The Kindle Fire 2 Recovery    *
ECHO * Option, We Will Now Recover And Restore The build.prop  *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push kf2\build.prop /system/.
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
echo.
ECHO ***********************************************************
ECHO * Great, That Was A Success, If You Saw Any Errors Please *
ECHO * Post Them In Kindle Fire First Aide. Next We Are Going  *
ECHO *          To Fix The File System Permissions             *
ECHO ***********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb push fix_permissions.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox chmod 0755 /data/local/tmp/fix_permissions.sh"
adb shell su -c "sh ./data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *     We Are Done With Fixing The Permissions      *
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
COLOR 2
echo.
ECHO ********************************************************
ECHO *We Have Sucessfully Fixed The Permissions And Restored*
ECHO * The build.prop If You Have Questions Post Them In The*
ECHO *     Kindle Fire First Aide Thread. Thank You For     *
ECHO *                 Using Our Software.                  *
ECHO ********************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:FIX-INSTALLATION.1
echo.
COLOR 2
echo.
cls
echo.
set /p unr=Do You Have A Kindle Fire HD 7 (y/n) ?
IF %unr% == n GOTO FIX-INSTALLATION.2
echo.
ECHO ***********************************************************
ECHO * Thank You For Selecting The Kindle Fire HD 7 Recovery   *
ECHO * Option, We Will Now Recover And Restore The build.prop  *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push kfhd7\build.prop /system/.
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
echo.
ECHO ***********************************************************
ECHO * Great, That Was A Success, If You Saw Any Errors Please *
ECHO * Post Them In Kindle Fire First Aide. Next We Are Going  *
ECHO *          To Fix The File System Permissions             *
ECHO ***********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb push fix_permissions.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox chmod 0755 /data/local/tmp/fix_permissions.sh"
adb shell su -c "sh ./data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *     We Are Done With Fixing The Permissions      *
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
COLOR 2
echo.
ECHO ********************************************************
ECHO *We Have Sucessfully Fixed The Permissions And Restored*
ECHO * The build.prop If You Have Questions Post Them In The*
ECHO *     Kindle Fire First Aide Thread. Thank You For     *
ECHO *                 Using Our Software.                  *
ECHO ********************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:FIX-INSTALLATION.2
echo.
COLOR 2
echo.
cls
echo.
set /p unr=Do You Have A Kindle Fire HD 8.9 (y/n) ?
IF %unr% == n GOTO FIX-INSTALLATION.3
echo.
ECHO ***********************************************************
ECHO * Thank You For Selecting The Kindle Fire HD 8.9 Recovery *
ECHO * Option, We Will Now Recover And Restore The build.prop  *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push kfhd8\build.prop /system/.
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
echo.
ECHO ***********************************************************
ECHO * Great, That Was A Success, If You Saw Any Errors Please *
ECHO * Post Them In Kindle Fire First Aide. Next We Are Going  *
ECHO *          To Fix The File System Permissions             *
ECHO ***********************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb push fix_permissions.sh /data/local/tmp/.
adb shell su -c "busybox chown 0:0 /data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox chmod 0755 /data/local/tmp/fix_permissions.sh"
adb shell su -c "sh ./data/local/tmp/fix_permissions.sh"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ****************************************************
ECHO *     We Are Done With Fixing The Permissions      *
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
echo.
adb reboot
adb kill-server
adb wait-for-device
COLOR 2
echo.
ECHO ********************************************************
ECHO *We Have Sucessfully Fixed The Permissions And Restored*
ECHO * The build.prop If You Have Questions Post Them In The*
ECHO *     Kindle Fire First Aide Thread. Thank You For     *
ECHO *                 Using Our Software.                  *
ECHO ********************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
cls
echo.
CALL:menu

:FIX-INSTALLATION.3
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *    The Option 38 To Fix A Broken Installation      *
ECHO *   On The Kindle Fire Was Canceled By The User.     *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:TWRPKFHD7
echo.
cd %~dp0
cls
echo.
ECHO ***********************************************************
ECHO *   This Option Will Install Kindle Fire 2nd-bootloader   *
ECHO *                 + TWRP 2.4.4.0                          *
ECHO *        This Option Is Only For The HD Series 7.         *
ECHO *  Do Not Attempt This Install On An Older Kindle Device. *
ECHO ***********************************************************
echo.
ECHO ***********************************************************
ECHO *   THIS IS A RISKY UPGRADE AND HAS A HIGH FAILURE RATE   *
ECHO * IF YOU DO NOT LIKE THE RISK INVOLVED DO NOT INSTALL THIS*
ECHO * UPDATE!!!!!! THE RISK IS THE SAME IF YOU DO IT THROUGH  *
ECHO *KINDLE FIRE FIRST AIDE OR THROUGH HASHCODE'S STEPS SINCE *
ECHO * THE STPES ARE IDENTICAL. IF THIS FAILS, DO NOT POST AN  *
ECHO *  ANGRY EMAIL TO US. WE TAKE CAREFUL STEPS TO ENSURE A   *
ECHO * POSTIVE OUTCOME BUT THIS WILL NOT DECREASE THE NUMBER OF*
ECHO *     POSTENTIAL FAILURES WITH THIS 2ND BOOTLOADER.       *
ECHO ***********************************************************
echo.
set /p unr=DO YOU UNDERSTAND THE RISK! (y/n) ?
IF %unr% == n GOTO TWRPKFHD7.3
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Install Kindle Fire HD 7 2ND-Bootloader And TWRP 2.4.4.0?" TWRPKFHD7.0 TWRPKFHD7.1

:TWRPKFHD7.0
echo.
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *     We Are Now Preparing The Kindle To Accept       *
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
echo.
ECHO ******************************************************
ECHO * It Is Critical You Backup The Kindle Fire Prior To *
ECHO *          Installing This Option!                   *
ECHO ******************************************************
echo.
set /p unr=Did You Backup The Kindle Fire HD 7 (y/n) ?
IF %unr% == n GOTO BACKUP-3
echo.
set /p unr=Do You Have A Kindle Fire HD 7 Plugged Into USB (y/n) ?
IF %unr% == n GOTO TWRPKFHD7.1
mkdir kfhd7\TWRP>nul
cd kfhd7\TWRP
cls
echo.
ECHO ********************************************************
ECHO *  Thank You For Selecting The Option To Flash TWRP    *
ECHO *Version 2.3.3.0 On The Kindle Fire HD 7. This Is Done *
ECHO * Through Our Secure Servers, So Please Wait While We  *
ECHO *         Download All The Files................       *
ECHO ********************************************************
echo.
ECHO ********************************************************
ECHO *We Are Now Querying The Download Server For The Latest*
ECHO * Stack Override File, Please Wait.............        *
ECHO ********************************************************
echo.
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd-7.2.3/images/custom/stack
..\..\wget -Ostack.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/m4cjutejb3ofu730spap.md5
..\..\md5 "stack"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Ostack -q --no-check-certificate https://xerocomm.box.com/shared/static/xy2zmkdaghiwc615ie1d
)
..\..\md5 "stack"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)
echo.
ECHO ******************************************************
ECHO *  Ok, Here We Go, We Are Now Installing The Stack   *
ECHO *  Override In The Kindle System Directory. Please   *
ECHO *  Wait wile I Push The File And Then Copy It From   *
ECHO *  The Kindle Temp Directory. If You See Any Errors  *
ECHO *        Please Post Them In Our Thread.             *
ECHO ******************************************************
echo.
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb push stack /data/local/tmp/.
adb shell su -c "dd if=/data/local/tmp/stack of=/dev/block/platform/omap/omap_hsmmc.1/by-name/system bs=6519488 seek=1"
echo.
ECHO *******************************************************
ECHO * We Are Done With The Prep Work, Now We Will Stop The*
ECHO *  Auto Recovery Update Script This File May Or May   *
ECHO * Not Be Present, So Do Not Worry If You See An Error *
ECHO *******************************************************
echo.
adb shell su -c "mount -o remount,rw ext4 /system"
adb shell su -c "mv /system/etc/install-recovery.sh /system/etc/install-recovery.sh.bak"
adb shell su -c "mount -o remount,ro ext4 /system"
echo.
ECHO *******************************************************
ECHO *  Get A Cup Of Coffee, We Are Going To Download And  *
ECHO *  Push The Kindle Fire Original OS 7.2.3 - This May  *
ECHO *          Take A While, Please Wait......            *
ECHO *******************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd-7.2.3/images/kfhd7-amazon-os-7.2.3.zip
..\..\wget -Okfhd7-amazon-os-7.2.3.zip.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/7zeie9okxos5d25y6rh8.img
..\..\md5 "kfhd7-amazon-os-7.2.3.zip"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Okfhd7-amazon-os-7.2.3.zip -q --no-check-certificate https://xerocomm.box.com/shared/static/qyvtkcxmj30glsqbsn1c.zip
)
..\..\md5 "kfhd7-amazon-os-7.2.3.zip"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)
echo.
ECHO *******************************************************
ECHO *We Are Done With The Download, Now We Will Push It To*
ECHO *  The Kindle SD Card. This May Take A While, Please  *
ECHO *           Wait..................                    *
ECHO *******************************************************
echo.
adb push kfhd7-amazon-os-7.2.3.zip /data/local/.
echo.
ECHO *******************************************************
ECHO *OK, Now We Are Going To Reboot The Kindle And Have It*
ECHO *Boot Into Fastboot. Once The Kindle Is In Fastboot We*
ECHO *   Will Flash The New TWRP Recovery And Freedom      *
ECHO *                 Bootloader.                         *
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
adb shell su -c "reboot bootloader"
ECHO *******************************************************
ECHO * The Kindle Is Now Rebooting Into Fastboot...........*
ECHO *******************************************************
echo.
echo.
REM ECHO ********************************************************
REM ECHO * Power Off The Kindle Fire HD 7 By Pressing The Power *
REM ECHO *Button Until The Kindle Shows Shutdown, Then Shutdown *
REM ECHO *    The Kindle. This Is A Very Important Step!        *
REM ECHO ********************************************************
REM echo.
set /p unr=Is The Kindle Fire HD 7 Displaying the Fastboot Logo (y/n) ?
IF %unr% == n GOTO TWRPKFHD7.1
echo.
ECHO *******************************************************
ECHO *  We Are Now Downloading The Latest Version Of The   *
ECHO *       Freedom Boot Image. Please Wait...........    *
ECHO *******************************************************
echo.
REM wget http://dl.dropbox.com/u/54456659/kfhd-7.2.3/images/custom/kfhd7-freedom-boot.img
..\..\wget -Okfhd7-freedom-boot.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/1wourzho3a6xyolqh16d.md5
..\..\md5 "kfhd7-freedom-boot.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Okfhd7-freedom-boot.img -q --no-check-certificate https://xerocomm.box.com/shared/static/ybuxo3j89hgxrzdxjnep.img
)
..\..\md5 "kfhd7-freedom-boot.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)
echo .
ECHO *******************************************************
ECHO *  We Are Now Downloading The Latest Version Of The   *
ECHO * TWRP 2.3.3.0 Recovery, Please Wait.............     *
ECHO *******************************************************
echo.
REM wget http://dl.dropboxusercontent.com/u/54456659/kfhd-7.2.3/images/custom/kfhd7-twrp-2.4.4.0-recovery.img
..\..\wget -Okfhd7-twrp-2.4.4.0-recovery.img.md5 -q --no-check-certificate https://xerocomm.box.com/shared/static/hbx1saesub04mnd1vxi4.img
..\..\md5 "kfhd7-twrp-2.4.4.0-recovery.img"
if /I '%ERRORLEVEL%' == '1' (
..\..\wget -Okfhd7-twrp-2.4.4.0-recovery.img -q --no-check-certificate https://xerocomm.box.com/shared/static/r306ed8hpugrsenk97x0.img
)
..\..\md5 "kfhd7-twrp-2.4.4.0-recovery.img"
if /I '%ERRORLEVEL%' == '1' (
echo.
ECHO *****************************************************
ECHO *       File downloaded does not match MD5 Sum.     *
ECHO *             Please try again later.               *
ECHO *****************************************************
echo.
CALL:sleep 5
exit
)
echo.
ECHO *******************************************************
ECHO *          Images downloaded successfully             *
ECHO *******************************************************
echo .
REM ECHO *******************************************************
REM ECHO *When You See <waiting for device> Please Power Up The*
REM ECHO *Kindle Fire HD 7 - OK Here We Go!                    *
REM ECHO *Power Up The Kindle Please..............             *
REM ECHO *******************************************************
REM echo.
ECHO *******************************************************
ECHO *We Are Now Flashing The Freedom Bootloader...........*
ECHO *******************************************************
echo.
fastboot -i 0x1949 flash boot kfhd7-freedom-boot.img
echo.
ECHO *******************************************************
ECHO *We Are Now Fashing TWRP 2.3.3.0......................*
ECHO *******************************************************
echo.
fastboot -i 0x1949 flash recovery kfhd7-twrp-2.4.4.0-recovery.img
echo.
ECHO *******************************************************
ECHO * We Are Going To Reboot The Kindle, When The Kindle  *
ECHO * Reboots, You Should Be Fine. As You Know, We Pushed *
ECHO * A Copy Of The Original OS To The Kindle Just In Case*
ECHO *There IS A Problem With The Original OS. If There Is *
ECHO * A Problem, Please Enter TWRP By Holding The Volume  *
ECHO *  Up When You See The Kindle Fire Blue Boot Logo.    *
ECHO * Just FYI, It Does Take A Full Minute To Enter TWRP, *
ECHO * So Be Patient When You Need To Manage TWRP Settings.*
ECHO *******************************************************
echo.
fastboot -i 0x1949 reboot
echo.
ECHO *******************************************************
ECHO *OK, We Are Done, I Am Rebooting The Kindle Next......*
ECHO *******************************************************
echo.
ECHO ***********************************************************
ECHO *Please Leave The Copy Of OS 7.2.3 On The data/local, Just*
ECHO *  In Case You Have To Restore The Kindle Fire. You Will  *
ECHO *   Be Armed With A Fresh Copy Of The Operating System.   *
ECHO *Having Said This, Never Delete The data/local File Named *
ECHO *  kfhd7-amazon-os-7.2.3.zip Located At The Root Of The   *
ECHO * data/local. If You Have Any Questions, Please Post The  *
ECHO *  Question In Our Thread. Thank You For Your Support!    *
ECHO ***********************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:TWRPKFHD7.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *   The Option To Install 2nd-bootloader + TWRP      *
ECHO *   On The Kindle Fire Was Canceled By The User.     *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:TWRPKFHD7.2
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *   The Option To Install 2nd-bootloader + TWRP      *
ECHO * On The Kindle Fire Failed due to Fastboot Failure. *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:OPTION40
echo.
cls
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting Option 40. This Option Will   *
ECHO *  Install Kindle Fire 2nd-bootloader + TWRP 2.4.4.0 On   *
ECHO *   The Kindle Fire 2.This Option Is Only For The Fire    *
ECHO *   Series 2. Do Not Attempt This Install On An Older     *
ECHO *                Kindle Fire Device.                      *
ECHO ***********************************************************
echo.
ECHO ***********************************************************
ECHO *   THIS IS A RISKY UPGRADE AND HAS A HIGH FAILURE RATE   *
ECHO * IF YOU DO NOT LIKE THE RISK INVOLVED DO NOT INSTALL THIS*
ECHO * UPDATE!!!!!! THE RISK IS THE SAME IF YOU DO IT THROUGH  *
ECHO *KINDLE FIRE FIRST AIDE OR THROUGH HASHCODE'S STEPS SINCE *
ECHO * THE STPES ARE IDENTICAL. IF THIS FAILS, DO NOT POST AN  *
ECHO *  ANGRY EMAIL TO US. WE TAKE CAREFUL STEPS TO ENSURE A   *
ECHO * POSTIVE OUTCOME BUT THIS WILL NOT DECREASE THE NUMBER OF*
ECHO *     POSTENTIAL FAILURES WITH THIS 2ND BOOTLOADER.       *
ECHO ***********************************************************
echo.
set /p unr=DO YOU UNDERSTAND THE RISK! (y/n) ?
IF %unr% == n GOTO OPTION40.1
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
set path=C:\KFFirstAide;%path%
cd \KFFirstAide
echo.
CALL:yesno "Would You Like To Install Kindle Fire 2 2ND-Bootloader And TWRP 2.4.4.0?" OPTION40.0 OPTION40.1


:OPTION40.0
echo.
COLOR 2
echo.
cls
echo.
set /p unr=Did You Backup The Kindle Fire 2 (y/n) ?
IF %unr% == n GOTO OPTION17
cd \KFFirstAide
echo.
set /p unr=Do You Have A Kindle Fire 2 Plugged Into USB (y/n) ?
IF %unr% == n GOTO OPTION41
echo.
ECHO ********************************************************
ECHO *  Thank You For Selecting The Option To Flash TWRP    *
ECHO * Version 2.3.3.0 On The Kindle Fire 2. This Is Done   *
ECHO * Through Our Secure Servers, So Please Wait While We  *
ECHO *         Download All The Files................       *
ECHO ********************************************************
echo.
ECHO ********************************************************
ECHO *We Are Now Querying The Download Server For The Latest*
ECHO * Stack Override File, Please Wait.............        *
ECHO ********************************************************
echo.
cd \KFFirstAide\kf2
del \KFFirstAide\kf2\stack
echo.
wget http://dl.dropbox.com/u/54456659/kf2-10.2.3/images/custom/stack
echo.
ECHO ******************************************************
ECHO *  Ok, Here We Go, We Are Now Installing The Stack   *
ECHO *  Override In The Kindle System Directory. Please   *
ECHO *  Wait While I Push The File And Then Copy It From  *
ECHO *  The Kindle Temp Directory. If You See Any Errors  *
ECHO *        Please Post Them In Our Thread.             *
ECHO ******************************************************
echo.
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb push \KFFirstAide\kf2\stack /data/local/tmp/.
adb shell su -c "dd if=/data/local/tmp/stack of=/dev/block/platform/omap/omap_hsmmc.1/by-name/system bs=6519488 seek=1"
echo.
ECHO *******************************************************
ECHO *  We Are Now Downloading The Latest Version Of The   *
ECHO *     Otter2 Freedom Boot Image. Please Wait......    *
ECHO *******************************************************
echo.
cd \KFFirstAide\kf2
del \KFFirstAide\kf2\otter2-freedom-boot.img
wget http://dl.dropbox.com/u/54456659/kf2-10.2.3/images/custom/otter2-freedom-boot.img
echo.
ECHO *******************************************************
ECHO *  We Are Now Downloading The Latest Version Of The   *
ECHO * TWRP 2.3.3.0 Recovery, Please Wait.............     *
ECHO *******************************************************
echo.
cd \KFFirstAide\kf2
del \KFFirstAide\kf2\otter2-twrp-2.4.4.0-recovery.img
wget http://dl.dropboxusercontent.com/u/54456659/kf2-10.2.3/images/custom/otter2-twrp-2.4.4.0-recovery.img
echo.
ECHO *******************************************************
ECHO * We Are Done With The Prep Work, Now We Will Stop The*
ECHO *  Auto Recovery Update Script This File May Or May   *
ECHO * Not Be Present, So Do Not Worry If You See An Error *
ECHO *******************************************************
echo.
adb shell su -c "mount -o remount,rw ext4 /system"
adb shell su -c "mv /system/etc/install-recovery.sh /system/etc/install-recovery.sh.bak"
adb shell su -c "mount -o remount,ro ext4 /system"
echo.
ECHO *******************************************************
ECHO *OK, Now We Are Going To Reboot The Kindle And Have It*
ECHO *Boot Into Fastboot. Once The Kindle Is In Fastboot We*
ECHO *   Will Flash The New TWRP Recovery And Freedom      *
ECHO *                 Bootloader.                         *
ECHO *******************************************************
echo.
ECHO *******************************************************
ECHO * The Kindle Is Now Rebooting Into Fastboot...........*
ECHO *******************************************************
echo.
echo.
ECHO ********************************************************
ECHO *  Power Off The Kindle Fire 2 By Pressing The Power   *
ECHO *Button Until The Kindle Shows Shutdown, Then Shutdown *
ECHO *    The Kindle. This Is A Very Important Step!        *
ECHO ********************************************************
echo.
set /p unr=Is The Kindle Fire 2 Powered Off (y/n) ?
IF %unr% == n GOTO TWRPKFHD7.2
echo.
ECHO *******************************************************
ECHO *When You See <waiting for device> Please Power Up The*
ECHO *Kindle Fire 2 - OK Here We Go!                       *
ECHO *Power Up The Kindle Please..............             *
ECHO *******************************************************
echo.
echo.
ECHO *******************************************************
ECHO *We Are Now Flashing The Freedom Bootloader...........*
ECHO *******************************************************
echo.
cd \KFFirstAide\kf2
fastboot -i 0x1949 flash boot otter2-freedom-boot.img
echo.
ECHO *******************************************************
ECHO *We Are Now Fashing TWRP 2.3.3.0......................*
ECHO *******************************************************
echo.
cd \KFFirstAide\kf2
fastboot -i 0x1949 flash recovery otter2-twrp-2.4.4.0-recovery.img
echo.
ECHO *******************************************************
ECHO * We Are Going To Reboot The Kindle, When The Kindle  *
ECHO *  Reboots, Please Enter TWRP By Holding The Volume   *
ECHO *  Up When You See The Kindle Fire Blue Boot Logo.    *
ECHO * Just FYI, It Does Take A Full Minute To Enter TWRP, *
ECHO * So Be Patient When You Need To Manage TWRP Settings.*
ECHO *******************************************************
echo.
cd \KFFirstAide
fastboot -i 0x1949 reboot
echo.
ECHO *******************************************************
ECHO *OK, We Are Done, I Am Rebooting The Kindle Now.......*
ECHO *******************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:OPTION40.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *  The Option 40 To Install 2nd-bootloader + TWRP    *
ECHO *   On The Kindle Fire Was Canceled By The User.     *
ECHO ******************************************************
echo.
cd \KFFirstAide
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:OPTION41
echo.
cls
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting Option 41. This Option Will   *
ECHO *  Install Kindle Fire 2nd-bootloader + TWRP 2.3.3.0 On   *
ECHO *  The Kindle Fire HD 8.9.This Option Is Only For The HD  *
ECHO *   Series 8.9. Do Not Attempt This Install On An Older   *
ECHO *                Kindle Fire Device.                      *
ECHO ***********************************************************
echo.
ECHO ***********************************************************
ECHO *   THIS IS A RISKY UPGRADE AND HAS A HIGH FAILURE RATE   *
ECHO * IF YOU DO NOT LIKE THE RISK INVOLVED DO NOT INSTALL THIS*
ECHO * UPDATE!!!!!! THE RISK IS THE SAME IF YOU DO IT THROUGH  *
ECHO *KINDLE FIRE FIRST AIDE OR THROUGH HASHCODE'S STEPS SINCE *
ECHO * THE STPES ARE IDENTICAL. IF THIS FAILS, DO NOT POST AN  *
ECHO *  ANGRY EMAIL TO US. WE TAKE CAREFUL STEPS TO ENSURE A   *
ECHO * POSTIVE OUTCOME BUT THIS WILL NOT DECREASE THE NUMBER OF*
ECHO *     POSTENTIAL FAILURES WITH THIS 2ND BOOTLOADER.       *
ECHO ***********************************************************
echo.
set /p unr=DO YOU UNDERSTAND THE RISK! (y/n) ?
IF %unr% == n GOTO OPTION41.1
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
set path=C:\KFFirstAide;%path%
cd \KFFirstAide
echo.
CALL:yesno "Would You Like To Install Kindle Fire HD 8.9 2ND-Bootloader And TWRP 2.3.3.0?" OPTION41.0 OPTION41.1


:OPTION41.1
echo.
COLOR 2
echo.
cls
echo.
set /p unr=Did You Backup The Kindle Fire HD 8.9 (y/n) ?
IF %unr% == n GOTO OPTION17
cd \KFFirstAide
echo.
set /p unr=Do You Have A Kindle Fire HD 8.9 Plugged Into USB (y/n) ?
IF %unr% == n GOTO OPTION41.1
echo.
ECHO ********************************************************
ECHO *  Thank You For Selecting The Option To Flash TWRP    *
ECHO * Version 2.3.3.0 On The Kindle Fire HD 8.9. This Is   *
ECHO *Done Through Our Secure Servers, So Please Wait While *
ECHO *          We Download All The Files................   *
ECHO ********************************************************
echo.
ECHO ********************************************************
ECHO *We Are Now Querying The Download Server For The Latest*
ECHO * Stack Override File, Please Wait.............        *
ECHO ********************************************************
echo.
cd \KFFirstAide\kfhd8
del \KFFirstAide\kfhd8\stack
echo.
wget http://dl.dropbox.com/u/54456659/kfhd-8.2.3/Images/custom/stack
echo.
ECHO ******************************************************
ECHO *  Ok, Here We Go, We Are Now Installing The Stack   *
ECHO *  Override In The Kindle System Directory. Please   *
ECHO *  Wait While I Push The File And Then Copy It From  *
ECHO *  The Kindle Temp Directory. If You See Any Errors  *
ECHO *        Please Post Them In Our Thread.             *
ECHO ******************************************************
echo.
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb push \KFFirstAide\kf2\stack /data/local/tmp/.
adb shell su -c "dd if=/data/local/tmp/stack of=/dev/block/platform/omap/omap_hsmmc.1/by-name/system bs=6519488 seek=1"
echo.
ECHO *******************************************************
ECHO *  We Are Now Downloading The Latest Version Of The   *
ECHO *     Otter2 Freedom Boot Image. Please Wait......    *
ECHO *******************************************************
echo.
cd \KFFirstAide\kfhd8
del \KFFirstAide\kfhd8\kfhd8-freedom-boot.img
wget http://dl.dropbox.com/u/54456659/kfhd-8.2.3/Images/custom/kfhd8-freedom-boot.img
echo.
ECHO *******************************************************
ECHO *  We Are Now Downloading The Latest Version Of The   *
ECHO * TWRP 2.3.3.0 Recovery, Please Wait.............     *
ECHO *******************************************************
echo.
cd \KFFirstAide\kfhd8
del \KFFirstAide\kfhd8\kfhd8-twrp-2.4.4.0-recovery.img
wget http://dl.dropboxusercontent.com/u/54456659/kfhd-8.2.3/Images/custom/kfhd8-twrp-2.4.4.0-recovery.img
echo.
ECHO *******************************************************
ECHO * We Are Done With The Prep Work, Now We Will Stop The*
ECHO *  Auto Recovery Update Script This File May Or May   *
ECHO * Not Be Present, So Do Not Worry If You See An Error *
ECHO *******************************************************
echo.
adb shell su -c "mount -o remount,rw ext4 /system"
adb shell su -c "mv /system/etc/install-recovery.sh /system/etc/install-recovery.sh.bak"
adb shell su -c "mount -o remount,ro ext4 /system"
echo.
ECHO *******************************************************
ECHO *OK, Now We Are Going To Reboot The Kindle And Have It*
ECHO *Boot Into Fastboot. Once The Kindle Is In Fastboot We*
ECHO *   Will Flash The New TWRP Recovery And Freedom      *
ECHO *                 Bootloader.                         *
ECHO *******************************************************
echo.
ECHO ********************************************************
ECHO *Power Off The Kindle Fire HD 8.9 By Pressing The Power*
ECHO *Button Until The Kindle Shows Shutdown, Then Shutdown *
ECHO *    The Kindle. This Is A Very Important Step!        *
ECHO ********************************************************
echo.
set /p unr=Is The Kindle Fire 8.9 Powered Off (y/n) ?
IF %unr% == n GOTO TWRPKFHD7.2
echo.
ECHO *******************************************************
ECHO *When You See <waiting for device> Please Power Up The*
ECHO *Kindle Fire HD 8.9 - OK Here We Go!                  *
ECHO *Power Up The Kindle Please.................          *
ECHO *******************************************************
echo.
ECHO *******************************************************
ECHO *We Are Now Flashing The Freedom Bootloader...........*
ECHO *******************************************************
echo.
cd \KFFirstAide\kfhd8
fastboot -i 0x1949 flash boot kfhd8-freedom-boot.img
echo.
ECHO *******************************************************
ECHO *We Are Now Fashing TWRP 2.3.3.0......................*
ECHO *******************************************************
echo.
cd \KFFirstAide\kfhd8
fastboot -i 0x1949 flash recovery kfhd8-twrp-2.4.4.0-recovery.img
echo.
ECHO *******************************************************
ECHO * We Are Going To Reboot The Kindle, When The Kindle  *
ECHO *  Reboots, Please Enter TWRP By Holding The Volume   *
ECHO *  Up When You See The Kindle Fire Blue Boot Logo.    *
ECHO * Just FYI, It Does Take A Full Minute To Enter TWRP, *
ECHO * So Be Patient When You Need To Manage TWRP Settings.*
ECHO *******************************************************
echo.
cd \KFFirstAide
fastboot -i 0x1949 reboot
echo.
ECHO *******************************************************
ECHO *OK, We Are Done, I Am Rebooting The Kindle Now.......*
ECHO *******************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:OPTION41.1
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *  The Option 41 To Install 2nd-bootloader + TWRP    *
ECHO *   On The Kindle Fire Was Canceled By The User.     *
ECHO ******************************************************
echo.
cd \KFFirstAide
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:FIX-FLASHING
echo.
cls
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting Option 42. This Option Will   *
ECHO * Perform Two Tasks. One, It Will Check For Root, If It Is*
ECHO * Not Detected, The Software Will Continue To Install Root*
ECHO *   Then It Will Restore The Kindle To A Normal Desktop.  *
ECHO ***********************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Fix A Sluggish Kindle?" FIX-FLASHING.1 FIX-FLASHING.3

:FIX-FLASHING.1
echo.
cd %~dp0
cls
echo.
COLOR 2
echo.
ECHO *********************************************************
ECHO *VERY IMPORTANT!!!!!! When You See This Console Hanging *
ECHO * Longer Than 2 Minutes, Please Grab The Kindle, Leave  *
ECHO *   The Kindle Plugged Into USB. Navigate To More +     *
ECHO * Security Find Enable ADB. Turn Enable ADB OFF And ON  *
ECHO * This Script Should Continue After You Take These Steps*
ECHO *********************************************************
echo.
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *********************************************
ECHO *Here We Go, We Are Now Preparing The Kindle*
ECHO *********************************************
echo.
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *         After The Reboot, This Is Normal.               *
ECHO ***********************************************************
echo.
adb reboot
adb wait-for-device
echo.
cd root
REM del \KFFirstAide\dropbox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb push su /data/local/tmp/.
adb push Superuser.apk /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "/system/xbin/busybox mv /data/local/tmp/su /system/xbin/su"
adb shell su -c "/system/xbin/busybox mv /data/local/tmp/Superuser.apk /system/app/Superuser.apk"
adb shell su -c "busybox chown 0.0 /system/xbin/su"
adb shell su -c "busybox chmod 06755 /system/xbin/su"
adb shell su -c "busybox chmod 655 /system/app/Superuser.apk"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm /system/bin/su"
adb shell su -c "ln -s /system/xbin/su /system/bin/su"
adb install -r Busybox_Installer_4.1.apk
cd %~dp0
adb install -r GApps\ES_File_Explorer_1.6.2.5.apk
adb install -r GApps\File_Manager_1.15.6.apk
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***************************************************
ECHO *OK, We Are Done With The Binary, Now We Are Going*
ECHO *              To Reboot The Kindle.              *
ECHO ***************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "rm /data/local.prop"
cls
echo.
ECHO *******************************************************
ECHO *Looks Good! Root Permissions Are Successfully Granted*
ECHO *To The SU Binary. We will Now Install Superuser......*
ECHO *******************************************************
echo.
adb kill-server
adb wait-for-device
echo.
ECHO *******************************************
ECHO *  OK, We Are Now Installing Root Checker *
ECHO * Basic. After The Kindle Reboot You Will *
ECHO * Be Able To Find Root Checker Basic Under*
ECHO * The Kindle Apps. Please Use This Program*
ECHO *             To Test Root.               *
ECHO *******************************************
echo.
cd root
adb install -r suchecker.apk
echo.
ECHO *******************************************************
ECHO *The Kindle Now Has Root. After The Reboot Please Goto*
ECHO *  Kindle Apps On The Device And Launch Superuser To  *
ECHO *              Initialize The Service.                *
ECHO *******************************************************
echo.
ECHO ***********************************************
ECHO * Pay Close Attention To The Kindle Fire For  *
ECHO * A Pop Up. When You See SuperSU Popup Be Sure*
ECHO *To Grant Or Allow The Request, Otherwise This*
ECHO *                 Will Fail!                  *
ECHO ***********************************************
echo.
adb shell "busybox mount -o remount,rw /system"
adb shell su -c "/system/xbin/busybox mount -o remount,rw /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro /system"
adb shell "busybox mount -o remount,ro /system"
echo.
adb kill-server
adb wait-for-device
adb reboot
echo.
ECHO ****************************************************
ECHO *Now We Are Going To Test Root, Sometimes This Test*
ECHO *  May Hang A Little, Plese Give It A Couple Of    *
ECHO *  Minutes. If There Is No Response Go Into More + *
ECHO *    Security And Toogle ADB Off Then Back On.     *
ECHO ****************************************************
echo.
adb kill-server
adb wait-for-device
type isroot | adb shell | find "#"
if %errorlevel% == 1 goto FIX-FLASHING.2
echo.
ECHO *******************************************************
ECHO *Success!!! You Have Root, This Test Is Very Accurate *
ECHO *Please Do Not Focus On The Errors During This Process*
ECHO *  Since There Will Be Errors. We Are Exploiting The  *
ECHO *        Kindle Fire, Errors Are Expected!            *
ECHO *******************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:FIX-FLASHING.2
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ****************************************************************
ECHO *You Made It Passed Step 2, We Were Able To Exploit The Kindle!*
ECHO *  Although Root Failed. Please Run Option 18 Again, Sometimes *
ECHO * The Process Need To Be Repeated Several Time Before You Will *
ECHO * Successfully Root The Kindle. If This Method Fails More Than *
ECHO * 5 Times Try Option 21 Which Uses A Different Method To Root  *
ECHO *                         The Kindle.                          *
ECHO ****************************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:FIX-FLASHING.3
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *The Option 42 To Fix The Sluggish Kindle And Return *
ECHO *To A Normal Desktop On The Kindle Fire Was Canceled *
ECHO *                  By The User.                      *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:UPGRADE-SU
echo.
cls
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting Option 43. This Option Will   *
ECHO * Perform Two Tasks. One, It Will Check For Root, If It Is*
ECHO *  Not Detected, The Software Will Direct You To Install  *
ECHO *  Root Using Option 21. Once Root Is Installed Then We   *
ECHO * Query Our Servers For The Latest Copy Of Superuser And  *
ECHO * Proceeds To Upgrade The SU Binary And The Superuser APK *
ECHO ***********************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Upgrade Superuser?" UPGRADE-SU.1 UPGRADE-SU.5

:UPGRADE-SU.1
echo.
cd %~dp0
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *     We Are Now Preparing The Kindle To Accept       *
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
echo.
echo.
adb kill-server
adb wait-for-device
echo.
ECHO **************************************************************
ECHO *  We Are Now Installing The Superuser Upgrade And Client    *
ECHO *   During The Install The Kindle Will Look Unusual, Do      *
ECHO *   Not Worry Or Interrupt The Install Process Once The      *
ECHO *                   Install Begins.                          *
ECHO **************************************************************
echo.
echo.
ECHO ******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *   An System Install Without Permission Errors      *
ECHO ******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto UPGRADE-SU.4
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
type isroot | adb shell | find "#"
if %errorlevel% == 1 goto OPTION21.0
echo.
set /p unr=Do You Have Chainfire Superuser (If You Used Our Restore Or Option 21 Root Answer y) (y/n) ?
IF %unr% == n GOTO UPGRADE-SU.3
echo.
CALL:UPGRADE-SU.2

:UPGRADE-SU.2
echo.
COLOR 2
echo.
cls
echo.
ECHO *********************************************************
ECHO *We Are Querying The Our Servers For The Lastest Version*
ECHO * Of Chainfire Superuser. These Items Are Small, The    *
ECHO * Download Speed Should Be Fast. Please Wait.........   *
ECHO *********************************************************
echo.
cd root
REM del \KFFirstAide\su
wget http://dl.dropbox.com/u/54456659/superuser/Chainfire/su
REM del \KFFirstAide\Superuser.apk
wget http://dl.dropbox.com/u/54456659/superuser/Chainfire/Superuser.apk
REM del \KFFirstAide\eu.chainfire.supersu-2.apk
wget http://dl.dropbox.com/u/54456659/superuser/Chainfire/eu.chainfire.supersu-2.apk
echo.
ECHO *************************************************************
ECHO *We Are Done. We Will Now Upgrade Chainfire SU And Superuser*
ECHO *  Please Give Us A Moment To Complete These Tasks, If You  *
ECHO * See Any Errors, Please Post The Screenshot In Our Thread. *
ECHO *************************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push su /data/local/tmp/.
adb push Superuser.apk /data/local/tmp/.
adb shell su -c "rm /system/xbin/su"
adb shell su -c "/system/xbin/busybox mv /data/local/tmp/su /system/xbin/su"
adb shell su -c "rm /system/app/Superuser.apk"
adb shell su -c "/system/xbin/busybox mv /data/local/tmp/Superuser.apk /system/app/Superuser.apk"
adb shell su -c "busybox chown 0.0 /system/xbin/su"
adb shell su -c "busybox chmod 06755 /system/xbin/su"
adb shell su -c "busybox chmod 655 /system/app/Superuser.apk"
adb shell su -c "rm /system/bin/su"
adb shell "ln -s /system/xbin/su /system/bin/su"
adb install -r eu.chainfire.supersu-2.apk
adb install -r suchecker.apk
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "/system/xbin/busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
ECHO *************************************************************
ECHO *That Is It, After The Kindle Reboots You Will Have Two Apps*
ECHO *First Launch SuperSU In Apps To Initialize The Client. Then*
ECHO *  You May Launch Root Checker Basic To Test The Upgrade.   *
ECHO *************************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:UPGRADE-SU.3
echo.
COLOR 2
echo.
cls
echo.
set /p unr=Do You Have ChainsDD Superuser (y/n) ?
IF %unr% == n GOTO UPGRADE-SU.5
echo.
ECHO *********************************************************
ECHO *We Are Querying The Our Servers For The Lastest Version*
ECHO *  Of ChainsDD Superuser. These Items Are Small, The    *
ECHO * Download Speed Should Be Fast. Please Wait.........   *
ECHO *********************************************************
echo.
mkdir root\CHAINSDD 2>nul
cd root\CHAINSDD
REM del \KFFirstAide\su
wget http://dl.dropbox.com/u/54456659/superuser/ChainsDD/su
REM del \KFFirstAide\Superuser.apk
wget http://dl.dropbox.com/u/54456659/superuser/ChainsDD/Superuser.apk
REM del \KFFirstAide\eu.chainfire.supersu-2.apk
wget http://dl.dropbox.com/u/54456659/superuser/ChainsDD/com.noshufou.android.su-1.apk
echo.
ECHO *************************************************************
ECHO *We Are Done. We Will Now Upgrade ChainsDD SU And Superuser *
ECHO *  Please Give Us A Moment To Complete These Tasks, If You  *
ECHO * See Any Errors, Please Post The Screenshot In Our Thread. *
ECHO *************************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push su /data/local/tmp/.
adb push Superuser.apk /data/local/tmp/.
adb shell su -c "rm /system/xbin/su"
adb shell su -c "/system/xbin/busybox mv /data/local/tmp/su /system/xbin/su"
adb shell su -c "rm /system/app/Superuser.apk"
adb shell su -c "/system/xbin/busybox mv /data/local/tmp/Superuser.apk /system/app/Superuser.apk"
adb shell su -c "busybox chown 0.0 /system/xbin/su"
adb shell su -c "busybox chmod 06755 /system/xbin/su"
adb shell su -c "busybox chmod 655 /system/app/Superuser.apk"
adb shell su -c "rm /system/bin/su"
adb shell "ln -s /system/xbin/su /system/bin/su"
adb install -r com.noshufou.android.su-1.apk
cd ..
adb install -r suchecker.apk
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "/system/xbin/busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
echo.
ECHO *************************************************************
ECHO *That Is It, After The Kindle Reboots You Will Have Two Apps*
ECHO * First Launch Superuser In Apps To Initialize The Client.  *
ECHO *Then You May Launch Root Checker Basic To Test The Upgrade.*
ECHO *************************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu


:UPGRADE-SU.4
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:UPGRADE-SU.1

:UPGRADE-SU.5
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *  The Option 43 To Upgrade Superuser On The Kindle  *
ECHO *         Fire Was Canceled By The User.             *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu


:UPGRADE-BUSYBOX
echo.
cls
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting Option 44. This Option Will   *
ECHO *  Install The Latest Version Of Busybox By Querying Our  *
ECHO *    Data Servers For The Latest Version Of Busybox.      *
ECHO ***********************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Upgrade Busybox?" UPGRADE-BUSYBOX.1 UPGRADE-BUSYBOX.2

:UPGRADE-BUSYBOX.1
echo.
cd %~dp0
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *     We Are Now Preparing The Kindle To Accept       *
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
echo.
echo.
adb kill-server
adb wait-for-device
echo.
ECHO **************************************************************
ECHO *   We Are Now Installing The Busybox Upgrade And Client     *
ECHO *   During The Install The Kindle Will Look Unusual, Do      *
ECHO *   Not Worry Or Interrupt The Install Process Once The      *
ECHO *                   Install Begins.                          *
ECHO **************************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *    An System Install Without Permission Errors      *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto UPGRADE-BUSYBOX.4
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
echo.
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *     Please Run This Option Every 90 Days.         *
ECHO *****************************************************
echo.
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:UPGRADE-BUSYBOX.2
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *  The Option 44 To Upgrade Busybox On The Kindle    *
ECHO *         Fire Was Canceled By The User.             *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:UPGRADE-BUSYBOX.4
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:UPGRADE-BUSYBOX.1

:INSTALL-CHAINFIRE
echo.
cls
echo.
ECHO ***********************************************************
ECHO *   Thank You For Selecting Option 45. This Option Will   *
ECHO * Install The Latest Version Of Chainfire By Querying Our *
ECHO *    Data Servers For The Latest Version Of Chainfire.    *
ECHO ***********************************************************
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
echo.
CALL:yesno "Would You Like To Install ChainFire 3D?" INSTALL-CHAINFIRE.1 INSTALL-CHAINFIRE.2

:INSTALL-CHAINFIRE.1
echo.
cd %~dp0
COLOR 2
echo.
cls
echo.
ECHO ************************************************
ECHO * OK Here We Go, We Are Beginning The Process! *
ECHO ************************************************
echo.
ECHO *******************************************************
ECHO *     We Are Now Preparing The Kindle To Accept       *
ECHO *An System Install Without Permission Errors. Please  *
ECHO * Pay Attention To The Kindle For A Superuser Popup   *
ECHO *Request, Be Sure To Click On Allow Or Grant Otherwise*
ECHO *             The Install Will Fail.                  *
ECHO *******************************************************
echo.
echo.
echo.
adb kill-server
adb wait-for-device
echo.
ECHO **************************************************************
ECHO *     We Are Now Installing The  ChainFire 3D Upgrade        *
ECHO *   During The Install The Kindle Will Look Unusual, Do      *
ECHO *   Not Worry Or Interrupt The Install Process Once The      *
ECHO *                   Install Begins.                          *
ECHO **************************************************************
echo.
echo.
ECHO *******************************************************
ECHO *Here We Go, We Are Now Preparing The Kindle To Accept*
ECHO *    An System Install Without Permission Errors      *
ECHO *******************************************************
echo.
adb shell su -c "ls /system/xbin/busybox"
if %errorlevel% == 1 goto INSTALL-CHAINFIRE.4
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "mv /data/local/tmp /data/local/tmp.bak"
adb shell su -c "ln -s /data/ /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO **********************************
ECHO *We Are Now Rebooting The Kindle.*
ECHO **********************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "echo 'ro.kernel.qemu=1' > /data/local.prop"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
ECHO ***********************************************************
ECHO *We Are Rebooting The Kindle. The Kindle Will Look Unusual*
ECHO *          After The Reboot, This Is Normal.              *
ECHO ***********************************************************
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb push Chainfire\eu.chainfire.cf3d-1.apk /data/app/.
adb shell su -c "busybox chmod 0644 /data/app/eu.chainfire.cf3d-1.apk"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"

echo.
ECHO *****************************************************
ECHO *    That Is It, Chainfire Is Now Installed!        *
ECHO *  You Need To Now Open ChainFire App After the     *
ECHO * Reboot And Install The Driver. During The Install *
ECHO * The Kindle Will Appear To Hang, This Is Normal Be *
ECHO *    Patient Let The Driver Install Complete.       *
ECHO *****************************************************
echo.
echo.
ECHO ****************************************************
ECHO *We Are Now Rebooting The Kindle And Restoring The *
ECHO *                   Appearance.                    *
ECHO ****************************************************
echo.
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "rm /data/local.prop"
adb shell su -c "rm -r /data/local/tmp"
adb shell su -c "mv /data/local/tmp.bak /data/local/tmp"
adb shell su -c "mkdir /data/local/tmp"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
echo.
adb reboot
adb kill-server
adb wait-for-device
echo.
cls
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-CHAINFIRE.2
echo.
cls
echo.
echo.
COLOR 2
ECHO ******************************************************
echo *  The Option 44 To Upgrade Busybox On The Kindle    *
ECHO *         Fire Was Canceled By The User.             *
ECHO ******************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu

:INSTALL-CHAINFIRE.4
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ******************************************************
ECHO * It Looks Like Busybox Is Missing, Give Me A Minute *
ECHO *         And We Will Install Busybox.               *
ECHO ******************************************************
echo.
cd root
REM del \KFFirstAide\busybox
REM del \KFFirstAide\Busybox_Installer_4.1.apk
wget http://dl.dropbox.com/u/54456659/busybox/busybox
wget http://dl.dropbox.com/u/54456659/busybox/Busybox_Installer_4.1.apk
adb shell su -c "busybox mount -o remount,rw ext4 /system"
adb shell su -c "mount -o rw,remount /dev/block/mmcblk0p1 /system"
adb shell su -c "mkdir /data/local/tmp"
adb push busybox /data/local/tmp/.
adb shell su -c "busybox chmod 755 /data/local/tmp/busybox"
adb shell su -c "busybox chown 0:0 /data/local/tmp/busybox"
adb shell su -c "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
adb shell su -c "busybox chown root.shell /system/xbin/busybox"
adb shell su -c "busybox chmod 04755 /system/xbin/busybox"
adb shell su -c "/system/xbin/busybox --install -s /system/xbin"
adb shell su -c "busybox chmod 755 /system/xbin/busybox"
adb shell su -c "rm -r /data/local/tmp/busybox"
adb shell su -c "busybox mount -o remount,ro ext4 /system"
adb shell su -c "mount -o ro,remount /dev/block/mmcblk0p1 /system"
adb install Busybox_Installer_4.1.apk
echo.
ECHO *****************************************************
ECHO * That Is It, Busybox Is Now Installed, We Will Now *
ECHO *         Return To The Installation!               *
ECHO *****************************************************
echo.
ECHO *****************************************************
ECHO *  If You See An Error Here, Please Post It In Our  *
ECHO *     Kindle Fire First Aide Thread. Thanks!        *
ECHO *****************************************************
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:INSTALL-CHAINFIRE.1

:OPTION99
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *Please Make Sure ADB Is Enabled On The Kindle By Going To*
ECHO * The Kindle Menu More - Security - Enable ADB  (Turn On) *
ECHO *And You Have The Kindle Plugged In To USB Using A Normal *
ECHO *  USB Cable To The Computer, NOT The Factory USB Cable   *
ECHO ***********************************************************
echo.
PAUSE
echo.
adb kill-server
adb start-server
adb wait-for-device
echo.
ECHO **************************************************
ECHO *   WARNING WARNING WARNING WARNING WARNING!     *
ECHO *This Is A Highly Distructive Option! This Hidden*
ECHO *   Option Is Only To Be Used Under Guidance     *
ECHO * Otherwise Serious Kindle OS Damage WILL Result!*
ECHO **************************************************
echo.
set /p unr=Do You Understand The Serious Risk Involved (y/n) ?
IF %unr% == n GOTO OPTION99.1
echo.
cls
echo.
echo.
adb shell su -c "cd /data/local/tmp/; rm -R *"
echo.
PAUSE
echo.
ECHO ****************************************************
ECHO *We Have Sent The Request To Reset The Kindle, This*
ECHO *  Option Wipes The Entire User Data And Settings  *
ECHO * When The Kindle Reboots You Will See The Broken  *
ECHO * Bootloader Image, Use The Volume Key To Select   *
ECHO *Reboot The Kindle,  Alternatively You May Select  *
ECHO * Restore The Kindle To Factory Defaults. If The   *
ECHO * Kindle No Longer Boots, Perform A Full Restore   *
ECHO ****************************************************
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu


:OPTION99.1
echo.
cls
echo.
echo.
COLOR 2
echo.
ECHO ***********************************************************
ECHO *We Have Canceled The Kindle Fire Hard Reset, We Will Now *
ECHO *             Return To The Main Menu!                    *
ECHO ***********************************************************
echo.
echo.
echo.
PAUSE
echo.
adb kill-server
echo.
CALL:menu


:exit
echo.
cls
COLOR 2
ECHO                     *          *
CALL:sleep 0
ECHO                      *   **   *
CALL:sleep 0
ECHO                      **********
CALL:sleep 0
ECHO                    **************
CALL:sleep 0
ECHO                   ****************
CALL:sleep 0
ECHO                    **************
CALL:sleep 0
ECHO                  ******************
CALL:sleep 0
ECHO              **  ***************** **
CALL:sleep 0
ECHO             **** ***************** ****
CALL:sleep 0
ECHO             **** ***************** ****
CALL:sleep 0
ECHO             **** ***************** ****
CALL:sleep 0
ECHO             **** ***************** ****
CALL:sleep 0
ECHO             **** ***************** ****
CALL:sleep 0
ECHO             **** ***************** ****
CALL:sleep 0
ECHO              *** ***************** ***
CALL:sleep 0
ECHO                  *****************
CALL:sleep 0
ECHO                   ***************
CALL:sleep 0
ECHO                     ****   ****
CALL:sleep 0
ECHO                     ****   ****
CALL:sleep 0
ECHO                     ****   ****
CALL:sleep 0
ECHO                     ****   ****
CALL:sleep 0
ECHO                     ****   ****
PAUSE
CLS
echo.
echo.
COLOR 2
ECHO *******************************************************
CALL:sleep 2
ECHO *Prokennexusa Would Like To Thank You For The Support!*
echo.
CALL:sleep 2
ECHO * If You Found This Utility Valuable,   PLEASE Send A *
echo.
CALL:sleep 2
ECHO *   Donation using PayPal to xerocomm@hotmail.com     *
echo.
CALL:sleep 2
ECHO *Support Is Available Via Email prokennexusa@gmail.com*
CALL:sleep 2
ECHO * This Utility Has Over 10,000 Lines Of Code, Please  *
CALL:sleep 2
ECHO *  Take This Seriously. If You Want This Utility To   *
CALL:sleep 2
ECHO *      Remain Free, Please Donate Today!!!!           *
CALL:sleep 2
ECHO *******************************************************
echo.
CALL:sleep 2
echo.
COLOR 2
CALL:yesno "Are You Sure You Are Done Using The Utility?" OPTION90.1 OPTION90.2

:OPTION90.1
echo.
echo.
EXIT

:OPTION90.2
echo.
echo.
CALL:menu
EXIT

::yesno "Question" yesoption nooption
:yesno
SET INPUT=
SET /P INPUT="%~1[y/n]?"
if /i '%input%'=='y' goto %~2
if /i '%input%'=='n' goto %~3

:sleep
SET /a SLEEP=%~1 -1
IF %SLEEP% GEQ 1 ping -n %SLEEP% -w 1000 1.1.1.1 >nul 2>&1