(setq current-language-environment "UTF-8")    ;;�������Ļ���
(setq locale-coding-system 'utf-8)    ;;�������Ļ���
(prefer-coding-system 'utf-8)    ;;���ȶ�ȡָ���ļ�����
(setq default-buffer-file-coding-system 'utf-8)    ;;����������
(setq default-process-coding-system 'utf-8)    ;;��������������
(setq file-name-coding-system 'gb18030)    ;;�ļ�������
(set-w32-system-coding-system 'gb18030)    ;;Windows��ϵͳ����
(set-selection-coding-system 'gb18030)    ;;ѡ������
(set-terminal-coding-system 'utf-8)    ;;�ն˱���
(set-keyboard-coding-system 'utf-8)    ;;�����������
;(set-default-font "Consolas-10")    ;;����Ӣ������

;;####=���������Դ����:=##############################################################
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")    ;;�ٷ�GNUԴ
  ("marmalade" . "http://marmalade-repo.org/packages/")    ;;������MarmaladeԴ
  ("melpa" . "http://melpa.milkbox.net/packages/")))    ;;������MelpaԴ
(package-initialize)

;;####=�Զ���װ�����:=################################################################
(when (not package-archive-contents)
  (package-refresh-contents))    ;;�Զ���ʼ��Դ��װ�б�
(when (not (package-installed-p 'undo-tree))
  (package-install 'undo-tree))    ;;�Զ���װ���������
(when (not (package-installed-p 'yasnippet))
  (package-install 'yasnippet))    ;;�Զ���װYASnippet���ܲ�ȫ����
(when (not (package-installed-p 'js2-mode))
  (package-install 'js2-mode))    ;;�Զ���װJS-IDE���ɿ�������
(when (not (package-installed-p 'auto-complete))
  (package-install 'auto-complete)) 
(when (not (package-installed-p 'color-theme))
  (package-install 'color-theme)) 
(when (not (package-installed-p 'web-mode))
  (package-install 'web-mode)) 

;;####=Ĭ�ϼ��ز������:=##############################################################
(require 'undo-tree)    ;;�򿪷���������
(require 'js2-mode)     ;;��JS-IDE���ɿ�������
(require 'yasnippet)     ;;��YASnippet���ܲ�ȫ����
(require 'auto-complete)    ;;���Զ���ȫģʽ
(require 'auto-complete-config)    ;;���Զ���ȫ����
(require 'color-theme)    ;;���Զ���ȫ����
(require 'web-mode) ;; web mode

;;####=������������:=#################################################################
(semantic-mode t)    ;;�����Դ����ܲ�ȫ���棨����һ������ͷ�ļ�·����
(semantic-add-system-include "C:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/include" 'c++-mode)
(global-semantic-idle-summary-mode t)    ;;����Semantic����ģ��
(global-semantic-show-parser-state-mode t)    ;;����Semantic��ʾ����ǰ����״̬
(setq inhibit-startup-message t)    ;;�ر�Emacs����ʱ�Ļ���
(setq initial-scratch-message nil)    ;;�رն��໺����������
(setq-default cursor-type 'bar)    ;;��ʾϸ�����
(setq pop-up-windows nil)    ;;��ֹ�Զ���������
(setq message-log-max nil)    ;;���"Messages"��������Ϣ
(kill-buffer "*Messages*")    ;;�ر�"Messages"������
(setq ring-bell-function 'ignore)    ;;�ر���ʾ������������
(tool-bar-mode 0)    ;;ȡ��������
(put 'scroll-left 'disabled nil)    ;;��ˮƽ��������
(global-undo-tree-mode)    ;;��������������
(global-font-lock-mode t)    ;;�����﷨����
(show-paren-mode t)    ;;������ƥ����ʾģʽ
(yas-global-mode t)     ;;����YASnippet���ܲ�ȫ����
(global-ede-mode t)    ;;�����Դ�EDEģ��
(ac-config-default)    ;;����ΪĬ��ģʽ���Զ���ȫ��
(setq ac-use-quick-help nil)    ;;�رհ���ģʽ
(setq ac-auto-show-menu 0.1)    ;;������ʱ�����˵�
(setq ac-sources '(ac-source-semantic ac-source-yasnippet))    ;;�����Զ���ȫ�б�
(setq hippie-expand-try-functions-list    ;;�Դ���ȫ�б�
      '(try-expand-dabbrev    ;;��ǰ������ƥ��
        try-expand-dabbrev-visible    ;;�ɼ�������ƥ��
        try-expand-dabbrev-all-buffers))    ;;���л�������ƥ��
(setq show-paren-style 'parenthesis)    ;;����ƥ��ʱ���Ը�����ʾ����һ�ߵ�����
(setq frame-title-format "emacs@%b")    ;;��ʾ�ļ�����
(defalias 'yes-or-no-p 'y-or-n-p)    ;;��дYes/No
(setq mouse-drag-copy-region nil)    ;;��ֹ�������ѡȡ��ͽ�����а�
(setq mouse-yank-at-point t)    ;;ճ���ڹ�괦,���������ָ�봦
(setq-default indent-tabs-mode nil)    ;;����"TAB"�ַ�������, �������ܶ���ֵĴ���
(setq-default tab-width 4)    ;;��������Ϊ4���ַ�
(setq-default c-basic-offset 4)    ;;����C/C++/java����λ��
(setq c-default-style "linux")    ;;���������ţ�������ʽ��
(defun sgml-mode-indent-setup ()
  (setq sgml-basic-offset 4))
(add-hook 'sgml-mode-hook 'sgml-mode-indent-setup)    ;;����HTML����λ��
(defun nxml-mode-indent-setup ()
  (setq nxml-child-indent 4))
(add-hook 'nxml-mode-hook 'nxml-mode-indent-setup)    ;;����XML����λ��
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128 132 136 140
 144 148 152 156 160 164 168 172 176 180 184 188 192 196 200))    ;;�����б�λ
(autoload 'js2-mode "js2" nil t)    ;;�Զ�����JS-IDEģʽ
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))    ;;Ĭ��JS�ļ�����IDEģʽ
(custom-set-faces '(highlight ((((class color) (background light))
  (:background "#fdeded"))))    ;;���������б���ɫ
 '(show-paren-match ((((class color) (background light))
  (:background nil :foreground "#ff0000" :bold t)))))    ;;����ƥ����ɫ����
(set-default 'truncate-lines t)    ;;�ر��Զ����й���
(setq default-directory "D:/")    ;;���ô��ļ���ȱʡ·��
(setq default-major-mode 'text-mode)    ;;��ȱʡ�ı�ģʽ
(mouse-wheel-mode t)    ;;����������
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))    ;;һ�ι���һ��
(setq mouse-wheel-follow-mouse 't)    ;;����������
(setq scroll-step 1
    scroll-conservatively 10000)    ;;ƽ������
(global-hl-line-mode t)    ;;�������������
(cua-mode t)    ;;�򿪣�C-x���У�/��C-c������/��C-vճ�������ܼ�
(put 'mouse-set-point 'CUA 'move)    ;;��������ѡ����
(transient-mark-mode 1)    ;;EmacsWiki����д��
(setq cua-auto-tabify-rectangles nil)    ;;EmacsWiki����д��
(setq column-number-mode t)    ;;��ʾ�к���״̬��
(setq line-number-mode t)    ;;��ʾ�к���״̬��
(global-linum-mode t)    ;;��ʾ�к�
(display-time-mode t)    ;;��ʾʱ��
(setq display-time-24hr-format t)    ;;ʱ��ʹ��24Сʱ��
(ido-mode t)    ;;���ļ��Զ���ȫ
(icomplete-mode t)    ;;���㻺�����Զ���ȫ
(setq make-backup-files nil)    ;;��Ҫ������ʱ�ļ�
(setq isearch-allow-scroll t)    ;;����ʱ�ǿ��Թ�����Ļ��
(setq ibuffer-sorting-mode 'recency)    ;;�������ģʽ��ʾ
(setq whitespace-global-mode t)     ;;ȫ�ּ�����ո�
(setq auto-save-default nil)    ;;�رձ����ļ�
;(setq undo-outer-limit 50000)    ;;��������
(setq gdb-many-windows t)    ;;����GDB�ര�ڵ���ģʽ
(setq compile-command nil)    ;;Ĭ�ϱ����������nil�ĳ�"����"���ɣ�

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

