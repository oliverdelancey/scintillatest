;;;;
;;;; SCINTILLATEST.LISP
;;;;

(in-package #:scintillatest)


(defun main-gui ()
  (iup:with-iup ()
    (iup-scintilla:open)
    (let* ((editor (iup-scintilla:scintilla
                     :visiblelines 20
                     :visiblecolumns 60))
           (vbox (iup:vbox (list editor)
                           :gap "10"
                           :margin "10x10"
                           :alignment :acenter
                           :expandchildren :yes))

           (dialog (iup:dialog vbox :title "Scintilla Test")))
      (setf (iup:handle "editor") editor)

      (setf (iup:attribute-handle nil :parentdialog) dialog)

      (iup:show dialog)

      (setf (iup:attribute editor :clearall) "")
      (setf (iup:attribute editor :lexerlanguage) "cpp")
      (setf (iup:attribute-id editor :keywords 0) "void struct")
      (setf (iup:attribute-id editor :stylefont 32) "Consolas")
      (setf (iup:attribute-id editor :stylefontsize 32) "12")
      (setf (iup:attribute editor :styleclearall) :yes)
      (setf (iup:attribute-id editor :stylefgcolor 1) "0 128 0")
      (setf (iup:attribute-id editor :stylefgcolor 2) "0 128 0")
      (setf (iup:attribute-id editor :stylefgcolor 4) "128 0 0")
      (setf (iup:attribute-id editor :stylefgcolor 5) "0 0 255")
      (setf (iup:attribute-id editor :stylefgcolor 6) "160 20 20")
      (setf (iup:attribute-id editor :stylefgcolor 7) "128 0 0")
      (setf (iup:attribute-id editor :stylefgcolor 9) "0 0 255")
      (setf (iup:attribute-id editor :stylefgcolor 10) "255 0 255")
      (setf (iup:attribute-id editor :stylebold 10) :yes)
      (setf (iup:attribute-id editor :stylehotspot 6) :yes)
      (iup:main-loop)))
  (uiop:quit))

#-sbcl
(defun main () (main-gui))

#+sbcl
(defun main ()
  (sb-int:with-float-traps-masked
    (:divide-by-zero :invalid)
    (main-gui)))

