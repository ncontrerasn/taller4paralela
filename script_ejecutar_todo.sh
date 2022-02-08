#!/bin/bash

sudo mpic++ taller4.cpp -o t4 `pkg-config --cflags --libs opencv`

mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 1
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 2
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 3
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 4
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 5
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 6
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 7
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 8
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 9
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 10
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 11
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 12
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 13
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 14
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 15
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720psobel.jpg 16

mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 1
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 2
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 3
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 4
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 5
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 6
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 7
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 8
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 9
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 10
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 11
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 12
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 13
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 14
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 15
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 1080p.jpg 1080psobel.jpg 16

mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 1
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 2
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 3
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 4
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 5
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 6
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 7
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 8
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 9
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 10
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 11
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 12
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 13
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 14
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 15
mpirun --allow-run-as-root  --mca btl_base_warn_component_unused 0 -np 2 --hostfile mpi_hosts ./t4 4k.jpg 4ksobel.jpg 16
