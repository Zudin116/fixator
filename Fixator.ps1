Write-Host 'Добро пожаловать в программу контороля целостности "Фиксатор"' 
$proj = Read-Host "Введите название проекта"
$dir = $($MyInvocation.MyCommand.Path | Split-Path -Parent)
Write-Host "Выберете ПО для контроля:"
Write-Host "1 - Secret Net Studio - C (Версия 8.2.1156)"
Write-host "2 - Kaspersky"
Write-host "3 - Dallas Lock 8.0 C (Версия 485.12) ФИКС 2.0.2"
Write-host "4 - Dallas Lock 8.0 C (Версия 485.12) Трафарет 2.0"
$a = Read-Host "1-4"
if ($a -eq 1) {& $dir\Isx_Sost.exe "#1" "&f1=$dir\lists\sns82-c.tre &f2=$dir\$proj &u1 &beep"}
elseif ($a -eq 2) {& $dir\Isx_Sost.exe "#1" "&f1=C:\Program Files (x86)\Kaspersky Lab\ &f2=$dir\$proj &u4 &beep &filtr=*.exe;*.dll;*.ppl;*.sys"}
elseif ($a -eq 3) {& $dir\Isx_Sost.exe "#1" "&f1=$dir\lists\DL8048512.tre &f2=$dir\$proj &u3 &beep"}
elseif ($a -eq 4) {& md $proj
    & $dir\trafaret2.exe -c $dir\lists\DL8048512.tre > $dir\$proj\$proj.txt}
else {Write-Host "Некорректное значение"}
Write-Host "Работа программы завершена."
Read-Host "Нажмите Enter для выхода"