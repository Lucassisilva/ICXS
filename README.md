<p align="center">
  <img src="/Gallery/ICXSCapa.bmp" width="600" />
</p>

---

**ICXS (I see axes)** is a software developed by [Lucas de Assis Silva](https://www.linkedin.com/in/lucas-de-assis-silva/?locale=en_US) as a scientific initiation project.
This graphical user interface aims to help the data analysis with an emphasis on aircraft testing, making this job easier and faster.

# Getting Started
- Download the file [ICXS2Download.exe](ICXS2Download.exe), **run it and install it**.
- If you have already MATLAB installed in your PC, you can just download the [program files](/Files/) and **run ICxs.m**.

# Motivation
- **Flight tests are fundamental to the R&D process** and have several advantages over wind tunnels and computer simulations;
- Flight tests often take place at the end of the development period, facing a lot of **pressure related to schedule and costs**;
- Need to expand the *know-how* of the [Aero Vitória Espírito Santo (AVES) Team](http://aves.ufes.br/) in flight test analysis to **validate and improve their projects**.

# Highlights
- **9 applications** for aeronautical analysis (6 validated):
  - **Performance/Aerodynamics**: Density altitude, Flight path, Takeoff and landing, Rate of climb/descent*, Turn*, Stall speed*, Drag polar (3 methods).
  - **Stability**: Neutral point, Dynamic analysis (3 methods).  
<sub><sup>* Applications not validated due to lack of data in the literature.</sup></sub>
- Main interface features:
  - **2 languages** available: Portuguese and English;
  - 3 layouts for data visualization and **many plot customization options**;
  - Possibility to **upload up to 10 files**.
 
# Documentation
For now, the documentation of this project is only available in Portuguese.
In the *User guide*, you can find explanations about the program's operation and the implemented models.

https://github.com/Lucassisilva/ICXS/blob/master/Files/h_ICXS.pdf

# Gallery
The figures below are examples of use of some applications of the software. More information about this examples are available in the documentation file.

- **Density altitude app**:  
The data used for the density calculation was acquired in Vila Velha (Brazil) and the density altitude of 1200m corresponds to a normal density altitude in São José dos Campos (Brazil) during the SAE Brasil Aerodesing competition.
<p align="center">
  <img src="/Gallery/FigAD.png" width="300" />
</p>

- **Flight path app**:  
This flight path corresponds to a fligh made by the Team AVES in Vila Velha.
<p align="center">
  <img src="/Gallery/FigTV.png" width="300" />
  <img src="/Gallery/FigTVMap.png" width="300" />
</p>

- **Takeoff and landing app**:  
Correction of the data acquired in Vila Velha by the Team AVES to the flight condition in São José dos Campos.
<p align="center">
  <img src="/Gallery/FigDec.png" width="300" />
  <img src="/Gallery/FigPous.png" width="300" />
</p>

- **Drag polar app**:  
Flight data of the NASA M2-F1, provided by Horton, Eldredge and Klein (1965). 
<p align="center">
  <img src="/Gallery/FigPAA.png" width="300" />
  <img src="/Gallery/FigPASG.png" width="300" />
  <img src="/Gallery/FigPARoS.png" width="300" />
  <img src="/Gallery/FigPARes.png" width="300" />
</p>

- **Neutral point app**:  
Data provided by Kimberlin (2003).
<p align="center">
  <img src="/Gallery/FigPN1.png" width="300" />
  <img src="/Gallery/FigPN2.png" width="300" />
</p>

- **Dynamic analysis app**:  
Flight data of a VFW-Fokker 614 (left and right figure), provided by Reis (2016), and artificial flight data (center figure), provided by Ward and Strganac (1998). 
<p align="center">
  <img src="/Gallery/FigMTPR.PNG" width="280" />
  <img src="/Gallery/FigMS.PNG" width="280" />
  <img src="/Gallery/FigO1.PNG" width="280" />
</p>

# License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

# Citation
If you use ICXS in your research, I would appreciate a citation to this work. For now you can use the following BibTeX code:

```sh
@INPROCEEDINGS {silva_2019,
    ADDRESS = {Vit{\'o}ria, Brazil},
    TITLE = {Desenvolvimento de programa com interface gr{\'a}fica para an{\'a}lise de dados com \^enfase em testes de aeronaves},
    BOOKTITLE = {XXIX Jornada de Iniciação Científica},
    AUTHOR = {Lucas de Assis Silva},
    YEAR = {2019},
    KEYWORDS = {Aeron{\'a}utica. Teste de voo. Interface Gr{\'a}fica do Usu{\'a}rio. An{\'a}lise de dados. An{\'a}lise de incerteza}
}
```
