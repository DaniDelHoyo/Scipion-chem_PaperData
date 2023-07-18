# Scipion-chem_PaperData

This repository contains all the data discussed in the Scipion-chem paper. These are:

- Example shown in "Virtual Drug Screening workflow" section for 4ERF PDB structure. Contains the Scipion project 
  folder, which can be imported into the Scipion workflow engine and reproduced once all the necessary plugins are 
  installed. 
  The example can be divided into 4 subworkflows:
    - Main VDS workflow: principal workflow that includes protocols following the "Virtual Drug Screening workflow" 
      section:
        1) Molecules import
            - Receptor import: 4ERF structure from PDB web, a ligase from Homo Sapiens
            - Small molecules import: 4 ZINC small molecule structures are imported from local "mol2" files 
              (included in this repository).
              
        2) Molecules preparation
            - Receptor preparation: we used LePro protein preparation (from LePhar) to prepare the receptor, removing 
              the ligand included in the structure and other heteroatoms and extracting only chain A.
            - Small molecules preparation: we used OpenBabel ligand preparation in order to add charges to the imported 
              small molecules and generating up to 2 conformers for each of them.
              
        3) Molecules filtering
            - Regions Of Interest definition: set of protocols that tries to find the most promising regions of the 
              receptor for interacting with the ligand. We did so by, first, independently predicting these receptor
              pockets with FPocket, P2Rank and AutoSite. Then, the results of each software are combined using the
              consensus protocol as explained in the paper.
        4) Docking
           
           Prepared small molecules are docked onto the consensus ROIs. This task is performed independently using
           LeDock, AutoDock-GPU and Vina, with default parameters. Then, as explained in the paper, the results of
           these protocols are rescored using ODDT Vina and RFScore_v3. Finally, the rescored docking poses are 
           combined and the most promising ones are extracted using the consensus protocol.
        5) Molecular dynamics
           
           The best scored docking pose from the consensus docking protocol (ZINC1453, according to the ODDT Vina score)
           is used as input for the Molecular dynamics simulation example. To do so, we used Desmond, from Schrödinger.
           We used this commercial software because of the advanced trajectory analysis and the automatic ligand 
           parametrization they provide.
           - System preparation: the docked molecule (together with the receptor) is surrounded by a water box 
             (with 5A buffer) with the SPC water model. Na+ and Cl- are added to reach 0.15M concentration and 
             neutralizing the system. S-OPLS main force field is used to parametrize the system.
           - Simulation: the prepared system is simulated in this protocol using Desmond. First, the system is 
             minimized and equilibrated following the default Desmond procedure. Then, a small production simulation 
             is executed, enlarging the trajectory with 24ps of unrestricted simulations.
           - Production simulation: a second simulation protocol is executed to generate a larger production simulation 
             of 5000ps of unrestricted simulation at native conditions, generating a trajectory that could be analyzed.
            

    - Structural ROIs definition: set of options for structural ROI definition, including manual definition, definition 
        from receptor predicted pockets or from sequence ROIs.