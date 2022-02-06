compilar
sudo mpic++ taller.cpp -o t -fopenmp \`pkg-config --
cflags --libs opencv\`

correr
mpirun -np 2 --hostfile mpi_hosts ./t 720p.jpg 720p
sobel.jpg
