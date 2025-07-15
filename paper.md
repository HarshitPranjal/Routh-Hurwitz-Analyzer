title: "Routh-Hurwitz Stability Analyzer: A MATLAB App for Symbolic and Numeric Evaluation of LTI Systems"
authors:
  - name: Harshit Pranjal
    orcid: https://orcid.org/0009-0000-3066-1457
    affiliation: 1
affiliations:
  - name: Department of Mathematics, Birla Institute of Technology, Mesra
    index: 1
date: 2025-07-14
software_repository: https://github.com/HarshitPranjal/routh-hurwitz-analyzer
archive: https://zenodo.org/record/XXXXXXXXX
repository_artifact: https://github.com/<your-username>/routh-hurwitz-analyzer/releases/tag/v1.0.0
---

Summary

The *Routh-Hurwitz Stability Analyzer* is a MATLAB-based application designed to automate the stability analysis of linear time-invariant (LTI) systems using the classical Routh-Hurwitz criterion. The app supports both symbolic and numeric polynomial inputs, generates the Routh-Hurwitz array, evaluates sign changes in the first column, and determines system stability. 

In numeric mode, the tool also visualizes the roots of the characteristic polynomial on the complex plane. Its GUI, built using MATLAB App Designer, allows researchers and students to verify their systems and reduce calculation errors in stability-focused studies.

The application is especially useful in educational and research settings for understanding control systems, modeling disease dynamics, and verifying symbolic algebraic approaches. This toolbox aims to bridge the gap between theoretical analysis and hands-on experimentation in system stability design.

Statement of Need

Stability analysis is essential in control system engineering, and the Routh-Hurwitz criterion remains a key analytical tool. Manual construction of Routh tables is prone to error, especially for higher-order or symbolic systems. This software provides an interactive, error-resilient interface that simplifies the analysis process and supports reproducibility in academic research.

Functionality

The application includes:

- Symbolic and numeric input handling
- Automatic polynomial and Routh table generation
- Sign change detection and system verdict
- Graphical root plotting for numeric input
- Export of results and plots
- Designed to handle edge cases like zero entries and symbolic algebra

The software is distributed as a .mltbx (MATLAB Toolbox) file and includes detailed documentation and examples. The backend logic is implemented in a transparent, modular MATLAB script (`routhAnalyzer.m`), while the user interface is developed using MATLAB App Designer.

Acknowledgements

This software was developed independently by the author to support the academic community in learning and applying Routh-Hurwitz-based methods in control theory and applied mathematics.

References

Ogata, K. *Modern Control Engineering*, 5th Ed., Prentice Hall, 2010.  
Ezekiel, D. (2011). *Stability Analysis of an SIR Infectious Disease Model*. International Journal of Nonlinear Science, 12(2), 107–113.  
Shaw, P. K., Kumar, S., Momani, S., & Hadid, S. (2022). *Dynamical Analysis of Fractional Plant Disease Model*. Chaos, Solitons & Fractals, 156, 111830.  
