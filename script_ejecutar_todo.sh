#!/bin/bash

sudo mpic++ taller4.cpp -o t4 `pkg-config --cflags --libs opencv`



mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 1 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 3 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 4 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 5 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 6 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 8 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 9 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 10 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 12 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 15 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 16 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg


