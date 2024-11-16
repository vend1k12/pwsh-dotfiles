# PowerShell Dotfiles Configuration

Этот конфигурационный файл PowerShell настроен для удобства личной работы:

# ВАЖНО!

- **Шрифты**: Учтите, что вам понадобится установка NerdFonts(выбирайте на свой вкус и цвет), а так же настройка их в вашем терминале. Вся подробная информация будет указана на сайте oh-my-posh

## Особенности конфигурации

- **Тема**: Использует `oh-my-posh` для настройки темы PowerShell. В моём случае используется тема `catppuccin_macchiato`.
- **Иконки**: Инициализирует модуль `Terminal-Icons` для отображения иконок в терминале.
- **Автодополнение**: Настроено автодополнение команд с помощью модуля `PSReadLine`, включая отображение подсказок и управление историей команд.
- **Удобный ls**: Используется инструмент eza(exa на некоторых системах) для более красивого и приятного вывода директорий(замена ls)
- **Навигация**: Для комфортного передвижения между директорий используется zoxide в связке с zfz
- **Алиасы**:

  - `l`: Показывает длинный список файлов с иконками (`eza -lh --icons=auto`).
  - `ls`: Показывает короткий список файлов с иконками (`eza -1 --icons=auto`).
  - `ll`: Показывает длинный список всех файлов с иконками, отсортированных по имени и с группировкой директорий (`eza -lha --icons=auto --sort=name --group-directories-first`).
  - `ld`: Показывает длинный список директорий с иконками (`eza -lhD --icons=auto`).
  - `lt`: Показывает содержимое директорий в виде дерева с иконками (`eza --icons=auto --tree`).
  - `p`: Ссылается на команду `pnpm`.
  - `g`: Ссылается на команду `git`.
  - `y`: Ссылается на команду `yarn`.
  - `c`: Ссылается на команду `clear`.
  - `vc`: Ссылается на команду `code` (Visual Studio Code).

- **Функция для вывода рандомного покемона**: — выводит рандомного покемона при запуске PowerShell. Чтобы отключить эту функцию, удалите или закомментируйте строку `krabby random --no-title`.

  Если вы хотите установить `krabby` и нуждаетесь в дополнительной инструкции, посетите [официальную страницу](https://github.com/yannjor/krabby?tab=readme-ov-file#installing-from-source-other-distros-and-macoswindows) для получения инструкций по установке. Обратите внимание, что для этого требуется [Visual C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/) и язык [Rust](https://www.rust-lang.org/learn/get-started).

## Установка зависимостей

1. **oh-my-posh**: Установите `oh-my-posh` через [официальный сайт](https://ohmyposh.dev/docs/installation/windows) или через команду `winget install JanDeDobbeleer.OhMyPosh`.

2. **Terminal-Icons**: Установите модуль `Terminal-Icons` через PowerShell:

   ```powershell
   Install-Module -Name Terminal-Icons -Scope CurrentUser
   ```

- **PSReadLine**: Установите модуль PSReadLine через PowerShell:

  ```powershell
  Install-Module -Name PSReadLine -Scope CurrentUser
  ```

- **eza**: Установите утилиту eza с помощью пакетного менеджера Scoop:

  ```bash
  scoop install eza
  ```

- **zoxide**: Установите zoxide через Scoop:

  ```bash
  scoop install zoxide
  ```

- **fzf**: Установите fzf через Scoop:

  ```bash
  scoop install fzf
  ```

- **krabby**: Установите krabby через Cargo:

  ```bash
  cargo install krabby
  ```

Если у вас нет Cargo, вы можете установить его вместе с Rust, следуя [инструкциям](https://www.rust-lang.org/learn/get-started).

## Рекомендация

1. **Отключение приветствия PowerShell**: Неважно, будете ли вы оставлять отображение покемонов или же нет, но я советую отключить это мешающее сообщение PowerShell. Вам нужно перейти по пути и открыть файл через удобный редактор `C:\Users\ВАШ_ПОЛЬЗОВАТЕЛЬ\AppData\Local\Packages\Microsoft.WindowsTerminal_(ваша_версия_powershell)\LocalState\settings.json`. Среди профилей найдите профиль с вашим powershell и измените поле `commandline`

```json
"commandline": "%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -nologo"
```
