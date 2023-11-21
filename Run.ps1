$ProjectName = "scintillatest"

$oldpath = $env:PATH
try {
	$env:PATH = "libs;"+$env:PATH
	sbcl --load "$ProjectName.asd" --eval "(ql:quickload :$ProjectName)" --eval "($ProjectName::main)"
} finally {
	$env:PATH = $oldpath
}
