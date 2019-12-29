adb shell run-as com.example.account_book cp /data/data/com.example.account_book/app_flutter/account_book.db /sdcard/
adb shell run-as com.example.account_book cp /data/data/com.example.account_book/app_flutter/account_book.db-shm /sdcard/
adb shell run-as com.example.account_book cp /data/data/com.example.account_book/app_flutter/account_book.db-wal /sdcard/

adb pull /sdcard/account_book.db db
adb pull /sdcard/account_book.db-shm db
adb pull /sdcard/account_book.db-wal db