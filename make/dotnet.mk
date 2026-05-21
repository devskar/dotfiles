.PHONY: dn-run dn-test dn-build dn-watch dn-format

_fzf_exe   = rg -l '<OutputType>Exe</OutputType>' -g '*.csproj' | fzf -1
_fzf_test  = rg -l '<OutputType>Exe</OutputType>' -g '*Tests.csproj' -g '*Test.csproj' | fzf -1

dn-run:
	PROJ=$$( $(_fzf_exe) ); \
	if [ -z "$$PROJ" ]; then echo "No executable projects found" >&2; else dotnet run --project "$$PROJ"; fi

dn-test:
	PROJ=$$( $(_fzf_test) ); \
	if [ -z "$$PROJ" ]; then echo "No test projects found" >&2; else dotnet test "$$PROJ"; fi

dn-build:
	dotnet build

dn-watch:
	PROJ=$$( $(_fzf_exe) ); \
	if [ -z "$$PROJ" ]; then echo "No executable projects found" >&2; else dotnet watch run --project "$$PROJ"; fi

dn-format:
	dotnet format
