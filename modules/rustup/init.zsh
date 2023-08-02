# Source rustup configuration
. "$HOME/.cargo/env"

# Generate completion scripts to a cache folder
_cache_folder="${XDG_CACHE_HOME:-$HOME/.cache}/prezto/rustup"

mkdir -p "$_cache_folder"
fpath+=$_cache_folder

# If those completion files time out after 20 hours, recreate them
if [[ -z $_cache_folder/_rustup(#qNmh-20) ]]; then
  rustup completions zsh rustup >! "$_cache_folder/_rustup"
fi
if [[ -z $_cache_folder/_cargo(#qNmh-20) ]]; then
  rustup completions zsh cargo >! "$_cache_folder/_cargo"
fi

unset _cache_folder
