;;; lab-themes.el --- A custom theme carefully constructed in the LAB space

;; Copyright (C) 2018 MetroWind.

;; This program is free software. It comes without any warranty, to
;; the extent permitted by applicable law. You can redistribute it
;; and/or modify it under the terms of the Do What the Fuck You Want
;; to Public License, Version 2, as published by Sam Hocevar. See
;; http://www.wtfpl.net/ for more details.

;; Author: MetroWind <chris.corsair@gmail.com>
;; URL: https://github.com/MetroWind/lab-theme
;; Keywords: lisp
;; Version: 1.0
;; Package-Requires: ((emacs "24"))

;;; Commentary:
;;
;; A carefully constructed color theme for max labbiness! The name
;; comes from the fact that I acquired these colors by fiddling in the
;; LAB color space.
;;
;; See https://github.com/MetroWind/lab-theme for installation and
;; more.

;;; Code:

(defvar lab-themes-current-style nil)

;;;###autoload
(add-to-list 'custom-theme-load-path
             (file-name-directory load-file-name))

;;;###autoload
(defun lab-themes-load-style (style)
  "Load Lab theme variant STYLE.
Argument STYLE can be either 'light or 'dark."

  (interactive)
  (cond ((equal style 'light)
         (load-theme 'lab-light t))
        ((equal style 'dark)
         (load-theme 'lab-dark t))

        (t (error (format "Unknown Lab theme style: %S" style)))))

;;;###autoload
(defun lab-themes-switch-style ()
  "Toggle between the light and dark style of Lab theme."
  (interactive)
  (cond ((or (null lab-themes-current-style)
             (equal lab-themes-current-style 'dark))
         (lab-themes-load-style 'light)
         (setq lab-themes-current-style 'light))
        ((equal lab-themes-current-style 'light)
         (lab-themes-load-style 'dark)
         (setq lab-themes-current-style 'dark))
        (t (error (format "Invalid Lab theme current style: %S"
                          lab-themes-current-style)))))

(provide 'lab-themes)

;;; lab-themes.el ends here
