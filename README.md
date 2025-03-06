# Binary to Hexadecimal Converter

This repository contains **three 8086 Assembly Language Programs** that perform different conversions:
1. **Binary to Decimal Converter**
2. **Binary to Hexadecimal Converter**
3. **8-bit Binary to Hexadecimal Converter**

## How They Work
### 1. Binary to Decimal Converter
- The program prompts the user to enter a **binary number**.
- It then converts the binary input into **decimal representation**.
- The output is displayed on the screen.

### 2. Binary to Hexadecimal Converter
- The program prompts the user to enter an **8-bit binary number** (e.g., `11001100`).
- It then converts the binary input into **hexadecimal representation** (e.g., `CC`).
- The output is displayed on the screen.

### 3. 8-bit Binary to Hexadecimal Converter
- Similar to the previous converter but optimized for **two hex digits**.
- The most significant nibble is printed first, ensuring correct hexadecimal output.

## Prerequisites
To run these programs, you need an **8086 emulator** or an assembler like:
- [EMU8086](http://www.emu8086.com/)
- [DOSBox](https://www.dosbox.com/) + MASM/TASM
- NASM + DOSBox (for some modifications)

## Usage
1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/BinConverters.git
   cd BinConverters
   ```
2. Assemble and run any of the programs:
   ```sh
   masm bin2dec.asm;
   link bin2dec.obj;
   bin2dec.exe
   ```
   ```sh
   masm bin2hex.asm;
   link bin2hex.obj;
   bin2hex.exe
   ```
3. Enter a **binary number**, press **Enter**, and see the respective output.

## Example Runs
### Binary to Decimal
```
Enter binary: 1101
Decimal: 13
```

### Binary to Hexadecimal
```
Enter 8-bit binary: 11001100
Hex: CC
```

## File Structure
```
📂 Converters
   ├── bin2dec.asm   # Binary to Decimal converter
   ├── bin2hex.asm   # Binary to Hexadecimal converter
   ├── hex2bin.asm  # 8-bit Binary to Hexadecimal converter
   ├── README.md      # Project documentation
   └── LICENSE        # (Optional) License file
```

## License
This project is licensed under the MIT License. Feel free to modify and distribute!

## Contributing
Pull requests are welcome! If you find any issues, feel free to open an issue in this repository.

## Author
[VANDAL](https://github.com/AmEnA3)

