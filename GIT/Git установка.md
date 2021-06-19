Git - 

если поп простому: программа которая помогает вам отслеживать изменения в файлах

# тут нужно описать что такое git на примерах, в виде картинок и как он работает

## Установка

По данной [ссылке](http://git-scm.com/book/ru/v2/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5-%D0%9F%D0%B5%D1%80%D0%B2%D0%BE%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-Git)

Есть большая и подробная инструкция как устанавливать и работать с git.
Я обращаю ваше внимание на _самые основные компоненты_, которые касаются непосредственно работы с git. Так как наша цель настроить синхронизацию между git и obsidian.

И так

Скачать git можно с [офф сайта](http://git-scm.com/downloads)

В буке по git, говорят что можете качать оригинал через командную строку, а можете скачать программу готовой. Разница есть и заключается в следующем:
>Многие предпочитают устанавливать Git из исходников, поскольку такой способ позволяет получить самую свежую версию. Обновление бинарных инсталляторов, как правило, немного отстаёт, хотя в последнее время разница не столь существенна.

Так же придется ставить ручками библиотеки от которых зависит git, [подробнее тут](http://git-scm.com/book/ru/v2/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5-%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-Git) 

В нашем случае я ставлю просто версию с графическим интерфейсом(GUI).
- Скачали
- устанавливаем
- выбираем путь гду будет храниться установленная программа
- выбираем редактор, который будет по умолчанию работать в git. Для тех кто умеет читать по английски, читайте. Умный git при выборе редактора подсказывает, что нормально, что нет, что бесплатно, а что нужно установить отдельно. Для каждого редактора там свое описание. К примеру я выбрала редактор Atom, так как хочу изучить что-то новое. Для это я, отменила установку git, скачала отдельно редактор [Atom](https://atom.io/), установила его, запустила заново установку git, и выбрала редактор Atom из списка, кнопка **Next**
- Далее нас спрашивают "_Как бы вы хотели, чтобы Git назвал начальную ветвь после "git init"?_". Выбираем пункт второй, где мы сами выбираем название по умолчанию. Переопределить имя ветви по умолчанию. **Для чего и зачем?** master Это теперь main?
- далле выбираем второй пункт, то что рекомендует git. Так как данный вариант дает вам использовать как командную строку от GIT, так и сторонние приложения и windows power shell
- теперь, нужно выбрать пункт 2:
	1. Use the OpenSSL Library - OpenSSL - сертификаты сервера будут проверяться с использованием Unix-файла ca-bundle.crt.
	2. Use the native Windows Secure Channel library - выбираем "Использовать собственную библиотеку безопасных каналов Windows". Это особенно полезно, если вы новичок или разработчик и, возможно, не знаете, как работает SSH. 
- Убедитесь, что вы выбрали способ обработки окончания строк «Checkout Windows-style, commit Unix-style line endings». Это значение гарантирует, что Git преобразует [LF в CRLF](https://coderoad.ru/1967370/git-%D0%B7%D0%B0%D0%BC%D0%B5%D0%BD%D0%B0-LF-%D0%BD%D0%B0-CRLF) при проверке текстовых файлов. При выполнении текстовых файлов CRLF также преобразуется в LF. Это мера совместимости для защиты новых строк в текстовых файлах, что позволяет легко работать с текстовыми файлами в Windows и на платформах Unix.
- Далее необходимо сконфигурировать используемый терминал:
	- MinTTY - терминал Unix;
	- Windows - стандартный терминал Windows.
	Для настройки эмулятора терминала для использования с Git Bash выберите Use MinTTY.
- по default git push
- выбираем пункт 1, [подробнее](https://git-scm.com/book/ru/v2/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D1%8B-Git-%D0%A5%D1%80%D0%B0%D0%BD%D0%B8%D0%BB%D0%B8%D1%89%D0%B5-%D1%83%D1%87%D1%91%D1%82%D0%BD%D1%8B%D1%85-%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85)
- Отметьте галочками нужные вам дополнительные функции:
	-   File system caching - кэширование файловой системы. Это!
	-   Symbolic links - разрешить символьные ссылки.

лист конфигурации
`git config --list`

удалить директорию
`rm -rf .git/`


дело в [ssh доступе как кажется](https://careerkarma.com/blog/git-fatal-could-not-read-from-remote-repository/)
вот [тут](https://stackoverflow.com/questions/2643502/how-to-solve-permission-denied-publickey-error-when-using-git) как ставить *rsa* ключи, генерация и установка для ssh


удалить папку .git
git init
git 
git add namefile
git commit -m "message Here"
git push -u origin main


## Решение: залезла в инструкции и стала читать и разбираться в базовых понятиях

Есть отладчик [дебагер](https://github-debug.com/)

1. Проверить верное ли соединение с github? объясняют [тут](# Error: Permission denied (publickey))
2. проверить верность доступов к удаленным репозиториям [тут](https://docs.github.com/en/github/getting-started-with-github/getting-started-with-git/managing-remote-repositories)
3. прочитать о самих удаленных репозиториях, [тут](https://docs.github.com/en/github/getting-started-with-github/getting-started-with-git/about-remote-repositories)


проблема была еще в ssh-agent

## убрать лишнии процессы ssh-agent
**_This results in 1 Windows 'ssh-agent' process being created every single time you run these commands (notice the new PID every time you enter those commands?)_**

So, `Ctrl`+`Alt`+`Del` and hit `End Process` to stop each '**ssh-agent.exe**' process.

Now that all the messed up stuff from the failed attempts is cleaned up, I will tell you how to get it working...

## In '**Git Bash**':

Start the '**ssh-agent.exe**' process

```
eval $(ssh-agent -s)
```

And install the SSH keys

```
ssh-add "C:\Users\MyName\.ssh\id_rsa"
```

**\* Adjust the path above with your username, and make sure that the location of the\*** **/.ssh** **_directory is in the correct place. I think you choose this location during the Git installation? Maybe not..._**

The part I was doing wrong before I figured this out was I was not using quotes around the '**ssh-add**' location. The above is how it needs to be entered on Windows.

# ! Закрытый ключ по умолчанию хранится в `.ssh/id_rsa` , а открытый-в `.ssh/id_rsa.pub`


push 