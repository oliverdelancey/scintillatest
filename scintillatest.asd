(asdf:defsystem "scintillatest"
	:description "IupScintilla test"
	:version "0.0.0"
	:author "Oliver Delancey"
	:license "MIT"
	:depends-on ("iup" "iup-im" "iup-scintilla")
	:serial t
	:components ((:file "package")
                 (:file "scintillatest")))
