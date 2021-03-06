Эти сообщения вызваны неправильным значением по умолчанию `core.autocrlf` на Windows.

Концепция `autocrlf` заключается в том, чтобы прозрачно обрабатывать преобразования окончаний строк. И это так!

**Плохая новость** : значение должно быть настроено вручную.  
**Хорошая новость** : это должно быть сделано только ONE раз за установку git (также возможна настройка проекта).

**Как работает** `autocrlf` :

```
core.autocrlf=true:      core.autocrlf=input:     core.autocrlf=false:
                                             
        repo                     repo                     repo
      ^      V                 ^      V                 ^      V
     /        \               /        \               /        \
crlf->lf    lf->crlf     crlf->lf       \             /          \      
   /            \           /            \           /            \
```

Здесь `crlf` \= win-style end-of-line маркер, `lf` \= unix-style (и mac osx).

(pre-osx `cr` in не влияет ни на один из трех вышеперечисленных вариантов)

**Когда появляется это предупреждение (в разделе Windows**)

    – `autocrlf` \= `true` , если у вас есть unix-style `lf` в одном из ваших файлов (= RARELY),  
     – `autocrlf` \= `input` , если у вас есть win-style `crlf` в одном из ваших файлов (=. ALWAYS),  
     – `autocrlf` \= `false` – NEVER!

**Что означает это предупреждение**

Предупреждение " _LF будет заменено на CRLF_ " говорит о том, что вы (имея `autocrlf` \= `true` ) потеряете свой unix-style LF после цикла фиксации(коммита)-проверки (он будет заменен на windows-style CRLF). Git не ожидает, что вы будете использовать unix-style LF под windows.

Предупреждение " _CRLF будет заменено на LF_ " говорит о том, что вы (имея `autocrlf` \= `input` ) потеряете свой windows-style CRLF после цикла фиксации(коммита)-проверки (он будет заменен на unix-style LF). Не используйте `input` под windows.

**Еще один способ показать, как работает** `autocrlf`

```
1) true:             x -> LF -> CRLF
2) input:            x -> LF -> LF
3) false:            x -> x -> x
```

где _x_ \- это либо CRLF (windows-style), либо LF (unix-style), а стрелки обозначают

```
file to commit -> repository -> checked out file
```

**Как исправить**

Значение по умолчанию для `core.autocrlf` выбирается во время установки git и хранится в общесистемном gitconfig ( `%ProgramFiles(x86)%\git\etc\gitconfig` ). также есть (каскадирование в следующем порядке):

   – "global" (для каждого пользователя) gitconfig расположен по адресу `~/.gitconfig`, еще один  
   – "global" (для каждого пользователя) gitconfig в `$XDG_CONFIG_HOME/git/config` или `$HOME/.config/git/config` и  
   – "local" (per-repo) gitconfig at `.git/config` в рабочем реж.

Итак, напишите `git config core.autocrlf` в рабочем каталоге, чтобы проверить текущее используемое значение и

   - добавить `autocrlf=false` в общесистемный gitconfig # решение для каждой системы  
   – `git config --global core.autocrlf false`            # решение для каждого пользователя  
   – `git config --local core.autocrlf false`              # per-project решение

**Предупреждения**  
\- Настройки `git config` могут быть переопределены настройками `gitattributes` .  
\- Преобразование `crlf -> lf` происходит только при добавлении новых файлов, файлы `crlf` , уже существующие в РЕПО, не затрагиваются.

**Мораль** (для Windows):  
    - используйте `core.autocrlf` \= `true` , если вы также планируете использовать этот проект под Unix (и не хотите настраивать свой редактор/IDE на использование окончаний строк unix),  
    - используйте `core.autocrlf` \= `false` , если вы планируете использовать этот проект только под Windows (или вы настроили свой редактор/IDE на использование окончаний строк unix),  
    - _никогда_ не используйте `core.autocrlf` \= `input` , если у вас нет веской причины ( _например_ , если вы используете утилиты unix под windows или если у вас возникли проблемы с makefiles),

П. С. **Что выбрать при установке git для Windows?**  
Если вы не собираетесь использовать ни один из ваших проектов под Unix, _не_ соглашайтесь с первым вариантом по умолчанию. Выберите третий вариант (**Checkout as-is, commit as-is** ). вы не увидите этого сообщения. Когда-либо.

PPS мое личное предпочтение-настроить **редактор / IDE** на использование окончаний в стиле Unix и установить `core.autocrlf` на `false` .