# Simple Arithmetic Expression Parser in Haskell

This project implements a basic arithmetic expression parser and evaluator using a recursive descent approach.

It supports:

- Single-digit integers
- Addition (`+`)
- Multiplication (`*`)
- Parentheses `(` `)` for grouping
- Operator precedence (`*` binds tighter than `+`)

## 📦 Project Structure

- `src/Main.hs` — contains the parser and evaluator logic
- `Main.main` runs test cases and prints results

## 🚀 Running the Project

Make sure you have [Stack](https://docs.haskellstack.org/en/stable/README/) installed.

```bash
stack run
```

This will compile and run the project, showing results of several example expressions.

### 🧪 Example Expressions

2+3*4         => 14
(1+2)*3       => 9
3*(1+2+4)     => 21
📚 How It Works

The parser uses three mutually recursive functions:

expr handles addition
term handles multiplication
factor handles digits and parentheses
This structure enforces correct operator precedence naturally.

### ✅ Next Steps (Ideas)

Add subtraction and division
Handle multi-digit numbers, and handle whitespace
Remove unsafe use of head and tail
Tokenizer
Parser Monad/Combinator
Add error messages or AST building
