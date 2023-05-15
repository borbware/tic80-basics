for /d %%A in (.\*) do (
	set "except="
	if /i "%%~nxA" == "temp" set "except=1"
	if /i "%%~nxA" == "_site" set "except=1"
	if /i "%%~nxA" == ".jekyll-cache" set "except=1"
	if not defined except (
		for %%j in (%%A\*.md) do (
			marp %%j -o %%~pj%%~nj-slides.html --html true
		)
	)
)
