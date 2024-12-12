# Hashcat Kasm Container

A custom KASM workspace container with Hashcat, CUDA support, and the Adj-Noun Wordlist Generator pre-installed.

## Features

- Hashcat with NVIDIA CUDA support
- Pre-installed Adj-Noun Wordlist Generator
- Included rockyou.txt wordlist at `/usr/local/wordlists/rockyou.txt`
- Custom background image

## Using the Adj-Noun Generator

The Adj-Noun Generator is pre-installed and available as `adj` command. It generates wordlists combining adjectives and nouns with optional digits.

### Basic Usage

```bash
# Basic usage (outputs adjective+noun+1digit and adjective+noun+3digits)
adj

# Pipe to hashcat
adj | hashcat -m 22000 hash.hc22000

# Different digit combinations
adj -0  # No digits
adj -1  # 1 digit
adj -2  # 2 digits
adj -3  # 3 digits

# Use expanded wordlist
adj -full