# JSasta Extension for Zed Editor

This is a Zed extension that provides language support for JSasta (`.jsa` files).

## Features

- Syntax highlighting for JSasta keywords (`struct`, `external`, etc.)
- Support for all built-in types (`int`, `double`, `string`, `bool`, `void`)
- Highlighting for:
  - Keywords and control flow
  - Function and struct declarations
  - Type annotations
  - Operators and punctuation
  - String and number literals
  - Comments (single-line `//` and multi-line `/* */`)
  - Variadic parameters (`...`)

## Installation

### Prerequisites

You must have Rust installed via `rustup` for Zed to compile the extension:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Method 1: Install as Dev Extension (Recommended for Development)

1. Open Zed
2. Press `cmd-shift-p` (macOS) or `ctrl-shift-p` (Linux/Windows)
3. Type "zed: extensions" and select it
4. Click "Install Dev Extension"
5. Navigate to and select the `editors/zed` directory in this repository
6. The extension will be compiled and installed automatically

### Method 2: Install from Directory

You can also install by cloning this repository and using the Zed extensions API:

```bash
# Clone the repository if you haven't already
git clone https://github.com/dimitarnanov/JSasta.git
cd JSasta/editors/zed

# Open Zed and install as dev extension from this directory
```

## Usage

Once installed, Zed will automatically recognize `.jsa` files and apply JSasta syntax highlighting.

## Customization

You can customize the highlighting by editing:
- `languages/jsasta/config.toml` - Language configuration (file extensions, brackets, comments)
- `languages/jsasta/highlights.scm` - Syntax highlighting rules (tree-sitter queries)

## Example

```jsasta
external printf(string, ...):int;

struct Point {
    x: int;
    y: int;
}

struct Vector {
    x: int = 0;
    y: int = 0;
    z: int = 0;
}

function main(): int {
    var p: Point = { x: 10, y: 20 };
    var v: Vector = { x: 5 };
    
    printf("Point: (%d, %d)\n", p.x, p.y);
    printf("Vector: (%d, %d, %d)\n", v.x, v.y, v.z);
    
    return 0;
}
```

## Supported JSasta Features

### Keywords
- `var`, `let`, `const` - Variable declarations
- `function`, `external` - Function declarations
- `struct` - Type definitions
- `if`, `else`, `for`, `while`, `return` - Control flow

### Types
- `int`, `double`, `string`, `bool`, `void`

### Operators
- Arithmetic: `+`, `-`, `*`, `/`, `%`
- Comparison: `==`, `!=`, `<`, `>`, `<=`, `>=`
- Logical: `&&`, `||`, `!`
- Bitwise: `&`, `|`, `^`, `<<`, `>>`
- Assignment: `=`, `+=`, `-=`, `*=`, `/=`
- Increment/Decrement: `++`, `--`

### Special
- Type annotations: `:type`
- Variadic parameters: `...`
- Default values: `property: type = value`

## Troubleshooting

### Extension not compiling

1. Make sure Rust is installed via `rustup`:
   ```bash
   rustup --version
   ```

2. If you have Rust from homebrew or another source, uninstall it and use `rustup` instead

### Highlighting not working

1. Check that the extension is installed:
   - Open Zed
   - Press `cmd-shift-p` / `ctrl-shift-p`
   - Type "zed: extensions"
   - Look for "JSasta" in the installed extensions

2. Check Zed's logs:
   - Press `cmd-shift-p` / `ctrl-shift-p`
   - Type "zed: open log"
   - Look for any errors related to JSasta

3. Restart Zed completely

### File not recognized as JSasta

Make sure your file has the `.jsa` extension. You can also manually set the language:
1. Open the file in Zed
2. Click on the language indicator in the status bar
3. Select "JSasta"

## Contributing

If you find issues or want to improve the syntax highlighting:
1. Edit the files in this directory
2. Test with various JSasta code examples
3. Submit your improvements

## Development

To work on this extension:

1. Make changes to the extension files
2. Rebuild by toggling the extension off and on in Zed's extensions panel, or restart Zed
3. Check `zed: open log` for any compilation or runtime errors

### Extension Structure

- `extension.toml` - Extension metadata and grammar references
- `Cargo.toml` - Rust package configuration
- `src/lib.rs` - Extension implementation (currently minimal)
- `languages/jsasta/config.toml` - Language configuration
- `languages/jsasta/highlights.scm` - Syntax highlighting rules
- `LICENSE` - MIT license (required by Zed)

## Notes

- This extension uses JavaScript's tree-sitter grammar as a base since JSasta syntax is JavaScript-like
- Some advanced JSasta features may not be perfectly highlighted until we create a custom tree-sitter grammar
- The highlighting will evolve as the JSasta language grows
- A language server implementation can be added to `src/lib.rs` in the future for features like autocomplete and go-to-definition
