# Research in Chaotic Systems for Cryptography

### Project Overview

This repository contains the research, simulation scripts, and findings from my work investigating the application of chaotic systems in symmetric-key cryptography. This is a theoretical and simulation-based project conducted as part of a formal summer research program at the Universidad de Guadalajara.

---

### Research Context & Objective

This research was conducted under the supervision of **Dr. Rider Jaimes Reategui (SNII Level 3)**, a top-tier national researcher in Mexico.

The primary objective is to analyze the mathematical properties of various chaotic systems (e.g., Lorenz, Rössler attractors) to evaluate their suitability, security, and efficiency for cryptographic applications, specifically in pseudo-random number generation (PRNG) and image encryption.

### Methodology

The process involved a three-phased approach:

1.  **Literature Review:** Synthesized and analyzed over 30+ academic papers to identify existing models, key vulnerabilities, and opportunities in chaotic encryption.
2.  **Mathematical Modeling:** Modeled the properties of chaotic attractors to determine their key-space, sensitivity to initial conditions (the "butterfly effect"), and entropy.
3.  **Simulation & Analysis:** Used MATLAB to run simulations, testing the statistical randomness of generated sequences against the **NIST statistical test suite**.

### Key Findings & Status

This is an ongoing theoretical investigation. Key findings to date include:

* A comparative analysis of the trade-offs between the complexity of chaotic systems and their cryptographic security.
* An evaluation of the key-space and sensitivity of several common chaotic maps, identifying potential weaknesses in simple implementations.
* The development of a theoretical framework for a hybrid algorithm that combines traditional ciphers with a chaotic map to enhance key sensitivity.

Findings were formally presented at the university's **"Feria de la Ciencia" (Science Fair)**.

---

### Tech Stack

* **Core Tool:** MATLAB (for simulation, modeling, and statistical analysis)
* **Control/Dynamic Systems:** Simulink
* **Documentation:** LaTeX (for formal report writing)

### Repository Contents

* `/simulations`: Contains all MATLAB `.m` files used to model chaotic attractors and run statistical tests.
* `/documentation`: Includes the final research report and presentation slides (in PDF format) from the "Feria de la Ciencia".
