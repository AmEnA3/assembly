# Binary to Hexadecimal Converter

This project is an **8086 Assembly Language Program** that converts an **8-bit binary number** into **hexadecimal**.

## How It Works
- The program prompts the user to enter an **8-bit binary number** (e.g., `11001100`).
- It then converts the binary input into **hexadecimal representation** (e.g., `CC`).
- The output is displayed on the screen.

## Prerequisites
To run this program, you need an **8086 emulator** or an assembler like:
- [EMU8086](http://www.emu8086.com/)
- [DOSBox](https://www.dosbox.com/) + MASM/TASM
- NASM + DOSBox (for some modifications)

## Usage
1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/Bin2Hex.git
   cd Bin2Hex
   ```
2. Assemble the program (if using MASM):
   ```sh
   masm bin2hex.asm;
   link bin2hex.obj;
   ```
3. Run the executable:
   ```sh
   bin2hex.exe
   ```
4. Enter an **8-bit binary number**, press **Enter**, and see the hexadecimal output.

## Example Run
```
Enter 8-bit binary: 11001100
Hex: CC
```

## File Structure
```
📂 Bin2Hex
   ├── bin2hex.asm   # Assembly source code
   ├── README.md      # Project documentation
   └── LICENSE        # (Optional) License file
```

## License
This project is licensed under the MIT License. Feel free to modify and distribute!

## Contributing
Pull requests are welcome! If you find any issues, feel free to open an issue in this repository.

## Author
[VANDAL](https://github.com/AmEnA3)

