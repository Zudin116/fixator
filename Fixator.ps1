Write-Host 'Добро пожаловать в программу контороля целостности "Фиксатор"' 
$proj = Read-Host "Введите название проекта"
$dir = $($MyInvocation.MyCommand.Path | Split-Path -Parent)
Write-Host "Выберете ПО для контроля:"
Write-Host "1 - Secret Net Studio - C (Версия 8.2.1156)"
Write-host "2 - Kaspersky"
$a = Read-Host "1-2"
if ($a -eq 1) {& $dir\Isx_Sost.exe "#1" "&f1=$dir\lists\sns82-c.tre &f2=$dir\$proj &u1 &beep"}
elseif ($a -eq 2) {& $dir\Isx_Sost.exe "#1" "&f1=C:\Program Files (x86)\Kaspersky Lab\ &f2=$dir\$proj &u4 &beep &filtr=*.exe;*.dll;*.ppl;*.sys"}
else {Write-Host "Некорректное значение"}
Write-Host "Работа программы завершена."
Read-Host "Нажмите Enter для выхода"