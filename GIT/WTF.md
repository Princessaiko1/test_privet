git push -u origin main

не проходит, возможные проблемы:

ssh доступ настроен не правильно.
### 1. Проверить соединение с github.com
`ssh -T username@github.com`
если соединения нету значит ошибка в ключах

#### сгенерировать новый ключ 
	`ssh-keygen -t rsa`
1. запомнить пароль для ключа в **passphrase**
2. запустить `eval $(ssh-agent -s)` или такая команда ` eval 'ssh-agent -s'`  ответ "Agent pid цифры" или такое  SSH_AUTH_SOCK=/tmp/ssh-h705MmHvO5wO/agent.1853; export SSH_AUTH_SOCK;
SSH_AGENT_PID=1854; export SSH_AGENT_PID;
echo Agent pid 1854;
3. обычно путь куда помещаются ключи вот такое: `C:\Users\i7\.ssh`.  Закрытый ключ по умолчанию хранится в `.ssh/id_rsa` , а открытый-в `.ssh/id_rsa.pub` .
4. далее нужно указать **путь** где данные файлы лежат, с помощью команды `ssh-add "C:\User\i7\.ssh\id_rsa"`
5. Так же нужно добавить ключ .pub в панели на github->settings->ssh and gpg keys->создать там новый ключ, вписать данные из файла .pub-> сохранить
6. потом проверить снова связь: `ssh -T username@github.com`
    ответ Permission denied (publickey)
6.  И проверить соединение до github `ssh -vT git@github.com` ответ "Hi Princessaiko1! You've successfully authenticated, but GitHub does not provide shell access."
7.  провереть порт 443 для github, командой
	`ssh -T -p 443 git@ssh.github.com`
	выдать должен следующее
	"Hi Princessaiko1! You've successfully authenticated, but GitHub does not provide shell access."
8. если не делает Push, то сделать следующее
	`git remote set-url origin git@github.com:Princessaiko1/test_privet.git`
	Объяснение [тут](https://stackoverflow.com/questions/17129751/stuck-at-push-nothing-happens)

	
	Инструкции от git hub:
	
	[1# Using SSH over the HTTPS port](https://docs.github.com/en/github/authenticating-to-github/troubleshooting-ssh/using-ssh-over-the-https-port)
	[2# Error: Permission denied (publickey)](https://docs.github.com/en/github/authenticating-to-github/troubleshooting-ssh/error-permission-denied-publickey)
	[3# Managing remote repositories](https://docs.github.com/en/github/getting-started-with-github/getting-started-with-git/managing-remote-repositories)
	[4# About remote repositories](https://docs.github.com/en/github/getting-started-with-github/getting-started-with-git/about-remote-repositories)
	
	Вспомогательная информация
	[коментарий 4](https://stackoverflow.com/questions/26505980/github-permission-denied-ssh-add-agent-has-no-identities)
	[неверный формат](https://coderoad.ru/48328446/id_rsa-pub-%D1%84%D0%B0%D0%B9%D0%BB-SSH-%D0%BE%D1%88%D0%B8%D0%B1%D0%BA%D0%B0-%D0%BD%D0%B5%D0%B2%D0%B5%D1%80%D0%BD%D1%8B%D0%B9-%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%82)
	[дебагер](https://github-debug.com/)
	[что-то](https://stackoverflow.com/questions/2643502/how-to-solve-permission-denied-publickey-error-when-using-git)
	
	
---
### Разница между `git add .` и `git add -A`
**Резюме**:

-   `git add -A` этапы **всех изменений**
    
-   `git add .` этапы создания новых файлов и модификаций **без удаления**
    
-   `git add -u` этапы модификации и удаления, **без новых файлов**
    

**Деталь**:

`git add -A` эквивалентно `git add .; git add -u` .

Важным моментом в `git add .` является то, что он смотрит на рабочее дерево и добавляет все эти пути к поэтапным изменениям, если они либо изменены, либо являются новыми и не игнорируются, он не выполняет никаких действий 'rm'.

`git add -u` просматривает все _уже_ отслеживаемые файлы и поэтапно вносит изменения в эти файлы, если они отличаются или были удалены. Он не добавляет никаких новых файлов, а только вносит изменения в уже отслеживаемые файлы.

`git add -A` \-это удобный ярлык для выполнения обоих этих действий.




---
Тест проверка работы скрипта