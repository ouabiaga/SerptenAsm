# SerptenAsm
# AsmHelpers - x86_64 Linux Assembly Utility Macros

A lightweight and practical NASM macro library designed to **make writing x86_64 Linux assembly code easier and faster**. It wraps repetitive system calls into simple, single-line macros so you can focus on logic rather than boilerplate setup.

## 🚀 Features

*   **Easy I/O:** Print text and get user input with single-line commands.
*   **Simplified File Actions:** Create, write, append, read, and delete files instantly.
*   **Quick Directory Control:** Create, remove, or check the existence of paths.
*   **Register Safety:** Built around standard x86_64 Linux calling conventions.

---

## 📂 Macro Reference & Usage

### 1. Basic Input / Output
*   `write_host buffer, length`: Easily prints text to the screen.
*   `read_host buffer, max_length`: Reads text input from the keyboard.
*   `exit_program`: Safely terminates the program execution.

### 2. File Processing
*   `make_file filename`: Creates a new empty file.
*   `write_file filename, buffer, length`: Opens/creates a file, writes data, and closes it.
*   `apend_file filename, buffer, length`: Appends data to the end of a file without erasing it.
*   `read_file filename, buffer, length`: Reads data from a file into a memory buffer.
*   `delete_file filename`: Deletes a file from the disk.

### 3. Directory Management
*   `create_folder foldername`: Creates a new folder.
*   `delete_folder foldername`: Deletes an empty folder.
*   `Check_file path`: Checks if a file or folder exists. Returns `0` in `RAX` if it exists.

---

## 💻 Quick Start Example

Include the library at the top of your main assembly file to start using the macros:

```nasm
%include "libasm.inc"

section .data
    filename db "my_file.txt", 0
    text     db "Writing assembly made easy!", 10
    text_len equ \$ - text

section .text
    global _start

_start:
    ; Easily write text into a file
    write_file filename, text, text_len

    ; Exit program smoothly
    exit_program
```

## 🛠️ How to Compile and Run

To assemble and link your project using **NASM** on 64-bit Linux:

```bash
# Assemble the source code
nasm -f elf64 main.asm -o main.o

# Link the object file
ld main.o -o main.out

# Run the executable
./main.out
```

## 📄 License
This project is open-source and available under the **MIT License**.
