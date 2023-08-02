# Rustup

Assuming Rust is installed in [the primary way](https://www.rust-lang.org/learn/get-started), this module configures rustup and its shell completion.

This module must be loaded _before_ the [_`completion`_][13] module so that the
provided completion definitions are loaded automatically by _`completion`_
module.
