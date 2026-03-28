# Automating the multidimensional density-based clustering of Principal Component Analysis (PCA) data derived from molecular dynamics trajectories.

## Project Objectives
The goal of this project is to provide a Python script that:
1. **Data Integration**: Ingests multidimensional PCA data (specifically compatible with `carma`/`grcarma` outputs).
2. **Density-Based Clustering**: Utilizes **HDBSCAN** to isolate deep thermodynamic conformational states within the trajectory, filtering out thermal noise.
3. **Structural Extraction**: Automatically extracts physical **Medoid** structures and **Superposition** ensembles for every identified state.
4. **Transition Plots**: *(Work in Progress)* Generates transition graphs between clusters to visualize folding and unfolding pathways.

## Prerequisites
Before running this pipeline, ensure your system has the following installed:
* **Python 3.8+**
* **CARMA** (Must be installed and accessible in your system `PATH`)

## Repository Structure
* `scripts/`: Contains the executable Python tools (`cluster`).
* `setup_env.sh`: Automated environment installer and dependency manager.
* `requirements.txt`: Python package dependencies (NumPy, HDBSCAN, Matplotlib, MDAnalysis).

## Installation
To set up the environment and install all dependencies on a new machine, simply run the Bash setup script from the root of the repository:
```bash
chmod +x setup_env.sh
./setup_env.sh