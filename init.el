(setq current-language-environment "UTF-8")    ;;设置中文环境
(setq locale-coding-system 'utf-8)    ;;设置中文环境
(prefer-coding-system 'utf-8)    ;;优先读取指定文件编码
(setq default-buffer-file-coding-system 'utf-8)    ;;缓冲区编码
(setq default-process-coding-system 'utf-8)    ;;进程输出输入编码
(setq file-name-coding-system 'gb18030)    ;;文件名编码
(set-w32-system-coding-system 'gb18030)    ;;Windows下系统编码
(set-selection-coding-system 'gb18030)    ;;选择块编码
(set-terminal-coding-system 'utf-8)    ;;终端编码
(set-keyboard-coding-system 'utf-8)    ;;键盘输入编码
;(set-default-font "Consolas-10")    ;;设置英文字体

;;####=插件包管理源设置:=##############################################################
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")    ;;官方GNU源
  ("marmalade" . "http://marmalade-repo.org/packages/")    ;;第三方Marmalade源
  ("melpa" . "http://melpa.milkbox.net/packages/")))    ;;第三方Melpa源
(package-initialize)

;;####=自动安装插件包:=################################################################
(when (not package-archive-contents)
  (package-refresh-contents))    ;;自动初始化源安装列表
(when (not (package-installed-p 'undo-tree))
  (package-install 'undo-tree))    ;;自动安装撤销插件包
(when (not (package-installed-p 'yasnippet))
  (package-install 'yasnippet))    ;;自动安装YASnippet智能补全引擎
(when (not (package-installed-p 'js2-mode))
  (package-install 'js2-mode))    ;;自动安装JS-IDE集成开发环境
(when (not (package-installed-p 'auto-complete))
  (package-install 'auto-complete)) 
(when (not (package-installed-p 'color-theme))
  (package-install 'color-theme)) 
(when (not (package-installed-p 'web-mode))
  (package-install 'web-mode)) 

;;####=默认加载插件设置:=##############################################################
(require 'undo-tree)    ;;打开反撤销功能
(require 'js2-mode)     ;;打开JS-IDE集成开发环境
(require 'yasnippet)     ;;打开YASnippet智能补全引擎
(require 'auto-complete)    ;;打开自动补全模式
(require 'auto-complete-config)    ;;打开自动补全配置
(require 'color-theme)    ;;打开自动补全配置
(require 'web-mode) ;; web mode

;;####=工作环境设置:=#################################################################
(semantic-mode t)    ;;开启自带智能补全引擎（下面一行设置头文件路径）
(semantic-add-system-include "C:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/include" 'c++-mode)
(global-semantic-idle-summary-mode t)    ;;加载Semantic辅助模块
(global-semantic-show-parser-state-mode t)    ;;设置Semantic显示出当前解析状态
(setq inhibit-startup-message t)    ;;关闭Emacs启动时的画面
(setq initial-scratch-message nil)    ;;关闭多余缓冲区内文字
(setq-default cursor-type 'bar)    ;;显示细条光标
(setq pop-up-windows nil)    ;;禁止自动弹出窗口
(setq message-log-max nil)    ;;清除"Messages"缓冲区信息
(kill-buffer "*Messages*")    ;;关闭"Messages"缓冲区
(setq ring-bell-function 'ignore)    ;;关闭提示音和闪屏警报
(tool-bar-mode 0)    ;;取消工具栏
(put 'scroll-left 'disabled nil)    ;;打开水平滚屏功能
(global-undo-tree-mode)    ;;开启反撤销功能
(global-font-lock-mode t)    ;;进行语法加亮
(show-paren-mode t)    ;;打开括号匹配显示模式
(yas-global-mode t)     ;;打启YASnippet智能补全引擎
(global-ede-mode t)    ;;开启自带EDE模块
(ac-config-default)    ;;设置为默认模式（自动补全）
(setq ac-use-quick-help nil)    ;;关闭帮助模式
(setq ac-auto-show-menu 0.1)    ;;设置延时跳出菜单
(setq ac-sources '(ac-source-semantic ac-source-yasnippet))    ;;设置自动补全列表
(setq hippie-expand-try-functions-list    ;;自带补全列表
      '(try-expand-dabbrev    ;;当前窗口内匹配
        try-expand-dabbrev-visible    ;;可见窗口内匹配
        try-expand-dabbrev-all-buffers))    ;;所有缓冲区内匹配
(setq show-paren-style 'parenthesis)    ;;括号匹配时可以高亮显示另外一边的括号
(setq frame-title-format "emacs@%b")    ;;显示文件标题
(defalias 'yes-or-no-p 'y-or-n-p)    ;;简写Yes/No
(setq mouse-drag-copy-region nil)    ;;禁止采用鼠标选取后就进入剪切板
(setq mouse-yank-at-point t)    ;;粘贴于光标处,而不是鼠标指针处
(setq-default indent-tabs-mode nil)    ;;不用"TAB"字符来缩进, 这会引起很多奇怪的错误
(setq-default tab-width 4)    ;;设置缩进为4个字符
(setq-default c-basic-offset 4)    ;;设置C/C++/java缩进位数
(setq c-default-style "linux")    ;;不缩进括号（缩进方式）
(defun sgml-mode-indent-setup ()
  (setq sgml-basic-offset 4))
(add-hook 'sgml-mode-hook 'sgml-mode-indent-setup)    ;;设置HTML缩进位数
(defun nxml-mode-indent-setup ()
  (setq nxml-child-indent 4))
(add-hook 'nxml-mode-hook 'nxml-mode-indent-setup)    ;;设置XML缩进位数
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128 132 136 140
 144 148 152 156 160 164 168 172 176 180 184 188 192 196 200))    ;;缩进列表位
(autoload 'js2-mode "js2" nil t)    ;;自动开启JS-IDE模式
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))    ;;默认JS文件进入IDE模式
(custom-set-faces '(highlight ((((class color) (background light))
  (:background "#fdeded"))))    ;;高亮所在行背景色
 '(show-paren-match ((((class color) (background light))
  (:background nil :foreground "#ff0000" :bold t)))))    ;;括号匹配颜色配置
(set-default 'truncate-lines t)    ;;关闭自动换行功能
(setq default-directory "D:/")    ;;设置打开文件的缺省路径
(setq default-major-mode 'text-mode)    ;;打开缺省文本模式
(mouse-wheel-mode t)    ;;开启鼠标滚轮
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))    ;;一次滚动一行
(setq mouse-wheel-follow-mouse 't)    ;;鼠标滚动窗口
(setq scroll-step 1
    scroll-conservatively 10000)    ;;平滑滚动
(global-hl-line-mode t)    ;;高亮光标所在行
(cua-mode t)    ;;打开（C-x剪切）/（C-c拷贝）/（C-v粘贴）功能键
(put 'mouse-set-point 'CUA 'move)    ;;开启鼠标点选功能
(transient-mark-mode 1)    ;;EmacsWiki里面写的
(setq cua-auto-tabify-rectangles nil)    ;;EmacsWiki里面写的
(setq column-number-mode t)    ;;显示列号在状态栏
(setq line-number-mode t)    ;;显示行号在状态栏
(global-linum-mode t)    ;;显示行号
(display-time-mode t)    ;;显示时间
(setq display-time-24hr-format t)    ;;时间使用24小时制
(ido-mode t)    ;;打开文件自动补全
(icomplete-mode t)    ;;迷你缓冲区自动补全
(setq make-backup-files nil)    ;;不要生成临时文件
(setq isearch-allow-scroll t)    ;;查找时是可以滚动屏幕的
(setq ibuffer-sorting-mode 'recency)    ;;用最近打开模式显示
(setq whitespace-global-mode t)     ;;全局检测多余空格
(setq auto-save-default nil)    ;;关闭备份文件
;(setq undo-outer-limit 50000)    ;;撤销限制
(setq gdb-many-windows t)    ;;开启GDB多窗口调试模式
(setq compile-command nil)    ;;默认编译参数（把nil改成"参数"即可）

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)


(color-theme-initialize)
(color-theme-calm-forest)

