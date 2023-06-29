# ClassicalSpinMFGS
Julia code to solve the open-system of a single classical spin coupled to multiple heat baths. This is the code used to generate the classical curves in the [Enhanced entanglement in multi-bath spin-boson models](https://arxiv.org/abs/2306.11036) paper.

### Repo structure

* **lib**: contains the code to calculate the Gibbs and mean force (MF), as well as the corresponding spin expectation values. Stuctured as a Julia modules: ```MFGS.jl```
* **run**: contains code from ```lib``` to generate the paper data
* **paper_data**: contains the data generated for the paper
