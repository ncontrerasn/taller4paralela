compilar
sudo mpic++ t4.cpp -o t \`pkg-config --cflags --libs opencv\`

correr
mpirun -np 2 --hostfile mpi_hosts ./t 720p.jpg 720p
sobel.jpg
