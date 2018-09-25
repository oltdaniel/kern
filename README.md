# kern :beer:

a computer kern

## About

This project is about creating a kernel. Goals during the development are
documentation, usability for developers of the kernel and gaining proximity to
the hardware.

###### NOTE: This project will not use any kind of UEFI functionalities

## Compile

```shell
# Get the code
$ git clone https://github.com/oltdaniel/kern
$ cd kern
# Compile the kern
$ make
# Build an image
$ make image
```

Requirements:
- `grub`, `grub-pc-bin` _(`kern` will boot with grub)_

Requirements (_Linux defaults_):
- `as` _(compile `kern`'s assembly parts)_
- `dd` _(burn image to disk)_

## Resources

- [A minimal Multiboot Kernel](https://os.phil-opp.com/multiboot-kernel)
- [GNU Assembler](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.32.4503&rep=rep1&type=pdf)

## License

_Just do what you'd like to_

[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/oltdaniel/kern/blob/master/LICENSE)

#### Credit

[Daniel Oltmanns](https://github.com/oltdaniel) - creator
